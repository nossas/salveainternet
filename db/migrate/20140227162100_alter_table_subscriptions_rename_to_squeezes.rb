class AlterTableSubscriptionsRenameToSqueezes < ActiveRecord::Migration
  def up
    execute "ALTER TABLE subscriptions RENAME TO squeezes"
  end
  
  def down
    execute "ALTER TABLE squeezes RENAME TO subscriptions"
  end
end
