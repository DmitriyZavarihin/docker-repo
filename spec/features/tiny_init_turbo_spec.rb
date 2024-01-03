require 'rails_helper'

RSpec.describe 'TinyMCE', js: true do
  before do
    Capybara.current_driver = :selenium_headless
    visit articles_path
  end

  # rubocop:disable RSpec/MultipleExpectations

  context 'when turbo: true (default Rails7)' do
    it 'is expected not to work with Turbo' do
      page.find_link('New article with turbo').click
      expect(page).to have_current_path('/articles/new')
      expect(page).to have_css('div.tox.tox-tinymce')
      page.find("a[href='#{articles_path}']").click
      expect(page).to have_current_path('/articles')
      page.find_link('New article with turbo').click
      expect(page).to have_current_path('/articles/new')
      expect(page).not_to have_css('div.tox.tox-tinymce')
    end

    context 'when turbo: false' do
      it 'is expected to work without Turbo' do
        page.find_link('New article without turbo').click
        expect(page).to have_current_path('/articles/new')
        expect(page).to have_css('div.tox.tox-tinymce')
        page.find_link('Back to articles').click
        expect(page).to have_current_path('/articles')
        page.find_link('New article without turbo').click
        expect(page).to have_current_path('/articles/new')
        expect(page).to have_css('div.tox.tox-tinymce')
      end
    end
  end
  # rubocop:enable RSpec/MultipleExpectations
end
