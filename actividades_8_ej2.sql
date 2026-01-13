use empresa2_dam;

select *
from centro;

/*a) Muestra por cada centro de trabajo, su nombre y dirección, así como el número de
departamentos en que se divide y el presupuesto máximo y mínimo de sus departamentos.*/
select c.nomcen 'NomCentro', c.dircen 'DirCentro', count(d.nomdep)'CantidadDepartamentos', max(d.preanu), min(preanu)
from centro c join departamento d on c.codcen=d.codcen
group by c.nomcen;

select count(d.nomdep)'CantidadDepartamentos'
from centro c join departamento d on c.codcen=d.codcen
group by c.nomcen;

select *
from centro c join departamento d on c.codcen=d.codcen;



/*b) Muestra por cada habilidad su código y descripción, el número de empleados que la poseen y
el nivel medio de dicha habilidad redondeado a un decimal.*/

/*c) Muestra por cada departamento su nombre, presupuesto, el nombre del departamento del que
depende y el presupuesto de este. Asigna alias a todos los atributos*/