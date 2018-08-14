class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum genders: { man: 1, women: 2 }

  def is_registrated_user_detail?
    if first_name.nil? || last_name.nil? || nick_name.nil? || age.nil? || gender.nil?
      return true
    end

    false
  end
end
