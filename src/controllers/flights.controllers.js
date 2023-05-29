import { getFlightByIdDB, getFlightsByDesinationDB, postFlightDB, postFlightPictureDB } from "../repositories/flights.repository.js";

export async function getFlightsByDestination(req, res) {
    try {
        const flights = await getFlightsByDesinationDB(req.params.destinationId);
        res.status(200).send(flights.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getFlightById(req, res) {
    try {
        const flight = await getFlightByIdDB(req.params.id);
        res.status(200).send(flight.rows[0]);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function postFlight(req, res) {
    const flight = req.body;
    try {
        const newFlight = await postFlightDB(flight);
        await postFlightPictureDB(newFlight.rows[0].id, flight.picture);
        res.status(200).send("Flight added");
    } catch (error) {
        res.status(500).send(error);
    }
}