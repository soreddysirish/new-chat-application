class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
     has_many :conversations, :foreign_key => :sender_id

     scope :online_users_list, -> { where(status:true)}
     enum role: [:admin]

end
