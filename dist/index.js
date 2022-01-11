"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const body_parser_1 = __importDefault(require("body-parser"));
const dotenv_1 = __importDefault(require("dotenv"));
const mongoose_1 = __importDefault(require("mongoose"));
const basics_1 = __importDefault(require("./middlewares/basics"));
const index_routes_1 = __importDefault(require("./api/routes/index.routes"));
const app = (0, express_1.default)();
dotenv_1.default.config();
const port = process.env.PORT || 8000;
app.use(body_parser_1.default.urlencoded({
    extended: true,
}));
app.use(basics_1.default);
app.use(index_routes_1.default);
function connector() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield mongoose_1.default.connect(`${process.env.REFQ_DB_URI}`);
            yield console.log("connected");
        }
        catch (e) {
            console.error(`Unable to establish a collection handle in moviesDAO: ${e}`);
        }
    });
}
connector()
    .then(result => {
    app.listen(port);
})
    .catch(err => console.log(err));
