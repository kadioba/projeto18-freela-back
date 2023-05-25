import { Router } from "express";
import { getFlightsByDestination } from "../controllers/flights.controllers.js";

const flightsRouter = Router();

flightsRouter.get("/flights/:destinationId", getFlightsByDestination);

export default flightsRouter;