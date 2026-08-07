class DashboardsController < ApplicationController
  def show
    @learnt_kanjis = current_user.learnt_kanjis.count
    @not_learnt_kanjis = KanjiCharacter.all.count - @learnt_kanjis
  end
end
