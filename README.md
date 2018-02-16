# Bucket List

Bucket List is an app that allows users to log all the things they've been wanting to do but haven't gotten around to doing. Once a user creates an account- by signing up with a username and password- the user can sign in and view all of the items in their bucket list. The items are displayed with a title and a description, created by the user. By clicking on the update or delete buttons under each item, the user is able to execute both of those functions. The user can also change their password and sign out. Only the user can view and edit their own items in the bucket list.

 Beyond the functions of creating, viewing and editing items, the overall goal of our app is to inspire users to accomplish the items on their bucket list. It is TeamBestTeam's hope that the users will feel accountable for their goals, and excited about accomplishing them when taking action to write them down and view them on a clear app display.

 Bucketlist app has a mongo database, an Express API framework backend and a javascript/HTML/CSS frontend. On the backend, a one-to-many relationship exists between a user and items - one user has many items. The RESTful routes, for handling GET, POST, PATCH and delete are used to communicate with the front end and execute user actions such as signing in/up, changing password, adding, deleting, updating and showing items.

## Related Links
- [Backend API Repo](http://github.com/teamBestTeam/bucket-list-backend)
- [Deployed API](https://serene-eyrie-46099.herokuapp.com/)
- [Deployed Client](http://teamBestTeam.github.io/bucket-list-frontend)
- [Frontend Client Repo](http://github.com/teamBestTeam/bucket-list-frontend)

## Dependencies

Install with `npm install`.

-   [`express`](http://expressjs.com/)
-   [`mongoose`](http://mongoosejs.com/)

At the beginning of each cohort, update the versions in
[`package.json`](package.json) by replace all versions with a glob (`*`) and
running `npm update --save && npm update --save-dev`. You may wish to test these
changes by deleting the `node_modules` directory and running `npm install`.
Fix any conflicts.

## Installation

1.  [Download](../../archive/master.zip) this template.
1.  Move the .zip file to your `wdi/projects/` directory and Unzip it (creating a folder) -- **NOTE:** if the folder was already unzipped, use the `mv` command line to move it to the `wdi/projects/` directory.
1.  Rename the directory from bucket-list -> your-app-name.
1.  Empty [`README.md`](README.md) and fill with your own content.
1.  Move into the new project and `git init`.
1.  Replace all instances of `'bucket-list'` with your app name. This
    includes `package.json`, various debugger configurations, and the MongoDB
    store.
1.  Install dependencies with `npm install`.
1.  From the root of your repository, run the following command. It will set a SECRET_KEY for development and testing.
 ```sh
 echo SECRET_KEY=$(/usr/local/opt/openssl/bin/openssl rand -base64 66 | tr -d '\n') >>.env
 ```
1.  Either run the API server with `npm start` OR if you want your code to be reloaded on
    change, you should `npm install --global nodemon` and use `nodemon` instead of
    `npm start`.
1.  Once everything is working, make an initial commit.
1.  In order to make requests from your deployed client application, you will need
to set `CLIENT_ORIGIN` in the environment (e.g. `heroku config:set
CLIENT_ORIGIN=https://<github-username>.github.io`).

##  Technologies
-  Express
-  MongoDB
-  Mongoose
-  JavaScript



## ERD
[Version1.0](https://www.lucidchart.com/documents/view/23708d64-2b51-4288-ac1e-838423ab04a9/0)

## Unsolved Problems
One piece of core list functionality that our team would like to further implement is the ability for a user to check off what they've done. Though there is something inspiring about viewing your hopes and dreams, it's underwhelming if you can't show that you've accomplished them.

Beyond that, our team would like to connect our lists and items with a third party API for the challenge involved. There are a few different directions that we could go. To make the application feel more 'official', we could connect to a mail-based API to send login credentials about signing up or changing a password. Or we could enhance user experience by allowing users to tweet their goals, or perhaps use seeded images, or even make our application specific to Pokemon Go and involve requests to that API to record successfully catching 'em all.

## Planning and Strategy
Our goals for this project were to meet the Minimal Viable Product (illustrated in the wire frames and entity relationship diagrams) while demonstrating clear, cohesive commits and working together as collaboratively and kindly as possible.

To do this, we created a culture code that was observed throughout the five day project.

```
1. Recognize and leverage each other's strengths to create a better product
2. Communicate directly
3. Communicate about availability through slack
4. Be respectful.
5. Don't take things personally.
6. If you're in a bad mood: try to minimize damage by separating yourself, and asking for help if you need it.
7. Each morning, a standup where next steps for the day are discussed, and then roles are taken up by members.
8. Each evening, a retro where we discuss the original plan, where we stand now, and next steps for the next day.
9. No merge without group consensus and review.
10. Before we move to the next step or feature, review for possible issues, report them to the issue queue, and move forward.
11.  No changes to database structure without group consensus.
12. After we reach our Minimal Viable Product: only User Experience changes.
```

In particular, we adhered closely to a daily practice of stand-up (addressing what we've accomplished, what we're working on, and what might be blocking us) and retro (what we've done and what we will aim to do the next day). No pull or merge request was made without unanimous consent by the group; and as we tri-programmed together for almost the entire duration of the project, almost every commit was approved by the whole group prior to a pull request.


### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

## API End Points

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/items`               | `items#index`     |
| GET    | `/items/:id`           | `items#show`      |
| POST   | `/items`               | `items#create`    |
| PATCH  | `/items/:id`           | `items#update`    |
| DELETE    | `/items/:id`     | `items#delete`     |

### GET /items/
```sh
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN" \

echo
```
```sh
API="http://localhost:4741" URL_PATH="/items"
TOKEN="${TOKEN}"
sh scripts/items/index.sh
```

Response:
```md
HTTP/1.1 200 OK
'{
"items":
   [
    {
      "id": "'"[id number]"'",
      "title": "'"[title]"'",
      "description": "'"[title]"'",
      "_owner": "'"[the ID of the owner of this item]"'",
      "createdAt": "'"[date of creation]"'",
      "updatedAt": "'"[date of last update]"'"
    }
  ]
}'

```
#### GET /items/:id

```sh
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN" \

echo
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
      "item": {
      "id": "'"[id number]"'",
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'",
      "_owner": "'"[the ID of the owner of this item]"'",
      "createdAt": "'"[date of creation]"'",
      "updatedAt": "'"[date of last update]"'",
      }
}
```

#### CREATE /items/
```sh
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo
```

Response:
```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
      "item": {
      "id": "'"[id number]"'",
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'",
      "_owner": "'"[the ID of the owner of this item]"'",
      "createdAt": "'"[date of creation]"'",
      "updatedAt": "'"[date of last update]"'",
      }
}
```


### PATCH /items/:id

Request:
```sh
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo
```

```sh
API="http://localhost:4741" URL_PATH="/items" TOKEN="${TOKEN}" TITLE="A NEW TITLE"
DESC="AN EVEN BETTER DESCRIPTION" sh scripts/items/update.sh
```

Response:
```md
HTTP/1.1 200 OK
'{
    "item": {
      "id": "'"[id number]"'",
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'",
      "_owner": "'"[the ID of the owner of this item]"'",
      "createdAt": "'"[date of creation]"'",
      "updatedAt": "'"[date of last update]"'"
    }
  }'
```


### DELETE /items/:id

```sh
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN" \
```

```sh
API="http://localhost:4741"
URL_PATH="/items"
ID="5a837a48e9f3b92d95ce27d5"
```

Response:
```
HTTP/1.1 204 No Content
```


## Gratitudes
1. Shaun White advised on the best way to display cards through a handle bars template, and his own personal stylings inspired our own.
2. --curlPower was, collectively, a lovely rival team.
3. Many thanks to Adam for repeatedly reserving rooms for us -- even re-reserving if we forgot to accept the reservation, in our caffeine deprived states.
4. Even greater thanks to the GA staff who were forgiving of our squatting or talking animatedly in their communal spaces.

## Catchphrases
```
To me this is the outfit of a smart person *gestures to self*: a hoodie.
```
