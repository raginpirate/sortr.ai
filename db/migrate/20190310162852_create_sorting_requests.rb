class CreateSortingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :sorting_requests do |t|
      t.integer :status
      t.json :unsorted_list
      t.json :sorted_list
      t.json :options

      t.timestamps
    end
  end
end
