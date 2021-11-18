class Item < ApplicationRecord
  validates :price, numericality: {greaterThanOrEqual: 0, allow_nil: true}
  validates :name, presence: true

  after_initialize {p 'initialize'} #Item.new Item.first
  after_save { p 'save' } #Item.save
  after_create { p 'create' } #Item.create
  after_update { p 'update' } #Item.update
  after_destroy { p 'destroy' } #Item.destroy


end
