class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(taggings_count: :desc).where.not(taggings_count: 0)
  end
end