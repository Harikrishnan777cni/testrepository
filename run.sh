cd  /Users/hsreekum/PycharmProjects/DAMrobotAutomationframeworkone
#pabot --processes 2 --outputdir Results TestCases/*.robot
#pabot --processes 3  --listener 'allure_robotframework;./results/allure'  TestCases/
#pabot --processes 3  --listener 'allure_robotframework;./results/allure'  TestCases/Searchtests/
#display allure report
#allure serve ./results/allure