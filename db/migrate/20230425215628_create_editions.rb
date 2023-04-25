class CreateEditions < ActiveRecord::Migration[7.0]
  def change
    create_table :editions do |t|
      t.date :start_date

      t.timestamps
    end
  end
end
