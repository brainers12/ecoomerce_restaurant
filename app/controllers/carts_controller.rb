class CartsController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @cart_items = enhanced_cart
    @subtotal = cart_subtotal_cents / 100.0
    @taxes = calculate_taxes(current_user) if current_user.present?
    @total = @subtotal + @taxes.values.sum
  end

  def add_item
    product_id = params[:product_id].to_s
    cart = update_cart_delta(product_id, +1)
    update_cart(cart)
    redirect_back(fallback_location: root_path)
  end

  def remove_item
    product_id = params[:product_id].to_s
    cart = update_cart_delta(product_id, -1)
    update_cart(cart)
    redirect_back(fallback_location: root_path)
  end

  def remove_product
    product_id = params[:product_id].to_s
    cart = update_cart_delta(product_id, 0)  # Set quantity to zero to remove
    update_cart(cart)
    redirect_back(fallback_location: root_path)
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

  def update_cart_delta(product_id, delta)
    cart[product_id] ||= 0
    cart[product_id] += delta
    cart.delete(product_id) if cart[product_id] <= 0
    cart
  end

  def calculate_taxes(user)
    return { gst: 0, pst: 0, hst: 0 } unless user&.province
    tax_rates = user.province.tax_rates || {}

    gst = tax_rates['gst'].to_f
    pst = tax_rates['pst'].to_f
    hst = tax_rates['hst'].to_f

    {
      gst: @subtotal * gst,
      pst: @subtotal * pst,
      hst: @subtotal * hst
    }
  end
end
