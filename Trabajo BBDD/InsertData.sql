------------------------------------------------------
-- Centro      : Cesur Sevilla
-- Descripción : Script de inserción de datos de BBDD Clinica
-- Autor : Fernando Pérez Nieto
-- Autor : Jonatan Carrera Viera
-- Autor : Eva Cardenas Bermudez
-- Autor : Pablo Dominguez Romero
-- Autor : Rafael Felipe Herrera Chavez
------------------------------------------------------
USE Clinica
GO

--Inserts de la tabla Pacientes
INSERT INTO Pacientes (nombre_paciente,apellidos_paciente,dni,genero,fNacimiento,codPost,email_paciente,telefono1_paciente,telefono2_paciente,comentarios_paciente)
VALUES 
('Lewis','Martinez Martin','41174158V','M','2003/12/24','22588','feugiat.sed@google.ca','694278173','635033323',NULL),
('Tanya','Santana Ruiz','30917725U','F','1987/11/03','66358','imperdiet@google.org','635096512','663105897',NULL),
('Madeline','Martin Redondo','84222385W','F','1986/10/31','77229','a.sollicitudin.orci@google.ca','667763684','662017884','Tiene sensibilidad cronica'),
('Risa','Rodriguez Peña','63108761N','F','2011/01/27','37751','in.molestie@aol.edu','611338746','608358529',NULL),
('Steven','Medina Hidalgo','16739767M','M','1965/05/19','74726','mauris.rhoncus.id@protonmail.edu','680539539','614342725',NULL),
('Keaton','Castro Merino','75411828J','M','1954/01/10','73428','elit.curabitur@yahoo.ca','689853646','611542931',NULL),
('Kyra','Sanz Vila','23588311L','F','1947/02/03','76258','curabitur@icloud.org','696206888','612573651',NULL),
('Amy','Santos Leon','28512684Q','F','2000/02/04','52422','eu.arcu@hotmail.edu','625384428','673987475',NULL),
('Adria','Blanco Cano','56375928C','M','1975/06/25','05308','nec.cursus@google.edu','658614357','613940845','Alergico a la anestesia'),
('Brendan','Carrasco Vila','17497384Y','M','1974/08/30','51124','lacinia.sed@icloud.couk','652427431','632443717',NULL),
('Ariana','Santana Pardo','20649798K','F','1969/09/28','38865','habitant@aol.edu','699163353','617578066',NULL),
('Ciaran','Flores Ruiz','11362434Y','F','1974/12/04','51413','pede.cras.vulputate@yahoo.couk','605878856','667276121',NULL),
('Gemma','Calvo Lopez','64186789E','F','1966/11/18','33078','bibendum.fermentum.metus@hotmail.net','692703154','620161635',NULL),
('Debra','Bravo Nieto','57693649M','F','1925/08/14','75457','condimentum@hotmail.edu','655624911','631534767',NULL),
('Abel','Reyes Moreno','40943555L','M','1944/04/20','17254','mus.donec.dignissim@google.org','614041757','684473102','Le huele la nariz'),
('Angelica','Lopez Sanz','14712256S','F','1970/12/01','31768','eleifend.vitae@outlook.ca','650011454','642572436',NULL),
('Kyla','Carmona Rubio','57821238F','F','1986/03/09','56387','et.tristique@yahoo.net','641380566','622350987',NULL),
('Cora','Campos Izquierdo','32351688J','F','2007/01/12','22198','risus.nunc@yahoo.net','604763491','641452247',NULL),
('Leo','Pardo Gonzalez','90812418M','M','1965/08/23','24647','ac.mattis@google.ca','665839640','674824273',NULL),
('Drew','Vazquez Carrasco','81262374U','M','1942/05/23','12376','elit.fermentum@protonmail.net','657552115','656471253',NULL);


--Inserts de la tabla Odontologos
INSERT INTO Odontologos(nombre_profesional, apellidos_profesional, email_profesional, telefono_profesional, comision, idResponsable, fechaLiquidacion)
VALUES
('Alejandro','Tellez Rubio','juan.alejandro.tellez.rubio@everis.nttdata.com','625597934', 20, NULL, getDate()),
('Juan','Del Carmen Sousa','juan.delcarmen.sousa@everis.nttdata.com','633527338', 10, 1, getDate()),
('Alejandro','De la Rosa Cosano','alejandro.delarosacosano.sousa@everis.nttdata.com','632033400', 5, 1, getDate())

