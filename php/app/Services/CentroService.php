<?php


namespace App\Services;

use Librerias\Database\DbProvider;
use App\Models\Centro;

class CentroService
{
    private $_db;

    function __construct()
    {
        $this->_db = DbProvider::get();
    }

    public function create(Centro $model)
    {

        $sql = 'insert into centros(centro,nombre,departamento,municipio,direccion,';
        $sql .= 'telefono,encargado,email) values(';
        $sql .= ':centro,:nombre, :departamento, :municipio, :direccion,';
        $sql .= ':telefono, :encargado, :email)';


        try
        {
            $stm = $this->_db->prepare(
                $sql
            );

            $stm->execute([
                    'centro' => $model->Centro,
                    'nombre' => $model->Centro_Nombre,
                    'departamento' => $model->Departamento,
                    'municipio' => $model->Municipio,
                    'direccion' => $model->Direccion,
                    'telefono' => $model->Telefono,
                    'encargado' => $model->Encargado,
                    'email' => $model->Email

                ]
            );

        } catch (\PDOException $ex){
            var_dump($ex);
        }
    }

    public function delete()
    {
        $sql = 'delete from centros';

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