class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
    end
  end
end
