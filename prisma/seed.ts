import { PrismaClient } from '@prisma/client'
import {faker} from "@faker-js/faker";

const prisma = new PrismaClient()

async function main() {
  console.log(`Start seeding ...`)
  for (let index = 0; index <= 100000; index++) {
    const customer_id = faker.datatype.uuid()
    await Promise.all([
      prisma.customers.create({
        data: {
          customer_id: customer_id,
          company_name: faker.company.companyName()
        }
      }),
      prisma.employees.create({
        data: {
          employee_id: index,
          last_name: faker.name.lastName(),
          first_name: faker.name.firstName()
        }
      }),
      prisma.shippers.create({
        data: {
          shipper_id: index,
          company_name: faker.company.companyName()
        }
      })
    ])
    await prisma.orders.create({
      data: {
        order_id: index,
        customers: {
          connect: {
            customer_id: customer_id
          }
        },
        employees: {
          connect: {
            employee_id: index
          }
        },
        shippers: {
          connect: {
            shipper_id: index
          }
        }
      }
    })
  }
  console.log(`Seeding finished.`)
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
