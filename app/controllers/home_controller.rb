class HomeController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  def index
    @notices = Notice.all
  end

  def manifest
  end

  def offline
  end
end
