class KanjiCharactersController < ApplicationController
  def show
    all_kanjis = KanjiCharacter.all
    @kanji = KanjiCharacter.find(params[:id])
    @random_kanji = all_kanjis.sample
  end

  private

  def kanji_params
    params.require(:kanji_character).permit(:id)
  end
end
