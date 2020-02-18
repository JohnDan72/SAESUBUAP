 <?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Mvc\Model\Query;


class Persona extends Model
{
    
	public $Id_Persona;
	public $Nombre;
	public $Ap_Paterno;
	public $Ap_Materno;
	public $Correo;
	public $Telefono;
	public $Tipo_P;
	public $Dentro;

    public function getFirstPersona(){
    	

    		$query = $this->modelsManager->createQuery("
				SELECT Persona.nombre,Persona.ap_paterno 
				FROM Persona
			");

			return $query->execute()[0];
	    	//SELECT grupo.*, AES_DECRYPT(Clave_Grupo, 'ardogs123') as Contraseña_Grupo FROM grupo;
    	
    }

    public function getPersonInfoById($id_person){
    	$dataPerson = $this->modelsManager->createQuery("
				SELECT Persona.Tipo_P
				FROM Persona
				WHERE Id_Persona = $id_person
    		")->execute();

    	if (!isset($dataPerson[0])) {
    		return false;
    	}

    	
    	switch ($dataPerson[0]['Tipo_P']) {
    		case '1':
    			$query = $this->modelsManager->createQuery("
					SELECT Persona.Id_Persona,Persona.Tipo_P,Persona.Nombre,Persona.Ap_Paterno,Persona.Ap_Materno, Persona.Dentro, Alumno.Facultad
					FROM Persona,Alumno
					WHERE   Persona.Id_Persona = Alumno.Id_A AND 
							Persona.Id_Persona = $id_person			
				");
				return $query->execute();

    			break;
    		case '2':
    			$query = $this->modelsManager->createQuery("
					SELECT Persona.Id_Persona,Persona.Tipo_P,Persona.Nombre,Persona.Ap_Paterno,Persona.Ap_Materno,Persona.Dentro, Docente.Grado_Estudios
					FROM Persona,Docente
					WHERE   Persona.Id_Persona = Docente.Id_D AND 
							Persona.Id_Persona = $id_person			
				");
				return $query->execute();
    			break;
    		default:
    			# code...
    			break;
    	}
    	
    	return false;
    }

    public function updateDentro($dentro,$id_person){
    	$query = $this->modelsManager->createQuery("
				UPDATE Persona
				SET Persona.Dentro = :dent:
				WHERE Persona.Id_Persona = :id:
			");

			return $query->execute(
				[
					'dent' => $dentro,
					'id' => $id_person
				]
			);
    }



    

    
}