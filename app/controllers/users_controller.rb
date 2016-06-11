class UsersController < ApplicationController

  def show
    @user = current_user #User.find(params[:id])
    @name = @user.format_name
    @greeting = format_greating
    # @temp = temp
    @commits = current_user_todays_commits
    @tasks = @user.tasks
  end

private

  # def temp
  #   location = current_user.location.split.first
  #   service = WeatherService.new
  #   temperature = service.temp_info(location)
  # end

  def time_now
    Time.now.strftime("%H").to_i
  end

  def format_greating
    if time_now < 12
      greeting = "morning"
    elsif  12 <= time_now && time_now < 17
      greeting = "afternoon"
    elsif  17 <= time_now
      greeting = "evening"
    end
    greeting
  end

  def current_user_todays_commits
    noko_scrub = NokogiriService.new(current_user)
    noko_scrub.todays_commits
  end

  def follow_user_todays_commits(user_to_follow)
    noko_scrub = NokogiriService.new(user_to_follow)
    noko_scrub.todays_commits
  end

end
