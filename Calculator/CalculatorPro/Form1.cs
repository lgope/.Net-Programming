using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CalculatorPro
{
    public partial class Form1 : Form
    {
        decimal num1 = 0;
        decimal num2 = 0;
        string operation = "";
        public Form1()
        {
            InitializeComponent();
        }
        private void input(string a)
        {
            if (textBox1.Text == "0")
                textBox1.Text = a;
            else
                textBox1.Text += a;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void ONE_Click(object sender, EventArgs e)
        {
            input("1");
        }

        private void TWO_Click(object sender, EventArgs e)
        {
            input("2");
        }

        private void THREE_Click(object sender, EventArgs e)
        {
            input("3");
        }

        private void FOUR_Click(object sender, EventArgs e)
        {
            input("4");
        }

        private void FIVE_Click(object sender, EventArgs e)
        {
            input("5");
        }

        private void SIX_Click(object sender, EventArgs e)
        {
            input("6");
        }

        private void SEVEN_Click(object sender, EventArgs e)
        {
            input("7");
        }

        private void EIGHT_Click(object sender, EventArgs e)
        {
            input("8");
        }

        private void NINE_Click(object sender, EventArgs e)
        {
            input("9");
        }

        private void ZERO_Click(object sender, EventArgs e)
        {
            input("0");
        }

        private void DOT_Click(object sender, EventArgs e)
        {
            if (!textBox1.Text.Contains("."))
            textBox1.Text += ".";
        }

        private void ResultBtn_Click(object sender, EventArgs e)
        {
            num2 = decimal.Parse(textBox1.Text);

            textBox2.Text = num1 + " " + operation;

            switch (operation)
            {
                case "+":
                    textBox1.Text = (num1 + num2).ToString();
                    break;
                case "-":
                    textBox1.Text = (num1 - num2).ToString();
                    break;
                case "*":
                    textBox1.Text = (num1 * num2).ToString();
                    break;
                case "/":
                    textBox1.Text = (num1 / num2).ToString();
                    break;
                case "^":
                    decimal PowerRes = 1;
                    for (decimal i = 1; i <= num2; i++)
                    {
                        PowerRes *= num1;
                    }
                    textBox1.Text = PowerRes.ToString();
                    break;
                case "%":
                    textBox1.Text = (num1 % num2).ToString();
                    break;
            }

            textBox2.Text = num1 + " " + operation + " " + num2 + " = " + textBox1.Text;
        }

        private void ADD_Click(object sender, EventArgs e)
        {
            num1 = decimal.Parse(textBox1.Text);
            textBox1.Text = "";
            operation = "+";

            showInfo(num1, operation);
        }

        private void MINUS_Click(object sender, EventArgs e)
        {
            num1 = decimal.Parse(textBox1.Text);
            textBox1.Text = "";
            operation = "-";

            showInfo(num1, operation);
        }

        private void DIVIDED_Click(object sender, EventArgs e)
        {
            num1 = decimal.Parse(textBox1.Text);
            textBox1.Text = "";
            operation = "/";

            showInfo(num1, operation);
        }

        private void MULTIPLY_Click(object sender, EventArgs e)
        {
            num1 = decimal.Parse(textBox1.Text);
            textBox1.Text = "";
            operation = "*";

            showInfo(num1, operation);
        }

        private void AC_Click(object sender, EventArgs e)
        {
            textBox1.Text = "0";
            textBox2.Text = "";
            num1 = 0;
            num2 = 0;
            operation = "";
        }

        private void SIN_Click(object sender, EventArgs e)
        {
            showTrigonometry("sin", decimal.Parse(textBox1.Text));

            textBox1.Text = (Math.Sin(double.Parse(textBox1.Text))).ToString();
        }

        private void COS_Click(object sender, EventArgs e)
        {
            showTrigonometry("cos", decimal.Parse(textBox1.Text));

            textBox1.Text = (Math.Cos(double.Parse(textBox1.Text))).ToString();
        }

        private void FACTORIAL_Click(object sender, EventArgs e)
        {
            long f = 1;
            for (long i = 1; i <= long.Parse(textBox1.Text); i++)
            {
                f = f * i;
            }
            textBox2.Text = textBox1.Text + "!";
            textBox1.Text = f.ToString();
        }



        private void LOG_Click(object sender, EventArgs e)
        {
            showTrigonometry("log", decimal.Parse(textBox1.Text));

            textBox1.Text = (Math.Log(double.Parse(textBox1.Text))).ToString();
        }

        private void SQRT_Click(object sender, EventArgs e)
        {
            showTrigonometry("√", decimal.Parse(textBox1.Text));

            textBox1.Text = (Math.Sqrt(double.Parse(textBox1.Text))).ToString();
        }

        private void POWER_Click(object sender, EventArgs e)
        {
            num1 = decimal.Parse(textBox1.Text);
            textBox1.Text = "";
            operation = "^";

            showInfo(num1, operation);
        }

        private void TAN_Click(object sender, EventArgs e)
        {
            showTrigonometry("tan", decimal.Parse(textBox1.Text));

            textBox1.Text = (Math.Tan(double.Parse(textBox1.Text))).ToString();
        }

        private void MOD_Click(object sender, EventArgs e)
        {
            num1 = decimal.Parse(textBox1.Text);
            textBox1.Text = "";
            operation = "%";

            showInfo(num1, operation);
        }

        private void showInfo(decimal num1, string operatorr)
        {
            textBox2.Text = num1 + " " + operation;
        }

        private void showTrigonometry(string Trigonometry, decimal num1)
        {
            textBox2.Text = Trigonometry + "" + num1;
        }
    }
}
