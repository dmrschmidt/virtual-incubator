class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions

  def mentor?
    role == 'mentor'
  end

  def mentee?
    role == 'mentee'
  end

  def first_name
    mentee? ? "Mentee Fabio" : "Mentor Mary"
  end
end
