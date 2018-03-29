require_relative('../db/sql_runner.rb')
require('pry')


class Student

  attr_reader :first_name, :second_name, :house_id, :age, :id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO student_enrollments
    (
      first_name,
      second_name,
      house_id,
      age
    )
    values
    ($1, $2, $3, $4)
    RETURNING *"
    values = [@first_name, @second_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end



  def self.all()
    sql = "SELECT * FROM student_enrollments"
    students = SqlRunner.run(sql)
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM student_enrollments"
    students = SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM student_enrollments
    WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values).first
    result = Student.new(student)
    return result
  end






end
