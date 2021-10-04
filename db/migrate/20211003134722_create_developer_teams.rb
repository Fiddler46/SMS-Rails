class CreateDeveloperTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :developer_teams do |t|
      t.belongs_to :team
      t.belongs_to :developer
      t.timestamps
    end
  end
end
