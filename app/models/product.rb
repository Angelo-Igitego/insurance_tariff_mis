class Product < ApplicationRecord
	belongs_to 	:productable, polymorphic: true, dependent: :destroy, :inverse_of => :product
	has_one  :product, as: :productable, inverse_of: :productable
end
