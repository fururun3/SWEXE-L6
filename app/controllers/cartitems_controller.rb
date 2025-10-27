class CartitemsController < ApplicationController
  def new
    @cartitem = Cartitem.new
    @products = Product.all
  end

  def create
    cart = current_cart
    product = Product.find(params[:product_id])
    item = cart.cartitems.find_or_initialize_by(product_id: product.id)
    item.quantity = (item.quantity || 0) + 1
    item.save
    redirect_to carts_path, notice: "#{product.names}をカートに追加しました。"
  end

  def destroy
    item = Cartitem.find(params[:id])
    item.destroy
    redirect_to carts_path, notice: "カートから削除しました。"
  end

  def update_quantity
    item = Cartitem.find(params[:id])
    new_quantity = (item.quantity || 0) + params[:change].to_i

    if new_quantity < 1
      redirect_to carts_path, alert: "数量は1以上にしてください"
    else
      item.update(quantity: new_quantity)
      redirect_to carts_path, notice: "数量を更新しました"
    end
  end
end
