class CreateSpends < ActiveRecord::Migration[7.0]
  def change
    create_table :spends do |t|
      t.references :User, null: false, foreign_key: true
      t.string :spended
      t.integer :cost
      t.timestamp :date_spend

      t.timestamps
    end
  end
end
