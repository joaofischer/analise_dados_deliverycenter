# Por questões de falta privilégio sobre outras pastas, coloquei os arquivos de carga dentro 
# da pasta "Uploads" (eu criei manualmente) onde facilitaria tanto o tamanho do caminho quanto acesso direto.

# A Query de carga deve ser feita por dentro do prompt de comando, e caso queira utilizar o workbench para o load, utiliza o import wizard.

# Para realizar a carga por prompt deve habilitar o local-infile

# mysql -u nome_usuario -p

# SET GLOBAL local_infile = true;
# exit

# Reconecta ao MySQL
# mysql -u nome_user -p --local_infile
# ou
# mysql --local_infile=1 -u nome_user -p

# Criação table deliveries
CREATE TABLE `pj1`.`tb_deliveries` (
  `delivery_id` INT NULL,
  `delivery_order_id` INT NULL,
  `driver_id` INT NULL,
  `delivery_distance_meters` INT NULL,
  `delivery_status` VARCHAR(50) NULL);
  
# Carga de Deliveries
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/deliveries.csv" 
INTO TABLE `pj1`.`tb_deliveries`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

# Criação de Table Channels
CREATE TABLE `pj1`.`tb_channels` (
  `channel_id` INT NULL,
  `channel_name` VARCHAR(50) NULL,
  `channel_type` VARCHAR(50) NULL);
  
# Query para carregamento de dados locais no banco - channels
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/channels.csv" 
INTO TABLE `pj1`.`tb_channels`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;


#Criação table drivers
CREATE TABLE `pj1`.`tb_drivers` (
  `driver_id` INT NULL,
  `driver_modal` VARCHAR(50) NULL,
  `driver_type` VARCHAR(50) NULL);
  
# Carga de Drivers
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/drivers.csv" 
INTO TABLE `pj1`.`tb_drivers`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

#Criação Table hubs
CREATE TABLE `pj1`.`tb_hubs` (
  `hub_id` INT NULL,
  `hub_name` VARCHAR(50) NULL,
  `hub_city` VARCHAR(50) NULL,
  `hub_state` VARCHAR(10) NULL,
  `hub_latitude` INT NULL,
  `hub_longitude` INT NULL);
  
#Carga de Hubs
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/hubs.csv" 
INTO TABLE `pj1`.`tb_hubs`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

#Criação Table Payments
CREATE TABLE `pj1`.`tb_payments` (
  `payment_id` INT NULL,
  `payment_order_id` INT NULL,
  `payment_amount` FLOAT(2) NULL,
  `payment_fee` FLOAT(2) NULL,
  `payment_method` VARCHAR(20) NULL,
  `payment_status` VARCHAR(10) NULL);
  
#Carga de Payments
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/payments.csv" 
INTO TABLE `pj1`.`tb_payments`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

#Criação Table orders
CREATE TABLE `pj1`.`tb_orders` (
  `order_id` INT NULL,
  `store_id` INT NULL,
  `channel_id` INT NULL,
  `order_status` VARCHAR(20) NULL,
  `order_amount` FLOAT(2) NULL,
  `order_delivery_fee` FLOAT(2) NULL,
  `order_delivery_cost` FLOAT(2) NULL,
  `order_created_hour` INT NULL,
  `order_created_minute` INT NULL,
  `order_created_day` INT NULL,
  `order_created_month` INT NULL,
  `order_created_year` INT NULL,
  `order_moment_created` VARCHAR(50) NULL,
  `order_moment_accepted` VARCHAR(50) NULL,
  `order_moment_ready` VARCHAR(50) NULL,
  `order_moment_collected` VARCHAR(50) NULL,
  `order_moment_in_expedition` VARCHAR(50) NULL,
  `order_moment_delivering` VARCHAR(50) NULL,
  `order_moment_delivered` VARCHAR(50) NULL,
  `order_moment_finished` VARCHAR(50) NULL,
  `order_metric_collected_time` VARCHAR(20) NULL,
  `order_metric_paused_time` VARCHAR(20) NULL,
  `order_metric_production_time` VARCHAR(20) NULL,
  `order_metric_walking_time` VARCHAR(20) NULL,
  `order_metric_expediton_speed_time` VARCHAR(20) NULL,
  `order_metric_transit_time` VARCHAR(20) NULL,
  `order_metric_cycle_time` VARCHAR(20) NULL);
  
#Carga de Payments
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/orders.csv" 
INTO TABLE `pj1`.`tb_orders`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

#Criação Table stores
CREATE TABLE `pj1`.`tb_stores` (
  `store_id` INT NULL,
  `hub_id` INT NULL,
  `store_name` VARCHAR(20) NULL,
  `store_segment` VARCHAR(20) NULL,
  `store_plan_price` FLOAT(2) NULL,
  `store_latitude` FLOAT(8) NULL,
  `store_longitude` FLOAT(8) NULL);
  
#Carga de stores
LOAD DATA LOCAL INFILE "C:/Program Files/MySQL/MySQL Server 8.0/Uploads/stores.csv" 
INTO TABLE `pj1`.`tb_stores`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;