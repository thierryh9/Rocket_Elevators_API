CREATE TABLE IF NOT EXISTS fact_quotes (
  quote_id SERIAL NOT NULL,
  date_created timestamp NOT NULL,
  company_name VARCHAR(70) NOT NULL,
  email VARCHAR(255) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  nb_elevators VARCHAR(45) NOT NULL);

CREATE TABLE IF NOT EXISTS fact_contact (
  contact_id SERIAL NOT NULL,
  date_created timestamp NOT NULL,
  email VARCHAR(255) NOT NULL,
  entreprise VARCHAR(255) NOT NULL,
  project_name VARCHAR(255) NOT NULL);

CREATE TABLE IF NOT EXISTS fact_elevator (
  serial_number VARCHAR(70) NOT NULL,
  commissionning_date timestamp NOT NULL,
  building_id INT NOT NULL,
  customer_id INT NOT NULL,
  building_city VARCHAR(70) NOT NULL);

  CREATE TABLE IF NOT EXISTS fact_interventions (
    employeeID INT NOT NULL,
    buildingID INT NOT NULL,
    batteryID  INT NULL,
    columnID   INT NULL,
    elevatorID INT NULL,
    interventionStart_date timestamp NOT NULL,
    interventionEnd_date timestamp  NULL,
    result VARCHAR(12) NOT NULL,
    repport VARCHAR(255) NULL,
    statut VARCHAR(15) NOT NULL);

CREATE TABLE IF NOT EXISTS dim_customers (
  id SERIAL NOT NULL,
  date_created timestamp NULL,
  company_name VARCHAR(70) NOT NULL,
  contact_name VARCHAR(70) NOT NULL,
  contact_email VARCHAR(255) NOT NULL,
  nb_elevators INT NOT NULL,
  customer_city VARCHAR(70) NULL);
