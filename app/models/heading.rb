class Heading < ActiveRecord::Base

  # Many-to-many associations (rel)
  has_many :rel_unit_headingss, :autosave => true, :dependent => :destroy
  has_many :units, :through => :rel_unit_headings

  has_many :rel_fond_headings, :autosave => true, :dependent => :destroy
  has_many :fonds, :through => :rel_fond_headings

end