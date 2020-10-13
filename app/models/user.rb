class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  #PRESENTE
  validates :username,
            :contact,
            :email,
            :level,
            :school_name,
            :role, presence: true


  #UNIQUENESS
   validates :contact,
             :email, uniqueness: true

  #RELATIONS
  has_many :courses, dependent: :destroy

  #SLUG
  extend FriendlyId
    friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
    username_changed?
  end

end
