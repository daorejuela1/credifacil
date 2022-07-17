class CreditController < ApplicationController
    def post_credit
        @credit = credit_params
        render json: @credit
    end
end
