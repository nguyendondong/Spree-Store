Spree::Payment.class_eval do
  after_save :send_notification
  Spree::Payment.state_machine.before_transition :to => :completed, :do => :compute_revenue_for_referer

  def compute_revenue_for_referer
    if order.revenue == 0 && order.referer
      order.update_attribute(:revenue, 10000)
      order.referer.update_attribute(:revenue, order.referer.revenue + 10000)
    end
  end


  def send_notification
    Pusher.trigger('my-channel', 'my-event', {
      message: "Có 1 đơn hàng được đặt, Mã đơn hàng: #{order.number}",
      path: Spree::Core::Engine.routes.url_helpers.edit_admin_order_path(order),
      number: order.number

    })
  end
end