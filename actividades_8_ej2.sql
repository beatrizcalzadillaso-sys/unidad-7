use empresa2_dam;

select *
from centro;

/*a) Muestra por cada centro de trabajo, su nombre y dirección, así como el número de
departamentos en que se divide y el presupuesto máximo y mínimo de sus departamentos.*/

select count(d.nomdep)'CantidadDepartamentos', c.nomcen 'NomCentro', c.dircen 'DirCentro', max(d.preanu) 'Presupesto max', min(preanu) 'Presupuesto minimo'
from centro c join departamento d on c.codcen=d.codcen
group by c.nomcen, c.dircen; /*hubo que agrupar por c.dircen tambien para que saliera la consulta*/

select *
from centro c join departamento d on c.codcen=d.codcen;



/*b) Muestra por cada habilidad su código y descripción, el número de empleados que la poseen y
el nivel medio de dicha habilidad redondeado a un decimal.*/

select *
from habilidad H join habemp HE on H.codhab=HE.codhab;

select count(h.codhab) 'CantEmpconHab', h.codhab 'CodHab', h.deshab 'DescHab', round(avg(he.nivhab),2) 'PromedioHab'
from habilidad H join habemp HE on H.codhab=HE.codhab
group by h.codhab;



/*c) Muestra por cada departamento su nombre, presupuesto, el nombre del departamento del que
depende y el presupuesto de este. Asigna alias a todos los atributos*/

select nomdep, preanu, coddepdep
from departamento;

select D.nomdep'NombreDep', D.preanu'PresupuestoAnual', DP.Nomdep 'DepDelQueDepende', DP.preanu 'PreAnu_del_DepDelQueDepende' 
from departamento D join departamento DP on D.coddepdep = DP.coddep;
