class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.integer :amount
      t.string :description
      t.datetime :transaction_timestamp
      t.references :transactable, polymorphic: true, null: true, type: :uuid

      t.timestamps
    end
  end
end
