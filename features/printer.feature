Feature: Printer
  Scenario: Connect and disconnect printer
    Given I have a printer with ip "192.168.1.3" and port "9100"
    When I connect the printer
