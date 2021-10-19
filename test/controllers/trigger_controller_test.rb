require "test_helper"

class TriggerControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "mail and mobile" do
    @mob = Team.find(4).developers.pluck(:mobile)
    @mail = Team.find(4).developers.pluck(:email)
    puts @mob
    puts @mail
  end
end
