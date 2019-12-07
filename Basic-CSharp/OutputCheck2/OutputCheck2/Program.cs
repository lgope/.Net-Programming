using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutputCheck2
{
    class Program
    {
        static String location;
        static int num;

        static void Main(string[] args)
        {
            Console.WriteLine(location == null ? "locaion is null" : location);
            Console.WriteLine(num == null ? "num is null" : num);
            Console.ReadLine();
        }
    }
}
