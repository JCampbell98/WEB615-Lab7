for i in 1..5
  @user = User.new
  @user.email = Faker::Internet.email
  @user.password = "asdfgh"
  if @user.save
    p "#{@user.email} has been saved"
    @article = Article.new
    @article.title = "Will #{Faker::Company.name} really #{Faker::Company.bs}?"
    paragraph_1 = Faker::Lorem.paragraphs.join(' ')
    paragraph_2 = Faker::Lovecraft.paragraphs.join(' ')
    paragraph_3 = Faker::Hipster.paragraphs.join(' ')
    @article.content = "#{paragraph_1} <br /> #{paragraph_2} <br /> #{paragraph_3}"
    @article.user = @user
        if @article.save
          p "#{@article.title} has been saved"
          for ii in 1..5
            @comment = Comment.new
            @comment.article = @article
            @comment.message = Faker::Hacker.say_something_smart
            @comment.user = @user
            if @comment.save
              p "Comment #{ii} has been saved for article #{@article.title}"
            else
              p @comment.errors
            end
          end
        else
          p @article.errors
        end
  else
    raise "#{@user.errors.full_messages}"
  end


end
