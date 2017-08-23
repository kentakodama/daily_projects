# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_query
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    WHERE
      title = 'Doctor No'
  SQL
end

def films_from_sixty_two
  # List the films where the yr is 1962 [Show id, title]
  execute(<<-SQL)

    select distinct movies.id, movies.title
    from movies
    join castings on castings.movie_id = movies.id
    join actors on actors.id = castings.actor_id
    where movies.yr = 1962
    order by movies.id

  SQL
end

def year_of_kane
  # Give year of 'Citizen Kane'.
  execute(<<-SQL)

  select distinct movies.yr
  from movies
  join castings on castings.movie_id = movies.id
  join actors on actors.id = castings.actor_id
  where movies.title = 'Citizen Kane'
  SQL
end

def trek_films
  # List all of the Star Trek movies, include the id, title and yr (all of
  # these movies include the words Star Trek in the title). Order results by
  # year.
  execute(<<-SQL)

    select distinct movies.id, movies.title, movies.yr
    from movies
    join castings on castings.movie_id = movies.id
    join actors on actors.id = castings.actor_id
    where movies.title like '%Star Trek%'
    order by movies.yr

  SQL
end

def films_by_id
  # What are the titles of the films with id 1119, 1595, 1768?
  execute(<<-SQL)
    select distinct movies.title
    from movies
    join castings on castings.movie_id = movies.id
    join actors on actors.id = castings.actor_id
    where movies.id in (1119, 1595, 1768)

  SQL
end

def glenn_close_id
  # What id number does the actress 'Glenn Close' have?
  execute(<<-SQL)

  select distinct actors.id
  from movies
  join castings on castings.movie_id = movies.id
  join actors on actors.id = castings.actor_id
  where actors.name = 'Glenn Close'

  SQL
end

def casablanca_id
  # What is the id of the film 'Casablanca'?
  execute(<<-SQL)

      select distinct movies.id
      from movies
      join castings on castings.movie_id = movies.id
      where movies.title = 'Casablanca'



  SQL
end

def casablanca_cast
  # Obtain the cast list for 'Casablanca'. Use the id value that you obtained
  # in the previous question directly in your query (for example, id = 1).
  execute(<<-SQL)

    select actors.name
    from movies
    join castings on castings.movie_id = movies.id
    join actors on castings.actor_id = actors.id
    where movies.id in (
      select distinct movies.id
      from movies
      join castings on castings.movie_id = movies.id
      where movies.title = 'Casablanca'
    )

  SQL
end

def alien_cast
  # Obtain the cast list for the film 'Alien'
  execute(<<-SQL)

    select actors.name
    from actors
    join castings on castings.actor_id = actors.id
    join movies on castings.movie_id = movies.id
    where movies.title = 'Alien'


  SQL
end
