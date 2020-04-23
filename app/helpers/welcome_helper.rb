module WelcomeHelper
  def gravatar_url(user, size=200)
    md5 = Digest::MD5.hexdigest user.email
    "https://www.gravatar.com/avatar/#{md5}?s=200&d=identicon"
  end

  def full_title(user)
    title = user.full_name
    title = "#{title}, #{user.user_profile.job_title}" unless user.user_profile.job_title.blank?
    title = "#{title} @ #{user.user_profile.company_name}" unless user.user_profile.company_name.blank?
    title
  end

  def question_cta
    current_user.mentor? ? "Write an answer" : "View answers"
  end
end
