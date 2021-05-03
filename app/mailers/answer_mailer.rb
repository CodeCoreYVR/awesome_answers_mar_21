# To generate a mailer do:
# rails g mailer <name_of_mailer>
# https://guides.rubyonrails.org/action_mailer_basics.html

class AnswerMailer < ApplicationMailer
    # In a mailer class the public methods are user to create and send mails.
    # they are simillar to actions in a controller
    def hello_world
        mail(
            to: 'naveed@codecore.ca',
            from: "info@awesome-answers.io",
            cc: 'jj@movies.com',
            bcc: 'someone.else@example.com',
            subject: 'Hello World!'
        )
    end
    def new_answer(answer)
        # Any instance variable set in mailer will be available in its rendered templates
        @answer=answer
        @question=answer.question
        @question_owner=@question.user
        mail(
            to: @question_owner.email,
            subject: "#{answer.user.first_name} answered your question!"
        )
    end
    
end
