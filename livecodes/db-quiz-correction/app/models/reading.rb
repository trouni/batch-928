class Reading < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  # has_one :author, through: :books
end
