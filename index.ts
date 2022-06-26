import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

async function main() {
  const allEmployees = await prisma.employees.findMany()
  console.dir(allEmployees)
}

main()
  .catch((e) => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })