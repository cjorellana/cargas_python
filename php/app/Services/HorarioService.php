<?php


namespace App\Services;

use App\Models\Horario;
use Librerias\Database\DbProvider;


class HorarioService
{
    private $_db;

    function __construct()
    {
        $this->_db = DbProvider::get();
    }

    public function create(Horario $model)
    {
        $sql = 'insert into horarios(curso,carrera,seccion,tipoasig,portal,';
        $sql .= 'periodo,dia,horaini,horafin,correlativo) values(';
        $sql .= ':curso,:carrera, :seccion, :tipoasig, :portal,';
        $sql .= ':periodo,:dia,';
        $sql .= ':horaini, :horafin, :correlativo)';


        try
        {
            $stm = $this->_db->prepare(
                $sql
            );

            $stm->execute([
                    'curso' => $model->curso,
                    'carrera' => $model->carrera,
                    'seccion' => $model->seccion,
                    'tipoasig' => $model->tipoasig,
                    'portal' => $model->portal,
                    'periodo' => $model->periodo,
                    'dia' => $model->dia,
                    'horaini' => $model->horaini,
                    'horafin' => $model->horafin,
                    'correlativo' => $model->correlativo
                ]
            );

        } catch (\PDOException $ex){
            var_dump($ex);
        }
    }

    public function delete()
    {
        $sql = 'delete from horarios';

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