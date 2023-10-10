class Subject < ApplicationRecord
    validates  :title ,presence: true ,length: {maximum: 50}
    validates   :description , presence: true ,length: {maximum: 255}

    has_many :exams
end
