module Spree
  Adjustment.class_eval do
  	# Recalculate amount given a target e.g. Order, Shipment, LineItem
    #
    # Passing a target here would always be recommended as it would avoid
    # hitting the database again and would ensure you're compute values over
    # the specific object amount passed here.
    #
    # Noop if the adjustment is locked.
    #
    # If the adjustment has no source, do not attempt to re-calculate the amount.
    # Chances are likely that this was a manually created adjustment in the admin backend.
    def update!(target = nil)
      return amount if closed?
      if source.present?
        amount = source.compute_amount(target || adjustable)
        self.update_columns(
          amount: amount,
          updated_at: Time.now,
        )
        if promotion?
          self.update_column(:eligible, source.promotion.eligible?(adjustable)) if source.promotion.present?
        end
      end
      amount
    end
  end
end