# Assignment

## SQL
In order to complete these exercises, you'll need the `psql` command line tool.

#### psql

In your command line, type
```bash
psql chinook_development
```
Don't forget to use semi-colons after each SQL statement!

To quit, simply type ctrl + d.

### Exercises


Check out [W3Schools' SQL Reference](http://www.w3schools.com/sql/sql_syntax.asp) as a reference.

Answer each of the following with one or more SQL queries:

1) Find the albums recorded by the artist Queen.
```SQL
/* Add your code below */

```

2) [Count](http://www.w3schools.com/sql/sql_func_count.asp) how many tracks belong to the media type "Protected MPEG-4 video file".
```SQL
/* Add your code below */

```

3) Find the least expensive track that has the genre "Electronica/Dance".
```SQL
/* Add your code below */

```

4) Find the all the artists whose names start with A.
```SQL
/* Add your code below */

```

5) Find all the tracks that belong to playlist 1.
```SQL
/* Add your code below */

```

## Active Record Query Interface
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

### Exercise

Answer each of the following with one or more Active Record queries:

1a) Find the genre with the name "Hip Hop/Rap".
```ruby
# Enter your code below

```
1b) Count how many tracks belong to the "Hip Hop/Rap" genre
```ruby
# Enter your code below

```
2) Find the total amount of time required to listen to all the tracks in the database.
```ruby
# Enter your code below

```
3a) Find the highest price of any track that has the media type "MPEG audio file".
```ruby
# Enter your code below

```
3b) Find the name of the most expensive track that has the media type "MPEG audio file".
```ruby
# Enter your code below

```
4) Find the 2 oldest artists.
```ruby
# Enter your code below

```

### Stretch Exercises (Active Record Query Interface)

Some of these questions require the use of [joins](http://guides.rubyonrails.org/active_record_querying.html#joining-tables) (see also [this link](http://www.w3schools.com/sql/sql_join.asp)).

1) Find all the tracks that belong to the first playlist.
```ruby
# Enter your code below

```
2) Write a series of queries to find all the tracks that belong to the 2 most recent playlists.
```ruby
# Enter your code below

```
3) Find all the albums whose titles start with B.
```ruby
# Enter your code below

```
