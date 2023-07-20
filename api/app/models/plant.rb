# frozen_string_literal: true

class Plant < ApplicationRecord
  enum status: { groundcover: 0, shrub: 1, rambling: 2, climbing: 3 }
  belongs_to :cultivar
  has_many :plant_statuses
  has_many :photos
  has_many :tags
  has_many :bloom_quality_ratings
  has_many :bloom_color_ratings
  has_many :scent_ratings
  has_many :favorites
end
