class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"#creates methods: active_relationship.follower, active_relationship.followed, user.active_relationship.create(followed_id: other_user.id)
    belongs_to :followed, class_name: "User"#user.active_relationships.create!(followed_id:other_user.id){exeption if error}, user.active_relationships.build(followed_id:other_user.id)
    validates :follower_id, presence: true
    validates :followed_id, presence: true
end
