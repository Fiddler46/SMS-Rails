class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :dept_name
      t.string :dev_ids, array: true, default: []

      t.timestamps
    end
  end
end