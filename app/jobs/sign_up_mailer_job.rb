class SignUpMailerJob < ApplicationJob
  queue_as :default

  def perform(user, type)
    if type == "inactive"
      UserMailer.with(user: user).inactive_mail.deliver_now
    end
    if type == "delete"
      UserMailer.with(user: user).delete_mail.deliver_now
    end
    if type == "welcome"
      UserMailer.with(user: user).welcome_mail.deliver_now
    end
  end
end
