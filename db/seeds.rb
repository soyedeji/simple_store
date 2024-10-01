require "csv"

# Clear out existing products and categories
Product.destroy_all
Category.destroy_all

# Read the CSV file
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |product_row|
  # Find or create the category
  category_name = product_row['category_name']
  category = Category.find_or_create_by(name: category_name)

  # Create the product and associate it with the category
  Product.create(
    title: product_row['title'],
    description: product_row['description'],
    price: product_row['price'],
    stock_quantity: product_row['stock_quantity'],
    category: category
  )
end
