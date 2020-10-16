class Material < ApplicationRecord
  belongs_to :user


   #PRESENTE
  validates :title,
            :slug,
            :user_id,
            :cycle, presence: true

  ##SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
