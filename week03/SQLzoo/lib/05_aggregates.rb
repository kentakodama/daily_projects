# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_sum
  execute(<<-SQL)
    SELECT
      SUM(population)
    FROM
      countries
  SQL
end

def continents
  # List all the continents - just once each.
  execute(<<-SQL)

    select distinct countries.continent
    from countries

  SQL
end

def africa_gdp
  # Give the total GDP of Africa.
  execute(<<-SQL)
    select Sum(countries.gdp)
    from countries
    where countries.continent = 'Africa'
  SQL
end

def area_count
  # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
    select COUNT(*)
    from countries
    where countries.area > 1000000

  SQL
end

def group_population
  # What is the total population of ('France','Germany','Spain')?
  execute(<<-SQL)

    select sum(countries.population)
    from countries
    where countries.name in ('France', 'Germany', 'Spain')

  SQL
end

def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)

    select countries.continent, COUNT(countries.name)
    from countries
    group by countries.continent
  SQL
end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)

    select countries.continent, COUNT(countries.name)
    from countries
    where countries.population >= 10000000
    group by countries.continent



  SQL
end

p 'HERE '

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)

    select countries.continent
    from countries
    group by countries.continent
    having sum(countries.population) >= 100000000

  SQL
end
