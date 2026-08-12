class KanjiTestsController < ApplicationController
  def index
    all_kanjis = KanjiCharacter.all
    # instance variable for show random kanji button
  end
end
