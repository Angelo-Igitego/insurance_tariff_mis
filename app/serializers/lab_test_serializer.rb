class LabTestSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :category, :unit_of_measurement, :min_ref_value, :max_ref_value, :created_at, :updated_at
end