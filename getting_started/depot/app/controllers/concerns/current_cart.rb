#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
module CurrentCart
  extend ActiveSupport::Concern

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
      logger.debug("Session cart_id: #{session[:cart_id]}")
      logger.debug("Cart: #{@cart.inspect}")
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
      logger.debug("Session cart_id: #{session[:cart_id]}")
      logger.debug("Cart: #{@cart.inspect}")
    end
end