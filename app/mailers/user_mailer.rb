class UserMailer < ApplicationMailer
    default from: "info@mountainstyle.com"

    def contact_form(email, name, message)
    @message = message
        mail(from: email,
            to: 'mariafalkiewicz3@gmail.com',
            subject: "A new contact form message from #{name}")
    end
    def welcome(user)
        @appname = "MountainStyle"
        mail(to: user.email,
            subject: "Welcome to #{@appname}!")
    end
end
