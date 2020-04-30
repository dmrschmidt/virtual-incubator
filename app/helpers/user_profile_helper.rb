module UserProfileHelper
  def can_call(mentee, mentor)
    mentee_mentor = mentee.mentee? && mentor.mentor?
    mentee_mentor && has_any_answers(mentee, mentor)
  end

  def has_any_answers(asker, answerer)
    asker.questions.any? do |q|
      q.answers.any? do |a|
        a.user == answerer
      end
    end
  end

  def profile_completion_percentage(user)
    fields = profile_fields[:common] + profile_fields[user.role.to_sym]
    fields += %i[email full_name] # so we never reach 0% and get display issues
    filled = fields.filter { |f| user.user_profile.send(f).present? }
    ((filled.count / fields.count.to_f) * 100).round.to_i
  end

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

  def profile_fields
    {
      common: %i[
        job_title
        location
        languages_spoken
        social_url_linkedin
      ],
      mentee: %i[
        team_description
        company_name
        company_website_url
        venture_founded
        venture_description
        venture_stage
        sdg_goal
        industry
        team_size
        operating_countries
      ],
      mentor: %i[
        company_name
        company_website_url
        industry
        profile_description
        mentor_expertise
        mentor_how_can_i_help
        skills
      ]
    }
  end
end