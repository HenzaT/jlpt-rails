class KanjiCharacter < ApplicationRecord
  has_many :learnt_kanjis
  has_many :users, through: :learnt_kanjis

  validates :jlpt, :kanji, presence: true
  validates :kanji, uniqueness: true
  validates :jlpt, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :skipped, inclusion: [true, false]
  validates :skipped, exclusion: [nil]
end
