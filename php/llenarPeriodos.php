<?php

require_once 'vendor/autoload.php';
require_once 'config.php';

use Librerias\api\apiProvider;
use App\Services\PeriodoService;
use App\Models\Periodo;

$table = apiProvider::getPeriodos();

if(count($table)>0){
    $service = new PeriodoService;
    $service->delete();
}

foreach($table as $row) {

    $service = new PeriodoService();
    $model = new Periodo();

   
    $model->Carrera = $row->Carrera;
    $model->Periodo = $row->Periodo;
    $model->Descripcion = $row->Descripcion;

    $service->create($model);

    print $row->Carrera;
    print $row->Periodo;
    print $row->Descripcion;
    echo "\n";

}