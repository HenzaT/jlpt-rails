class KanjiTestsController < ApplicationController
  def index
    all_kanjis = KanjiCharacter.all
    # instance variable for show random kanji button
    @random_kanji = all_kanjis.sample
  end
end
