class User < ApplicationRecord
  acts_as_paranoid

  validates_presence_of :first_name, :last_name, :birthday_date, :location, :country

  def self.[](id)
    self.find(id)
  end

  def message
    msg = Setting['HOOKBIN_MESSAGE_TEMPLATE']
    self.as_json.each do |key, value|
      msg = msg.sub("{#{key}}", value.to_s)
    end
    msg
  end
end
