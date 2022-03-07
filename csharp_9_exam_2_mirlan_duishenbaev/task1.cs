using System;

namespace Homeworks
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("---          Start game          ---");
            Console.Write("Predict the points number (2...12):   ");
            int y = int.Parse(Console.ReadLine());

            int dice1 = RollTheDice();
            int dice2 = RollTheDice();

            int x = dice1 + dice2;
            int result = x - Math.Abs(x - y) * 2;

            Console.WriteLine("User rolls the dice:");
            Console.WriteLine("-------------");
            PrintDice(dice1);
            Console.WriteLine("-------------");
            Console.WriteLine("-------------");
            PrintDice(dice2);
            Console.WriteLine("-------------");
            Console.WriteLine($"On the dice fall {x} points.");
            Console.WriteLine($"Result is {result} points");
            GameResult(result);
        }

        static void PrintDice(int number){
            switch (number)
            {
                case 1:
                    Console.WriteLine("|           |");
                    Console.WriteLine("|     #     |");
                    Console.WriteLine("|           |");
                    break;
                case 2:
                    Console.WriteLine("|         # |");
                    Console.WriteLine("|           |");
                    Console.WriteLine("| #         |");
                    break;
                case 3:
                    Console.WriteLine("|         # |");
                    Console.WriteLine("|     #     |");
                    Console.WriteLine("| #         |");
                    break;
                case 4:
                    Console.WriteLine("| #       # |");
                    Console.WriteLine("|           |");
                    Console.WriteLine("| #       # |");
                    break;
                case 5:
                    Console.WriteLine("| #       # |");
                    Console.WriteLine("|     #     |");
                    Console.WriteLine("| #       # |");
                    break;
                case 6:
                    Console.WriteLine("| #   #   # |");
                    Console.WriteLine("|           |");
                    Console.WriteLine("| #   #   # |");
                    break;
            }
        }

        static int RollTheDice(){
            Random rnd = new Random();
            return rnd.Next(1, 7);
        }

        static void GameResult(int result){
            if (result > 0)
            {
                Console.WriteLine("Users win!");
            }else
            {
                Console.WriteLine("Failed! Try again!");
            }
        }
    }
}
