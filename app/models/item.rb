# frozen_string_literal: true

class Item < ApplicationRecord
  validates :price, numericality: { greaterThanOrEqual: 0, allow_nil: true }
  validates :name, presence: true

  after_initialize { p 'initialize' }
  after_save { p 'save' }
  after_create { p 'create' }
  after_update { p 'update' }
  after_destroy { p 'destroy' }
end
