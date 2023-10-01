class MedicalActSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :available, :productable_type, :productable_id, :unit_of_measurement, :cost_price, :selling_price, :reimbursable_amount, :created_at, :updated_at
end