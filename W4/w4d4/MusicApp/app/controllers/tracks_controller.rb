class TracksController < ApplicationController
  before_action :require_logged_in, except: [:index]
end
