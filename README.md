# TodoApp

## Team Members
- Your Name Here

## Overview
A Rails 7 app where each user manages Categories and ToDos.  
Each ToDo belongs to one Category.

## Features
- Sign up / Log in / Log out (custom authentication with bcrypt)
- CRUD for Categories & ToDos
- Per-user scoping: only your own data is visible
- “Completed ToDos” view
- Priority & Completed styling via Bootstrap & FontAwesome

## Tech Stack
- Ruby 3.1.2, Rails 7.0.7
- PostgreSQL
- Bootstrap 5, FontAwesome
- bcrypt

## Setup

```bash
git clone https://github.com/yourusername/todo_app.git
cd todo_app
bundle install
rails db:create db:migrate
rails server
```

Visit `http://localhost:3000` and sign up!

## Deployment
- Push to GitHub
- Deploy to Heroku (or Fly.io)

## Demo Video
Link to your screen‐recorded demo showing all CRUD and styling.
