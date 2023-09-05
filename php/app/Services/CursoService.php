<?php


namespace App\Services;

use App\Models\Curso;
use Librerias\Database\DbProvider;


class CursoService
{
    private $_db;

    function __construct()
    {
        $this->_db = DbProvider::get();
    }

    public function create(Curso $model)
    {
        $sql = 'insert into cursos(Carrera,Nombre_Curso,';
        $sql .= 'Curso,Seccion,Tipoasig,';
        $sql .= 'Periodo,Pensum,Ciclo,No_Asignados,centro,';
        $sql .= 'Jornada, desc_seccion,';
        $sql .= 'inicio,fin) values(';
        $sql .= ':Carrera,:Nombre_Curso, :Curso, :Seccion, :Tipoasig,';
        $sql .= ':Periodo,:Pensum,';
        $sql .= ':Ciclo, :No_Asignados, :centro, :Jornada, :Desc_Seccion,';
        $sql .= ':inicio,:fin)';


        try
        {
            $stm = $this->_db->prepare(
                $sql
            );

            $stm->execute([
                    'Carrera' => $model->Carrera,
                    'Nombre_Curso' => $model->Nombre_Curso,
                    'Curso' => $model->Curso,
                    'Seccion' => $model->Seccion,
                    'Tipoasig' => $model->Tipoasig,
                    'Periodo' => $model->Periodo,
                    'Pensum' => $model->Pensum,
                    'Ciclo' => $model->Ciclo,
                    'No_Asignados' => $model->No_Asignados,
                    'centro' => $model->Centro,
                    'Jornada' => $model->Jornada,
                    'Desc_Seccion' =>$model->Desc_Seccion,
                    'inicio' =>$model->Inicio,
                    'fin' =>$model->Fin

                ]
            );

        } catch (\PDOException $ex){
            var_dump($ex);
        }
    }

    public function delete()
    {
        $sql = 'delete from cursos';

        try
        {
            $stm = $this->_db->prepare(
                $sql
            );

            $stm->execute();

        } catch (\PDOException $ex){
            var_dump($ex);
        }

    }
}