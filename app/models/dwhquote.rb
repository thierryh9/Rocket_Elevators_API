class Dwhquote < ApplicationRecord
include RailsAdminCharts

  def self.graph_data since=30.days.ago
	d=[]
	connection = PG.connect(dbname: 'AlexandreLevesque',host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', user: 'codeboxx', password: 'Codeboxx1!')
	connection.exec( 'select count(q.quote_id) as "quote_count", to_char(q.date_created , \'YYYY\') as "year", to_char(date_trunc(\'month\', q.date_created)::date, \'Month\') as "month" from fact_quotes q where q.quote_id not in (select distinct on (fq.company_name,fq.nb_elevators) fq.quote_id from fact_quotes fq 
join fact_quotes fq2 on
fq.company_name = fq2.company_name 
and fq.quote_id != fq2.quote_id 
and fq.nb_elevators = fq2.nb_elevators 
and to_char(fq.date_created , \'YYYY-mm\') = to_char(fq2.date_created , \'YYYY\'))
group by to_char(q.date_created , \'YYYY\'), date_trunc(\'month\', q.date_created)ORDER BY to_char(q.date_created , \'YYYY\'),date_trunc(\'month\', q.date_created);' ) do |result|
	result.each do |row|

	d = d.push({
          name: row.values_at('year')[0]+" "+row.values_at('month')[0],
          pointInterval: point_interval = 1.day * 1000,
          pointStart: start_point = since.to_i * 1000,
          data: [row.values_at('quote_count')[0].to_i]
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
