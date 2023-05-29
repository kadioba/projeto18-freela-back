import { Router } from "express";
import { getFlightById, getFlightsByDestination, postFlight } from "../controllers/flights.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postFlightSchema } from "../schemas/flights.schema.js";

const flightsRouter = Router();

flightsRouter.get("/flights/:destinationId", getFlightsByDestination);
flightsRouter.get("/flight/:id", getFlightById);
flightsRouter.post("/flight", validateSchema(postFlightSchema), postFlight);

export default flightsRouter;