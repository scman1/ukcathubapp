class CreateAuthorAffiliations < ActiveRecord::Migration[6.0]
  def change
    create_table :author_affiliations do |t|
      t.integer :author_id
      t.string :name
      t.string :add_01
      t.string :add_02
      t.string :add_03
      t.string :add_04
      t.string :add_05
      t.string :country

      t.timestamps
    end
  end
end
