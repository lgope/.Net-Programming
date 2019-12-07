using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutputCheck1
{
    class Program
    {
        public static void Main(string[] args)
        {
            Sample s1 = new Sample();
            s1.SetData(10, 5);
            s1.Display();
        }
    }

    class Sample
    {
        int i;
        int j;
        public void SetData(int i, int j)
        {
            this.i = j;
            j = i;
        }

        public void Display()
        {
            Console.WriteLine(i + " " + j);
            Console.ReadLine();
        }
    }
}
