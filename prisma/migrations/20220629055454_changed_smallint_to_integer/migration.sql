/*
  Warnings:

  - The primary key for the `categories` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `customer_customer_demo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `customer_demographics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `employee_territories` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `employees` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `order_details` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `orders` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `products` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `region` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `shippers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `suppliers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `us_states` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "customer_customer_demo" DROP CONSTRAINT "fk_customer_customer_demo_customer_demographics";

-- DropForeignKey
ALTER TABLE "employee_territories" DROP CONSTRAINT "fk_employee_territories_employees";

-- DropForeignKey
ALTER TABLE "employees" DROP CONSTRAINT "fk_employees_employees";

-- DropForeignKey
ALTER TABLE "order_details" DROP CONSTRAINT "fk_order_details_orders";

-- DropForeignKey
ALTER TABLE "order_details" DROP CONSTRAINT "fk_order_details_products";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "fk_orders_employees";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "fk_orders_shippers";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "fk_products_categories";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "fk_products_suppliers";

-- DropForeignKey
ALTER TABLE "territories" DROP CONSTRAINT "fk_territories_region";

-- AlterTable
ALTER TABLE "categories" DROP CONSTRAINT "pk_categories",
ALTER COLUMN "category_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_categories" PRIMARY KEY ("category_id");

-- AlterTable
ALTER TABLE "customer_customer_demo" DROP CONSTRAINT "pk_customer_customer_demo",
ALTER COLUMN "customer_type_id" SET DATA TYPE CHAR,
ADD CONSTRAINT "pk_customer_customer_demo" PRIMARY KEY ("customer_id", "customer_type_id");

-- AlterTable
ALTER TABLE "customer_demographics" DROP CONSTRAINT "pk_customer_demographics",
ALTER COLUMN "customer_type_id" SET DATA TYPE CHAR,
ADD CONSTRAINT "pk_customer_demographics" PRIMARY KEY ("customer_type_id");

-- AlterTable
ALTER TABLE "employee_territories" DROP CONSTRAINT "pk_employee_territories",
ALTER COLUMN "employee_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_employee_territories" PRIMARY KEY ("employee_id", "territory_id");

-- AlterTable
ALTER TABLE "employees" DROP CONSTRAINT "pk_employees",
ALTER COLUMN "employee_id" SET DATA TYPE INTEGER,
ALTER COLUMN "reports_to" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_employees" PRIMARY KEY ("employee_id");

-- AlterTable
ALTER TABLE "order_details" DROP CONSTRAINT "pk_order_details",
ALTER COLUMN "order_id" SET DATA TYPE INTEGER,
ALTER COLUMN "product_id" SET DATA TYPE INTEGER,
ALTER COLUMN "quantity" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_order_details" PRIMARY KEY ("order_id", "product_id");

-- AlterTable
ALTER TABLE "orders" DROP CONSTRAINT "pk_orders",
ALTER COLUMN "order_id" SET DATA TYPE INTEGER,
ALTER COLUMN "employee_id" SET DATA TYPE INTEGER,
ALTER COLUMN "ship_via" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_orders" PRIMARY KEY ("order_id");

-- AlterTable
ALTER TABLE "products" DROP CONSTRAINT "pk_products",
ALTER COLUMN "product_id" SET DATA TYPE INTEGER,
ALTER COLUMN "supplier_id" SET DATA TYPE INTEGER,
ALTER COLUMN "category_id" SET DATA TYPE INTEGER,
ALTER COLUMN "units_in_stock" SET DATA TYPE INTEGER,
ALTER COLUMN "units_on_order" SET DATA TYPE INTEGER,
ALTER COLUMN "reorder_level" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_products" PRIMARY KEY ("product_id");

-- AlterTable
ALTER TABLE "region" DROP CONSTRAINT "pk_region",
ALTER COLUMN "region_id" SET DATA TYPE INTEGER,
ALTER COLUMN "region_description" SET DATA TYPE CHAR,
ADD CONSTRAINT "pk_region" PRIMARY KEY ("region_id");

-- AlterTable
ALTER TABLE "shippers" DROP CONSTRAINT "pk_shippers",
ALTER COLUMN "shipper_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_shippers" PRIMARY KEY ("shipper_id");

-- AlterTable
ALTER TABLE "suppliers" DROP CONSTRAINT "pk_suppliers",
ALTER COLUMN "supplier_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_suppliers" PRIMARY KEY ("supplier_id");

-- AlterTable
ALTER TABLE "territories" ALTER COLUMN "territory_description" SET DATA TYPE CHAR,
ALTER COLUMN "region_id" SET DATA TYPE INTEGER;

-- AlterTable
ALTER TABLE "us_states" DROP CONSTRAINT "pk_usstates",
ALTER COLUMN "state_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "pk_usstates" PRIMARY KEY ("state_id");

-- AddForeignKey
ALTER TABLE "customer_customer_demo" ADD CONSTRAINT "fk_customer_customer_demo_customer_demographics" FOREIGN KEY ("customer_type_id") REFERENCES "customer_demographics"("customer_type_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employee_territories" ADD CONSTRAINT "fk_employee_territories_employees" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employees" FOREIGN KEY ("reports_to") REFERENCES "employees"("employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "fk_order_details_orders" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "fk_order_details_products" FOREIGN KEY ("product_id") REFERENCES "products"("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_employees" FOREIGN KEY ("employee_id") REFERENCES "employees"("employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_shippers" FOREIGN KEY ("ship_via") REFERENCES "shippers"("shipper_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "fk_products_categories" FOREIGN KEY ("category_id") REFERENCES "categories"("category_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "fk_products_suppliers" FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("supplier_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "territories" ADD CONSTRAINT "fk_territories_region" FOREIGN KEY ("region_id") REFERENCES "region"("region_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
