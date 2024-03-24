# Live Chat App

## Prerequisites
- Ruby 3.3.0
- Bundler 2.5.5 or higher
- Install Bun [Bun docs](https://bun.sh/docs/installation)
- PostgreSQL
## Get started locally
1. Clone this repo
```bash
git clone git@github.com:antonzaharia/live-chat-app.git
cd live-chat-app
```
2. Install dependencies
```bash
bundle install && bun install
```
3. Prepare Database
```bash
bin/rails db:create && bin/rails db:migrate
```
4. Start the server
```bash
bin/dev
```
And visit [http://localhost:3000](http://localhost:3000)

## TODO
- [x] Users should be able to sign up and be authenticated
- [x] Users should have a display name
- [x] Users should be able to join and leave chat rooms
- [x] Chat rooms can have many users at a time
- [x] Users can send message to chat rooms
- [x] Messages should be real time
- [x] Messages should contain text
- [x] Messages should be persisted in a database

## Data Model

### User
  - id
  - email
  - name
  - (...)

### UserChat
  - user_id (foreign key referencing User.id)
  - chat_id (foreign key referencing Chat.id)

### Chat
  - id
  - name

### Message
  - id
  - content
  - user_id (foreign key referencing User.id)
  - chat_id (foreign key referencing Chat.id)
