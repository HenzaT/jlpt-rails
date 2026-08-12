class LearntKanji < ApplicationRecord
  belongs_to :user
  belongs_to :kanji_character

  validates :kanji_character_id, :user_id, presence: true
  validates :kanji_character_id, uniqueness: { scope: :user_id }
  validates :kanji_character_id, :user_id, numericality: { only_integer: true }
  validates :has_learnt, inclusion: [true, false]
  validates :has_learnt, exclusion: [nil]

  # def not_learnt_by_jlpt
  # end

  def self.last_learnt_kanji
    order(:created_at).last.kanji_character.kanji
  end
end
