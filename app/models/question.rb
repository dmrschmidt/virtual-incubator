class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates_presence_of :title, :current_challenges, :actions_taken, :skills_needed

  def skills_needed_csv=(value)
    self.skills_needed = value.split(',').map(&:strip)
  end

  def skills_needed_csv
    skills_needed&.join(', ')
  end

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
