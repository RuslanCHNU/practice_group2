class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
