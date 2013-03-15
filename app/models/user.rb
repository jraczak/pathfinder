class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :token_authenticatable, :omniauth_providers => [:facebook, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :provider, :uid, :first_name, :last_name, :facebook_url, 
  # attr_accessible :title, :body
  
  public
  
  def password_required?
    super if confirmed?
  end
  
  def password_match?
    self.errors[:password] << "is needed to sign up" if password.blank?
    self.errors[:password_confirmation] << "is needed to sign up" if password_confirmation.blank?
    self.errors[:password_confirmation] << "doesn't match the original password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(first_name: auth.info.first_name,
      						last_name: auth.info.last_name,
      						email: auth.info.email,
      						provider: auth.provider,
      						uid: auth.uid,
      						facebook_url: auth.extra.raw_info.link
      						).skip_confirmation_notification!
    end
    user
  end
  
end
