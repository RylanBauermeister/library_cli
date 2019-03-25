require_relative "../config/environment.rb"
require "pry"

greeting
username = get_user_name
user = User.find_or_create_by(name: username)
choice = what_to_do
loop do
  case choice
  when "checkout"
    category = pick_category
    category.print_available_books
    book = get_book_selection(category)
    user.checkout(book)
  when "return"
    book_return_message
    user.print_checked_out_books
    book = get_book_to_return(user)
    user.return(book) if !book.nil?
  when "exit"
    break
  end
  choice = what_to_do
end

binding.pry

"Hi!"
