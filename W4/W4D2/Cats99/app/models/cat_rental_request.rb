class CatRentalRequest < ApplicationRecord
  STATUS_STATES = %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUS_STATES

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat



    def overlapping_requests
      CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where(<<-SQL,start_date: start_date, end_date: end_date)
        NOT((start_date > :end_date)OR(end_date < :start_date))
      SQL
      # We want:
      # 1. A different request
      # 2. That is for the same cat.
      # 3. That overlaps.


      #not overlapping_requests
      # new start_date later than old end_date
      #new end_date earlier than old start_date

    end

    def overlapping_approved_requests
      overlapping_requests.where(status: "APPROVED")
    end

    def does_not_overlap_approved_request
      if overlapping_approved_requests.exists?
        errors[:base] << "Request conflicts with existing approved request"
        return
      end
    end

end
