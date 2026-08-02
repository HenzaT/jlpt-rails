class KanjiCharacter < ApplicationRecord
  has_many :learnt_kanjis
  has_many :users, through: :learnt_kanjis

  validates :jlpt, :kanji, presence: true
  validates :kanji, uniqueness: true
  validates :jlpt, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :skipped, inclusion: [true, false]
  validates :skipped, exclusion: [nil]

  def show_two_meanings(limit: 2)
    meanings.reject { |meaning| meaning == heisig_en }.first(limit)
  end

  def show_rest_meanings
    kanjis = meanings.reject { |meaning| meaning == heisig_en }
    kanjis - show_two_meanings
  end

  def count_of_rest
    left_over = show_rest_meanings
    left_over.count
  end

  def show_two_kun_readings(limit: 2)
    kun_readings.first(limit)
  end

  def show_rest_kun_readings
    kun_readings - show_two_kun_readings
  end

  def count_of_rest_kun_readings
    left_over = show_rest_kun_readings
    left_over.count
  end
end
