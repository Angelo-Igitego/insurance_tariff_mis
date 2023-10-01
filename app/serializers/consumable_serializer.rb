class ConsumableSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :form, :unit_of_measurement, :updated_at, :created_at
end