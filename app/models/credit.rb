class Credit < ApplicationRecord

    # def broadcast_append_or_update_to_credit()
    #     if self.new_record?
    #         broadcast_append_to "credits"
    #     else
    #         broadcast_update_to "credits"
    #     end
    # end

    belongs_to :user
end
