class BookRepository < Hanami::Repository

  def books_by_author(author)
    books
      .where(author: author)
  end
end
