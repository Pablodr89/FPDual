------------------------------------------------------
-- Centro      : Cesur Sevilla
-- Descripcion : Script de consultas y metodos de BBDD Clinica
-- Autor : Fernando Perez Nieto
-- Autor : Jonatan Carrera Viera
-- Autor : Eva Cardenas Bermudez
-- Autor : Pablo Dominguez Romer0
-- Autor : Rafael Felipe Herrera Chavez
------------------------------------------------------

USE Clinica
GO

--Consultas:

--1. Media de los precios de los tratamientos (avg)

SELECT AVG(precio) AS Media_Precios FROM Tratamientos

--2. Cuál es la máxima comision de los odontologos (max)

SELECT MAX(comision) AS Comision_mas_alta FROM Odontologos

--3. Cuantos pacientes tienen con codigo postal 41089 (count)

SELECT COUNT(idPaciente) AS Numero_Pacientes FROM Pacientes WHERE codPost='22198'

--4. Patologias que terminen en 'itis'(like)

SELECT nombre_patologias FROM Patologias WHERE nombre_patologias LIKE '%itis'

--5. Visitas con comentarios (not)

SELECT * FROM Visitas WHERE comentarios_visitas IS NOT NULL

--6. Cuantos pacientes trata un odontologo (group by)

SELECT o.nombre_profesional, o.apellidos_profesional ,COUNT(DISTINCT v.idPaciente) AS CantidadPacientes FROM Odontologos o
INNER JOIN Visitas v ON o.idProfesional=v.idProfesional
GROUP BY o.idProfesional, o.nombre_profesional, o.apellidos_profesional

--7. Cuantos pacientes han sido tratados el 5 de mayo (group by)

SELECT COUNT(DISTINCT idPaciente) AS NumeroPacientes FROM Visitas v
WHERE fecha_visitas='2022-05-11'

--8. Cuales son los pacientes que han pagado mas de 200 € (having)
SELECT p.nombre_paciente, p.apellidos_paciente, SUM(v.pagado) AS TotalPagado FROM Visitas v
INNER JOIN Pacientes p ON v.idPaciente=p.idPaciente
GROUP BY v.idPaciente, p.nombre_paciente, p.apellidos_paciente
HAVING SUM(pagado)>200

--9. Cuanto dinero ha ganado los becarios en el mes de mayo (inner join)

SELECT o.nombre_profesional, o.apellidos_profesional, SUM(v.pagado)/o.comision FROM Odontologos o
INNER JOIN Visitas v ON o.idProfesional=v.idProfesional
WHERE o.idResponsable IS NOT NULL AND v.fecha_visitas LIKE '2022-05%'
GROUP BY o.idProfesional, o.nombre_profesional, o.apellidos_profesional, o.comision

--10. Qué tratamientos no se han hecho (left join)

SELECT t.nombre_tratamiento, t.idTratamiento FROM Tratamientos t
LEFT JOIN Visitas v ON t.idTratamiento=v.idTratamiento
WHERE v.idTratamiento IS NULL

--11. Qué tratamientos se han hecho a pacientes con caries y pulpitis (inner join)

SELECT t.nombre_tratamiento ,t.idTratamiento, COUNT(v.idTratamiento) AS CantidadTratamientos FROM Tratamientos t
INNER JOIN Visitas v ON t.idTratamiento=v.idTratamiento
INNER JOIN Patologias_Pacientes pp ON v.idPaciente=pp.idpaciente
INNER JOIN Patologias p ON pp.idPatologia=p.idPatologia
WHERE p.nombre_patologias LIKE 'Caries' OR p.nombre_patologias LIKE 'Pulpitis'
GROUP BY t.idTratamiento, t.nombre_tratamiento

--Funciones o procedures:

--1. Un intervalo de fechas que diga donde va el dinero (function)

GO

CREATE OR ALTER FUNCTION dbo.consultarMovimientos (@fechaInicio DATE, @fechaFin DATE)
RETURNS TABLE
AS
RETURN 
(
	SELECT SUM(v.pagado) AS Total, fp.nombre_formas_pago, d.nombre_destino FROM Visitas v
	INNER JOIN FormasPago fp ON fp.idFCobro=v.idFPago
	INNER JOIN Destino d ON d.idDestino=v.idDestino
	GROUP BY fp.nombre_formas_pago, d.nombre_destino
)

GO

SELECT * FROM consultarMovimientos('2022/05/01','2022/05/31')


--2. Mandando como parametro el idpaciente, dime las patologias que tiene (function)
GO

CREATE OR ALTER FUNCTION dbo.consultarHistorial(@idPaciente INT)
RETURNS TABLE
AS
RETURN 
(
    SELECT P.apellidos_paciente, P.nombre_paciente, PT.nombre_patologias from Pacientes P
	INNER JOIN Patologias_Pacientes PP ON PP.idPaciente=P.idPaciente
	INNER JOIN Patologias PT ON PT.idPatologia=PP.idPatologia
	WHERE P.idPaciente=@idPaciente
)

GO

SELECT * FROM dbo.consultarHistorial(6)


--3. Debido a que una clínica ha abierto cerca nuestra, debemos bajar los precios de los tratamientos de más de 300€ en 50€ y los que valgan mas de 1000€ en 300€ (procedure con cursor, if-else y while)

GO

CREATE OR ALTER PROCEDURE competencia
AS BEGIN

    DECLARE @tramo1 AS DECIMAL(7,2)=300.00, @tramo2 AS DECIMAL(7,2)=1000.00, @max AS INT, @descMenor AS DECIMAL(7,2) = 50.00, @descMayor 
    AS DECIMAL (7,2) = 300.00, @punt AS INT=1

    SELECT @max=COUNT(idTratamiento) FROM Tratamientos

    WHILE @punt<>(@max+1)
    
    IF (SELECT precio FROM Tratamientos WHERE idTratamiento=@punt)<@tramo1
        BEGIN
        SET @punt+=1
        END
    ELSE IF (SELECT precio FROM Tratamientos WHERE idTratamiento=@punt)<@tramo2
        BEGIN
        UPDATE Tratamientos SET precio-=@descMenor
        WHERE idTratamiento=@punt
        SET @punt+=1
        END
	ELSE
		BEGIN
        UPDATE Tratamientos SET precio-=@descMayor
        WHERE idTratamiento=@punt
        SET @punt+=1
        END

END

EXEC competencia

SELECT * FROM Tratamientos


--4&5. Actualizar los precios con un % (en este caso un 5%) por encarecimiento de las materias primas (function + procedure anidados)

GO

CREATE OR ALTER FUNCTION dbo.porcentaje(@cantidad AS DECIMAL(5,2))
RETURNS DECIMAL(5,2)
AS 
BEGIN
RETURN (1.00+(@cantidad/100))
END

GO

CREATE OR ALTER PROCEDURE actualizarPrecios
AS 
BEGIN
	DECLARE @porcetanjeAIncrementar AS DECIMAL(5,2) = 5.00
	UPDATE Tratamientos SET precio /= (dbo.porcentaje(@porcetanjeAIncrementar))
END

EXEC actualizarPrecios