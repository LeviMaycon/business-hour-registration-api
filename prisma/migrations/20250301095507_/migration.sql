-- CreateEnum
CREATE TYPE "Speciality" AS ENUM ('AFRICANA', 'ACAI', 'JAPONESA', 'ARABE', 'CHINESA', 'BRASILEIRA', 'ITALIANA', 'MEXICANA', 'VEGETARIANA', 'VEGANA', 'AMERICANA', 'MEDITERRANEA', 'PIZZARIA', 'HAMBURGUERIA', 'SUSHI', 'FAST_FOOD', 'INDIGENA', 'TAILANDESA', 'FRANCES', 'COREANA', 'INDIANA', 'PERUANA', 'CAJUN', 'ESPANHOLA', 'FUSION', 'CONTEMPORANEA', 'COSTELA', 'SEAFOOD', 'LANCHONETE', 'GRILL');

-- CreateTable
CREATE TABLE "Admin" (
    "id" TEXT NOT NULL,
    "fullname" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Adress" (
    "id" TEXT NOT NULL,
    "adminId" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "postal_code" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Adress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Business" (
    "id" TEXT NOT NULL,
    "adminId" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "state_registration" TEXT NOT NULL,
    "specialty" "Speciality"[],

    CONSTRAINT "Business_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Admin_email_key" ON "Admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Business_cnpj_key" ON "Business"("cnpj");

-- AddForeignKey
ALTER TABLE "Adress" ADD CONSTRAINT "Adress_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "Admin"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
