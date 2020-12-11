<?php 
/*
L'âge de la retraite est fixé à 55 ans

SI l'âge fourni est supérieur à l'âge de la retraite
    afficher (echo) "vous êtes à la retraite depuis X années"

SINON SI l'âge fourni ($age) est inférieur à l'âge de la retraite ($retraite)
        SI l'âge est inférieur à 0 
            afficher "un peu jeune pour penser à la retraite !"
        SINON SI l'âge est inférieur à 18 
            afficher "vous pas être né"
        SINON 
            afficher (echo) "Il vous reste X années  avant la retraite"
SINON 
    alors
    afficher (echo) "La retraite c'est cette année"

*/

$retraite = 55;

$age = -12;



if($age > $retraite) { 
    $difference = ($age - $retraite);
    echo "Vous êtes à la retraite depuis $difference années";
}
else if ($age < $retraite) {

    if ($age < 0) { 
        echo "Vous pas être né";
    }

    else if ($age < 18) {
        echo "Un peu jeun pour penser à la retraite";
    }

    else {
        $retraite - $age;
    }
    
    $difference = ($retraite - $age);
    echo "Il vous reste $difference années  avant la retraite";
}
else {
    echo "La retraite c'est cette année";
}

echo "\n FIN";

