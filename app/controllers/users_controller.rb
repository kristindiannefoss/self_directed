class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @name = @user.user_name   
    @greeting = format_greating
    @temp = temp
    @commits = current_user_todays_commits
    @tasks = @user.tasks
    @insult = insult_me
    @praise = praise_me
  end

private

  def temp
    location = @user.location.split.first
    service = WeatherService.new
    temperature = service.temp_info(location)
  end

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
    noko_scrub = NokogiriService.new(@user)
    noko_scrub.todays_commits
  end

  def insult_me
    noko = InsultNokogiriService.new
    noko.todays_insult
  end

  def praise_me
    noko = PraiseNokogiriService.new
    noko.todays_praise
  end

end
