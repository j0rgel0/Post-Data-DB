-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema postdata
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema postdata
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `postdata` DEFAULT CHARACTER SET utf8 ;
USE `postdata` ;

-- -----------------------------------------------------
-- Table `postdata`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postdata`.`libros` (
  `idlibros` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `editorial` VARCHAR(100) NOT NULL,
  `ISBN` VARCHAR(13) NOT NULL,
  `descripcion` MEDIUMTEXT NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `urlimagen` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idlibros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postdata`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postdata`.`inventario` (
  `idinventario` INT NOT NULL AUTO_INCREMENT,
  `libros_idlibros` INT NOT NULL,
  `cantidad` INT(5) NOT NULL,
  PRIMARY KEY (`idinventario`, `libros_idlibros`),
  INDEX `fk_inventario_libros_idx` (`libros_idlibros` ASC) VISIBLE,
  CONSTRAINT `fk_inventario_libros`
    FOREIGN KEY (`libros_idlibros`)
    REFERENCES `postdata`.`libros` (`idlibros`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postdata`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postdata`.`roles` (
  `idroles` INT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idroles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postdata`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postdata`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `roles_idroles` INT NOT NULL,
  PRIMARY KEY (`idusuarios`, `roles_idroles`),
  INDEX `fk_usuarios_roles1_idx` (`roles_idroles` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_roles1`
    FOREIGN KEY (`roles_idroles`)
    REFERENCES `postdata`.`roles` (`idroles`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO roles (`rol`) VALUES ('admin');
INSERT INTO roles (`rol`) VALUES ('almacenista');
INSERT INTO roles (`rol`) VALUES ('proveedores');
INSERT INTO roles (`rol`) VALUES ('colaborador');
INSERT INTO roles (`rol`) VALUES ('usuario');

INSERT INTO usuarios (`nombre`, `email`, `contrasena`, `roles_idroles`) VALUES ('Jorge López Valdez','jorge.lopezvz@udlap.mx','A.abc.123',1);
INSERT INTO usuarios (`nombre`, `email`, `contrasena`, `roles_idroles`) VALUES ('Alma','alma@gmail.com','A.abc.123',2);
INSERT INTO usuarios (`nombre`, `email`, `contrasena`, `roles_idroles`) VALUES ('Eric','eric@gmail.com','A.abc.123',3);
INSERT INTO usuarios (`nombre`, `email`, `contrasena`, `roles_idroles`) VALUES ('Abraham','abraham@gmail.com','A.abc.123',4);
INSERT INTO usuarios (`nombre`, `email`, `contrasena`, `roles_idroles`) VALUES ('Cristobal','cristobal@gmail.com','A.abc.123',5);

INSERT INTO libros (`titulo`, `autor`, `editorial`, `ISBN`, `descripcion`, `precio`, `urlimagen`) VALUES ('Últimos días de mis padres','Mónica Lavín','Planeta México',9786070787300,'Cuando el padre de la narradora muere, lejos está de imaginar que tan solo un año después tendría que enfrentar también la pérdida de su madre. A partir de este golpe tan doloroso como real, los recuerdos y las emociones irán tejiendo un texto donde la fuerza de la sinceridad da paso a una prosa íntima y poderosa, que indaga sobre la orfandad y la necesidad de reconstruir el origen: quiénes fueron los padres, los distintos exilios por los que pasaron para encontrarse en la Ciudad de México, las penurias que marcaron sus infancias, las vacaciones familiares, la separación y el rencuentro final.   Mónica Lavín nos ofrece su obra más personal y emotiva, reafirmándose como una de las escritoras más talentosas de su generación. Frente a la pena de la ausencia, en Últimos días de mis padres queda el recuerdo de lo vivido, el aprendizaje de un camino recorrido y, por último, la literatura como una forma de celebrar la vida.',268.00,'https://www.gandhi.com.mx/media/catalog/product/9/7/9786070787300_4c53.jpg');
INSERT INTO libros (`titulo`, `autor`, `editorial`, `ISBN`, `descripcion`, `precio`, `urlimagen`) VALUES ('La estafa maestra: La historia del desfalco','Manuel Ureste Cava','Planeta México',9786070787126,'Cuando el padre de la narradora muere, lejos está de imaginar que tan solo un año después tendría que enfrentar también la pérdida de su madre. A partir de este golpe tan doloroso como real, los recuerdos y las emociones irán tejiendo un texto donde la fuerza de la sinceridad da paso a una prosa íntima y poderosa, que indaga sobre la orfandad y la necesidad de reconstruir el origen: quiénes fueron los padres, los distintos exilios por los que pasaron para encontrarse en la Ciudad de México, las penurias que marcaron sus infancias, las vacaciones familiares, la separación y el rencuentro final.   Mónica Lavín nos ofrece su obra más personal y emotiva, reafirmándose como una de las escritoras más talentosas de su generación. Frente a la pena de la ausencia, en Últimos días de mis padres queda el recuerdo de lo vivido, el aprendizaje de un camino recorrido y, por último, la literatura como una forma de celebrar la vida.',268.00,'https://www.gandhi.com.mx/media/catalog/product/9/7/9786070787126_b19c.jpg');
INSERT INTO libros (`titulo`, `autor`, `editorial`, `ISBN`, `descripcion`, `precio`, `urlimagen`) VALUES ('Contemporary Japanese Architecture','Philip Jodidio','TASCHEN',9786070787126,'La mañana del 13 de agosto de 2019, la historia política modernade México cambió. Por primera vez en nuestro país, una secretaria de Estado era encarcelada a raíz de una investigación periodística. Rosario Robles ingresó al penal de Santa Martha Acatitlaacusada de ejercicio indebido de la función pública y, hasta lafecha, sigue presa. La Estafa Maestra —Premio Nacional de Periodismo 2017 y Premio Ortega y Gasset 2018— develó el multimillonario desfalco de dinero público bajo un esquema de corrupción que involucraba a miembros del gabinete del expresidente Peña Nieto, universidades públicas y empresas fantasma. De todos los altos mandos involucrados solo Robles, exsecretaria de la Sedesol y de la Sedatu y una vieja adversaria del presidente López Obrador, ha sido encarcelada y paga un castigo que asoma oscuros motivos políticos. A partir de entrevistas inéditas, un minucioso seguimiento de la investigación a tres años de la publicación original y una implacable cobertura de los juicios, los periodistas Nayeli Roldán y Manuel Ureste relatan, a manera de thriller político, la historia detrás de La Estafa Maestra y dan a conocer a los orquestadores de uno de los peores desfalcos que México ha conocido y cuya maquinaria continúa intacta para seguir operando.',268.00,'https://www.gandhi.com.mx/media/catalog/product/9/7/9786070787126_b19c.jpg');
INSERT INTO libros (`titulo`, `autor`, `editorial`, `ISBN`, `descripcion`, `precio`, `urlimagen`) VALUES ('El infinito en un junco','Irene Vallejo','Debolsillo',9786073804332,'La historia de los libros, el alfabeto, las bibliotecas... contada/bb/b bcon erudición y amenidad,/bb/b bsentido del humor y elegancia,/bb/b bhaciendo paralelismos con el presente./b/p pbLaura Freixas/b/ppEn esta obra exquisita sobre los orígenes del libro, Irene Vallejo recorre la historia del asombroso artefacto que nació hace cinco milenios, cuando los egipcios descubrieron el potencial de un junco al que llamaron papiro. Con gran sensibilidad y soltura narrativa, la autora se remonta a los campos de batalla de Alejandro, los palacios de Cleopatra, las primeras librerías y los talleres de copia manuscrita, pero también visita las hogueras donde ardieron códices prohibidos, la biblioteca de Sarajevo y el laberinto subterráneo de Oxford en el año 2000. Los tiempos se funden en la aventura colectiva de quienes solo han concebido la vida en compañía de la palabra escrita. Y este ensayo acaba prolongando el diálogo infinito del que tan magistralmente nos habla./ppUn relato poético y preciso de cuando los libros eran jóvenes y todo sucedía por primera vez. bHéctor Abad Faciolince/b/ppiEl infinito en un junco/i nos permite volver a tener esperanza en nosotros mismos y en nuestra imaginación. La gran empresa del libro es una de nuestras grandes conquistas como especie.',399.00,'https://www.gandhi.com.mx/media/catalog/product/9/7/9786073804332_695a.jpg');
INSERT INTO libros (`titulo`, `autor`, `editorial`, `ISBN`, `descripcion`, `precio`, `urlimagen`) VALUES ('Los juegos del hambre: En llamas','Suzanne Collins','Molino',9786073807852,'El mundo estará observando.Katniss Everdeen sobrevivió a Los Juegos del Hambre, pero el Capitolio quiere venganza.Contra todo pronóstico, Katniss Everdeen y Peeta Mellark siguen vivos.',359.00,'https://www.gandhi.com.mx/media/catalog/product/9/7/9786073807852_ddec.jpg');

INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (1,10);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (2,11);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (3,12);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (4,13);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (5,14);