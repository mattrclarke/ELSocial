class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one :profile
  has_one :feed, through: :profile
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  def follow(other_user)
      following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end
  #
  def following?(other_user)
    following.include?(other_user)
  end

  def profile_id
    Profile.find_by(user_id: self.id)
  end


end
