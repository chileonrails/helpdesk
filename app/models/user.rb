class User < ActiveRecord::Base
  acts_as_authentic

  def active?
    active
  end

  def activate!
    self.active = true
    save
  end

end

