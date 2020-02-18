<?php

class TableController extends ControllerBase{

	public function initialize(){
		$this->tag->setTitle("Historial E/S");
		$this->view->setTemplateAfter('main');
		parent::initialize();
	}

	public function indexAction(){
		$modelH = new Historial();

		$historialData = $modelH->getHistorialforTable();

		if($historialData){
			$this->view->Registros = $historialData;
		}
	}
}