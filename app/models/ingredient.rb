class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, uniqueness: true
  validates :name, presence: true

  before_destroy :check_for_cocktails

  private

  def check_for_cocktails
    false if cocktails.count.positive?
  end
end
