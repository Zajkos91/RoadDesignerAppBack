import {Router} from "express";
import {RoadRecord} from "../records/road.record";
import {ValidationError} from "../utils/errors";


export const roadRouter = Router()
    .get('/search/:name?', async (req, res) => {

        const roads = await RoadRecord.findAll(req.params.name ?? '');

        res.json(roads);
    })

    .get('/:id', async(req, res) => {
        const road = await RoadRecord.getOne(req.params.id);
        res.json(road);
    })

    .post('/', async (req, res) => {
        const road  = new RoadRecord(req.body);
        await road.insert();
        res.json(road);
    })


    .delete('/:id', async (req, res) => {
        const road  = await RoadRecord.getOne(req.params.id);

        if(road === null) {
            throw new ValidationError('Not found road with that Id');
        }
        await road.delete();
        res.json(road);
    })

    .patch('/:id', async (req, res) => {
        const road  = await RoadRecord.getOne(req.params.id);
        const body = req.body;

        if(road === null) {
            throw new ValidationError('Not found road with that Id');
        }
        console.log(body);
        console.log(road);

        const {startAddress, endAddress, ...rest} = body
        const updatedRoad = new RoadRecord({...road, ...rest});
        console.log(updatedRoad);

        await updatedRoad.update();
        res.json(updatedRoad);
    });
