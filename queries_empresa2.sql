use empresa2_dam;

/*a) Muestra por cada empleado su código, nombre, salario y el nombre del departamento en el que
trabaja.*/

select codemp, nomemp, salemp, nomdep
from empleado natural join departamento
