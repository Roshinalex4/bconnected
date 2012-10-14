class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name
  # attr_accessible :title, :body
  has_one :user_profile
  has_many :connections
  has_many :friends, :through => :connections
  
  has_and_belongs_to_many :languages
  has_many :qualifications
  has_many :experiences
  has_and_belongs_to_many :groups
end
