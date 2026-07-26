require 'test_helper'

class LearntKanjiTest < ActiveSupport::TestCase
  test 'should not save Learnt Kanji row if missing KanjiCharacter_id and User_id' do
    learnt_kanji = LearntKanji.new
    assert_not learnt_kanji.save, 'Learnt Kanji saved without required fields'
  end

  test 'should not save Learnt Kanji row if KanjiCharacter_id and User_id are not numbers' do
    learnt_kanji = LearntKanji.new(kanji_character_id: 'abc', user_id: 'def')
    assert_not learnt_kanji.save, 'Learnt Kanji saved with invalid foreign keys'
  end

  test 'should not save Learnt Kanji if has_learnt is not boolean value' do
    learnt_kanji = LearntKanji.new(kanji_character_id: 1, user: users(:one), has_learnt: nil)
    assert_not learnt_kanji.save, 'Learnt Kanji saved with invalid has_learnt value'
  end

  test 'should save multiple Learnt Kanji rows for one user' do
    kanjis = [kanji_characters(:two), kanji_characters(:three), kanji_characters(:four)]

    kanjis.each do |kanji|
      learnt_kanji = LearntKanji.new(kanji_character: kanji, user: users(:two), has_learnt: false)
      assert learnt_kanji.save, 'Learnt Kanji not saved'
    end
  end

  test 'should not save duplicate Learnt Kanji for same user (even with different has_learnt values)' do
    existing = kanji_characters(:one)
    duplicate = LearntKanji.new(kanji_character: existing, user: users(:two), has_learnt: false)
    assert_not duplicate.save, 'Learnt Kanji saved with duplicate kanji for same user'
  end
end
