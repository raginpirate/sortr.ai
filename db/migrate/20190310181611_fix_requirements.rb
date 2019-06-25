class FixRequirements < ActiveRecord::Migration[5.2]
  def change
    drop_table "clients"
    change_table :sorting_requests do |t|
      t.change :unsorted_list, :json, null: false
      t.change :sorted_list, :json
      t.change :options, :json
    end

    change_table :drivers do |t|
      t.change :name, :string, null: false
      t.remove :email
      t.change :vbucks, :integer, null: false
    end
  end
end
