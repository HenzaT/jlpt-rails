class DashboardsController < ApplicationController
  def show
    @learnt_kanjis = current_user.learnt_kanjis.count
    @not_learnt_kanjis = KanjiCharacter.all.count - @learnt_kanjis
    @levels = [5, 4, 3, 2, 1]
    @kanji_character_counts = KanjiCharacter.group(:jlpt).count
    @most_recent_learnt = LearntKanji.last_learnt_kanji
  end
end
