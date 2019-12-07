using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Delegates
{
    class Program
    {
        delegate int mydel(int aa);
        int myfunc(int a) { return a * a; }
        int myfunc2(int a) { return a + a; }
        static void Main(string[] args)
        {
            Program p = new Program();
            mydel d = p.myfunc; System.Console.WriteLine(d(5));
            d = p.myfunc2; System.Console.WriteLine(d(5));
            System.Console.Read();
        }
    }
}
