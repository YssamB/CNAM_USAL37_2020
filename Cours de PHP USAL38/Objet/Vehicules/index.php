<?php 
require_once 'Voiture.php';

use Vehicules\Voiture;





$v1 = new Voiture();

$v1->setMarque("Suziki");

var_export($v1);

echo "\n";






$v2 = new Voiture();

$v2->setModel("JeSaisPas");

$v2->modele = "2"; // ca plante !

var_export($v2);

