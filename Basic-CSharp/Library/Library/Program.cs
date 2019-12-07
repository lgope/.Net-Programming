using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library
{
    class Books
    {
        public string bookName;
        private string dueDate;

        public Books(string bookName, string dueDate)
        {
            this.bookName = bookName;
            this.dueDate = dueDate;
        }

        public void borrowBooks(string bookName, string userName)
        {
            Console.WriteLine(bookName + " book is borrowed by " + userName + ". And due date is : " + this.dueDate);
        }
    }

    class Movies
    {
        public string movieName;
        private string dueDate;

        public Movies(string movieName, string dueDate)
        {
            this.movieName = movieName;
            this.dueDate = dueDate;
        }

        public void borrowMovies(string movieName, string userName)
        {
            Console.WriteLine(movieName + " movie is borrowed by " + userName + ". And due date is : " + this.dueDate);
            Console.ReadLine();
        }
    }

    class createAccount
    {
        public string userName;
        private string cardName;
        private string id;

        public createAccount(string userName, string cardName, string id)
        {
            this.userName = userName;
            this.cardName = cardName;
            this.id = id;
        }
    }


    class LibraryTest
    {
        static void Main(string[] args)
        {
            Books books1 = new Books("English", "11/11/19");
            Books books2 = new Books("Math", "11/11/20");

            Movies movies1 = new Movies("Iron Man", "11/11/19");
            Movies movies2 = new Movies("Thor", "11/11/20");

            createAccount user1 = new createAccount("Lakshman", "lgope", "173");

            books1.borrowBooks(books1.bookName, user1.userName);
            movies1.borrowMovies(movies1.movieName, user1.userName);
        }
    }
}
