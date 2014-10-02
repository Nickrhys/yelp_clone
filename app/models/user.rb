class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

    def self.from_omniauth_facebook(auth)
		  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		    user.email = auth.info.email
		    user.password = Devise.friendly_token[0,20]
		    # user.name = auth.info.name   # assuming the user model has a name
		    # user.image = auth.info.image # assuming the user model has an image
	  	end
		end

		def self.from_omniauth_twitter(auth)
		  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		    user.email = auth.info.nickname + "@twitter.com"
		    user.nickname = auth.info.nickname
		    user.password = Devise.friendly_token[0,20]
		    # user.name = auth.info.name   # assuming the user model has a name
		    # user.image = auth.info.image # assuming the user model has an image
	  	end
		end
end
