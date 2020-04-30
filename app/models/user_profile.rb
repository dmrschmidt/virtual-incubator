class UserProfile < ApplicationRecord
  belongs_to :user
  delegate :email, to: :user
  delegate :full_name, to: :user

  validates_each :company_website_url, :social_url_linkedin, :meeting_schedule_url do |record, attr, value|
    URI(value).normalize unless value.nil?
  rescue StandardError
    record.errors.add(attr, 'must be valid uri')
  end

  def skills_csv=(value)
    self.skills = value.split(',').map(&:strip)
  end

  def skills_csv
    skills&.join(', ')
  end

  def self.team_sizes
    {
      '1' => 'myself only',
      '1-5' => '1 - 5 people',
      '5-10' => '5 - 10 people',
      '10-50' => '10 - 50 people',
      '50-100' => '50 - 100 people',
      '100-250' => '100 - 250 people',
      '250-500' => '250 - 500 people',
      '500-1000' => '500 - 1000 people',
      '1000+' => '1000+ people',
    }
  end

  def self.industries
    {
      'agriculture' => 'Agriculture and Food',
      'arts' => 'Arts / Media / Entertainment',
      'consultancy' => 'Consultancy Services',
      'education' => 'Education Services',
      'energy' => 'Energy, Oil and Gas',
      'finance-insurance' => 'Finance and Insurance',
      'health-social' => 'Health and Social Care',
      'hospitality-travel' => 'Hospitality, Travel and Transport',
      'internet' => 'Internet Technology',
      'manufacturing' => 'Manufacturing',
      'real-estate' => 'Real Estate',
      'retail' => 'Retail, Wholesale and E-commerce',
      'telecommunication' => 'Telecommunication',
      'waste' => 'Waste Management',
    }
  end

  def self.venture_stages
    {
      'ideation' => 'Ideation Stage',
      'mvp' => 'MVP Stage',
      'market-validation' => 'Market validation / Paying customers',
      'growth' => 'Growth Stage',
      'seed-funding' => 'Seed funding',
      'series-a' => 'Series A',
      'series-b' => 'Series B',
      'series-c' => 'Series C',
    }
  end

  def self.sdg_goals
    {
      'no-poverty' => 'No Poverty',
      'zero-hunger' => 'Zero Hunger',
      'good-health' => 'Good Health and Well-being',
      'quality-education' => 'Quality Education',
      'gender-equality' => 'Gender Equality',
      'clean-water' => 'Clean Water and Sanitation',
      'clean-energy' => 'Affordable and Clean Energy',
      'decent-work' => 'Decent Work and Economic Growth',
      'industry-innovation' => 'Industry, Innovation and Infrastructure',
      'reduced-inequality' => 'Reduced Inequality',
      'sustainable-cities' => 'Sustainable Cities and Communities',
      'responsible-consumption' => 'Responsible Consumption and Production',
      'climate-action' => 'Climate Action',
      'life-water' => 'Life Below Water',
      'life-land' => 'Life on Land',
      'peace-justice' => 'Peace and Justice Strong Institutions',
      'partnerships' => 'Partnerships to achieve the Goal',
    }
  end
end
