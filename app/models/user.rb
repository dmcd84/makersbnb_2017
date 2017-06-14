require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader  :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true
  property :password_digest, Text, required: true

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end