class Task < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :date_before_end
    validate :end_before_start

    
    def date_before_end
        return if end_date.blank?
        errors.add(:end_date, "は今日以降のものを選択してください") if end_date < Date.today
    end

    def end_before_start
        return if end_date.blank? || start_date.blank?
        errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
    end
end
