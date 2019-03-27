class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :notice_type
      t.string :message
      t.datetime :event_time

      t.timestamps
    end
  end
end
