class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  def tags
    [location.sample, phase.sample, industry.sample]
  end

  def location
    ["Cairo, Egypt", "São Paulo, Brazil"]
  end

  def phase
    ["pre-seed", "MVP", "Series-A"]
  end

  def industry
    ["EdTech", "FinTech", "Healthcare"]
  end
end
