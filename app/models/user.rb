class User < ApplicationRecord
  has_secure_password  

  validates :email, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def build_api_token!
    unencrypted_token = SecureRandom.hex
    encrypted_token = Digest::SHA256.hexdigest(unencrypted_token)
    self.update(api_token: encrypted_token, api_token_created_at: Time.zone.now)
    return unencrypted_token
  end

  def generate_api_token!
    if self.api_token
      self.api_token
    else
      build_api_token!
    end
  end

  def self.find_by_api_token(unencrypted_token)
    return nil unless unencrypted_token.present?
    encrypted_token = Digest::SHA256.hexdigest(unencrypted_token)
    User.where(api_token: encrypted_token).first
  end
end
