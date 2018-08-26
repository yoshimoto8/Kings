class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  mount_uploader :image, ImageUploader
  enum genders: { man: 1, women: 2 }

  def is_registrated_user_detail?
    if is_user_parameter_nil?
      return true
    end

    false
  end

  private

  def is_user_parameter_nil?
    first_name.nil? || last_name.nil? || nick_name.nil? || age.nil? || gender.nil?
  end
end
