Feature: Render a well-formatted report
  In order to print a well-formatted report through WINPOS WP-800 printer
  I want to render the report with erb templates

  Scenario: create a titled report
    Given a ESC/POS template:
    """
    <%= @title %>
    """
    And a titled report:
    """
    class TitledReport < Rescpos::Report
      attr_reader :title, :str_template

      def initialize(title = '')
        @title = title
      end
    end
    @report = TitledReport.new('A report with a title')
    """
    When I render the titled report with the given template
    Then I will see "A report with a title"
