class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|

      t.timestamps
    end
  end
end
