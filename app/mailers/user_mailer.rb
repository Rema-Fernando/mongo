class UserMailer < ApplicationMailer
    def send_email(user_id)
        @user = user_id
        mail(to: @user.email, subject: 'Good Evening :)') do |format|
            format.text { render plain: "Hello #{@user.name},\nHave a great day :)" }
            format.html { render html: "<strong>Hello #{@user.name},</strong><br>Have a great day :)".html_safe }
          end
      end
end
