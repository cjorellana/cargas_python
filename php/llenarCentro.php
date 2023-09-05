<?php

require_once 'vendor/autoload.php';
require_once 'config.php';


//use Librerias\Database\DbProvider;
use Librerias\api\apiProvider;
use App\Services\CentroService;
use App\Models\Centro;


//var_dump(DbProvider::get());
//var_dump(apiProvider::getCentos());

$table = apiProvider::getCentos();

if(count($table)>0){
    $service = new CentroService;
    $service->delete();
}

foreach($table as $row) {

    $service = new CentroService;
    $model = new Centro();
    $model->Centro = $row->Centro;
    $model->Centro_Nombre = $row->Centro_Nombre;
    $model->Departamento = $row->Departamento;
    $model->Municipio = $row->Municipio;
    $model->Direccion= $row->Direccion;
    $model->Telefono = $row->Telefono;
    $model->Encargado = $row->Encargado;
    $model->Email =  $row->Email;


    $service->create($model);

    print $row->Centro;
    print $row->Centro_Nombre;
    print $row->Departamento;
    print $row->Municipio;
    print $row->Telefono;
    print $row->Encargado;
    print $row->Email;
    echo "\n";

}
