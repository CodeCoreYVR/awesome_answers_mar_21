class Answer < ApplicationRecord
  belongs_to :question
  #   validates :body, presence: true
    validates :body, presence:{message: 'Please enter answer body'}
end
