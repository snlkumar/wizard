class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.string :code
     t.references :user
      t.timestamps
    end
  end
end
