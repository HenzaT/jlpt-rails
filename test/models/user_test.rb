require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save User if missing required fields' do
    user = User.new
    assert_not user.save, 'User saved with missing required fields'
  end

  test 'should not save User if firstname is shorter than two characters' do
    user = User.new(firstname: 'H', email: 'h1@example.com', password: 'SeveranceGrowthYearning85')
    assert_not user.save, 'User saved with firstname that is too short'
  end

  test 'should not save User if email is not a valid format' do
    email_formats = %w[h1 h1@ h1@example h1@example.]

    email_formats.each do |email_format|
      user = User.new(firstname: 'Henry', email: email_format, password: 'SeveranceGrowthYearning85')
      assert_not user.save, 'User saved with invalid email format'
    end
  end

  test 'should not save User if password does not match criteria' do
    password_formats = %w[tooshort Password123 Open3]

    password_formats.each do |password_format|
      user = User.new(firstname: 'Henry', email: 'h1@example.com', password: password_format)
      assert_not user.save, 'User saved with invalid password format'
    end
  end
end
