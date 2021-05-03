class CreateTags < ActiveRecord::Migration[6.1]
  # rails g model tag name:string
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end
end
