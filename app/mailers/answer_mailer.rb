# To generate a mailer do:
# rails g mailer <name_of_mailer>
# https://guides.rubyonrails.org/action_mailer_basics.html

class AnswerMailer < ApplicationMailer

    def hello_world
        mail(
            to: 'naveed@codecore.ca',
            from: "info@awesome-answers.io",
            cc: 'jj@movies.com',
            bcc: 'someone.else@example.com',
            subject: 'Hello World!'
        )
    end
    
end
