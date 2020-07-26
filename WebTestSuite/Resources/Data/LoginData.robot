*** Variables ***
${BASE_URL}  http://localhost:8080/
${BROWSER}  Chrome

# Base Existing User
&{BASE_USER}  Username=base0B1Sf0IRfr  Password=test123  Firstname=sdfso  Lastname=wewf  Phone=3092

# Login Failure Test Data
&{UNREGISTERED_USER}  Username=nonexistent  Password=test123  ExpectedErrorMessage=You provided incorrect login details
&{INVALID_PASSWORD}  Username=abc  Password=test123  ExpectedErrorMessage=You provided incorrect login details
&{BLANK_CREDENTIALS}  Username=#BLANK  Password=#BLANK  ExpectedErrorMessage=Log In
