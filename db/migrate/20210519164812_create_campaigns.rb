class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.integer :goal
      t.belongs_to :user

      t.timestamps
    end
  end
end