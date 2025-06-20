using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SV21T1080059.DataLayers
{
    /// <summary>
    /// Dinh nghia cac phep xu ly du lieu chung
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface ICommonDAL<T> where T : class
    {
        /// <summary>
        /// Tim kiem va lay dsach dl duoi dang phan trang
        /// </summary>
        /// <param name="page">Trang can hien thi</param>
        /// <param name="pageSize">So dong hien thi tren moi trang (bang 0 neu khong phan trang)</param>
        /// <param name="searchValue">Gia tri can tim (chuoi rong neu lay toan bo dlieu)</param>
        /// <returns></returns>
        List<T> List(int page = 1, int pageSize = 0, string searchValue = "");
        /// <summary>
        /// Dem so luong dong dl tim dc
        /// </summary>
        /// <param name="searchValue">Gia tri can tim (chuoi rong neu lay toan bo dl)</param>
        /// <returns></returns>
        int Count(string searchValue = "");
        /// <summary>
        /// Lay 1 dong dl dua vao id (tra ve null neu dl k ton tai)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        T? Get(int id);
        /// <summary>
        /// Bo sung dlieu vao CSDL. Ham tra ve ID cua dlieu duoc bo sung
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        int Add(T data);
        /// <summary>
        /// Cap nhat dlieu
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        bool Update(T data);
        /// <summary>
        /// Xoa dl dua vao ma (id)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// Kiem tra mot dong dl co khoa la id hien co dl lien quan den bang khac hay khong?
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        bool InUsed(int id);
    }
}
