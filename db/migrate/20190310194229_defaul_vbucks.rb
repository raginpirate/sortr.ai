class DefaulVbucks < ActiveRecord::Migration[5.2]
  def change
    change_table :drivers do |t|
      t.change :vbucks, :integer, null: false, default: 0
    end
  end
end
