class BannerStorage < ActiveRecord::Base
  include ::Baeneroid::Model

  validates_uniqueness_of :name
  validates_inclusion_of :state, in: %w(draft publication)

  before_create do
    draft!
  end

end
