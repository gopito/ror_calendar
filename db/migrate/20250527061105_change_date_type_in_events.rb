class ChangeDateTypeInEvents < ActiveRecord::Migration[8.0]
  def change
    change_column :events, :date, :date
  end
end
