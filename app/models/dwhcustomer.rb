class Dwhcustomer < ApplicationRecord
include RailsAdminCharts

  def self.graph_data since=30.days.ago
	d=[]
	connection = PG.connect(dbname: 'AlexandreLevesque',host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', user: 'codeboxx', password: 'Codeboxx1!')
	connection.exec( 'select count(serial_number) as "elevators", customer_id from fact_elevator group by customer_id;' ) do |result|
	result.each do |row|

	d = d.push({
          name: "customer "+row.values_at('customer_id')[0],
          pointInterval: point_interval = 1.day * 1000,
          pointStart: start_point = since.to_i * 1000,
          data: [row.values_at('elevators')[0].to_i]
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
