class SupportRequest < ApplicationRecord
    belong_to :order , optional: true
    has_rich_text :response
end
