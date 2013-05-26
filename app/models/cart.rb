class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_product = line_items.find_by_product_id(product_id)
		if current_product
			current_product.quantity += 1
		else
			current_product = line_items.build(product_id: product_id)
		end	
		current_product
	end
end
