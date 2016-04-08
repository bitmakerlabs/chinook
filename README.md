## README

# Chinook App

Chinook is a Rails application destined to help you practice various ActiveRecord queries. It is based on [this dataset](http://chinookdatabase.codeplex.com/), but translated to work with Rails and ActiveRecord.

Chinook doesn't currently have a user interface, but feel free to add one!

## Requirements

### PostgreSQL
Chinook uses a PostgreSQL database. You'll need to have it installed and running.

#### OS X Users

[Mac OS X packages](http://www.postgresql.org/download/macosx/)

Installing PostgreSQL with Homebrew or with the Postgres.app are recommended.

If you're on a Mac and installed the Postgres.app, you might need to add the psql command to bash by inserting the following line into your .bash_profile.

```bash
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
```

#### Linux (Ubuntu) Users

[Ubuntu Postgres installation](https://help.ubuntu.com/community/PostgreSQL#Installation)

## Getting started

Once you've installed PostgreSQL, start by setting up the database by typing the following in your terminal:

```bash
rake db:setup
```

There's *a lot of data* to load, so instead of using seeds, we're going to manually import a SQL file with Postgres command line. This make take a moment.

```bash
psql chinook_development < chinook.sql
```

Once you're done loading your data, it's time to play! Fire up your Rails Console!
```bash
rails console
```
or for short
```bash
rails c
```
and it should look something like this!
![](http://cl.ly/image/1c3F0o0a2g0Q/Screen%20Shot%202014-01-29%20at%201.38.28%20PM.png)

Before attempting [the assignment](https://github.com/bitmakerlabs/chinook/blob/master/assignment.md) take a moment to familiarize yourself with the tables, columns, and foreign key relationships in your database:

![](chinook_schema.png)

And in the corresponding Rails models:
![](erd.png)

