class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  enum user_type: [:regular_user, :patron]
  def admin?
    user_type == 'admin'
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
