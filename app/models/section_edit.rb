class SectionEdit < ApplicationRecord
	belongs_to :section
	belongs_to :admin_user
end
