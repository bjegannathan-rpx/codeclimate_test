class Project < ActiveRecord::Base
  attr_accessible :title

  def self.injection1(arg=1)
    k = connection.execute(<<-SQL
      SELECT id FROM projects where id in (#{arg})
    SQL
    ).to_a
  end

  def self.injection2(arg=1)
    Project.find_by_sql("SELECT ID FROM projects where id in (#{arg})")
  end

  
  def self.injection3(arg=1)
    k = ActiveRecord::Base.connection.execute(<<-SQL
      SELECT id FROM projects where id in (#{arg})
    SQL
    ).to_a
  end

end
