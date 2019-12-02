class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'

    create_table :merchants do |t|
      t.citext :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
