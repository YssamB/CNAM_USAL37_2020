<?php 
/*
L'âge de la retraite est fixé à 55 ans

SI l'âge fourni ($age) est supérieur à l'âge de la retraite ($retraite)
    alors
    afficher (echo) "vous êtes à la retraite depuis X années"

SINON SI l'âge fourni ($age) est inférieur à l'âge de la retraite ($retraite)
    alors   
    afficher (echo) "Il vous reste X années  avant la retraite"

SINON 
    alors
    afficher (echo) "La retraite c'est cette année"


*/

$retraite = 55;

$age = 60;


if($age > $retraite) 
{
    $difference = $age - $retraite;
    echo "vous êtes à la retraite depuis $difference années";
}

elseif($age < $retraite) 
{
    echo "Il vous reste $difference années avant la retraite";
}

else($age == $retraite)
{
    echo "La retraite c'est cette année";
}


