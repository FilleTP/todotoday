class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :inviter, null: false, foreign_key: { to_table: :profiles}
      t.references :invitee, null: false, foreign_key: { to_table: :profiles}
      t.references :task_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
