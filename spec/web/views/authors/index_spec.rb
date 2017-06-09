require 'spec_helper'
require_relative '../../../../apps/web/views/authors/index'

describe Web::Views::Authors::Index do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/authors/index.html.erb') }
  let(:view)      { Web::Views::Authors::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe 'when there are no authors' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no authors yet.</p>')
    end
  end

  describe 'when there are books' do
    let(:book1)     { Book.new(title: 'The Moon is a Harsh Mistress', author: 'Robert A. Heinlein') }
    let(:book2)     { Book.new(title: 'Starship Troopers', author: 'Robert A. Heinlein') }
    let(:book3)     { Book.new(title: 'The Cat in the Hat', author: 'Dr. Seuss') }
    let(:exposures) { Hash[books: [book1, book2, book3]] }

    it 'lists exactly 2 authors' do
      rendered.scan(/class="author"/).count.must_equal 2
    end

    it 'lists the correct authos' do
      rendered.must_include('Robert A. Heinlein')
      rendered.must_include('Dr. Seuss')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no authors yet.</p>')
    end
  end

end
