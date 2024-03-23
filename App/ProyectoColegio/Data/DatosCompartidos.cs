namespace ProyectoColegio.Data
{
    public static class DatosCompartidos
    {
        private static string _miDato;
<<<<<<< Updated upstream
=======
        private static string _sedeUsuario;
        private static string _rolUsuario;
        private static string _idEstudiante;
        private static string _rutaPdf;
        private static bool _habilitadorNota;
>>>>>>> Stashed changes

        public static string MiDato
        {
            get { return _miDato; }
            set { _miDato = value; }
        }
<<<<<<< Updated upstream
=======

        public static string IdentificacionEstudiante
        {
            get { return _idEstudiante; }
            set { _idEstudiante = value; }
        }
        
        public static string SedeUsuario
        {
            get { return _sedeUsuario; }
            set { _sedeUsuario = value; }
        }
        
        public static string RolUsuario
        {
            get { return _rolUsuario; }
            set { _rolUsuario = value; }
        }

        public static string RutaPDF
        {
            get { return _rutaPdf; }
            set { _rutaPdf = value; }
        }

        public static bool HabilitarNotas
        {
            get { return _habilitadorNota; }
            set { _habilitadorNota = value; }
        }
>>>>>>> Stashed changes
    }

}
