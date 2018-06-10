class Parcel < ApplicationRecord
  def tax(year, rate_type = :regular)
    value_history = assessed_value(year)
    return unless value_history.present?
    levy_rate = LevyRate.where(year: year, code: levy_code).first
    return unless levy_rate.present?
    rate_per_1000 = rate_type == :senior ? levy_rate.senior_rate : levy_rate.rate
    (value_history.total_appraised / 1000.0) * rate_per_1000.to_f
  end

  def assessed_value(year)
    values = ValueHistory.where(taxyr: year, major: major, minor: minor, reason: 'REVALUE')
    # magically works because date format is 2017-05-31 00:00:00 which sorts
    # like this.
    values.order(changedate: :desc).first
  end
end
