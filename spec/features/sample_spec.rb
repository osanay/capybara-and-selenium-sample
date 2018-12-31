# frozen_string_literal: true

RSpec.feature 'Google', type: :feature, js: true do
  scenario 'should have title "Google"' do
    visit 'https://www.google.com/'

    expect(page).to have_title 'Google'
  end
end
