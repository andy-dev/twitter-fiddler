helpers do

  def get_followers_tweets
    all_tweets = []

    follow = @user.followers

    follow.each do |f|
      f.tweets.each do |t|
        all_tweets << t
      end
    end

    all_tweets
  end

  def following?(tweet)
    @user.followings.each do |follow|
      follow.id == tweet ? true : false
    end

  end

end
