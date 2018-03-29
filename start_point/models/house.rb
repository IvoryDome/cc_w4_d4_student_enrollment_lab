class House

attr_reader :name, :id

def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
end

def save
  sql = "INSERT INTO houses
  (
    name
  )
  values
  ($1)
  RETURNING *"
  values = [@name]
  house_data = SqlRunner.run(sql, values)
  @id = house_data.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  result = houses.map {|house| House.new(house)}
  return result
end

def self.delete_all()
  sql = "DELETE FROM houses"
  houses = SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM houses
  WHERE id = $1"
  values = [id]
  house = SqlRunner.run(sql, values).first
  result = House.new(student)
  return result
end

























end
