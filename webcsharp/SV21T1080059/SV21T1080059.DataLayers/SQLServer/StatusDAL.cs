using Dapper;
using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SV21T1080059.DataLayers.SQLServer
{
    public class StatusDAL : BaseDAL, ISimpleSelectDAL<Statuss>
    {
        public StatusDAL(string connectionString) : base(connectionString)
        {
        }

        public List<Statuss> List()
        {
            List<Statuss> list = new List<Statuss>();
            using (var connection = OpenConnection())
            {
                var sql = @"select * from OrderStatus";
                list = connection.Query<Statuss>(sql: sql, commandType: System.Data.CommandType.Text).ToList();
                connection.Close();
            }
            return list;
        }
    }
}
