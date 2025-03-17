import { Request, Response } from 'express';
import { UserService } from '../services/users.service';

export class UserController {
  // Create a new user
  static async createUser(req: Request, res: Response) {
    const userData = req.body;
    const user = await UserService.createUser(userData);
    res.status(201).json(user);
  }

  // Get a user by ID
  static async getUser(req: Request, res: Response) {
    const userId = req.params.id;
    const user = await UserService.getUserById(userId);
    res.status(200).json(user);
  }

  // Update a user by ID
  static async updateUser(req: Request, res: Response) {
    const userId = req.params.id;
    const userData = req.body;
    const updatedUser = await UserService.updateUser(userId, userData);
    res.status(200).json(updatedUser);
  }

  // Delete a user by ID
  static async deleteUser(req: Request, res: Response) {
    const userId = req.params.id;
    await UserService.deleteUser(userId);
    res.status(204).send();
  }

  // Add a belonging
  static async addBelonging(req: Request, res: Response) {
    const userId = req.params.userId;
    const belongingData = req.body;
    const belonging = await UserService.addBelonging(userId, belongingData);
    res.status(201).json(belonging);
  }

  // Get belongings
  static async getBelongings(req: Request, res: Response) {
    const userId = req.params.userId;
    const belongings = await UserService.getBelongings(userId);
    res.status(200).json(belongings);
  }

  // Delete a belonging
  static async deleteBelonging(req: Request, res: Response) {
    const belongingId = req.params.id;
    await UserService.deleteBelonging(belongingId);
    res.status(204).send();
  }

  // Add an entry log
  static async addEntryLog(req: Request, res: Response) {
    const userId = req.params.userId;
    const entryLogData = req.body;
    const entryLog = await UserService.addEntryLog(userId, entryLogData);
    res.status(201).json(entryLog);
  }

  // Get entry logs
  static async getEntryLogs(req: Request, res: Response) {
    const userId = req.params.userId;
    const entryLogs = await UserService.getEntryLogs(userId);
    res.status(200).json(entryLogs);
  }

  // Add a warning
  static async addWarning(req: Request, res: Response) {
    const userId = req.params.userId;
    const warningData = req.body;
    const warning = await UserService.addWarning(userId, warningData);
    res.status(201).json(warning);
  }

  // Get warnings
  static async getWarnings(req: Request, res: Response) {
    const userId = req.params.userId;
    const warnings = await UserService.getWarnings(userId);
    res.status(200).json(warnings);
  }

  // Send a notification
  static async sendNotification(req: Request, res: Response) {
    const notificationData = req.body;
    const notification = await UserService.sendNotification(notificationData);
    res.status(201).json(notification);
  }

  // Get a notification by ID
  static async getNotification(req: Request, res: Response) {
    const notificationId = req.params.id;
    const notification = await UserService.getNotificationById(notificationId);
    res.status(200).json(notification);
  }
}
