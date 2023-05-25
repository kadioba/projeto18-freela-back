import { db } from "../database/database.connection.js";

export async function getCities(req, res) {
    try {
        const cities = await db.query('SELECT * FROM cities');
        res.status(200).send(cities.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}