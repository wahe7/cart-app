require 'pago'
class Order < ApplicationRecord

    has_many :line_items, dependent: :destroy
    validates :name, :address, :email, presence: true
    
    enum pay_type: {
        "check" => 0,
        "credit card" => 1,
        "purchase order" => 2
    }
    validates :pay_type, inclusion: pay_types.keys ,allow_blank: true

   

    def add_line_items_from_cart(cart)
         cart.line_items.each do |item|
         item.cart_id = nil
         item.order_id = id
         end
     end


     def charge!(pay_type_params)
         payment_details = {}
         payment_method = nil
    
         case pay_type
         when "check"
         payment_method = :check
         payment_details[:routing] = pay_type_params[:routing_number]
         payment_details[:account] = pay_type_params[:account_number]
         when "credit card"
         payment_method = :credit_card
         month,year = pay_type_params[:expiration_date].split(//)
         payment_details[:cc_num] = pay_type_params[:credit_card_number]
         payment_details[:expiration_month] = month
         payment_details[:expiration_year] = year
         when "purchase order"
         payment_method = :po
         payment_details[:po_num] = pay_type_params[:po_number]
         end
        
         payment_result = Pago.make_payment(
         order_id: id,
         payment_method: payment_method,
         payment_details: payment_details
         )
        
         if payment_result.succeeded?
         OrderMailer.received(self).deliver_later
         else
         raise payment_result.error
         end
         end

end
