class LearntKanjisController < ApplicationController
  before_action :authenticate_user!

  def create
    kanji = KanjiCharacter.find(params[:kanji_character_id])
    learnt_kanji = LearntKanji.new(user_id: current_user.id, kanji_character_id: kanji.id, has_learnt: true)
    if learnt_kanji.save
      redirect_to kanji, notice: 'Marked as learnt!'
    end
  end

  def destroy
    kanji = KanjiCharacter.find(params[:kanji_character_id])
    current_user.learnt_kanjis.find_by(kanji_character: kanji)&.destroy
    redirect_to kanji, notice: 'Removed from learnt list.'
  end

  private

  def learnt_kanji_params
    params.require(:learnt_kanji).permit(:kanji_character_id, :user_id, :has_learnt)
  end
end
