import { Router } from "express";
import { getAccommodationById, getAccommodationsByDestinationId, postAccommodation } from "../controllers/accommodations.controllers.js";


const accommodationsRouter = Router()

accommodationsRouter.get("/accommodations/:destinationId", getAccommodationsByDestinationId);
accommodationsRouter.get("/accommodation/:id", getAccommodationById);
accommodationsRouter.post("/accommodation", postAccommodation);

export default accommodationsRouter;