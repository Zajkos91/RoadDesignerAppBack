
export interface NewRoadEntity extends Omit<RoadEntity, 'id'> {
    id?: string;
}

export interface SimpleRoadEntity {

    id: string;
    name: string;
    startLat: number;
    startLon: number;
    endLat: number;
    endLon: number;
}

export interface RoadEntity extends SimpleRoadEntity{

    description: string;
    realisationYear: number;
    url: string;

}

