class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      if raw_info = auth.extra.andand.raw_info
        user.location = raw_info.location.andand.name
        if raw_info.work.present?
          user.occupation = raw_info.work.first.andand.position.andand.name
        end
      end

      user.save!
    end
  end
end
