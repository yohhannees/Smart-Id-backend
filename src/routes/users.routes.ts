import express from 'express';
import { UserController } from '../controllers/users.controller';

const router = express.Router();

// User routes
router.post('/users', UserController.createUser);
router.get('/users/:id', UserController.getUser);
router.put('/users/:id', UserController.updateUser);
router.delete('/users/:id', UserController.deleteUser);

// Belongings routes
router.post('/users/:userId/belongings', UserController.addBelonging);
router.get('/users/:userId/belongings', UserController.getBelongings);
router.delete('/belongings/:id', UserController.deleteBelonging);

// Entry logs routes
router.post('/users/:userId/entry-logs', UserController.addEntryLog);
router.get('/users/:userId/entry-logs', UserController.getEntryLogs);

// Warnings routes
router.post('/users/:userId/warnings', UserController.addWarning);
router.get('/users/:userId/warnings', UserController.getWarnings);

// Notifications routes
router.post('/notifications', UserController.sendNotification);
router.get('/notifications/:id', UserController.getNotification);

export default router;
