using System;

namespace Homeworks
{
    class Program
    {

        static int[] yRound = new int[3];
        static int[] compRound = new int[3];
        static int[] dice1Round = new int[3];
        static int[] dice2Round = new int[3];
        static int[] dice3Round = new int[3];
        static int[] dice4Round = new int[3];
        static int[] result1Round = new int[3];
        static int[] result2Round = new int[3];

        static void Main(string[] args)
        {
            Console.WriteLine("---          Start game          ---\n");

            for (int count = 0; count <= 2; count++)
            {
                Console.WriteLine($"Round {count + 1}\n");
                Console.Write("\nPredict the points number (2...12):   ");
                yRound[count] = int.Parse(Console.ReadLine());

                dice1Round[count] = RollTheDice();
                dice2Round[count] = RollTheDice();

                dice3Round[count] = RollTheDice();
                dice4Round[count] = RollTheDice();

                int x1 = dice1Round[count] + dice2Round[count];
                result1Round[count] = x1 - Math.Abs(x1 - yRound[count]) * 2;

                compRound[count] = compPredict();
                int x2 = dice3Round[count] + dice4Round[count];
                result2Round[count] = x2 - Math.Abs(x2 - compRound[count]) * 2;

                Console.WriteLine("User rolls the dice:");
                Console.WriteLine("-------------");
                PrintDice(dice1Round[count]);
                Console.WriteLine("-------------");
                Console.WriteLine("-------------");
                PrintDice(dice2Round[count]);
                Console.WriteLine("-------------");
                Console.WriteLine($"On the dice fall {x1} points.");
                Console.WriteLine($"Result is {result1Round[count]} points.");
                Console.WriteLine("");

                Console.WriteLine($"Computer predicted {compRound[count]}.");
                Console.WriteLine("Computer rolls the dice:");
                Console.WriteLine("-------------");
                PrintDice(dice3Round[count]);
                Console.WriteLine("-------------");
                Console.WriteLine("-------------");
                PrintDice(dice4Round[count]);
                Console.WriteLine("-------------");
                Console.WriteLine($"On the dice fall {x2} points.");
                Console.WriteLine($"Result is {result2Round[count]} points.");

                Console.WriteLine("");
                Console.WriteLine("---------- Current score ----------");
                Console.WriteLine($"User:       {result1Round[count]} points");
                Console.WriteLine($"Computer:   {result2Round[count]} points");
                Console.WriteLine("\n");

                if (result1Round[count] > result2Round[count])
                {
                    Console.WriteLine($"Users is ahead {result1Round[count] - result2Round[count]} points!");
                }else if(result1Round[count] < result2Round[count])
                {
                    Console.WriteLine($"Computer is ahead {result2Round[count] - result1Round[count]} points!");
                }else
                {
                    Console.WriteLine("User and computer have the same number of points!");
                }

                Console.WriteLine("-----------------------------------");
            }

            PrintResult();
            Console.WriteLine("\n");

            restartGame();
        }

        static void restartGame(){
            Console.WriteLine("Do you want to play ones more? (Y / N)");
            string restart = Console.ReadLine();

            if (restart == "Y" || restart == "y"){
                for (int count = 0; count <= 2; count++)
                    {
                        Console.WriteLine($"Round {count + 1}\n");
                        Console.Write("\nPredict the points number (2...12):   ");
                        yRound[count] = int.Parse(Console.ReadLine());

                        dice1Round[count] = RollTheDice();
                        dice2Round[count] = RollTheDice();

                        dice3Round[count] = RollTheDice();
                        dice4Round[count] = RollTheDice();

                        int x1 = dice1Round[count] + dice2Round[count];
                        result1Round[count] = x1 - Math.Abs(x1 - yRound[count]) * 2;

                        compRound[count] = compPredict();
                        int x2 = dice3Round[count] + dice4Round[count];
                        result2Round[count] = x2 - Math.Abs(x2 - compRound[count]) * 2;

                        Console.WriteLine("User rolls the dice:");
                        Console.WriteLine("-------------");
                        PrintDice(dice1Round[count]);
                        Console.WriteLine("-------------");
                        Console.WriteLine("-------------");
                        PrintDice(dice2Round[count]);
                        Console.WriteLine("-------------");
                        Console.WriteLine($"On the dice fall {x1} points.");
                        Console.WriteLine($"Result is {result1Round[count]} points.");
                        Console.WriteLine("");

                        Console.WriteLine($"Computer predicted {compRound[count]}.");
                        Console.WriteLine("Computer rolls the dice:");
                        Console.WriteLine("-------------");
                        PrintDice(dice3Round[count]);
                        Console.WriteLine("-------------");
                        Console.WriteLine("-------------");
                        PrintDice(dice4Round[count]);
                        Console.WriteLine("-------------");
                        Console.WriteLine($"On the dice fall {x2} points.");
                        Console.WriteLine($"Result is {result2Round[count]} points.");

                        Console.WriteLine("");
                        Console.WriteLine("---------- Current score ----------");
                        Console.WriteLine($"User:       {result1Round[count]} points");
                        Console.WriteLine($"Computer:   {result2Round[count]} points");
                        Console.WriteLine("\n");

                        if (result1Round[count] > result2Round[count])
                        {
                            Console.WriteLine($"Users is ahead {result1Round[count] - result2Round[count]} points!");
                        }else if(result1Round[count] < result2Round[count])
                        {
                            Console.WriteLine($"Computer is ahead {result2Round[count] - result1Round[count]} points!");
                        }else
                        {   
                            Console.WriteLine("User and computer have the same number of points!");
                        }

                        Console.WriteLine("-----------------------------------");
                    }
                    PrintResult();
                    restartGame();
            }else{
                Console.WriteLine("Thank you for playing our game!");
            }
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

        static void PrintResult(){
            Console.WriteLine("--------------- Finish game ---------------");
            Console.WriteLine("");
            Console.WriteLine("Round  |              User  |          Computer  ");
            Console.WriteLine("-------+--------------------+--------------------");

            for (int i = 0; i < 3; i++)
            {
                Console.WriteLine($"       |  Predicted:     {yRound[i]}  |  Predicted:     {compRound[i]}  ");
                Console.WriteLine($"   {i+1}   |  Dice:          {dice1Round[i] + dice2Round[i]}  |  Dice:          {dice3Round[i] + dice4Round[i]}  ");
                Console.WriteLine($"       |  Result:       {result1Round[i]}  |  Result:       {result2Round[i]}  ");
                Console.WriteLine("-------+--------------------+--------------------");
            }

            int sum1 = 0;
            foreach (int item1 in result1Round)
            {
                sum1 += item1;
            }
            int sum2 = 0;

            foreach (int item2 in result2Round)
            {
                sum2 += item2;
            }
            
            Console.WriteLine($"Total  |  Points:  {sum1}  |  Points:  {sum2}  ");

            if (sum1 > sum2)
            {
                Console.WriteLine($"Users win {sum1 - sum2} points more.\nCongratulations!");
            }else if(sum1 < sum2)
            {
                Console.WriteLine($"Computer wins {sum2 - sum1} points more. Try again!");
            }else
            {
                Console.WriteLine("User and computer have the same number of points!");
            }
        }
    }
}
