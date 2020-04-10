class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  def tags
    [Question.location.sample, Question.phase.sample, Question.industry.sample]
  end

  def self.tags
    location + phase + industry
  end

  def self.location
    ["Cairo, Egypt", "São Paulo, Brazil"]
  end

  def self.phase
    ["pre-seed", "MVP", "Series-A"]
  end

  def self.industry
    ["EdTech", "FinTech", "Healthcare"]
  end
end
