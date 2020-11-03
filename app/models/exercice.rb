class Exercice < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_rich_text :content_exercice
  belongs_to :material


  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
