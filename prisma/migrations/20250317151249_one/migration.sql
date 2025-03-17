/*
  Warnings:

  - You are about to drop the column `telegramId` on the `Belonging` table. All the data in the column will be lost.
  - You are about to drop the column `days` on the `CurfewRule` table. All the data in the column will be lost.
  - You are about to drop the column `length` on the `CurfewRule` table. All the data in the column will be lost.
  - You are about to drop the column `telegramId` on the `QRCode` table. All the data in the column will be lost.
  - You are about to drop the column `PictureUrl` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `WarningList` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `day` to the `CurfewRule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `CurfewRule` table without a default value. This is not possible if the table is not empty.
  - Made the column `startTime` on table `CurfewRule` required. This step will fail if there are existing NULL values in that column.
  - Made the column `endTime` on table `CurfewRule` required. This step will fail if there are existing NULL values in that column.
  - Made the column `qrData` on table `QRCode` required. This step will fail if there are existing NULL values in that column.
  - Made the column `studentId` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "Belonging_telegramId_key";

-- DropIndex
DROP INDEX "QRCode_telegramId_key";

-- AlterTable
ALTER TABLE "Belonging" DROP COLUMN "telegramId",
ALTER COLUMN "itemPhoto" DROP NOT NULL;

-- AlterTable
ALTER TABLE "CurfewRule" DROP COLUMN "days",
DROP COLUMN "length",
ADD COLUMN     "day" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "startTime" SET NOT NULL,
ALTER COLUMN "endTime" SET NOT NULL;

-- AlterTable
ALTER TABLE "Notification" ALTER COLUMN "telegramId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "QRCode" DROP COLUMN "telegramId",
ALTER COLUMN "qrData" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "PictureUrl",
ADD COLUMN     "isBlacklisted" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "telegramId" DROP NOT NULL,
ALTER COLUMN "studentId" SET NOT NULL;

-- DropTable
DROP TABLE "WarningList";

-- CreateTable
CREATE TABLE "Admin" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EntryLog" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "entryTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "exitTime" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "EntryLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Warning" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "violation" TEXT NOT NULL,
    "occurredAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Warning_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Admin_username_key" ON "Admin"("username");

-- AddForeignKey
ALTER TABLE "EntryLog" ADD CONSTRAINT "EntryLog_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Warning" ADD CONSTRAINT "Warning_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
