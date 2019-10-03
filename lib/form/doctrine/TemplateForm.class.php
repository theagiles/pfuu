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
    $this->widgetSchema['name']=new  sfWidgetFormInputText(array(),array("class"=>"form-control"));
   $this->useFields(['name','description','prefix']); 
  }
}
