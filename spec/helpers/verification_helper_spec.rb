require 'rspec/expectations'

module VerificationHelpers
  include Capybara::DSL

  def verify_content(expected_content)
    expect(page).to have_content expected_content
  end

  def verify_title(expected_title)
    expect(page.title).to eql(expected_title)
  end

  def verify_is_truthy(value)
    expect(value).to be_truthy
  end

  def verify_array_elements_include_value(arr, value, avoid_key_sensitive=true)
    if avoid_key_sensitive
      value.downcase!
      arr = arr.map(&:downcase)
    end
    expect(arr).to all(match(value))
  end

end

include VerificationHelpers