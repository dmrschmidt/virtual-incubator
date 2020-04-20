class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_one :user_profile

  validates_presence_of :full_name

  def mentor?
    role == 'mentor'
  end

  def mentee?
    !mentor?
  end

end
