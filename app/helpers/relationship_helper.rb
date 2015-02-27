helpers do

  def establish_relationship(user_to_follow, user_that_follows)
    user_to_follow.followers << user_that_follows
    user_that_follows.followings << user_to_follow
  end

end
