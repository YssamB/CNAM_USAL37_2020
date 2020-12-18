<?php 

namespace Vehicules;


class Voiture 
{
    private string $marque = "Peugeot";

    private string $modele = "207";

    public function getMarque()
    {
        return $this->marque;
    }

    public function setMarque(string $nouvelleMarque)
    {
        $longueur = strlen($nouvelleMarque);

        if($longueur >= 2) {
            $this->marque = $nouvelleMarque;
        }
        else {
            throw new \Exception("Nom trop court !");
        }
        
    }

    public function setModel(string $newModel)
    {
        $longueur = strlen($newModel);

        if($longueur >= 2) {
            $this->modele = $newModel;
        }
        else {
            throw new \Exception("Nom trop court !");
        }
        
    }
}  // fin de la classe Voiture  
