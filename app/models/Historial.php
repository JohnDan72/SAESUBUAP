<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Mvc\Model\Query;


class Historial extends Model
{
    
	public $Id_H;
	public $Id_Persona;
	public $Id_Acceso;
	public $Id_Bici;
	public $Accion;
	public $Fecha_Hora;

	//getBiciInfoById

	public function getFechaNow(){
		$query = $this->modelsManager->createQuery("SELECT now() as fecha from Persona LIMIT 1");
		//$result = $query->execute()[0]['fecha'];
		return $query->execute()[0]['fecha'];
	}
	
	public function getHistorialforTable(){
		$query = $this->modelsManager->createQuery("
				SELECT persona.Id_Persona, persona.Nombre, persona.Ap_Paterno, persona.Ap_Materno, historial.Accion, historial.Id_Bici,acceso.Nombre_A, historial.Fecha_Hora
				FROM persona, historial, acceso, bici
				WHERE 	persona.Id_Persona = historial.Id_Persona AND
						acceso.Id_Acceso = historial.Id_Acceso AND
				        bici.Id_Bici = historial.Id_Bici
				ORDER BY historial.Fecha_Hora
			");
		$result = $query->execute();

		return (isset($result[0]))? $result:false;
		
	}

	/*
SELECT persona.Id_Persona, persona.Nombre, persona.Ap_Paterno, persona.Ap_Materno, historial.Accion, historial.Id_Bici,acceso.Nombre_A, historial.Fecha_Hora
FROM persona, historial, acceso, bici
WHERE 	persona.Id_Persona = historial.Id_Persona AND
		acceso.Id_Acceso = historial.Id_Acceso AND
        bici.Id_Bici = historial.Id_Bici;
        

	*/
  
}