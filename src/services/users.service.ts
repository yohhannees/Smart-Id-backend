import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

export class UserService {
  // Create a new user
  static async createUser(userData: any) {
    return await prisma.user.create({ data: userData });
  }

  // Get a user by ID
  static async getUserById(userId: string) {
    return await prisma.user.findUnique({ where: { id: userId } });
  }

  // Update a user
  static async updateUser(userId: string, userData: any) {
    return await prisma.user.update({
      where: { id: userId },
      data: userData,
    });
  }

  // Delete a user
  static async deleteUser(userId: string) {
    return await prisma.user.delete({ where: { id: userId } });
  }

  // Add a belonging
  static async addBelonging(userId: string, belongingData: any) {
    return await prisma.belonging.create({
      data: { ...belongingData, studentId: userId },
    });
  }

  // Get belongings
  static async getBelongings(userId: string) {
    return await prisma.belonging.findMany({ where: { studentId: userId } });
  }

  // Delete a belonging
  static async deleteBelonging(belongingId: string) {
    return await prisma.belonging.delete({ where: { id: belongingId } });
  }

  // Add an entry log
  static async addEntryLog(userId: string, entryLogData: any) {
    return await prisma.entryLog.create({
      data: { ...entryLogData, studentId: userId },
    });
  }

  // Get entry logs
  static async getEntryLogs(userId: string) {
    return await prisma.entryLog.findMany({ where: { studentId: userId } });
  }

  // Add a warning
  static async addWarning(userId: string, warningData: any) {
    return await prisma.warning.create({
      data: { ...warningData, studentId: userId },
    });
  }

  // Get warnings
  static async getWarnings(userId: string) {
    return await prisma.warning.findMany({ where: { studentId: userId } });
  }

  // Send a notification
  static async sendNotification(notificationData: any) {
    return await prisma.notification.create({ data: notificationData });
  }

  // Get a notification by ID
  static async getNotificationById(notificationId: string) {
    return await prisma.notification.findUnique({ where: { id: notificationId } });
  }
}
