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
select numdep, puesto, count(puesto) 'CantEmp', avg(salario) 'SalarioMedio'
from departamento natural join empleado
where puesto in ('empleado', 'gerente', 'vendedor') 
group by numdep
having salariomedio>1200;







