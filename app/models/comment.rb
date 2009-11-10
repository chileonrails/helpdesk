class Comment < ActiveRecord::Base
  belongs_to :ticket

  validates_presence_of :body, :ticket_id
end
