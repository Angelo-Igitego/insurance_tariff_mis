class DrugSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :category, :form, :unit_of_measurement, :updated_at, :created_at
end
