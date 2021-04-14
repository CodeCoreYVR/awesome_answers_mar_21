class AddIndexToQuestions < ActiveRecord::Migration[6.1]
  #created with command: rails g migration AddIndexToQuestions

  def change
    add_index :questions, :title
    add_index :questions, :body
  end
  
end
