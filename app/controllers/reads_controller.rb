class ReadsController < ApplicationController
  def index
    @hot_links = Read.hot
  end
end
