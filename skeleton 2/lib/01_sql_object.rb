require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # debugger
    @columns ||= self.fresh_cols #THIS WORKS
    # @@columns ||= self.fresh_cols #THIS DOESNT WORK
  end

  def self.fresh_cols
    cols_query = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}" --Note: instructions and testing shows cannot ? interpolate with bind arg in FROM, use regular string interpolation instead
    SQL
    cols_query.first.map(&:to_sym)
  end

  def self.finalize!
  end

  def self.table_name=(table_name)
    @@table_name = table_name
  end

  def self.table_name
    @@table_name ||= self.to_s.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
