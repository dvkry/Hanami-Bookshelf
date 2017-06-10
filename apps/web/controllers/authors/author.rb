module Web::Controllers::Authors
  class Author
    include Web::Action

    expose :books_by_author
    expose :author

    def call(params)
      @author = params[:author]
      @books_by_author = BookRepository.new.books_by_author(@author)
    end
  end
end
