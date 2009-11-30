class Notifier < ActionMailer::Base
  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "Helpdesk Notifier <noreply@helpdesk>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "Helpdesk Notifier <noreply@helpdesk>"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Helpdesk Notifier <noreply@helpdesk>"
    recipients    user.email
    sent_on       Time.now
    body          :change_password_url => change_password_url(user.perishable_token)
  end
end
