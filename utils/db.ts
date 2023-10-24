import {createPool} from "mysql2/promise";
import dotenv from 'dotenv';
dotenv.config();

export const pool = createPool({
    host: process.env["MYSQL_HOST"],
    user: process.env["MYSQL_USER"],
    database: process.env["MYSQL_DATABASE"],
    namedPlaceholders: true,
    decimalNumbers: true,
});