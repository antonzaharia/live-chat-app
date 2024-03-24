# Live Chat App

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
