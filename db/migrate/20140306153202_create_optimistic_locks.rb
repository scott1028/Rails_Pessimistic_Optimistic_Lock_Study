class CreateOptimisticLocks < ActiveRecord::Migration
  def change
    create_table :optimistic_locks do |t|
      t.string :label
      t.integer :status
      t.integer :lock_version

      t.timestamps
    end
  end
end
