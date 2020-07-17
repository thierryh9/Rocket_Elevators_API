class Dwhlead < ApplicationRecord
include RailsAdminCharts

  def self.graph_data since=30.days.ago
	d=[]
	connection = PG.connect(dbname: 'AlexandreLevesque',host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', user: 'codeboxx', password: 'Codeboxx1!')
	connection.exec( 'select count(project_name) as "project_count", to_char(date_created , \'YYYY\') as "year", to_char(date_trunc(\'month\', date_created)::date, \'Month\') as "month" from fact_contact group by to_char(date_created , \'YYYY\'),date_trunc(\'month\', date_created) order by to_char(date_created , \'YYYY\'),date_trunc(\'month\', date_created);' ) do |result|
	result.each do |row|

	d = d.push({
          name: row.values_at('year')[0]+" "+row.values_at('month')[0],
          pointInterval: point_interval = 1.day * 1000,
          pointStart: start_point = since.to_i * 1000,
          data: [row.values_at('project_count')[0].to_i]
      })
	end
	end
	puts d
	d
  end
  def self.chart_type
      "column"
  end
end
