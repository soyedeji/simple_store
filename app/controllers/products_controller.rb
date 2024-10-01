class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      redirect_to products_path, alert: "Product not found."
    end
  end
end
