class CreateSearchhistories < ActiveRecord::Migration[5.0]
  def change
    create_table :searchhistories do |t|

      t.timestamps
    end
  end
end
