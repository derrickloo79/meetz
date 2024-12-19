class Room < ApplicationRecord

    has_many :bookings, dependent: :destroy

    ROOM_TYPE_OPTIONS = [
        'Meeting Room',
        'Phone Booth',
        'Hot Desk'
    ]
    
    validates :name, presence: true, uniqueness: true
    validates :room_type, inclusion: { in: ROOM_TYPE_OPTIONS }
end
