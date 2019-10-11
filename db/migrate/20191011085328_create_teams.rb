class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|

      t.timestamps

      t.string :name
      t.text :description
      t.string :image_url
      t.boolean :is_private, default: false
    end
  end
end
