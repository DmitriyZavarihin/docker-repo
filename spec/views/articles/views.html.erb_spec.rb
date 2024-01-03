require 'rails_helper'

RSpec.describe 'articles/views' do
  describe 'new' do
    before { assign(:article, build(:article)) }

    it 'renders new article form' do
      render template: 'articles/new'

      assert_select 'form[action=?][method=?]', articles_path, 'post' do
        assert_select 'input[name=?]', 'article[title]'
        assert_select 'textarea[name=?]', 'article[body]'
      end
    end
  end

  describe 'edit' do
    let!(:article) { create(:article) }

    before { assign(:article, article) }

    it 'renders edit article form' do
      render template: 'articles/edit'

      assert_select 'form[action=?][method=?]', article_path(article), 'post' do
        assert_select 'input[name=?]', 'article[title]'
        assert_select 'textarea[name=?]', 'article[body]'
      end
    end
  end

  describe 'index' do
    let(:articles) { create_list(:article, 10) }

    before do
      assign(:articles, articles)
      assign(:pagy, Pagy.new(count: 10, size: [1, 2, 2, 1], items: 1))
    end

    it 'renders a list of articles' do
      render template: 'articles/index'
      cell_selector = Rails::VERSION::STRING >= '7' ? 'ul.pagination-list' : 'tr>td'
      assert_select cell_selector, text: Regexp.new('\d'.to_s), count: 1
      assert_select cell_selector, text: Regexp.new('page 10'.to_s), count: 1
    end
  end

  describe 'show' do
    let(:article1) { create(:article, title: 'MyTitle', body: 'MyText') }

    before { assign(:article, article1) }

    # rubocop:disable RSpec/MultipleExpectations
    it 'renders attributes in view' do
      render template: 'articles/show'
      expect(rendered).to match(/Title/)
      expect(rendered).to match(/MyText/)
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
