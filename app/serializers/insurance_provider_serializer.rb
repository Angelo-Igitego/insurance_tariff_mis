class InsuranceProviderSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :name, :email, :address, :city, :province_or_state, :country, :updated_at, :created_at
end