class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  
  devise :omniauthable, :omniauth_providers => [:orcid]
  
  enum role: [:user, :admin]
  
  after_initialize :set_default_role, :if => :new_record?
  
  API_VERSION = '2.0'
  
  def set_default_role
    self.role ||= :user
  end
  
  def get_orcid_record()
    url = User.orcid_api_base_url + "/#{self[:uid]}/record"
    
    Rails.logger.debug "GET: #{url} token: #{self[:token]}"
    
    response = Maremma.get(url, accept: 'json', bearer: self[:token])
    response['body']['data']
  end
  
  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.token_expires_at = auth.credentials.expires_at
      user.email = auth.info.email
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end
  
  def self.orcid_api_base_url
    if ENV['ORCID_SANDBOX'] == "true"
      ENV['ORCID_MEMBER'] == "true" ? "https://api.sandbox.orcid.org/v#{API_VERSION}" : "https://pub.sandbox.orcid.org/v#{API_VERSION}"
    else
      ENV['ORCID_MEMBER'] == "true" ? "https://api.orcid.org/v#{API_VERSION}" : "https://pub.orcid.org/v#{API_VERSION}"
    end
  end
end
