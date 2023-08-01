class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buses, dependent: :destroy
  enum role: ["service_provider","admin"]

  def admin?
    self.role.eql?("admin")
  end

  def service_provider?
    self.role.eql?("service_provider")
  end
end