--Inserts de la tabla Patologias
INSERT INTO Patologias(nombre_patologias)
VALUES
('Caries'),
('Gingivitis'),
('Periodontitis'),
('Periimplantitis'),
('Alveolitis'),
('Estomatitis'),
('Exóstosis'),
('Placa'),
('Pulpitis'),
('Quiste'),
('Trismo'),
('Xerostomía')

--Inserts de la tabla FormasPago
INSERT INTO FormasPago(nombre_formas_pago)
VALUES
('Tarjeta'),
('Efectivo'),
('Bitcoins')

--Inserts de la tabla Destino
INSERT INTO Destino(nombre_destino)
VALUES
('BBVA'),
('Santander'),
('Caja')

--Inserts de la tabla Familias
INSERT INTO Familias(nombre_familia)
VALUES
('Cirujia'),
('Corona'),
('Empastes'),
('Endodoncia'),
('Extracciones'),
('General Odontología'),
('Implantes'),
('Ortodoncia'),
('Puente')

--Inserts de la tabla Tratamientos
INSERT INTO Tratamientos(codTto, nombre_tratamiento,precio, codFamilia)
VALUES
('INJ', 'INJERTO DE TEJIDO CONECTIVO', 250, 1),
('QP', 'QUITAR PUNTOS', 0, 1),
('CIMP', 'CORONA SOBRE IMPLANTE METAL PROCELANA', 400, 2),
('CIZ', 'CORONA SOBREIMPLANTE DE ZIRCONIO', 450, 2),
('CMP', 'CORONA METAL PORCELANA', 250, 2),
('COC', 'CORONA CIRCONIA', 350, 2),
('COP', 'CORONA PROVISIONAL', 250, 2),
('GRCP', 'GRAN RECONSTRUCCION CON PERNO', 80, 3),
('GREC', 'GRAN RECONSTRUCCION', 60, 3),
('OBT', 'OBTURACION', 40, 3),
('PFV', 'PERNO DE FIBRA DE VIDRIO', 20, 3),
('REC', 'RECONSTRUCCIÓN', 50, 3),
('END1', 'ENDODONCIA 1 CONDUCTO', 100, 4),
('END2', 'ENDODONCIA 2 CONDUCTOS', 120, 4),
('END3', 'ENDODONCIA 3 CONDUCTOS', 150, 4),
('EXCOR', 'EXTRACCION CORDAL SIMPLE', 60, 5),
('EXIN','EXTRACCION DIENTE INCLUIDO',180,5),
('EXOD','EXTRACION CON ODONTOSECCION',75,5),
('EXT','EXTRACCION SIMPLE',40,5),
('ADA','AÑADIR DIENTES ADICCIONALES',20,6),
('ADI','AÑADIR 1 DIENTE',50,6),
('BL','BLANQUEAMIENTO COMPLETO',350,6),
('CPU','CORTAR PUENTE',50,6),
('HG','HIGIENE',45,6),
('PA6+','PARCIAL DE 6 O MAS PIEZAS',400,6),
('PV','PRIMERA VISITA',0,6),
('REB','REBASE',80,6),
('REV','REVISION',0,6),
('VIS','VISITA SIMPLE',30,6),
('IMP','IMPLANTE',600,7),
('ORCB','CEMENTADO BRAKCKET POR ARCADA',250,8),
('ORE','ESTUDIO DE ORTODONCIA',150,8),
('ORRB','RETIRADA BRACKET',300,8),
('RVAP','REVISION APARATO ORTODONCIA',50,8),
('RVBK','REVISION DE ORTODONCIA BRACKET',65,8),
('RVO','REVISION SEGUIMIENTO ORTODONCIA',0,8),
('SD4','SOBREDENTADURA 4 IMPLANTES',3000,9)

