class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :first_name, :last_name, :email, :remember_me,
                  :password, :password_confirmation

  validates_presence_of :first_name
  validates_uniqueness_of :email, :case_sensitive => false

  after_create :add_default_role

  def name
    "#{first_name} #{last_name}".strip
  end

  private

  def add_default_role
    self.add_role :user
  end
end
