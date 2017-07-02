class AddConfirmableToDevise < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmaed_at, :datetime
    add_column :users, :confirmation_sent_at, :dattime
    add_index :users, :confirmation_token, unique: true

    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

  end
end
