class LearntKanjisController < ApplicationController
  before_action :authenticate_user!

  def index
    @learnt_kanjis = LearntKanji.where(user_id: current_user)
  end

  def create
    kanji = KanjiCharacter.find(params[:kanji_character_id])
    current_user.learnt_kanjis.find_or_create_by(kanji_character: kanji)
    redirect_to kanji, notice: 'Marked as learnt!'
  end

  def destroy
    kanji = KanjiCharacter.find(params[:kanji_character_id])
    current_user.learnt_kanjis.find_by(kanji_character: kanji)&.destroy
    redirect_to kanji, notice: 'Removed from learnt list.'
  end
end
