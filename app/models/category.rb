require "pry"
class Category < ActiveRecord::Base
  has_many :books

  def print_books
    self.books.each do |book|
      puts book.title
    end
  end

  def print_available_books
    available_book_titles.each do |title|
      puts title
    end
  end

  def available_books
    books.select do |book|
      !books.loans.any?{|loan|
        loan.status == "out"
      }
    end
  end

  def available_book_titles
    available_books.map do |book|
      book.title
    end
  end

  def book_titles
    books.map do |book|
      book.title
    end
  end
end
