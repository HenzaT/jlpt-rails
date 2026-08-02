class KanjiCharactersController < ApplicationController
  def index
    #jsdj
  end

  # show individual kanji or random kanji
  def show
    @kanji = KanjiCharacter.find(params[:id])
  end

  private

  def kanji_params
    params.require(:kanji_character).permit(:id, :jlpt)
  end
end
