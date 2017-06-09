module Web::Views::Authors
  class Index
    include Web::View

    def authors
      books.map{|book| book.author}.uniq
    end
  end
end
