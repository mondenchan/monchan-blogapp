class ArticlesController < ApplicationController
  def index
    @article = Article.first

    # This action will render the home page of the application.
    # You can add any logic here if needed.
  end

end