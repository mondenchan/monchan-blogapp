class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @like = current_user.likes.new(article: @article)

    if @like.save
      redirect_to article_path(@article), notice: '記事をいいねしました。'
    else
      redirect_to article_path(@article), alert: '記事のいいねに失敗しました。'
    end
  end

def destroy
    @article = Article.find(params[:article_id])
    @like = current_user.likes.find_by(article: @article)

    if @like&.destroy
      redirect_to article_path(@article), notice: '記事のいいねを解除しました。'
    else
      redirect_to article_path(@article), alert: '記事のいいね解除に失敗しました。'
    end

end
end
