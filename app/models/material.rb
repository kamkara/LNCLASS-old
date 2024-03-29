class Material < ApplicationRecord
  belongs_to :user
  has_many :courses
  has_many :exercices

   #PRESENTE
  validates :title,
            :slug, presence: true


  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end


