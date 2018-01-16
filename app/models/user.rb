class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :groups
  has_many :posts
  has_many :group_relationships
  has_many :participated_groups, :through => :group_relationships, :source => :group
# 在 user model 内实作判断式“是否为群组的一分子”
# 让我们修改 app/models/user.rb ，在最后一个end的上面加入这一段 is_member_of?(group)

  def is_member_of?(group)
    participated_groups.include?(group)
  end
end
