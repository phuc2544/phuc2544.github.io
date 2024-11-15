using Microsoft.Data.SqlClient;

namespace SV21T1080059.DataLayers.SQLServer
{
    public abstract class BaseDAL
    {
        protected string _connectionString = "";
        
        /// <summary>
        /// Constructor/Ctor/Ham tao
        /// </summary>
        /// <param name="connectionString"></param>
        public BaseDAL(string connectionString)
        {
            _connectionString = connectionString;
        }
        /// <summary>
        /// Tao va mo ket noi den CSDL
        /// </summary>
        /// <returns></returns>
        protected SqlConnection OpenConnection()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = _connectionString;
            connection.Open();
            return connection;
        }
    }
}
