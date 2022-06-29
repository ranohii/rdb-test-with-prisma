/*
  Warnings:

  - The primary key for the `customer_customer_demo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `customer_demographics` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "customer_customer_demo" DROP CONSTRAINT "fk_customer_customer_demo_customer_demographics";

-- AlterTable
ALTER TABLE "customer_customer_demo" DROP CONSTRAINT "pk_customer_customer_demo",
ALTER COLUMN "customer_type_id" SET DATA TYPE CHAR,
ADD CONSTRAINT "pk_customer_customer_demo" PRIMARY KEY ("customer_id", "customer_type_id");

-- AlterTable
ALTER TABLE "customer_demographics" DROP CONSTRAINT "pk_customer_demographics",
ALTER COLUMN "customer_type_id" SET DATA TYPE CHAR,
ADD CONSTRAINT "pk_customer_demographics" PRIMARY KEY ("customer_type_id");

-- AlterTable
ALTER TABLE "customers" ALTER COLUMN "company_name" SET DATA TYPE VARCHAR(80);

-- AlterTable
ALTER TABLE "region" ALTER COLUMN "region_description" SET DATA TYPE CHAR;

-- AlterTable
ALTER TABLE "territories" ALTER COLUMN "territory_description" SET DATA TYPE CHAR;

-- AddForeignKey
ALTER TABLE "customer_customer_demo" ADD CONSTRAINT "fk_customer_customer_demo_customer_demographics" FOREIGN KEY ("customer_type_id") REFERENCES "customer_demographics"("customer_type_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
