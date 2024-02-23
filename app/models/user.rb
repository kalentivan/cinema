class User < ApplicationRecord
    has_secure_password

    before_save :downcase_nickname
    
    validates :name, length: {maximum: 15}
    validates :nickname, format: { with: /\A[a-z_]+\z/ }
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true

    def downcase_nickname
        nickname.downcase!
    end
end
