import { db } from "../database/database.connection.js";

export function getCitiesDB() {
    return db.query('SELECT * FROM cities');
}

export function getCityByIdDB(id) {
    return db.query('SELECT cities.name FROM cities WHERE cities.id = $1', [id]);
}

export function postCityDB(city) {
    return db.query('INSERT INTO cities (name, state, county) VALUES ($1, $2, $3) RETURNING id', [city.name, city.state, city.country]);
}