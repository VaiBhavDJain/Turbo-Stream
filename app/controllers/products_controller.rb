class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to products_path, notice: "Product updated successfully." }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "product_#{@product.id}",
            partial: "product_card",
            locals: { product: @product }
          )
        }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
