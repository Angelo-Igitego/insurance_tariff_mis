class ProductSerializer
include FastJsonapi::ObjectSerializer
attributes :id, :name, :description, :created_at, :updated_at
end