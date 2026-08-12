class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :learnt_kanjis
  has_many :kanji_characters, through: :learnt_kanjis

  validates :firstname, :email, presence: true
  validates :firstname, length: { minimum: 2 }
  validates :email, uniqueness: true
  validates :email, 'valid_email_2/email': true
  validates :password, length: { minimum: 12 }, not_pwned: { on_error: :valid }, presence: true, if: :password_required?
  validate :password_complexity

  def password_complexity
    return unless password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{12,}$/)

    errors.add :password, 'must include at least one lowercase letter, one uppercase letter, one digit, and needs to be minimum 12 characters.'
  end

  def learnt_kanji?(kanji)
    learnt_kanjis.exists?(kanji_character_id: kanji)
  end
end
