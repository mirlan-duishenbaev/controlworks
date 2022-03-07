using System;

namespace Homeworks
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("---          Start game          ---\n");
            Console.Write("\nPredict the points number (2...12):   ");
            int y = int.Parse(Console.ReadLine());

            int dice1 = RollTheDice();
            int dice2 = RollTheDice();

            int dice3 = RollTheDice();
            int dice4 = RollTheDice();

            int x1 = dice1 + dice2;
            int result1 = x1 - Math.Abs(x1 - y) * 2;

            int compNum = compPredict();
            int x2 = dice3 + dice4;
            int result2 = x2 - Math.Abs(x2 - compNum) * 2;

            Console.WriteLine("User rolls the dice:");
            Console.WriteLine("-------------");
            PrintDice(dice1);
            Console.WriteLine("-------------");
            Console.WriteLine("-------------");
            PrintDice(dice2);
            Console.WriteLine("-------------");
            Console.WriteLine($"On the dice fall {x1} points.");
            Console.WriteLine($"Result is {result1} points.");
            Console.WriteLine("");

            Console.WriteLine($"Computer predicted {compNum}.");
            Console.WriteLine("Computer rolls the dice:");
            Console.WriteLine("-------------");
            PrintDice(dice3);
            Console.WriteLine("-------------");
            Console.WriteLine("-------------");
            PrintDice(dice4);
            Console.WriteLine("-------------");
            Console.WriteLine($"On the dice fall {x2} points.");
            Console.WriteLine($"Result is {result2} points.");

            Console.WriteLine("");
            GameResult(result1, result2);
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

        static int compPredict(){
            Random rnd = new Random();
            return rnd.Next(2, 13);
        }

        static void GameResult(int result1, int result2){
            if (result1 > result2)
            {
                Console.WriteLine($"Users win {result1 - result2} points more.\nCongratulations!");
            }else if(result1 < result2)
            {
                Console.WriteLine($"Computer wins {result2 - result1} points more. Try again!");
            }else
            {
                Console.WriteLine("User and computer have the same number of points!");
            }
        }
    }
}
