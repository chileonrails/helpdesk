class Status < ActiveRecord::Base
  has_many :tickets

  validates_presence_of :name
  validates_uniqueness_of :name
end
