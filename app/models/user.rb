class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def can?(code)
    self.permissions.where(:code => code, :apply => true).exists? || self.rol.can?(code)
  end
end
