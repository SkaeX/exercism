# School of life
class School
  def initialize
    @grades = {}
  end

  def students(grade)
    return [] if @grades[grade].nil?

    @grades[grade].sort
  end

  def add(student, grade)
    if @grades[grade].nil?
      @grades[grade] = [student]
    else
      @grades[grade].push(student)
    end
  end

  def students_by_grade
    @grades
      .reduce([]) do |acc, (key, value)|
        acc.push(grade: key, students: value.sort)
      end.sort_by { |element| element[:grade] }
  end
end
