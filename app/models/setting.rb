class Setting < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  before_validation :upcase_name

  def self.[]=(name, value)
    self.set(name, value)
  end

  def self.get(name, fallback_env: true)
    name = "#{name}".parameterize.underscore.upcase
    self.find_by_name(name)&.value || (fallback_env ? ENV[name] : nil)
  end

  def self.[](name)
    self.get(name, fallback_env: true)
  end

  def upcase_name
    if self.name.respond_to? :parameterize
      self.name = self.name.parameterize.underscore.upcase
    end
  end
end
