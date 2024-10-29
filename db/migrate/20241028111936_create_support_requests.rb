class CreateSupportRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :support_requests do |t|
        t.string :email , comment: "email of the user"
        t.string :subject , comment: "subject of the support request"
        t.text :message , comment: "message of the support request"

        t.references :order,
        foreign_key: true,
        comment: "order associated with the support request"
      t.timestamps
    end
  end
end
