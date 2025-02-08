using SV21T1080059.DataLayers;
using SV21T1080059.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static SV21T1080059.BusinessLayers.UserAccountService;

namespace SV21T1080059.BusinessLayers
{
    public static class UserAccountService
    {
        private static readonly IUserAccountDAL employeeAccountDB;
        private static readonly IUserAccountDAL customerAccountDB;

        static UserAccountService()
        {
            string connectionString = Configuration.ConnectionString;
            employeeAccountDB = new DataLayers.SQLServer.EmployeeAccountDAL(connectionString);
            customerAccountDB = new DataLayers.SQLServer.CustomerAccountDAL(connectionString);
        }

        public static UserAccount? Authorize(UserTypes userType, string userName, string password)
        {
            if (userType == UserTypes.Employee)
            {
                return employeeAccountDB.Authorize(userName, password);
            }
            else
            {
                return customerAccountDB.Authorize(userName, password);
            }
        }

        public static bool ChangePassword(UserTypes userType, string userName, string password)
        {
            if (userType == UserTypes.Employee)
            {
                return employeeAccountDB.ChangePassword(userName, password);
            }
            else
            {
                return customerAccountDB.ChangePassword(userName, password);
            }

        }

        public static bool CheckOutPassword(UserTypes userType, string userName, string password)
        {
            if (userType == UserTypes.Employee)
            {
                return employeeAccountDB.CheckOutPassword(userName, password);
            }
            else
            {
                return customerAccountDB.CheckOutPassword(userName, password);
            }
        }

        public static int SignUp(UserTypes userTypes, string userName, string password, string contactName, string customerName, string phone) {
            if(userTypes == UserTypes.Customer)
            {
                return customerAccountDB.SingUp(userName, password, contactName, customerName, phone);
            }
            else
            {
                return employeeAccountDB.SingUp(userName, password, contactName, customerName, phone);
            }
        }
        /// <summary>
        /// Loại tài khoản
        /// </summary>
        public enum UserTypes
        {
            Employee,
            Customer
        }
    }
}
