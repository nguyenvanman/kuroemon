class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end
  
  def self.invalid_credentials
    'invalid_credentials'
  end

  def self.not_admin
    'not_admin'
  end

  def self.not_super_admin
    'not_super_admin'
  end
  
  def self.invalid_token
    'invalid_token'
  end
  
  def self.missing_token
    'missing_token'
  end
  
  def self.unauthorized
    'unauthorized'
  end
  
  def self.account_created
    'account_created'
  end
  
  def self.account_not_created
    'account_not_created'
  end
  
  def self.expired_token
    'expired_token'
  end
  
  def self.account_not_active
    'account_not_active'
  end
end