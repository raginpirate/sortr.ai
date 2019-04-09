class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :callback_url
      t.string :email
      t.string :secret_key

      t.timestamps
    end
  end
end
