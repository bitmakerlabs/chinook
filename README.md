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

If you already went through the [Bitmaker set-up guide for Ubuntu](https://github.com/bitmakerlabs/dev_environment_setup) you should already have PostgreSQL installed and ready to go.  If not you can follow the instructions in the section called 'Installing PostgreSQL'.

Alternatively, sections [3](https://help.ubuntu.com/community/PostgreSQL#Installation) and [5](https://help.ubuntu.com/community/PostgreSQL#Alternative_Server_Setup) of the [Ubuntu Postgres installation guide](https://help.ubuntu.com/community/PostgreSQL#Installation) may be useful.

## Getting started

Once you've installed PostgreSQL, start by setting up the database by typing the following in your terminal:

```bash
bin/rake db:setup
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

Before you get down to work, it's important to take a moment to familiarize yourself with the tables, columns, and foreign key relationships in your database:

![](chinook_schema.png)

And in the corresponding Rails models:
![](erd.png)


# Assignment

## SQL
The SQL assignment questions are in the file `sql_assignment.sql`.
In order to complete these exercises, you'll need the `psql` command line tool.

#### psql

In your command line, type
```bash
psql chinook_development
```
Don't forget to use semi-colons after each SQL statement!

To quit, simply type ctrl + d.


## Active Record Query Interface
The Active Record Query Interface assignment questions are in the file `activerecord_assignment.rb`.

In order to complete these exercises, you'll need to launch your Rails console with
```bash
$ rails c
```

### Practice

Getting to know the Active Record Query Interface will definitely pay off in the long run. You should read through the [Rails Guide on Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html)  and get to know it well.

With Chinook, you can start your rails console and try out the following queries. The cool part is, the console will also show you the SQL it actually generated and ran to execute the query.

All these practice examples are making use of some of the most commonplace methods. That said, DO TRY the other ones. And don't forget, **you can chain these different methods** to refine your results!

#### Finding
##### Retrieving a Single Object
[These methods](http://guides.rubyonrails.org/active_record_querying.html#retrieving-a-single-object) will return a single object. Notice that the SQL queries that are generated always use `LIMIT 1` and sometimes include an `ORDER BY` clause.

`.find`, `.first`, `.last`, `.find_by` are very commonly used methods and you'll see them often.

```ruby
artist = Artist.find(22)
```
```ruby
album = Album.first
```
```ruby
track = Track.last
```
```ruby
my_playlist = Playlist.find_by(name: "90’s Music")
```

##### Retrieving Multiple Objects
[These methods](http://guides.rubyonrails.org/active_record_querying.html#retrieving-multiple-objects) help you find multiple objects. You can also use `.find` with an array of ids.

Other popular multiple object finders are `.all`, `.find_each`, `.find_in_batches`

```ruby
tracks = Track.find([1, 10, 55])
```
```ruby
Genre.find_each do |a|
  puts a.name
end
```

#### Conditions
`.where` is the go-to method when it comes to conditionally finding data. You can pass in conditions as SQL strings, Ruby arrays or hashes. Strings are considered unsafe, however!

Instead of...
```ruby
Artist.where("name = 'AC/DC'")
```
...you should properly sanitize any user input by using an array to prevent SQL injection!
```ruby
Artist.where("name = ?", 'AC/DC')
```

Using a hash
```ruby
Artist.where(name: 'AC/DC')
```

#### Order
You can order your queries based on one or more column with `.order`. [See more details here](http://guides.rubyonrails.org/active_record_querying.html#ordering). It can be used alone or chained with other query statements.

```ruby
Album.where(artist_id: 1).order(created_at: :desc)
```

#### Limit
You can also [limit the amount of results](http://guides.rubyonrails.org/active_record_querying.html#limit-and-offset) you get with `.limit`. Best combined with other queries.

```ruby
Playlist.limit(5)
```

#### Calculations
`.count`, `.maximum`, `.minimum`, `.average`, `.sum` are common calculation methods you can run on your results. [See more details here](http://guides.rubyonrails.org/active_record_querying.html#calculations)

```ruby
Album.count
```

```ruby
Track.minimum(:unit_price)
```
