class JlptLevelsController < ApplicationController
  def index
    @levels = %i[1 2 3 4 5]
    @kanji_character_counts = KanjiCharacter.group(:jlpt).count
  end

  def show
    @level = params[:level].to_i
    @kanji_characters = KanjiCharacter.where(jlpt: @level)
  end
end
