import { Router } from "express";
import { getFlightById, getFlightsByDestination } from "../controllers/flights.controllers.js";

const flightsRouter = Router();

flightsRouter.get("/flights/:destinationId", getFlightsByDestination);
flightsRouter.get("/flight/:id", getFlightById);

export default flightsRouter;