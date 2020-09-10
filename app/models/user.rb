class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, and :omniauthable, :rememberable,
  devise :database_authenticatable, :registerable,
         :validatable, :confirmable, :recoverable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follower_relationships, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :follower_relationships, source: :follower, dependent: :destroy  #@user.followers is list of users that follow this user

  has_many :followee_relationships, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :followee_relationships, source: :followee, dependent: :destroy  #@user.followees is list of users that this user follow

  mount_uploader :avatar, PhotoUploader

  validates :firstname, uniqueness: {scope: :lastname}

  validates_each :firstname, :lastname do |record, attr, value|
    record.errors.add(attr, "must start with upper case") if value =~ /\A[[:lower:]]/
  end


  with_options if: :admin? do |admin|
    admin.validates :password, length: {minimum: 10}
  end

  scope :admin, -> {where(admin: true)}

  # send sign up mail
  after_commit :send_welcome_mail

  # method
  def name
    [firstname, lastname].select(&:present?).join(' ')
  end

  def avatar_name
    [firstname.chars.first, lastname.chars.first].compact.join
  end


  private

  def send_welcome_mail
    puts "after_save User"
    SignUpMailerJob.perform_now self
  end

end
