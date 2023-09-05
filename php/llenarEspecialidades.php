<?php

require_once 'vendor/autoload.php';
require_once 'config.php';


use Librerias\Database\DbProvider;
use Librerias\api\apiProvider;
use App\Services\EspecialidadService;
use App\Models\Especialidad;

$table = apiProvider::getEspecialidades();

//var_dump(DbProvider::get());
//var_dump(apiProvider::getEspecialidades());

if(count($table)>0){
    $service = new EspecialidadService;
    $service->delete();
}

foreach($table as $row) {

    $service = new EspecialidadService();
    $model = new Especialidad();

    $model->Carrera = $row->Carrera;
    //$model->Carrera = 'LITA';
    $model->Pensum = $row->Pensum;
    $model->Nombre = $row->Nombre;

    $service->create($model);

    print $row->Carrera;
    print $row->Pensum;
    print $row->Nombre;
    echo "\n";

}
