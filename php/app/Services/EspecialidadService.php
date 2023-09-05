<?php


namespace App\Services;

use App\Models\Especialidad;
use Librerias\Database\DbProvider;


class EspecialidadService
{
    private $_db;

    function __construct()
    {
        $this->_db = DbProvider::get();
    }

    public function create(Especialidad $model)
    {
        $sql = 'insert into especialidades(Carrera,Pensum,Nombre) values(';
        $sql .= ':Carrera,:Pensum, :Nombre)';


        try
        {
            $stm = $this->_db->prepare(
                $sql
            );

            $stm->execute([
                    'Carrera' => $model->Carrera,
                    'Pensum' => $model->Pensum,
                    'Nombre' => $model->Nombre
                ]
            );

        } catch (\PDOException $ex){
            var_dump($ex);
        }
    }

    public function delete()
    {
        $sql = 'delete from especialidades';

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