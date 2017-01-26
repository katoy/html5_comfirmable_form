class Article < ActiveRecord::Base
  validates :title, presence: true

  concerning :Confirmable do
    included do
      validates :confirmed, acceptance: true
      validates :finished, acceptance: true
      after_validation :check_confirming
    end

    def check_confirming
      self.confirmed = errors.include?(:confirmed) && errors.size == 1 ? '1' : ''
    end

    def clear_confirm_errors
      errors.delete :confirmed
      errors.delete :finished
    end
  end
end
