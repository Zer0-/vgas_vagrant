CREATE DATABASE vidya;
CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';
GRANT ALL PRIVILEGES ON `vidya` . * TO 'vagrant'@'localhost';
FLUSH PRIVILEGES;
