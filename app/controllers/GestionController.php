<?php
use Phalcon\Http\Response;

/**
 * 
 */
class GestionController extends ControllerBase
{
	public function initialize(){
		$this->tag->setTitle('Gestión');
		$this->view->setTemplateAfter('main');
        parent::initialize();
	}

	public function indexAction(){
		if(!$this->session->get('userdata')){
            $response = new Response();
            $response->redirect("index/index");
            $response->send();
        }
	}

	public function logoutAction(){
		$response = new Response();
		$response->redirect('index/end');
		$response->send();
	}

	public function cambioDentroAction(){
		if ($this->request->isPost()) {
			//echo "var_dump()  ".var_dump($this->request->getPost());
			$id_person = $this->request->getPost('Matricula');
			$id_bici = $this->request->getPost('Id_Bici');
			$dentro = $this->request->getPost('Id_Dentro');

			$modelH = new Historial();
			$modelP = new Persona();

				$fecha = $modelH->getFechaNow();
				$id_acceso = $this->session->get('userdata')['Id_Acceso'];
				
				/*
				echo "matricula now: ".$id_person."<br><br>";
				echo "bici now: ".$id_bici."<br><br>";
				echo "fecha now: ".$fecha."<br><br>";
				echo "acceso now: ".$id_acceso."<br><br>";
				echo "dentro now: ".$dentro."<br><br>";
				*/

				$accion = ($dentro == '0')?'E':'S';
				$post = [
					'Id_Persona' => $id_person,
					'Id_Bici' => $id_bici,
					'Id_Acceso' => $id_acceso,
					'Accion' => $accion,
					'Fecha_Hora' => $fecha,
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
                $modelP->updateDentro($dentroAux,$id_person);

                ($dentroAux == 1)? $this->view->Reg_Result = "(ENTRADA CORRECTA)":$this->view->Reg_Result = "(SALIDA CORRECTA)";
                return 	$this->dispatcher->forward([
			    				'controller'=> 'gestion',
			    				'action'	=> 'index'
			    			]);	
		}
		else{

		}
	}

	public function ajaxEstudianteBiciAction(){
		$this->view->disable();

		if ($this->request->isGet()) {
			
			if(($this->request->getQuery('id_person')>0)&&($this->request->getQuery('id_bici') == null)){
				$modelAux = new Persona();
				//$data = Persona::findFirst(["Id_Persona = $id_persona"]);
				$data = $modelAux->getPersonInfoById($this->request->getQuery('id_person'));
				//echo json_encode($data);
			
				if($data != false){
					//array_push($data, ["Return_Type" => "1"]);
					//$data['Return_Type'] = 1;
					switch ($data[0]['Tipo_P']) { //excepciones de info
						case '1':
							$dataAux["Facultad"] = $data[0]['Facultad'];
							break;
						case '2':							
							$dataAux["Grado_Estudios"] = $data[0]['Grado_Estudios'];
							break;
						case '3':
							# code...
							break;
						default:
							# code...
							break;
					}
					
					//Informacion comun
					$dataAux["Id_Persona"] = $data[0]['Id_Persona'];
					$dataAux["Nombre"] = $data[0]['Nombre'];
					$dataAux["Ap_Paterno"] = $data[0]['Ap_Paterno'];
					$dataAux["Ap_Materno"] = $data[0]['Ap_Materno'];
					$dataAux["Tipo_P"] = $data[0]['Tipo_P'];
					$dataAux["Dentro"] = $data[0]['Dentro'];
					$dataAux["Return_Type"] = 1;

					echo json_encode($dataAux);
				}
				else{
					echo json_encode("Error");
				}
				
			}
			else if(($this->request->getQuery('id_person')>0)&&($this->request->getQuery('id_bici')>0)){
				$modelAux = new Persona();
				$modelAuxBici = new Bici();
				//$data = Persona::findFirst(["Id_Persona = $id_persona"]);
				$dataP = $modelAux->getPersonInfoById($this->request->getQuery('id_person'));
				//echo json_encode($data);
			
				if($dataP != false){
					//$idAux = $this->request->getQuery('id_bici');
					$dataB = Bici::findFirst("Id_Bici =  ".$this->request->getQuery('id_bici')."");

					if ($dataB != false) {
						//array_push($data, ["Return_Type" => "1"]);
						//$data['Return_Type'] = 1;
						switch ($dataP[0]['Tipo_P']) {
							case '1':
								$dataAux["Facultad"] = $dataP[0]['Facultad'];
								break;
							case '2':
								$dataAux["Grado_Estudios"] = $dataP[0]['Grado_Estudios'];
								break;
							case '3':
								# code...
								break;
							default:
								# code...
								break;
						}
						$dataAux["Id_Persona"] = $dataP[0]['Id_Persona'];
						$dataAux["Nombre"] = $dataP[0]['Nombre'];
						$dataAux["Ap_Paterno"] = $dataP[0]['Ap_Paterno'];
						$dataAux["Ap_Materno"] = $dataP[0]['Ap_Materno'];
						$dataAux["Tipo_P"] = $dataP[0]['Tipo_P'];
						$dataAux["Dentro"] = $dataP[0]['Dentro'];
						$dataAux["Id_Bici"] = $dataB->Id_Bici;
						$dataAux["Color"] = $dataB->Color;
						$dataAux["Rodada"] = $dataB->Rodada;
						$dataAux["Marca"] = $dataB->Marca;
						
						$dataAux["Return_Type"] = 2;

						echo json_encode($dataAux);
					}
					else{
						echo json_encode("Error");
					}
					
				}
				else{
					echo json_encode("Error");
				}
			}
			else{
				echo json_encode("Error");
			}
			
			
		}
		else{
			echo json_encode("Error");
		}

		
	}














	//FUNCION PARA PROBAR LOS QUERYS EN CASO DE USAR AJAX (ya que con ajax no te deja ver directamente el error, si es que existe!)
	public function dataBasePruebaAction($id_persona){

		$modelAux = new Persona();
		//$data = Persona::findFirst(["Id_Persona = $id_persona"]);
		$data = $modelAux->getPersonInfoById($id_persona);

		if($data != false){
			echo "Encontro info: ";
		}
		else{
			echo "No encontro algo";
		}
	}
}