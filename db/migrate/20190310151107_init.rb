class Init < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :callback_url
      t.string :email
      t.string :secret_key
      t.timestamps
    end
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :vbucks
      t.timestamps
    end
    create_table :requestable do |t|
      t.integer :status
      t.timestamps
      t.belongs_to :drivers, :clients, index: true
    end
    create_table :sorting_requests do |t|
      t.json :unsorted_list
      t.json :sorted_list
      t.json :options
      t.belongs_to :requestable, index: true
    end
  end
end
