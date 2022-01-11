import { Router } from "express";

import VolunteersController from "../controllers/volunteer.controllers";

const router = Router();


router.post("/", VolunteersController.insert );

router.put("/", VolunteersController.deactivate );

export default router;
