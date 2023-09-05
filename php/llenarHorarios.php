<?php

require_once 'vendor/autoload.php';
require_once 'config.php';

use Librerias\api\apiProvider;
use App\Services\HorarioService;
use App\Models\Horario;

$table = apiProvider::getHorarios();

if(count($table)>0){
    $service = new HorarioService;
    $service->delete();
}

foreach($table as $row) {

    $service = new HorarioService();
    $model = new Horario();

    $model->curso = $row->Curso;
    $model->carrera = $row->Carrera;
    $model->seccion = $row->Seccion;
    $model->tipoasig = $row->Tipoasig;
    $model->portal = $row->Portal;
    $model->periodo = $row->Periodo;
    $model->dia = $row->Dia;
    $model->horaini = $row->Horaini;
    $model->horafin = $row->Horafin;
    $model->correlativo = $row->Correlativo;

    $service->create($model);

    print $row->Curso;
    print $row->Carrera;
    print $row->Seccion;
    print $row->Tipoasig;
    print $row->Portal;
    print $row->Periodo;
    print $row->Dia;;
    print $row->Horaini;
    print $row->Horafin;
    print $row->Correlativo;
    echo "\n";

}