import { db } from "../database/database.connection.js";

export function getCitiesDB() {
    return db.query('SELECT * FROM cities');
}

export function getCityByIdDB(id) {
    return db.query('SELECT cities.name FROM cities WHERE cities.id = $1', [id]);
}