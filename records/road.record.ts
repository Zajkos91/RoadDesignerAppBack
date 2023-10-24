import {RoadEntity, NewRoadEntity, SimpleRoadEntity} from "../types";
import {ValidationError} from "../utils/errors";
import {pool} from "../utils/db";
import {FieldPacket} from "mysql2";
import {v4 as uuid} from "uuid";



type RoadRecordResults = [RoadEntity[], FieldPacket];

export class RoadRecord implements RoadEntity {
    id: string;
    name: string;
    description: string;
    realisationYear: number;
    url: string;
    startLat: number;
    startLon: number;
    endLat: number;
    endLon: number;

    constructor(obj: NewRoadEntity) {
        if(!obj.name || obj.name.length > 100) {
            throw new ValidationError('Nazwa inwestycji drogowej nie może być pusta ani przekraczać 100 znaków.');
        }

        if (obj.description.length > 1000) {
            throw new ValidationError('Opis inwestycji drogowej nie może przekraczać 1000 znaków');
        }

        if(obj.realisationYear < 1990 || obj.realisationYear > 2030) {
            throw new ValidationError('Rok realizacji inwestycji musi zawierać się od 1990 do 2030');
        }

        if (!obj.url || obj.url.length > 100) {
            throw new ValidationError('Link do Googlestreet nie może być pusty, ani przekraczać 100 znaków');
        }

        if(typeof obj.startLat !== 'number' || typeof obj.startLon !== 'number') {
            throw new ValidationError('Nie można zlokalizować początku inwestycji');
        }

            if(typeof obj.endLat !== 'number' || typeof obj.endLon !== 'number') {
                throw new ValidationError('Nie można zlokalizować końca inwestycji');
        }

        this.id = obj.id;
        this.name = obj.name;
        this.description = obj.description;
        this.realisationYear = obj.realisationYear;
        this.url = obj.url;
        this.startLat = obj.startLat;
        this.startLon = obj.startLon;
        this.endLat = obj.endLat;
        this.endLon = obj.endLon;

    }

    static async getOne(id: string): Promise<RoadRecord | null> {
        const [results] = await pool.execute("SELECT * FROM `roads` WHERE `id` = :id", {
            id,
        }) as unknown as RoadRecordResults;

        return results.length === 0 ? null : new RoadRecord(results[0]);
    }

    static async findAll(name: string): Promise<SimpleRoadEntity[]> {
        const [results] = await pool.execute("SELECT * FROM `roads` WHERE `name` LIKE :search", {
            search: `%${name}%`,
        }) as unknown as RoadRecordResults;

        return results.map(result => {

            const {id, name, startLat, startLon, endLat, endLon} = result;
            return {id, name, startLat, startLon, endLat, endLon}
        });
    }

    async insert(): Promise<string> {
        if(!this.id) {
            this.id = uuid()
        } else {
            throw new ValidationError('Cannot insert something that is already inserted');
        }
        await pool.execute("INSERT INTO `roads` VALUES(:id, :name, :description, :realisationYear, :url, :startLat, :startLon, :endLat, :endLon)", {
            id: this.id,
            name: this.name,
            description: this.description,
            realisationYear: this.realisationYear,
            url: this.url,
            startLat: this.startLat,
            startLon: this.startLon,
            endLat: this.endLat,
            endLon: this.endLon,
        });
        return this.id;
    }

    async delete(): Promise<void> {
        if(!this.id) {
            throw new ValidationError('Road has no Id');
        }
        await pool.execute("DELETE FROM `roads` WHERE `id` = :id", {
            id: this.id,
        });
    }

    async update() {
        if(!this.id) {
            throw new ValidationError('Road has no Id');
        }

        await pool.execute('UPDATE `roads` SET `name` = :name, `url` = :url  WHERE `id` = :id;',{
            id: this.id,
            name: this.name,
            // description: this.description,
            // realisationYear: this.realisationYear,
            url: this.url,
            // startLat: this.startLat,
            // startLon: this.startLon,
            // endLat: this.endLat,
            // endLon: this.endLon,
        });

    };


}