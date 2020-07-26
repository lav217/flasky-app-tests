# Unit Tests to test the function implementations of utilities module

from utilities import *

junk_uname = "3randomtext_dfsdfdsfnsdfoefwefowefsdkflsdfsdfasdlfoewofsdf_:Ä*^``#\"%?#€?%#€?%#€?%#?%?\"?"
JUNKCHAR_PROFILE = {'username': junk_uname, 'password': junk_uname+"123", 'firstname': junk_uname+"fname", 'lastname': junk_uname+"lname", 'phone': junk_uname}
BLANKCHAR_PROFILE = {'username': "", 'password': "", 'firstname': "", 'lastname': "", 'phone': 000}
BLANKPWORD_PROFILE = {'username': "ewjfs", 'password': "", 'firstname': "", 'lastname': "", 'phone': 000}

uname = random_username()
test_Profile4 = {'username': uname, 'password': "ewjfs123", 'firstname': "", 'lastname': "", 'phone': 000}


def test_register_user():
    response = register_given_user(JUNKCHAR_PROFILE)
    assert "Log In - Demo App" or "Register - Demo App" in response.content.decode('utf8')
    response = register_given_user(BLANKCHAR_PROFILE)
    assert "Username is required" in response.content.decode('utf8')
    response = register_given_user(BLANKPWORD_PROFILE)
    assert "Password is required" in response.content.decode('utf8')
    response = register_given_user(test_Profile4)
    assert "class=\"flash\"" not in response.content.decode('utf8')


def test_access_token_invalid_username():
    try:
        response = get_access_token(JUNKCHAR_PROFILE['username'], JUNKCHAR_PROFILE['password'])
    except UnicodeEncodeError:
        print(UnicodeEncodeError, "Username is invalid for token generation.")
        assert True
    else:
        assert False


def test_access_token_missing_username():
    try:
        response = get_access_token(BLANKCHAR_PROFILE['username'], BLANKCHAR_PROFILE['password'])
    except KeyError:
        print(KeyError, "Missing Username for token generation.")
        assert True
    else:
        assert False


def test_access_token_missing_password():
    try:
        response = get_access_token(BLANKPWORD_PROFILE['username'], BLANKPWORD_PROFILE['password'])
    except KeyError:
        print(KeyError, "Missing Password for token generation.")
        assert True
    else:
        assert False
