<?php

/**
 * Template form.
 *
 * @package    check-list
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id$
 */
class TemplateForm extends BaseTemplateForm
{
  public function configure()
  {
    //Esta linea ayuda a pintar mejor  el  recuadro del fomulario con las propiedas de form-control
    $this->widgetSchema['name']=new  sfWidgetFormInputText(array(),array("class"=>"form-control"));
    $this->widgetSchema['description'] = new  sfWidgetFormTextarea(array(),array("class"=>"form-control"));
    $this->widgetSchema['prefix'] = new sfWidgetFormInputText(array(),array("class"=>"form-control"));
  
    $this->useFields(['name','description','prefix']); 
  }
}
