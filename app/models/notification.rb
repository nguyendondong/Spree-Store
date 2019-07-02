class Notification < ActiveRecord::Base
  
  def self.auto_create(user_id, message)
    self.create(user_id: user_id, message: message)
  end

  def self.of_user(user)
    return self.all.where({user_id: user})
  end

  def self.unread(user)
    return self.of_user(user).where({active: true})
  end

  def targetable
   return nil if targetable_type.blank?
   targetable_type.constantize.find(targetable_id)
  end
 
  
  # scope :unread, ->{where( read_at: nill) }
end
