-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "telegramId" TEXT NOT NULL,
    "photoUrl" TEXT,
    "PictureUrl" TEXT,
    "name" TEXT NOT NULL,
    "studentId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Belonging" (
    "id" TEXT NOT NULL,
    "telegramId" TEXT NOT NULL,
    "itemName" TEXT NOT NULL,
    "itemPhoto" TEXT NOT NULL,
    "itemDescription" TEXT NOT NULL,
    "serialNumber" TEXT,
    "studentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Belonging_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WarningList" (
    "id" TEXT NOT NULL,
    "telegramId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "day" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WarningList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CurfewRule" (
    "id" TEXT NOT NULL,
    "startTime" TIMESTAMP(3),
    "endTime" TIMESTAMP(3),
    "length" TEXT,
    "days" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CurfewRule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QRCode" (
    "id" TEXT NOT NULL,
    "telegramId" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "qrData" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "QRCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "telegramId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "recipientId" TEXT NOT NULL,
    "sentAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_telegramId_key" ON "User"("telegramId");

-- CreateIndex
CREATE UNIQUE INDEX "User_studentId_key" ON "User"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "Belonging_telegramId_key" ON "Belonging"("telegramId");

-- CreateIndex
CREATE UNIQUE INDEX "Belonging_serialNumber_key" ON "Belonging"("serialNumber");

-- CreateIndex
CREATE UNIQUE INDEX "WarningList_telegramId_key" ON "WarningList"("telegramId");

-- CreateIndex
CREATE UNIQUE INDEX "QRCode_telegramId_key" ON "QRCode"("telegramId");

-- CreateIndex
CREATE UNIQUE INDEX "Notification_telegramId_key" ON "Notification"("telegramId");

-- AddForeignKey
ALTER TABLE "Belonging" ADD CONSTRAINT "Belonging_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QRCode" ADD CONSTRAINT "QRCode_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
