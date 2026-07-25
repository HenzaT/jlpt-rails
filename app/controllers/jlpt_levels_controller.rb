class JlptLevelsController < ApplicationController
  def index
    @levels = [5, 4, 3, 2, 1]
    @kanji_character_counts = KanjiCharacter.group(:jlpt).count
  end

  def show
    @level = params[:level].to_i
    @kanji_characters = KanjiCharacter.where(jlpt: @level)
  end
end
