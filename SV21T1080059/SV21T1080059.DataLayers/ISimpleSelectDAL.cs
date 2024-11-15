using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DataLayers
{
    public interface ISimpleSelectDAL<T> where T : class
    {
        /// <summary>
        /// Select toan bo du lieu trong mot bang
        /// </summary>
        /// <returns></returns>
        List<T> List();
    }
}
