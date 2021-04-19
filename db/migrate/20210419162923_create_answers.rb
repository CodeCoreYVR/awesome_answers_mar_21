class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true

      # Primary Key: Any id / integer refering to the column in its own table is known as primary key
      # Foreign Key: Any id that refers to the other table is known as foreign key 

      # The above migration creates a 'question_id' columne of 'big_int'. Big Int can go from -9_223_372_036_854_775_807
      # to 9_223_372_036_854_775_807
      
      # Int can go from -2_147_483_648 to 2_147_483_648

      #  It also sets a foreign_key constraint to endofrce teh association to the question table as the db level.

      # The question_id will refere to the id of the question in the question table. It is said that answer 'belong to' the question



      t.timestamps
    end
  end
end
