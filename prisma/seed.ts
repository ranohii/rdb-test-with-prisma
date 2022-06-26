import { PrismaClient } from '@prisma/client'
import {faker} from "@faker-js/faker";

const prisma = new PrismaClient()

async function main() {
  console.log(`Start seeding ...`)
  for (const index of Array.from({length: 10}, (_, i) => i + 1)) {
    await Promise.all([
      prisma.customers.create({
        data: {
          customer_id: faker.datatype.uuid(),
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
