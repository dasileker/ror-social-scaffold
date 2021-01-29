class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.status }
    friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.status }
    friends_array.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.status }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end
end
