### flasky-app-tests

This test suite includes API and web automated tests for the Flasky demo-app found at https://github.com/Interview-demoapp/Flasky. The test automation suite covers only basic acceptance criteria for both UI and API. UI tests are written using the Robot Framework with Python. API tests are written using requests and pytest libraries from Python. Unit tests are written for the utilities module which includes some basic functions for token-generation, registration and removal of users from the db.

### Instructions for running the tests:
1. Install the demo-app following the instructions at https://github.com/Interview-demoapp/Flasky
2. Make sure the app server is running at 127.0.0.1:8080
3. Install 'robotframework' and 'robotframework-selenium'.
4. Add 'Chromedriver' from https://chromedriver.chromium.org/downloads to the PATH environment variable.
5. Run 'pytest -v' from the folder APITestSuite to run both API and unit tests.
6. Run 'robot -d results tests' from the folder WebTestSuite to run all UI tests.

### Structure of the Tests Organization:
* /APITestSuite
  - /test_basics.py   
  - /test_utilities.py  
  - /utilities.py
* /WebTestSuite
  - /Resources
    - /Data
      - LoginData.robot
    - /Page Objects
      - login_page.robot
      - register_page.robot
    - common.robot
    - login_resource.robot
    - register_resource.robot
  - /Results
  - /Tests
    - 01_register.robot
    - 02_login.robot
* QA - Testing and Testability.docx
* Test Report.docx
