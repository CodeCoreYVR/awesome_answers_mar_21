class Answer < ApplicationRecord
  belongs_to :question
  #   validates :body, presence: true
    validates :body, presence:{message: 'Please enter answer body'},length: {minimum: 5 }
    # validates :body, presence:{message: 'Please enter answer body'},length: {minimum: 10, maximum: 50}
end
