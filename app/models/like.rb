class Like < ApplicationRecord
    #If migration for join table was already created, you can use: rails g model Like --skip
    #If you want to create this from scratch with migration for join table, do:
    #rails g model Like user:references question:references

    belongs_to: question
    belongs_to: user
end
