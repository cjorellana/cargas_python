<?php

require_once 'vendor/autoload.php';
require_once 'config.php';


use Librerias\Database\DbProvider;
use Librerias\api\apiProvider;
use App\Services\CursoService;
use App\Models\Curso;

$table = apiProvider::getCursos();

//var_dump(DbProvider::get());
//var_dump(apiProvider::getCursos());

if(count($table)>0){
    $service = new CursoService;
    $service->delete();
}

foreach($table as $row) {

    $service = new CursoService();
    $model = new Curso();

    $model->Carrera = $row->Carrera;
    //$model->Carrera = 'LITA';
    $model->Nombre_Curso = $row->Descripcion;
    $model->Curso = $row->Curso;
    $model->Seccion = $row->Seccion;
    $model->Tipoasig = $row->Tipoasig;
    $model->Periodo = $row->Periodo;
    $model->Pensum = $row->Pensum;
    $model->Ciclo = $row->Ciclo;
    $model->No_Asignados = $row->No_Asignados;
    $model->Centro = $row->Centro;
    $model->Jornada = $row->Jornada;
    $model->Desc_Seccion = $row->Desc_Seccion;
    $model->Inicio = $row->Inicio;
    $model->Fin = $row->Fin;

    $service->create($model);

    print $row->Carrera;
    print $row->Descripcion;
    print $row->Curso;
    print $row->Seccion;
    print $row->Tipoasig;
    print $row->Periodo;
    print $row->Pensum;
    print $row->Ciclo;
    print $row->No_Asignados;
    print $row->Centro;
    print $row->Jornada;
    print $row->Desc_Seccion;
    print $row->Inicio;
    print $row->Fin;
    echo "\n";

}
