# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Classi::NewMyCop, :config do
  it 'registers an offense when using #current_user' do
    expect_offense(<<~RUBY)
      current_user
      ^^^^^^^^^^^^ DO NOT USE `#current_user`!
    RUBY
  end

  it 'registers an offense when using safe navigation with #current_user' do
    expect_offense(<<~RUBY)
      object&.current_user
      ^^^^^^^^^^^^^^^^^^^^ DO NOT USE `#current_user`!
    RUBY
  end

  it 'does not register an offense for other methods' do
    expect_no_offenses(<<~RUBY)
      user_name
      get_user
      current_session
    RUBY
  end

  it 'registers an offense when chaining methods with current_user' do
    expect_offense(<<~RUBY)
      object.current_user.name
      ^^^^^^^^^^^^^^^^^^^ DO NOT USE `#current_user`!
    RUBY
  end
end
