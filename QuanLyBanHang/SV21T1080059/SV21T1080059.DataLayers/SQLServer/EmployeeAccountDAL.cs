using Dapper;
using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DataLayers.SQLServer
{
    public class EmployeeAccountDAL : BaseDAL, IUserAccountDAL
    {
        public EmployeeAccountDAL(string connectionString) : base(connectionString)
        {
        }

        public UserAccount? Authorize(string userName, string password)
        {
            UserAccount? data = null;
            using (var connection = OpenConnection())
            {
                var sql = @"select	EmployeeID as UserId,
		                            Email as UserName,
		                            FullName as DisplayName,
		                            Photo,
		                            RoleNames
                            from	Employees
                            where	Email = @Email and Password = @Password
                            ";
                var parameters = new { Email = userName, Password = password };
                data = connection.QueryFirstOrDefault<UserAccount>(sql: sql, param: parameters, commandType: System.Data.CommandType.Text);
            }
            return data;
        }

        public bool ChangePassword(string userName, string password)
        {
            bool result = false;
            using (var connection = OpenConnection())
            {
                var sql = @"update	Employees
                            set		Password = @Password
                            where	Email = @Email";
                var parameters = new
                {
                    Password = password,
                    Email = userName
                };
                result = connection.Execute(sql: sql, param: parameters, commandType: System.Data.CommandType.Text) > 0;
                connection.Close();
            }
            return result;
        }

        public bool CheckOutPassword(string userName, string password) {
            bool result = false;
            using (var connection = OpenConnection())
            {
                var sql = @"if exists (select * from Employees where Password = @Password and Email = @Email)
	                            select 1
                            else
	                            select 0";
                var parameters = new
                {
                    Password = password,
                    Email = userName
                };
                result = connection.ExecuteScalar<bool>(sql: sql, param: parameters, commandType: System.Data.CommandType.Text);
                connection.Close();
            }
            return result;
        }

        public int SingUp(string userName, string password, string contactName, string customerName, string phone)
        {
            throw new NotImplementedException();
        }
    }
}
