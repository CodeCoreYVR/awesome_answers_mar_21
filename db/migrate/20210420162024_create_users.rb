class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index:{unique: true}
      # Add an index to columns that you often query
      # It will improve the performance of that query significantly as it grows in 'size'
      # An indexing does it by creating ordered list that gives the database faster way to search for the certain values in that column
      # Example think of index in a book vs just flipping through pages
      t.string :password_digest # This is the requirment of has_secure_password
      t.timestamps
    end
  end
end
