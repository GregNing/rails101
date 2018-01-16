class GroupRelationship < ApplicationRecord
    belongs_to :group
    belongs_to :user
    # 这样当捞 user.participated_groups 时，就会捞出“参与的所有群”。
end
