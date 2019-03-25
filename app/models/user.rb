class User < ActiveRecord::Base
  has_many :loans
  has_many :books, through: :loans

  def checkout(book)
    self.loans.create(book: book, status: "out")
  end

  def return(book)
    book_loan = self.loans.find_by(user_id: self.id, book_id: book.id)
    book_loan.update(status: "returned")
  end

  def checked_out_books
    self.books.where("loans.status": "out")
  end

  def checked_out_book_titles
    checked_out_books.map(&:title)
  end

  def print_checked_out_books
    checked_out_books.each do |book|
      puts book.title
    end
  end

end
