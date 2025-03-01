-- CreateEnum
CREATE TYPE "Speciality" AS ENUM ('AFRICANA', 'ACAI', 'JAPONESA', 'ARABE', 'CHINESA', 'BRASILEIRA', 'ITALIANA', 'MEXICANA', 'VEGETARIANA', 'VEGANA', 'AMERICANA', 'MEDITERRANEA', 'PIZZARIA', 'HAMBURGUERIA', 'SUSHI', 'FAST_FOOD', 'INDIGENA', 'TAILANDESA', 'FRANCES', 'COREANA', 'INDIANA', 'PERUANA', 'CAJUN', 'ESPANHOLA', 'FUSION', 'CONTEMPORANEA', 'COSTELA', 'SEAFOOD', 'LANCHONETE', 'GRILL');

-- CreateEnum
CREATE TYPE "DaysOpen" AS ENUM ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY');

-- CreateTable
CREATE TABLE "Admin" (
    "id" SERIAL NOT NULL,
    "fullname" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Adresses" (
    "id" SERIAL NOT NULL,
    "adminId" INTEGER NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "postal_code" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Adresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Business" (
    "id" SERIAL NOT NULL,
    "isOpen" BOOLEAN NOT NULL,
    "logo" VARCHAR(100),
    "adminId" INTEGER NOT NULL,
    "cnpj" VARCHAR(18),
    "name" TEXT NOT NULL,
    "state_registration" VARCHAR(100) NOT NULL,
    "speciality" "Speciality"[],

    CONSTRAINT "Business_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessHours" (
    "id" SERIAL NOT NULL,
    "businessId" INTEGER NOT NULL,
    "day" "DaysOpen" NOT NULL,
    "openHour" VARCHAR(10) NOT NULL,
    "closeHour" VARCHAR(10) NOT NULL,

    CONSTRAINT "BusinessHours_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Admin_email_key" ON "Admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Business_cnpj_key" ON "Business"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessHours_businessId_day_key" ON "BusinessHours"("businessId", "day");

-- AddForeignKey
ALTER TABLE "Adresses" ADD CONSTRAINT "Adresses_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessHours" ADD CONSTRAINT "BusinessHours_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "Business"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
