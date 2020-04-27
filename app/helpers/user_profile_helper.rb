module UserProfileHelper
  def available(value)
    value.blank? ? 'n/a' : value
  end

  def venture_founded(founded)
    available(founded)
  end

  def venture_stage(stage)
    UserProfile.venture_stages.fetch(stage, 'n/a')
  end

  def team_size(size)
    UserProfile.team_sizes.fetch(size, 'n/a')
  end

  def industry(industry)
    UserProfile.industries.fetch(industry, 'n/a')
  end

  def sdg(sdg_goal)
    UserProfile.sdg_goals.fetch(sdg_goal, 'n/a')
  end

  def languages(languages)
    available(non_empty(languages).map { |c| LANGUAGES_SPOKEN[c] }.join(', '))
  end

  def countries(countries)
    available(non_empty(countries).map { |c| location(c) }.join(', '))
  end

  def location(location)
    ISO3166::Country.find_country_by_alpha2(location)&.translation('en')
  end

  private

  def non_empty(values)
    values&.reject { |v| v.blank? } || []
  end
end