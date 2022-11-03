class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #

  def account_activation(user)
    @user = user
    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  # mail for order completely

  def order(user)
    @user = user
    @cart_sesison = CartSession.last
    @cart_items = @cart_sesison.cart_items
    mail to: @user.email
  end

  def shop(shop)
    @shop = shop
    @products = @shop.products
    @cart_sesison = CartSession.last
    @user = User.find_by(id: @cart_sesison.id)
    @cart_items = CartItem.where(cart_session_id: @cart_sesison.id)
    @cart_items = @cart_items.where(product_id: @products.ids)
    mail to: @shop.user.email
  end

end
