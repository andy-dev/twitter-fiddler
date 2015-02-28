helpers do

  def get_followers_tweets
    all_tweets = []

    follow = @user.followings

    follow.each do |f|
      f.tweets.each do |t|
        all_tweets << t
      end
    end

    all_tweets
  end

end
