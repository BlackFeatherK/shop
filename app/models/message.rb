class Message < ApplicationRecord
  validates_presence_of :content

  belongs_to :user , :optional => true

  def user_name
    (self.user)? self.user.email.split("@").first : "Nobody"
  end

end
