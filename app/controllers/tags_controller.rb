class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.where.not(taggings_count: 0)
  end
end