json.extract! credit, :id, :payment_type, :credit_value, :installment_number, :interest_type, :interest_rate, :created_at, :updated_at
json.url credit_url(credit, format: :json)
