use empresa_dam;

select *
from empleado;

select *
from departamento;



/*a) Indica por cada puesto que sea desempeñado por más de dos empleados, el nombre del puesto,
el número de empleados que lo desempeñan, la suma de sus salarios, la suma de sus
comisiones, el salario máximo y el salario mínimo. Asigna alias a todos los datos que se
muestran excepto al puesto. Ordena el resultado por suma salarial en orden descendente.*/

select puesto, count(puesto) 'CantEmp', sum(salario) 'SumSalario', sum(comision) 'SumComision',max(salario) 'MaxSalario', min(salario) 'MinSalario'
from empleado
group by puesto
having count(puesto)>2
order by sumsalario desc;

/*b) Indica por cada número de departamento y puesto, el número de empleados que desempeñan
ese puesto en ese departamento, así como su salario mínimo y máximo. Ordena el resultado
por número de departamento y puesto.*/
select numdep, puesto, count(puesto) 'CantEmp', max(salario) 'MaxSalario', min(salario) 'MinSalario'
from departamento natural join empleado
group by numdep, puesto
order by numdep, puesto;

/*c) Solo consideraremos a los empleados no directores. Pues bien, indica por cada departamento
con un salario medio de sus empleados no directores superior a 1200 €, el número del
departamento, el número de empleados no directores que tiene y su salario medio (redondeado
a dos decimales), ordenando el resultado por el número de empleados de cada departamento.*/
select numdep, puesto, salario  
from departamento natural join empleado
where puesto not like 'director';
/*group by numdep;*/

select numdep,count(*) 'CantEmp', round (avg(salario), 2) 'SalarioMedio'
from departamento natural join empleado
where puesto not like 'director'
group by numdep
having SalarioMedio>1200
order by CantEmp;


/*d) Indica para los departamentos con salario medio superior a 1800 €, su número, nombre, el
salario medio de sus empleados y el salario máximo y mínimo.*/
select numdep, nomdep ,round (avg(salario), 2) 'salarioMedio', max(salario), min(salario)
from empleado natural join departamento
group by numdep
having salarioMedio>1800;



/*e) Visualiza el número de vendedores del departamento llamado Ventas.*/
select numemp, puesto, nomdep
from departamento natural join empleado
where nomdep like 'ventas' and puesto like 'vendedor';

/*f) Indica para todos los empleados que trabajan en el departamento de ventas su nombre, salario,
comisión, el nombre de su jefe (columna Jefe), el salario de este (columna Salario jefe) y el
resultado de dividir el salario del jefe entre el del empleado (columna Factor multiplicador)
redondeado a dos decimales.*/

select numdep
from  departamento
where nomdep like 'ventas';

select e.nomemp, e.salario, e.comision, ej.nomemp 'Jefe', ej.salario 'Salario Jefe', round(ej.salario/e.salario,2) 'Factor Multiplicador' 
from  empleado e inner join empleado ej on e.numempjefe=ej.numemp
where e.numdep = (select numdep
	from  departamento
	where nomdep like 'ventas');


/*g) Indica para todos los empleados que tengan dos o más empleados subordinados, su nombre,
salario, número de subordinados que tiene y el nombre del departamento en el que trabaja.
Ordena el resultado por número de subordinados de mayor a menor.*/



select EJ.nomemp, EJ.salario ,count(E.numempjefe) 'CantidadSubordinados', d.nomdep
from empleado E join empleado EJ on E.numempjefe=EJ.numemp join departamento d on ej.numdep=d.numdep
group by E.numempjefe
having CantidadSubordinados>=2;






