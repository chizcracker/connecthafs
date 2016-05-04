class AddStatusTimestamps < ActiveRecord::Migration
  def change
    add_column :users, :verification_sent_at, :timestamp
    add_column :users, :verification_confirmed_at, :timestamp
    add_column :users, :account_confirmed_at, :timestamp
  end
end
