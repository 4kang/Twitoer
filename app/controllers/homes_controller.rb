class HomesController < ApplicationController
  def top
  end

  def about
    @tweet = Tweet.new
    @tweets = Tweet.all
  end
end
