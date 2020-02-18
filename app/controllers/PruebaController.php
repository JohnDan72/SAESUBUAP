<?php
use Phalcon\Http\Response;

class PruebaController extends ControllerBase{

	public function initialize(){

		$this->tag->setTitle("Prueba");
		//$this->view->setTemplateAfter('main');
		parent::initialize();
	}

	public function indexAction(){

	}
}