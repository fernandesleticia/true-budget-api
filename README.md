# True Budget API 
Provides API for [True Budget App](https://github.com/hhldiniz/true-budget-app)

## Prerequisites
- Ruby 2.7.4
- Rails 6.1.6
- PostgreSQL 12

## Testing the app
### Run the server
```
rails s
```

### Register an account
**Note: use [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) to generate the password**
```
User.create(username: John Doe, password_digest: BCrypt::Password.create("my password"))
```
```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "leticia@truebudget.com", "password": "12345678" } }' http://localhost:3000/users
```

### Login
**Note: we're using the flag '-i' so the response includes headers (which contains the JWT token)**
```
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "leticia@truebudget.com", "password": "12345678" } }' http://localhost:3000/users/sign_in
```

### Making requests using the auth token returned in the last request response

```
curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU5OTk1MjAyLCJleHAiOjE2NjEyOTEyMDIsImp0aSI6IjY5NTE4NDE3LWMwOWMtNDRlNy04NmQ2LThhOGRlZWU3ZTQyNSJ9.PEhspmjdWN8NKgrqPuCyipVibMY19ymnx0DbsXyDPro" -H "Content-Type: application/json" -d '{ "group": { "name": "Essencial" } }' http://localhost:3000/groups
```

```
curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjY2MDMxMDU5LCJleHAiOjE2NjYxMTc0NTksImp0aSI6IjZkZDJmODJhLTk1ZGUtNDNiMS1iMGQ5LWRhYjYyYWQ1ZGUzNyJ9.Lw5NVn430eepIBdt6qtNoiXGyTO8q125xJ4SYWnX5o4" -H "Content-Type: application/json" http://localhost:3000/groups/1
```

### Sign out
```
curl -XDELETE -H "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjY2MDMxMDU5LCJleHAiOjE2NjYxMTc0NTksImp0aSI6IjZkZDJmODJhLTk1ZGUtNDNiMS1iMGQ5LWRhYjYyYWQ1ZGUzNyJ9.Lw5NVn430eepIBdt6qtNoiXGyTO8q125xJ4SYWnX5o4" -H "Content-Type: application/json" http://localhost:3000/users/sign_out
```
## Create env files
```
cp "sample.env" ".env"
```

## Bugs and feature requests

If you have an idea or found a problem, [feel free to open a new issue](https://github.com/fernandesleticia/true-budget-api/issues/new).

## Creators

[**Leticia Fernandes**](https://github.com/fernandesleticia)

[**Hugo Diniz**](https://github.com/hhldiniz)


## Copyright and license

Code released under the [GNU General Public License v3.0](https://github.com/fernandesleticia/true-budget-api/blob/main/LICENSE).
