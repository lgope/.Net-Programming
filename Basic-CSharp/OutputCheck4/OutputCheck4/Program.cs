using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutputCheck4
{
    class index
    {
        protected int count;
        public index()
        {
            count = 0;
        }
    }

    class index1 : index
    {
        public index1()
        {
            count += 2;
        }

        public void increment()
        {
            count = count + 1;
            Console.WriteLine(count);
            Console.ReadLine();
        }
    }


    class MyProgram
    {
        static void Main(string[] args)
        {
            index1 i = new index1();
            i.increment();
        }
    }
}
