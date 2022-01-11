
import { Request, Response } from 'express';


export default interface CustomRequest<T> extends Request {
    body: T
  }