--Inserts de la tabla Patologias_Pacientes
INSERT INTO Patologias_Pacientes(idPaciente,idPatologia)
VALUES 
(1,1),
(5,8),
(7,2),
(6,3),
(3,8),
(4,2),
(10,3),
(2,1),
(9,8),
(8,2),
(6,2),
(5,1),
(1,8),
(10,2),
(9,1)

--Inserts de la tabla Visitas
INSERT INTO Visitas(idProfesional,idPaciente,idTratamiento,idFPago,idDestino,fecha_visitas,pagado,restante,comentarios_visitas,finalizado)
VALUES
(1,1,12,1,3,'2022/05/03',50.00,0.00,NULL,1),
(1,1,24,1,3,'2022/05/25',45.00,0.00,NULL,1),
(1,2,15,1,3,'2022/05/04',50.00,100.00,NULL,0),
(1,2,7,1,3,'2022/05/21',150.00,100.00,NULL,0),
(1,3,1,2,1,'2022/05/06',50.00,200.00,NULL,0),
(1,4,37,3,2,'2022/05/11',500.00,2500.00,NULL,0),
(1,5,21,2,1,'2022/05/11',50.00,0.00,NULL,1),
(1,6,34,2,1,'2022/05/18',50.00,0.00,NULL,1),
(1,7,10,2,1,'2022/05/20',40.00,0.00,NULL,1),
(1,5,30,2,1,'2022/05/28',300.00,300.00,NULL,0),
(2,8,4,2,2,'2022/05/27',300,150,NULL,0),
(2,8,4,2,2,'2022/05/31',150,0,'Tiene miedo a las agujas',1),
(2,9,12,1,1,'2022/07/10',50,0,NULL,1),
(2,10,21,2,2,'2022/03/15',50,0,'Alergico al paracetamol',1),
(2,11,25,2,2,'2022/02/01',200,200,NULL,0),
(2,12,25,1,1,'2022/02/18',200,0,'Alergico a los antibioticos',1),
(2,13,37,2,2,'2022/02/01',500,1500,'El paciente hay que tener cuidado porque es sensible en la zona de la mandibula superior',0),
(2,13,37,2,2,'2022/02/28',500,1000,NULL,0),
(2,13,37,1,1,'2022/03/15',500,500,NULL,0),
(2,13,37,1,1,'2022/03/30',500,0,NULL,1),
(1,1,12,1,3,'2022/05/03',50.00,0.00,'Reconstruccion 11,12,21,22,42',1),
(1,1,24,1,3,'2022/05/25',45.00,0,NULL,1),
(1,2,15,1,3,'2022/05/04',50.00,100.00,'Extraccion maxilar inferior izquierdo 38',1),
(1,2,7,1,3,'2022/05/21',100.00,150.00,'Corona en pieza 46',1),
(1,3,1,2,1,'2022/05/06',50.00,200.00,NULL,0),
(1,4,37,3,2,'2022/05/11',50.00,2950.00,'Ausencia de piezas 11,12,22,23,24,25,26,13,14,15,42,42,31,32,33',0),
(3,5,21,2,1,'2022/05/11',50.00,0.00,'Maxilar inferior derecho 46',1),
(1,6,34,2,1,'2022/05/18',25.00,25.00,NULL,1),
(3,7,10,2,1,'2022/05/20',40.00,0.00,NULL,1),
(2,7,12,2,1,'2022/05/22',50.00,0.00,'Reconstruccion maxilar superior 11,12',1),
(3,8,20,3,2,'2022/06/30',20.00,0.00,NULL,1),
(2,8,18,2,1,'2022/05/10',25.00,50.00,NULL,0),
(1,9,29,2,1,'2022/05/06',30.00,0.00,NULL,1),
(3,9,30,2,1,'2022/05/08',30.00,570.00,NULL,0),
(1,9,32,1,3,'2022/05/18',50.00,100.00,NULL,1),
(1,10,26,2,1,'2022/05/20',0.00,40.00,NULL,1),
(2,10,37,1,3,'2022/05/22',30.00,2970.00,'Ausencia de piezas 16,17,36,37,46,47,28,38,48',0),
(1,7,22,2,1,'2022/05/14',50.00,300.00,NULL,1)