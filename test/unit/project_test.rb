require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_injections
  	assert_equal [{"id"=>1, 0=>1}], Project.injection1
  	assert_equal 1, Project.injection2.size
  end
end
