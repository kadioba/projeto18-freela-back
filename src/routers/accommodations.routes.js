import { Router } from "express";
import { getAccommodationById, getAccommodationsByDestinationId } from "../controllers/accommodations.controllers.js";


const accommodationsRouter = Router()

accommodationsRouter.get("/accommodations/:destinationId", getAccommodationsByDestinationId);
accommodationsRouter.get("/accommodation/:id", getAccommodationById);

export default accommodationsRouter;