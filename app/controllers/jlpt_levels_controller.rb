class JlptLevelsController < ApplicationController
  # all jlpt levels page
  def index
    @levels = [5, 4, 3, 2, 1]
    @kanji_character_counts = KanjiCharacter.group(:jlpt).count
    @learnt_kanji = current_user.learnt_kanjis
    all_kanjis = KanjiCharacter.all
    # instance variable for show random kanji button
    @random_kanji = all_kanjis.sample
    @counts = @learnt_kanji.map { |l| l.kanji_character.jlpt }.tally
  end

  # show all kanji in a specific jlpt level
  def show
    @level = params[:level].to_i
    @kanji_characters = KanjiCharacter.where(jlpt: @level)
  end
end
