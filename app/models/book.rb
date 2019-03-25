require "pry"
class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :loans
  has_many :users, through: :loans

end
