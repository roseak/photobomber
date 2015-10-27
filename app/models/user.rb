class User < ActiveRecord::Base
  def self.from_oauth(auth_info)
    where(uid: auth_info[:id]).first_or_create do |new_user|
      new_user.uid = auth_info["user"]["id"]
      new_user.name = auth_info["user"]["full_name"]
      new_user.nickname = auth_info["user"]["username"]
      new_user.image = auth_info["user"]["profile_picture"]
      new_user.bio = auth_info["user"]["bio"]
      new_user.website = auth_info["user"]["website"]
      new_user.token = auth_info["access_token"]
    end
  end
end
