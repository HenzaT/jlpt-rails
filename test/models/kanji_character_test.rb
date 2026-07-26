require 'test_helper'

class KanjiCharacterTest < ActiveSupport::TestCase
  test 'should not save Kanji Character if missing jlpt level, kanji string and skipped boolean' do
    kanji = KanjiCharacter.new
    assert_not kanji.save, 'Kanji saved without required fields'
  end

  test 'should not save Kanji Character if jlpt level is not 1, 2, 3, 4 or 5' do
    kanji = KanjiCharacter.new(jlpt: 6, kanji: '一', skipped: false)
    assert_not kanji.save, 'Kanji saved with invalid jlpt level'
  end

  test 'should not save Kanji Character if skipped is not boolean value' do
    kanji = KanjiCharacter.new(jlpt: 1, kanji: '一', skipped: nil)
    assert_not kanji.save, 'Kanji saved with invalid skipped value'
  end

  test 'should not save Kanji Character if kanji is duplicate' do
    existing = kanji_characters(:one)
    duplicate = KanjiCharacter.new(jlpt: 5, kanji: existing.kanji, skipped: false)
    assert_not duplicate.save, 'Kanji saved with duplicate kanji value'
  end
end
