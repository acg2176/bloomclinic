class CreateTherapists < ActiveRecord::Migration[6.0]
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :bio
      t.string :email
      t.string :location
    end
  end
end
