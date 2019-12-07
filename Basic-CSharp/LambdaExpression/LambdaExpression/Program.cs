using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LambdaExpression
{
    class Program
    {
        delegate int mydel(int aa, int bb);
        static void Main(string[] args)
        {
            mydel d = (a, b) => a + 2 * b;

            // in above line, read a,b go to a+b*2 to evaluate

            System.Console.WriteLine(d(2, 3));
            System.Console.Read();
        }
    }
}
