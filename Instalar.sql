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

INSERT INTO libros (`titulo`, `autor`, `urlimagen`, `editorial`, `descripcion`, `ISBN`, `precio`) VALUES
    ('Últimos días de mis padres','Mónica Lavín','https://www.gandhi.com.mx/media/catalog/product/9/7/9786070787300_4c53.jpg','Planeta México','Cuando el padre de la narradora muere, lejos está de imaginar que tan solo un año después tendría que enfrentar también la pérdida de su madre. A partir de este golpe tan doloroso como real, los recuerdos y las emociones irán tejiendo un texto donde la fuerza de la sinceridad da paso a una prosa íntima y poderosa, que indaga sobre la orfandad y la necesidad de reconstruir el origen: quiénes fueron los padres, los distintos exilios por los que pasaron para encontrarse en la Ciudad de México, las penurias que marcaron sus infancias, las vacaciones familiares, la separación y el rencuentro final.   Mónica Lavín nos ofrece su obra más personal y emotiva, reafirmándose como una de las escritoras más talentosas de su generación. Frente a la pena de la ausencia, en Últimos días de mis padres queda el recuerdo de lo vivido, el aprendizaje de un camino recorrido y, por último, la literatura como una forma de celebrar la vida.',9786070787300,268.00),
    ('La estafa maestra: La historia del desfalco','Manuel Ureste Cava','https://www.gandhi.com.mx/media/catalog/product/9/7/9786070787126_b19c.jpg','Planeta México','La mañana del 13 de agosto de 2019, la historia política modernade México cambió. Por primera vez en nuestro país, una secretaria de Estado era encarcelada a raíz de una investigación periodística. Rosario Robles ingresó al penal de Santa Martha Acatitlaacusada de ejercicio indebido de la función pública y, hasta lafecha, sigue presa. La Estafa Maestra —Premio Nacional de Periodismo 2017 y Premio Ortega y Gasset 2018— develó el multimillonario desfalco de dinero público bajo un esquema de corrupción que involucraba a miembros del gabinete del expresidente Peña Nieto, universidades públicas y empresas fantasma. De todos los altos mandos involucrados solo Robles, exsecretaria de la Sedesol y de la Sedatu y una vieja adversaria del presidente López Obrador, ha sido encarcelada y paga un castigo que asoma oscuros motivos políticos. A partir de entrevistas inéditas, un minucioso seguimiento de la investigación a tres años de la publicación original y una implacable cobertura de los juicios, los periodistas Nayeli Roldán y Manuel Ureste relatan, a manera de thriller político, la historia detrás de La Estafa Maestra y dan a conocer a los orquestadores de uno de los peores desfalcos que México ha conocido y cuya maquinaria continúa intacta para seguir operando.',9786070787126,268.00),
    ('Contemporary Japanese Architecture','Philip Jodidio','https://www.gandhi.com.mx/media/catalog/product/9/7/9783836575119_7f0d.jpg','TASCHEN','Un estudio de la escena arquitectónica contemporánea de JapónLa arquitectura japonesa contemporánea ha sido durante mucho tiempo una de las más imaginativas del mundo, y es famosa por sus diseños sostenibles y su infinita creatividad. Nada menos que siete arquitectos japoneses han ganado el premio Pritzker.Desde que la Exposición Universal de Osaka de 1970 cedió el protagonismo a las formas contemporáneas, Japón ha sido uno de los actores clave de la arquitectura global. Con un vocabulario limitado intencionalmente a formas geométricas, Tadao Ando puso la arquitectura japonesa en el mapa cultural del mundo y estableció un puente entre Oriente y Occidente. Siguiendo la estela de los edificios de Ando, en su mayoría de hormigón, figuras como Kengo Kuma (Estadio Nacional de Japón, destinado a albergar los Juegos Olímpicos que debían haberse celebrado en 2020), Shigeru Ban (Centro de Patrimonio Mundial Monte Fuji) y Kazuyo Sejima (Museo de Arte Contemporáneo del Siglo XXI de Kanazawa) se convirtieron en pioneros de un enfoque más sostenible.',9783836575119,1649.00),
    ('El infinito en un junco','Irene Vallejo','https://www.gandhi.com.mx/media/catalog/product/9/7/9786073804332_695a.jpg','Debolsillo','En esta obra exquisita sobre los orígenes del libro, Irene Vallejo recorre la historia del asombroso artefacto que nació hace cinco milenios, cuando los egipcios descubrieron el potencial de un junco al que llamaron papiro. Con gran sensibilidad y soltura narrativa, la autora se remonta a los campos de batalla de Alejandro, los palacios de Cleopatra, las primeras librerías y los talleres de copia manuscrita, pero también visita las hogueras donde ardieron códices prohibidos, la biblioteca de Sarajevo y el laberinto subterráneo de Oxford en el año 2000. Los tiempos se funden en la aventura colectiva de quienes solo han concebido la vida en compañía de la palabra escrita. Y este ensayo acaba prolongando el diálogo infinito del que tan magistralmente nos habla. Un relato poético y preciso de cuando los libros eran jóvenes y todo sucedía por primera vez.',9786073804332,399.00),
    ('Los juegos del hambre: En llamas','Suzanne Collins','https://www.gandhi.com.mx/media/catalog/product/9/7/9786073807852_ddec.jpg','Molino','El mundo estará observando.Katniss Everdeen sobrevivió a Los Juegos del Hambre, pero el Capitolio quiere venganza.Contra todo pronóstico, Katniss Everdeen y Peeta Mellark siguen vivos.',9786073807852,359.00),
    ('Los juegos del hambre: Sinsajo','Suzanne Collins','https://www.gandhi.com.mx/media/catalog/product/9/7/9786073807869_9037.jpg','Molino','El mundo estará observando.«SI NOSOTROS ARDEMOS, TÚ ARDERÁS CON NOSOTROS».Katniss Everdeen sobrevivió dos veces a los Juegos del Hambre, pero no está a salvo. ',9786073807869,369.00),
    ('La segunda guerra mundial (1939-1945)','Martin Gilbert','https://www.gandhi.com.mx/media/catalog/product/t/m/tmp9788490601648_a685.jpg','La esfera de los libros','Por primera vez en un solo volumen los dos tomos sobre la Segunda Guerra Mundial de Martin Gilbert. La Segunda Guerra Mundial fue el conflicto bélico más destructivo de la historia.',9788490601648,852.00),
    ('El hombre sin rostro','Masha Gessen','https://www.gandhi.com.mx/media/catalog/product/9/7/9786073815161_10e2.jpg','Debate','La fascinante historia de cómo Vladímir Putin, un agente mediocre del KGB, llegó a la presidencia de Rusia, deshizo años de avances y convirtió a su país de nuevo en una amenaza para sus ciudadanos. ',9786073815161,299.00),
    ('El ojo del mundo','Robert Jordan','https://www.gandhi.com.mx/media/catalog/product/9/7/9788445007006_4bdf.jpg','Minotauro México','La vida de Rand Al’Thor y sus amigos en Campo de Emond ha resultado bastante monótona hasta que una joven misteriosa llega al pueblo. Moraine, una maga capaz de encauzar el Poder Único, anuncia el despertar de una terrible amenaza. Esa misma noche, el pueblo se ve atacado por espantosos trollocs sedientos de sangre, unas bestias semihumanas que hastaentonces se habían considerado una leyenda. Mientras Campo de Emond soporta la ofensiva, Moraine y su guardián ayudan a Rand y a sus amigos a escapar.',9788445007006,498.00),
    ('Las intermitencias de la muerte','José Saramago','https://www.gandhi.com.mx/media/catalog/product/9/7/9789707703254_9cae.jpg','Alfaguara','En un país cuyo nombre no será mencionado, se produce algo nunca visto desde el principio del mundo: la muerte decide suspender su trabajo letal, la gente deja de morir. La euforia colectiva se desata, pero muy pronto dará paso a la desesperación yal caos. Sobran los motivos. Si es cierto que las personas ya no mueren, eso no significa que el tiempo haya parado. El destino de los humanos será una vejez eterna.En un país cuyo nombre no será mencionado, se produce algo nunca visto desde elprincipio del mundo: la muerte decide suspender su trabajo letal, la gente deja de morir. La euforia colectiva se desata, pero muy pronto dará paso a la desesperación y al caos. Sobran los motivos. Si es cierto que las personas ya no mueren, eso no significa que el tiempo haya parado. El destino de los humanos será una vejez eterna.',9789707703254,298.00),
    ('La gran cacería','Robert Jordan','https://www.gandhi.com.mx/media/catalog/product/9/7/9788445007013_66de.jpg','Minotauro México','¡Rand ha sobrevivido a su primer enfrentamiento con los perversos seguidores del Oscuro, pero ni sus amigos ni él están a salvo, ya que el señor del mal ha liberado a los Renegados, mientras los héroes de todas las eras se levantan de la tumba cuando el Cuerno de Valere los saca de su sueño. Al verse obligado a enfrentarse alas fuerzas de la oscuridad, Rand decide escapar de su destino.Pero la profecía tiene que cumplirse. Por su calidad literaria, su ambicioso planteamiento y su descomunal historia, La Rueda del Tiempo es la saga de fantasía más importante de los últimos treinta años. El lector que inicie el camino junto a Egwene al Vere, Nynaeve al Meara, Moraine, Rand, Mat y Perrin no podrá abandonar el viaje hasta su incierto y sorprendente final.',9788445007013,458.00),
    ('La rebelión de los colgados','Bruno Traven Traven','https://www.gandhi.com.mx/media/catalog/product/9/7/9786074532210.jpg','Selector','La rebelión de los colgados, forma junto con Gobierno, La Carreta, Marcha al imperio de la caoba, Monterías y El general, el ciclo de la caoba. Estas novelas, independientes entre sí, narran el drama de los indios del México tropical a principios del siglo XX. La rebelión de los colgados es la intensa historia del levantamiento de los peones oprimidos y de su lucha por alcanzar la libertad e independencia.',9786074532210,150.00);
  
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (1,10);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (2,11);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (3,12);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (4,13);
INSERT INTO inventario (`libros_idlibros`, `cantidad`) VALUES (5,14);