# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  owner_id    :integer          not null
#
class Sub < ApplicationRecord
    validates :title, :description, :owner_id, presence: true
    validates :tile, :owner_id, uniqueness: true

    belongs_to :owner,
        primary_key: :id,
        foreign_key: :owner_id,
        class_name: :User
    

end
