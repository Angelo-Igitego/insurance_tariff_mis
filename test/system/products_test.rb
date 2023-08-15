require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    check "Available" if @product.available
    fill_in "Cost price", with: @product.cost_price
    fill_in "Name", with: @product.name
    fill_in "Productable", with: @product.productable_id
    fill_in "Productable type", with: @product.productable_type
    fill_in "Reimbursable amount", with: @product.reimbursable_amount
    fill_in "Selling price", with: @product.selling_price
    fill_in "Unit of measurement", with: @product.unit_of_measurement
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    check "Available" if @product.available
    fill_in "Cost price", with: @product.cost_price
    fill_in "Name", with: @product.name
    fill_in "Productable", with: @product.productable_id
    fill_in "Productable type", with: @product.productable_type
    fill_in "Reimbursable amount", with: @product.reimbursable_amount
    fill_in "Selling price", with: @product.selling_price
    fill_in "Unit of measurement", with: @product.unit_of_measurement
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
