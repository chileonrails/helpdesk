class User < ActiveRecord::Base
  acts_as_authentic

  def active?
    active
  end

  def activate!
    self.active = true
    save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

end

