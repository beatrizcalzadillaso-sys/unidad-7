use empresa2_dam;

/*a) Muestra por cada empleado su código, nombre, salario y el nombre del departamento en el que
trabaja.*/
select codemp, nomemp, salemp, nomdep
from empleado natural join departamento;

/*b) Muestra por cada departamento su código, nombre y el nombre del empleado que lo dirige.*/
select coddep, nomdep,tidir
from departamento;

/*c) Muestra por cada empleado su nombre y por cada una de las habilidades que posee, el código de
la habilidad, la descripción de la habilidad y el nivel correspondiente.*/
select nomemp, h.codhab, h.deshab, he.nivhab
from empleado e join habemp he on e.codemp=he.codemp join habilidad h on he.codhab=h.codhab;


