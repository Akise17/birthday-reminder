class User < ApplicationRecord
  acts_as_paranoid

  validates_presence_of :first_name, :last_name, :birthday_date, :location

  def self.[](id)
    self.find(id)
  end
end
