# API tests covering the acceptance criteria

import json

from pytest import mark,fixture

from utilities import *

uname = random_username()
USER_PROFILE = {'username': uname, 'password': uname+"123", 'firstname': uname+"fname", 'lastname': uname+"lname", 'phone': "3092"}
access_token = None


@fixture(scope="module")
def setup_and_teardown():
    register_given_user(USER_PROFILE)
    global access_token
    access_token = get_access_token(USER_PROFILE['username'], USER_PROFILE['password'])
    yield
    remove_given_user(USER_PROFILE)


class TestAPIs:
    @mark.smoke
    def test_get_users_list(self, setup_and_teardown):
        url = base_url+"/api/users"
        res = requests.get(url, headers=get_headers(access_token))
        response_body = res.json()
        assert res.status_code == 200
        assert response_body['status'] == "SUCCESS"
        assert response_body['payload'] is not None
        assert USER_PROFILE['username'] in response_body['payload']

    @mark.smoke
    def test_get_user_details(self):
        url = base_url+"/api/users/"+USER_PROFILE['username']
        res = requests.get(url, headers=get_headers(access_token))
        response_body = res.json()
        assert res.status_code == 200
        assert response_body['payload']['firstname'] == USER_PROFILE['firstname']
        assert response_body['payload']['lastname'] == USER_PROFILE['lastname']
        assert response_body['payload']['phone'] == USER_PROFILE['phone']
        assert response_body['status'] == "SUCCESS"
        assert response_body['message'] == "retrieval succesful"

    @mark.smoke
    def test_update_user_details(self):
        url = base_url+"/api/users/"+USER_PROFILE['username']
        payload = {'firstname': 'soda', 'lastname': 'medavo', 'phone': '0504839'}
        res = requests.put(url, headers=get_headers(access_token), data=json.dumps(payload))
        response_body = res.json()
        assert res.status_code == 201
        assert response_body['message'] == "Updated"
        assert response_body['status'] == "SUCCESS"
        res = requests.get(url, headers=get_headers(access_token))
        response_body = res.json()
        assert response_body['payload']['firstname'] == payload['firstname']
        assert response_body['payload']['lastname'] == payload['lastname']
        assert response_body['payload']['phone'] == payload['phone']

    def test_removed_user_notin_list(self, setup_and_teardown):
        url = base_url+"/api/users"
        remove_given_user(USER_PROFILE)
        res = requests.get(url, headers=get_headers(access_token))
        response_body = res.json()
        assert res.status_code == 200
        assert USER_PROFILE['username'] not in response_body['payload']
