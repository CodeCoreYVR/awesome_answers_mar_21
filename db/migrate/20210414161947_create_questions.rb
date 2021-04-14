class CreateQuestions < ActiveRecord::Migration[6.1]
  #rails g model question title:string body:text

  # Migrations are incremental changes to a database. They can always be reversed. Migrations are defined in migration files.
  # Migration files themselves do not apply changes to a database. They merely contain the steps to change it. You'll need to specifically execute the migration by "migrating" it.
  # Run rails db:migrate to migrate all unmigrated migration files. Run rails db:rollback to undo the last migration.
  
  #In case of errors you can drop your database, but not recommended in the real world with an active database
  #rails db:drop
  #rails db:create
  #Shortcut for both: rails db:reset   (but does not always execute properly)


  # Some ActiveRecord data types as of Rails 5

  # :primary_key
  # :string
  # :text
  # :integer
  # :bigint
  # :float
  # :decimal
  # :numeric
  # :datetime
  # :time
  # :date
  # :binary
  # :boolean

  def change
    create_table :questions do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
