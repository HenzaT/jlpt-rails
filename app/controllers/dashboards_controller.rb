class DashboardsController < ApplicationController
  def show
    learnt_kanjis = current_user.learnt_kanjis
    @learnt_count = learnt_kanjis.count
    @not_learnt_count = KanjiCharacter.all.count - @learnt_count
    @levels = [5, 4, 3, 2, 1]
    @kanji_character_counts = KanjiCharacter.group(:jlpt).count
    @most_recent_learnt = LearntKanji.last_learnt_kanji
    @counts = learnt_kanjis.map { |l| l.kanji_character.jlpt }.tally
  end
end
