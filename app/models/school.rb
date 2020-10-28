class School < ApplicationRecord
  belongs_to :user


   #PRESENTE
  validates :name,
            :sigle,
            :role,
            :slug, presence: true

  ROLES= ["Fondateur","DE","Educateur", "Compt"]

  #SLUG
  extend FriendlyId
    friendly_id :sigle, use: :slugged

  def should_generate_new_friendly_id?
    sigle_changed?
  end
end
