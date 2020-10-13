class Course < ApplicationRecord

  #RELATIONS
  belongs_to :user

  #VALIDATIONS

  #PRESENTE
  validates :title,
            :content,
            :level,
            :author, presence: true


  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
