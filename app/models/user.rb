class User < ActiveRecord::Base
  def self.from_oauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.name = auth_info.info.name
      new_user.nickname = auth_info.info.nickname
      new_user.image = auth_info.info.image
      new_user.bio = auth_info.info.bio
      new_user.website = auth_info.info.website
      new_user.token = auth_info.credentials.token
      new_user.uid = auth_info.uid
    end
  end
end
