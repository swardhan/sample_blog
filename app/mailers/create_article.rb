class CreateArticle < ApplicationMailer
  default from: "from@example.com"
  layout 'mailer'

  def send_create_mail article_id
    @article = Article.find(article_id)

    mail to: @article.user.email, subject: "You Article was Created"
  end


end
