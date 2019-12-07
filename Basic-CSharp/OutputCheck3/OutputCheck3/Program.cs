using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutputCheck3
{
    class MyProgram
    {
        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("Exception:" + "" + "1/Convert.ToInt32(0)");
                Console.ReadLine();
            } catch(ArithmeticException e)
            {
                Console.WriteLine("Divide by Zeroerror");
                Console.ReadLine();
            }
        }
    }
}
