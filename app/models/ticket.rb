class Ticket < ActiveRecord::Base
  belongs_to :status
  has_many :comments, :dependent => :destroy

  validates_presence_of :subject, :body, :status_id
end
