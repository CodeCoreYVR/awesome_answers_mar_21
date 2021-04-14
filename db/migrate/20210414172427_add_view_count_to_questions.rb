class AddViewCountToQuestions < ActiveRecord::Migration[6.1]
  #created with command rails g migration add_view_count_to_questions

  #To rollback to a specific migration you can do this command: rails db:rollback STEP=3

  def change
    add_column :questions, :view_count, :integer
  end
end
