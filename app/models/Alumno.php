 <?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Mvc\Model\Query;


class Alumno extends Model
{
    public $Id_A;
    public $Carrera;
    public $Facultad;

    
}
