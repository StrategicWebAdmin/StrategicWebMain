class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phonenumber
      t.string :select_service_type
      t.string :message

      t.timestamps
    end
  end
end
