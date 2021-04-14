class Question < ApplicationRecord
    #GENERATING THIS FILE:
    #rails g model question title:string body:text
    #This above command creates this model Class in file question.rb
    #and also a migration file to create a table questions
    # 1. rails is console keyword that we use (instead of node, npm, knex, or ruby as we used before)
    # 2. g - stands for "generate"
    # 3. model - keyword to generate a model
    # 4. question is the name for our model - models are always singular
    # 5. title is the name of a property the model has with the type of string
    # 6. body is another property with the type of text
    # *This generates the class model and a migration file, similar to knex, that is not migrated yet


    #NAMING CONVENTIONS: A model is always singular and database tables are always plural
    #The Question Class is created and it inherits from the Application (ApplicationRecord)
    #Which in turn inherits from the Active Record library (see) application_record.rb
end
