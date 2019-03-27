class AddContactToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :contact, :string
  end
end
