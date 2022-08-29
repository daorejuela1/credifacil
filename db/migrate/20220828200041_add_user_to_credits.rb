class AddUserToCredits < ActiveRecord::Migration[6.1]
  def change
    change_table :credits do |t|
       t.belongs_to :user
      end
  end
end
