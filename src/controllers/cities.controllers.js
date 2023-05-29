import { getCitiesDB, getCityByIdDB, postCityDB } from "../repositories/cities.repository.js";

export async function getCities(req, res) {
    try {
        const cities = await getCitiesDB();
        res.status(200).send(cities.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getCityById(req, res) {
    try {
        const city = await getCityByIdDB(req.params.id);
        res.status(200).send(city.rows[0]);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function postCity(req, res) {
    try {
        await postCityDB(req.body);
        res.status(200).send("City added");
    }
    catch (error) {
        res.status(500).send(error);
    }
}