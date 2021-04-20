class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user, optional: true
  #   validates :body, presence: true
    validates :body, presence:{message: 'Please enter answer body'},length: {minimum: 5 }
    # validates :body, presence:{message: 'Please enter answer body'},length: {minimum: 10, maximum: 50}
end
