<?php
use Phalcon\Http\Response;

class EntradaAutoController extends ControllerBase{

	public function initialize(){

		$this->tag->setTitle("Entrada Automática");
		$this->view->setTemplateAfter('mainAuto');
		parent::initialize();
	}

	public function indexAction($data){
		//echo "Data: ".$data;
		if(!$this->session->get('userdata')){


			try {
			    $datAux = explode(" ", $data);//split("[/.-]", $data);
				if (count($datAux)==2) {

					$datLogin['id_user'] = $datAux[0];
					$datLogin['passw'] = $datAux[1];
					//echo "dataLogin: <br>".$datLogin['id_user']."<br>".$datLogin['passw']."<br>";
					if(!$this->login($datLogin)){
						$this->view->ErrorLogin = "ACCESO DENEGADO";
					}

				}
				else{
					$this->view->ErrorLogin = "ACCESO DENEGADO";
				}
			} catch (Exception $e) {
			    $this->view->ErrorLogin = "ACCESO DENEGADO";
			}
		}
		else{
			//echo "userdata: ".var_dump($this->session->get('userdata'));
		}
	}

	public function ajaxRegistroAction(){
		$this->view->disable();

		if ($this->request->isGet()) {
			$Id_P = $this->request->getQuery('id_person');
			$Tam_Id = $this->request->getQuery('tam');

			if($Tam_Id == 9){

				$modelH = new Historial();
				$modelP = new Persona();

				$persona = Persona::findFirst("Id_Persona = ".$Id_P."");

				if($persona){
					$id_bici = 0;
					$dentro = $persona->Dentro;
					$fecha = $modelH->getFechaNow();
					$id_acceso = $this->session->get('userdata')['Id_Acceso'];
						
					$accion = ($dentro == '0')?'E':'S';
					$post = [
						'Id_Persona' => $Id_P,
						'Id_Bici' => $id_bici,
						'Id_Acceso' => $id_acceso,
						'Accion' => $accion,
						'Fecha_Hora' => $fecha
					];

					$modelH->save(
	                            $post,
	                            [	"Id_H",
	                                "Id_Persona",
									"Id_Bici",
									"Id_Acceso",
									"Accion",
									"Fecha_Hora"
	                            ]
	                        );
					$dentroAux = ($dentro == '0')?1:0;
	                $modelP->updateDentro($dentroAux,$Id_P);


	                $userRow = Persona::findFirst("Id_Persona =".$Id_P);
	                $dataMessage="null";
	                ($userRow->Dentro == 1)?
	                	$dataMessage = "Entrada a ".$userRow->Nombre." Correcta":
	                	$dataMessage = "Salida a ".$userRow->Nombre." Correcta";

					echo json_encode($dataMessage);


					
				}
				else{
					echo json_encode('Error');
				}
				
			}
			else{
				echo json_encode('Error');
			}	
		}
		else{
			echo json_encode('Error');
		}
	}

	public function login($post){

	 	if (count($post)==2) {
	 		
			$accesoModel = new Acceso();
			$id_user = $post['id_user'];
			$passw = $post['passw'];
			$user = $accesoModel->getUserLogin($id_user,$passw,$this->Clave_Encriptacion['key']);
			
			if($user){
				$this->dataRegistry($user);
				return true;
			}
			else{
				return false;
			}
		}
    }

    public function dataRegistry($user_data){
    	$this->session->set('userdata', $user_data);
    }

     public function endAction(){
    	$this->session->remove('userdata');
        //$this->flash->success('Goodbye!');

        $response = new Response();
		$response->redirect('entradaAuto/index');
		$response->send();
    }

}

/*
Ejemplo de Entrada URL
http://localhost/_Phalcon/SAESUBUAP/entradaauto/index/10001%20acceso123
*/