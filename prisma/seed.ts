import { PrismaClient, Speciality } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  // Criando um Admin
  const admin = await prisma.admin.create({
    data: {
      fullname: 'João Silva',
      phone: '123456789',
      email: 'joao.silva@email.com',
      password: 'hashedpassword',
      Adress: {
        create: [
          {
            street: 'Rua Exemplo',
            number: '123',
            city: 'Cidade Exemplo',
            state: 'Estado Exemplo',
            postal_code: '12345-678',
          },
        ],
      },
      Business: {
        create: [
          {
            cnpj: '12345678000199',
            state_registration: '1234567890',
            specialty: [Speciality.PIZZARIA, Speciality.BRASILEIRA],
          },
        ],
      },
    },
  });

  console.log({ admin });

  // Criando outro Admin
  const admin2 = await prisma.admin.create({
    data: {
      fullname: 'Maria Souza',
      phone: '987654321',
      email: 'maria.souza@email.com',
      password: 'hashedpassword', // Aqui você deve usar um hash de senha
      Adress: {
        create: [
          {
            street: 'Avenida Teste',
            number: '456',
            city: 'Cidade Teste',
            state: 'Estado Teste',
            postal_code: '87654-321',
          },
        ],
      },
      Business: {
        create: [
          {
            cnpj: '98765432000100',
            state_registration: '9876543210',
            specialty: [Speciality.HAMBURGUERIA, Speciality.FAST_FOOD],
          },
        ],
      },
    },
  });

  console.log({ admin2 });
}

main()
  .catch((e) => {
    throw e;
  })
  // eslint-disable-next-line @typescript-eslint/no-misused-promises
  .finally(async () => {
    await prisma.$disconnect();
  });
