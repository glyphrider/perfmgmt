require 'test_helper'

class DirectReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direct_report = direct_reports(:one)
  end

  test "should get index" do
    get direct_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_direct_report_url
    assert_response :success
  end

  test "should create direct_report" do
    assert_difference('DirectReport.count') do
      post direct_reports_url, params: { direct_report: { name: @direct_report.name } }
    end

    assert_redirected_to direct_report_url(DirectReport.last)
  end

  test "should show direct_report" do
    get direct_report_url(@direct_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_direct_report_url(@direct_report)
    assert_response :success
  end

  test "should update direct_report" do
    patch direct_report_url(@direct_report), params: { direct_report: { name: @direct_report.name } }
    assert_redirected_to direct_report_url(@direct_report)
  end

  test "should destroy direct_report" do
    assert_difference('DirectReport.count', -1) do
      delete direct_report_url(@direct_report)
    end

    assert_redirected_to direct_reports_url
  end
end
