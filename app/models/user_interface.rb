OPTIONS = ["checkout", "return", "exit"]

def greeting
    puts "Welcome to the library!"
end

def get_user_name
    puts "Please enter your username:"
    gets.chomp
end

def print_categories
  Category.all.each do |category|
    puts category.name
  end
end

def pick_category
  categories = Category.all.map(&:name)
  selected_category = ""
  loop do
    puts "Pick a category, or type 'list' to get a list of options!"
    selected_category = gets.chomp
    if selected_category == 'list'
      print_categories
    elsif !categories.include?(selected_category)
      puts "Please input a valid selection from the list."
    else
      break
    end
  end
  Category.find_by(name: selected_category)
end

def list_options
  OPTIONS.each do |option|
    puts option
  end
end

def what_to_do
  selection = ""
  loop do
    puts "What would you like to do (type 'list' for options)?"
    selection = gets.chomp
    if selection == 'list'
      list_options
    elsif OPTIONS.include?(selection)
      break
    else
      puts "Invalid selection.  Please try again, or type 'list' for options."
    end
  end
  selection
end

def get_book_selection(category)
  selection = ""
  loop do
    puts "Which book would you like to checkout?"
    selection = gets.chomp
    if category.available_book_titles.include?(selection)
      break
    else
      puts "Invalid selection.  Please try again, or type 'list' for options."
    end
  end
  Book.find_by(title: selection)
end

#--------------------- BOOK RETURN METHODS -----------------------------#
def book_return_message
  puts "Thanks for returning a book!  You have the following checked out:"
end

def get_book_to_return(user)
  selection = ""
  if user.checked_out_books.count == 0
    puts "You don't have any books right now!"
    return nil
  end
  loop do
    puts "Which book would you like to return?"
    selection = gets.chomp
    if user.checked_out_book_titles.include?(selection)
      break
    else
      puts "Invalid selection.  Please try again, or type 'list' for options."
    end
  end
  Book.find_by(title: selection)
end
