# frozen_string_literal: true

class CultivarGroup < ApplicationRecord
  belongs_to :category
  has_many :cultivars
end
