class RatingCache < ActiveRecord::Base
  before_save do
    self.avg = self.avg.round 1
  end

  belongs_to :cacheable, :polymorphic => true

end
