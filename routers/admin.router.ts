import {Router} from "express";

import {ValidationError} from "../utils/errors";
import bcrypt from "bcrypt";
import dotenv from 'dotenv';
import {pool} from "../utils/db";
import {FieldPacket} from "mysql2/promise";


dotenv.config();

interface AdminPass {
    id: string;
    login: string;
    password: string;
}

type AdminPassResults = [AdminPass[], FieldPacket];

export const adminRouter = Router()


    .post('/', async (req, res) => {
        const adminPassword = process.env["MYSQL_ADMINPASSWORD"];

        try {
            const [results]: AdminPassResults = await pool.execute("SELECT * FROM `loginpass` WHERE `login` LIKE :login", {
                login: `${req.body.login}`,
            }) as unknown as AdminPassResults;
            if (results.length > 0) {
                const {hashedPassword} = req.body;
                bcrypt.compare(adminPassword, hashedPassword.toString(), (e, result) => {
                    if (result) {
                        console.log('Logged IN!!');
                        res.json({message: 'Zalogowano poprawnie'});
                    } else {
                        console.log('Your password is Incorrect!! Try again!');
                        res.status(401).json({message: 'Login lub hasło są niepoprawne!'});
                    }
                });
            } else {
                console.log('No email existed!');
                res.status(401).json({message: 'Login lub hasło są niepoprawne!'});

            }

        } catch (error) {

            console.error('Error occurred:', error);
            res.status(500).json({message: 'Internal server error'});
        }

    });


