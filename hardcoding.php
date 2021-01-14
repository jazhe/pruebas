<?php

$iva = 0.21;
$precioInicial = $argv[1];
$precioConIVA = $precioInicial * (1 + $iva);

echo "Valor del IVA: ".($iva * 100)."%".PHP_EOL;
echo "Sin IVA: \$$precioInicial, con IVA: \$$precioConIVA".PHP_EOL;