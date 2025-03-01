import { PrismaClient, Speciality, DaysOpen } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  // Criando o primeiro Admin
  const admin1 = await prisma.admin.create({
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
            speciality: [Speciality.PIZZARIA, Speciality.BRASILEIRA],
            name: 'Xgrilo',
            logo: 'logo.jpg',
            isOpen: true,
            BusinessHours: {
              create: [
                {
                  day: DaysOpen.MONDAY,
                  openHour: '07:00',
                  closeHour: '21:00',
                },
                {
                  day: DaysOpen.TUESDAY,
                  openHour: '07:00',
                  closeHour: '21:00',
                },
                {
                  day: DaysOpen.WEDNESDAY,
                  openHour: '07:00',
                  closeHour: '21:00',
                },
                {
                  day: DaysOpen.THURSDAY,
                  openHour: '07:00',
                  closeHour: '21:00',
                },
                {
                  day: DaysOpen.FRIDAY,
                  openHour: '07:00',
                  closeHour: '22:00',
                },
                {
                  day: DaysOpen.SATURDAY,
                  openHour: '07:00',
                  closeHour: '22:00',
                },
                {
                  day: DaysOpen.SUNDAY,
                  openHour: '07:00',
                  closeHour: '22:00',
                },
              ],
            },
          },
        ],
      },
    },
  });

  console.log({ admin1 });

  const admin2 = await prisma.admin.create({
    data: {
      fullname: 'Maria Souza',
      phone: '987654321',
      email: 'maria.souza@email.com',
      password: 'hashedpassword',
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
            speciality: [Speciality.HAMBURGUERIA, Speciality.FAST_FOOD],
            name: 'Xtuto Gabriel',
            logo: 'logo2.jpg',
            isOpen: true,
            BusinessHours: {
              create: [
                {
                  day: DaysOpen.MONDAY,
                  openHour: '08:00',
                  closeHour: '22:00',
                },
                {
                  day: DaysOpen.TUESDAY,
                  openHour: '08:00',
                  closeHour: '22:00',
                },
                {
                  day: DaysOpen.WEDNESDAY,
                  openHour: '08:00',
                  closeHour: '22:00',
                },
                {
                  day: DaysOpen.THURSDAY,
                  openHour: '08:00',
                  closeHour: '22:00',
                },
                {
                  day: DaysOpen.FRIDAY,
                  openHour: '08:00',
                  closeHour: '22:00',
                },
              ],
            },
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
