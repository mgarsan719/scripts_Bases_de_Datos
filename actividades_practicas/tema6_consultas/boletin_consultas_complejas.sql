use banco;
-- 1. Mostrar el saldo medio de todas las cuentas de la entidad bancaria.
describe cuenta;
select avg(saldo) as media_saldo 
from cuenta;

-- 2. Mostrar la suma de los saldos de todas las cuentas bancarias.
select sum(saldo) as suma_saldo 
from cuenta;

-- 3. Mostrar el saldo mínimo, máximo y medio de todas las cuentas bancarias.
select min(saldo) as saldo_minimo, max(saldo) as saldo_maximo, avg(saldo) as saldo_medio 
from cuenta;

-- 4. Mostrar la suma de los saldos y el saldo medio de las cuentas bancarias agrupadas
-- por su código de sucursal.
select sum(saldo) as suma_saldos, avg(saldo) as media_saldos, cod_sucursal 
from cuenta
group by cod_sucursal;

-- 5. Para cada cliente del banco se desea conocer su código, la cantidad total que tiene
-- depositada en la entidad y el número de cuentas abiertas.
select cod_cliente, sum(saldo) as saldo_total, count(cod_cuenta) as cuentas_totales 
from cuenta 
group by cod_cliente;

-- 6. Retocar la consulta anterior para que aparezca el nombre y apellidos de cada cliente
-- en vez de su código de cliente.
select * from movimiento;
describe cliente;
select concat_ws(' ', cliente.nombre, cliente.apellidos) as nombre_completo_cliente, sum(saldo) as saldo_total, count(cod_cuenta) as cuentas_totales 
from cuenta join cliente on cuenta.cod_cliente = cliente.cod_cliente
group by cliente.cod_cliente;

-- 7. Para cada sucursal del banco se desea conocer su dirección, el número de cuentas
-- que tiene abiertas y la suma total de saldo que hay en ellas.
describe sucursal;
select sucursal.cod_sucursal, direccion, count(cuenta.cod_cuenta) as sucursales_totales, sum(cuenta.saldo) as saldo_total
from sucursal join cuenta on sucursal.cod_sucursal = cuenta.cod_sucursal
group by cuenta.cod_sucursal;

-- 8. Mostrar el saldo medio y el interés medio de las cuentas a las que se le aplique un
-- interés mayor del 10%, de las sucursales 1 y 2
select avg(saldo) as saldo_medio, avg(interes) as interes_medio 
from cuenta
where interes > 0.10 and cod_sucursal in(1, 2);

-- 9. Mostrar los tipos de movimientos de las cuentas bancarias, sus descripciones y el
-- volumen total de dinero que se manejado en cada tipo de movimiento.
select * from cuenta;
select tipo_movimiento.cod_tipo_mov, tipo_movimiento.descripcion, sum(importe) as dinero_movido
from movimiento join tipo_movimiento on movimiento.cod_tipo_mov = tipo_movimiento.cod_tipo_mov
group by tipo_movimiento.cod_tipo_mov;

-- 10. Mostrar cuál es la cantidad media que sacan de cajero los clientes de nuestro banco.
select concat_ws(' ', cliente.nombre, cliente.apellidos) as nombre_completo, round(avg(movimiento.importe), 2) as media_saldo_retirada_cajero
from movimiento 
	join cuenta on movimiento.cod_cuenta = cuenta.cod_cuenta 
    join cliente on cuenta.cod_cliente = cliente.cod_cliente
where movimiento.cod_tipo_mov = 2
group by cliente.cod_cliente;

-- 11. Calcular la cantidad total de dinero que emite la entidad bancaria clasificada según
-- los tipos de movimientos de salida.









