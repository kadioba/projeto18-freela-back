import { db } from "../database/database.connection.js";

export async function getCities(req, res) {
    try {
        const cities = await db.query('SELECT * FROM cities');
        res.status(200).send(cities.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getCityById(req, res) {
    try {
        const city = await db.query(`SELECT cities.name FROM cities WHERE cities.id = $1`, [req.params.id]);
        res.status(200).send(city.rows[0]);
    } catch (error) {
        res.status(500).send(error);
    }
}