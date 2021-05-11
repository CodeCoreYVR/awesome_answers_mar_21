class QuestionSerializer < ActiveModel::Serializer
  # active_model_serializers docs:
  # https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/README.md
  
  # By default, rails will use this serializer when rendering json

  # Use the "atttributes" method to specify which attributes
  # of a model to include in its serialization output
  attributes(
    :id,
    :title,
    :body,
    :view_count,
    :like_count, # custom attribute defined in serializer
    :created_at,
    :updated_at,
  )

  # To include associate models, we can use the same "belongs_to" and "has_many" methods.
  # We can rename the associate with "key" in the serialized output.
  belongs_to(:user, key: :author)

  has_many(:answers)

  # To customize serialization for associated models, we can define a serializer
  # within the current serializer. This would replace any global serializer 
  # whenever we are serializing questions.
  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :body, :created_at, :updated_at

    # This will not work automatically when included nested associations
    # We will need to include it in the controller
    belongs_to(:user, key: :author)
  end

  def like_count
    # "object" is assigned the instance of the model being serialized
    # In the question model, we used "self" because it was assigned
    # an instance of the model. But here if we use "self" here, then
    # it would be an instance of the QuestionSerializer.
    object.likes.count
  end
end
