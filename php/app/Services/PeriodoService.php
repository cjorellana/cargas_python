<?php


namespace App\Services;

use App\Models\Periodo;
use Librerias\Database\DbProvider;


class PeriodoService
{
    private $_db;

    function __construct()
    {
        $this->_db = DbProvider::get();
    }

    public function create(Periodo $model)
    {
        $sql = 'insert into periodos(carrera,periodo,descripcion)';
        $sql .= 'values(:carrera,:periodo,:descripcion)';

        try
        {
            $stm = $this->_db->prepare(
                $sql
            );

            $stm->execute([
                    'carrera' => $model->Carrera,
                    'periodo' => $model->Periodo,
                    'descripcion' => $model->Descripcion
                ]
            );

        } catch (\PDOException $ex){
            var_dump($ex);
        }
    }

    public function delete()
    {
        $sql = 'delete from periodos';

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