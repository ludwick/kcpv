class ValueHistory < ApplicationRecord
  def total_appraised
    apprlandval + apprimpsval
  end
end
