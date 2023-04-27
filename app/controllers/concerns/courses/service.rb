class Courses::Service
  def initialize(courses)
    @courses = courses
  end

  def filter(editions, criteria)
    @courses = @courses.where(id: get_courses(JSON.parse(editions))) if editions.present?
    criterion_params = JSON.parse(criteria)
    criterion_params.each do |criterion|
      case criterion
      when "latest"
        @courses = @courses.where(id: latest_courses)
      when "closest"
        @courses = @courses.where(id: closest_courses)
      when /type-/
        @courses = @courses.where(id: type_courses(criterion))
      when /school-/
        @courses = @courses.where(id: school_courses(criterion))
      end
    end
    @courses
  end

  private

  def get_courses(edition_params)
    Course.joins(:edition, :topic).where(
      edition: { start_date: edition_params.pluck("date") },
      topic: { name: edition_params.pluck("courses").flatten.pluck("type") },
      name: edition_params.pluck("courses").flatten.pluck("name")
    )
  end

  def closest_courses
    Edition.where("start_date >= ?", Date.today).order(start_date: :asc).first&.courses || Course.none
  end

  def latest_courses
    Edition.where("start_date >= ?", Date.today).order(start_date: :desc).first&.courses || Course.none
  end

  def type_courses(type)
    Topic.where(name: type.delete_prefix("type-")).first&.courses || Course.none
  end

  def school_courses(school)
    school_id_and_parametrized_name = School.all.pluck(:id, :name).map{|school| [school[0], school[1].parameterize]}.find{|k, v| k; v == school.delete_prefix("school-")}
    Course.joins(topic: :school).where(school: {id: school_id_and_parametrized_name[0]})
  end
end