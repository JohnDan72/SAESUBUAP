<?php

class SalidaAutoController extends ControllerBase{

	public function initialize(){
		$this->tag->setTitle("Salida Automática");
		$this->view->setTemplateAfter('main');
		parent::initialize();
	}

	public function indexAction(){

	}
}