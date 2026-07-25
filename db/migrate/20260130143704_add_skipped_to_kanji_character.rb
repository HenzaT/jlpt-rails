class AddSkippedToKanjiCharacter < ActiveRecord::Migration[7.1]
  def change
    add_column :kanji_characters, :skipped, :boolean
  end
end
