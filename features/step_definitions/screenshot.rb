#Before do |scenario|
#  track_time 'assigning reference and test shots directories' do
#    $reference_shots = "#{scenario.directory}/reference_shots"
#    $test_shots = "#{scenario.directory}/test_shots"
#  end
#end

Then /^I take a reference screenshot$/ do
  browser.take_screenshot("#{$reference_shots}/#{@scenario_name}")
end

Then /^the screen should match the reference screenshot$/ do
  browser.take_screenshot("#{$test_shots}/#{@scenario_name}")

  reference_shot = Image.new("#{$reference_shots}/#{@scenario_name}.png")
  test_shot = Image.new("#{$test_shots}/#{@scenario_name}.png")

  unless test_shot.same_as? reference_shot
    reference_path = write_difference_gif(reference_shot, test_shot)
    fail("screen does not match reference shot, see difference:\n#{reference_path}")
  end
end

