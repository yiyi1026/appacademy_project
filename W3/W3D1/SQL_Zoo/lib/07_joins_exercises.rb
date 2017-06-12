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

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    JOIN
      castings ON movies.id = movie_id
    JOIN
      actors ON actors.id = actor_id
    WHERE
      name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = movie_id
  JOIN
    actors ON actors.id = actor_id
  WHERE
    name = 'Harrison Ford' AND ord != 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    SELECT
      title, name
    FROM
      movies
    JOIN
      castings ON movies.id = movie_id
    JOIN
      actors ON actors.id = actor_id
    WHERE
      yr = 1962 AND ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT
      yr, COUNT(title)
    FROM
      movies
    JOIN
      castings ON movies.id = movie_id
    JOIN
      actors ON actors.id = actor_id
    WHERE
      name = 'John Travolta'
    GROUP BY
      yr
    HAVING
     COUNT(title) > 1
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
  SELECT
    title, name
  FROM
    movies
  JOIN
    castings ON movies.id = movie_id
  JOIN
    actors ON actors.id = actor_id
  WHERE
    ord = 1 AND title in (
      SELECT
        title
      FROM
        movies
      JOIN
        castings ON movies.id = movie_id
      JOIN
        actors ON actors.id = actor_id
      WHERE
        name = 'Julie Andrews'
    )
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
  SELECT DISTINCT
    name
  FROM
    actors
  JOIN
    castings on id = actor_id
  WHERE
    ord = 1
  GROUP BY
    name
  HAVING
    count(movie_id) >= 15
  ORDER BY name
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
  SELECT
    title, count(actor_id)
  FROM
    movies
  JOIN
    castings ON movies.id = movie_id
  WHERE
    YR = 1978
  GROUP BY
    title
  ORDER BY count(actor_id) DESC, title
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  SELECT
    name
  FROM
    actors
  JOIN
    castings on actors.id = actor_id
  JOIN
    movies on movies.id = movie_id
  WHERE
    name != 'Art Garfunkel' AND title in (
      SELECT DISTINCT
        title
      FROM
        movies
      JOIN
        castings on movies.id = movie_id
      JOIN
        actors on actors.id = actor_id
      WHERE
        name = 'Art Garfunkel'
    )
  SQL
end
