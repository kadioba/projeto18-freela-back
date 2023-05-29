import { Router } from "express";
import { getFlightById, getFlightsByDestination, postFlight } from "../controllers/flights.controllers.js";

const flightsRouter = Router();

flightsRouter.get("/flights/:destinationId", getFlightsByDestination);
flightsRouter.get("/flight/:id", getFlightById);
flightsRouter.post("/flight", postFlight);

export default flightsRouter;