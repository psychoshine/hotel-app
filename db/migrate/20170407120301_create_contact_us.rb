class CreateContactUs < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_us do |t|
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
