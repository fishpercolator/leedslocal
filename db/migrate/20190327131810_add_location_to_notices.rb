class AddLocationToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :location, :string
  end
end
