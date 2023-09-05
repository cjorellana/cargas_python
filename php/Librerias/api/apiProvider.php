<?php
namespace Librerias\api;


class apiProvider
{
    private static $api;

    public static function getCentos()
    {
        $url = __CONFIG__['api']['centros'];
        $json = file_get_contents($url);
        $array = json_decode($json);

        self::$api = $array;

        return self::$api;
    }

    public static function getCursos()
    {
        $url = __CONFIG__['api']['cursos'];
        $json = file_get_contents($url);
        $array = json_decode($json);

        self::$api = $array;

        return self::$api;
    }

    public static function getEspecialidades()
    {
        $url = __CONFIG__['api']['especialidades'];
        $json = file_get_contents($url);
        $array = json_decode($json);

        self::$api = $array;

        return self::$api;
    }

    public static function getHorarios()
    {
        $url = __CONFIG__['api']['horarios'];
        $json = file_get_contents($url);
        $array = json_decode($json);

        self::$api = $array;

        return self::$api;
    }

    
    public static function getPeriodos()
    {
        $url = __CONFIG__['api']['periodos'];
        $json = file_get_contents($url);
        $array = json_decode($json);

        self::$api = $array;

        return self::$api;
    }

}