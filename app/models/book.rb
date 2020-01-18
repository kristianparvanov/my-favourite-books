class Book < ApplicationRecord

	GENRES = [
		'Science fiction',
    'Drama',
    'Action and Adventure',
    'Romance',
    'Mystery',
    'Horror',
    'Fantasy',
    'Novel'
	]

  validates :title, presence: true
  validates :genre, presence: true, inclusion: GENRES
  validates :publish_date, presence: true
  validates :isbn, presence: true
  # validate :released_1967_or_later

  before_save :titleize_title

  private

    def released_1967_or_later
      errors.add(:publish_date, 'must be 1967 or later') if
      publish_date && publish_date < Date.parse('1 Jan 1967')
    end

    def titleize_title
      return nil if !title.present?
      
      self.title = title.gsub(/\w+/, &:capitalize).gsub(/\s+/, ' ')
    end
end