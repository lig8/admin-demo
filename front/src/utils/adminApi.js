import { get, post, put, del } from '@/utils/request';




export const adminSelectAll = () => get('/admin');
export const adminSelectById = (id) => get(`/admin/${id}`);
export const adminRetrieveById = (id) => get('/admin/id', { id });
export const adminInsert = (admin) => post('/admin', admin);
export const adminUpdate = (admin) => put('/admin', admin);
export const adminDeleteById = (id) => del(`/admin/delete/${id}`);
export const adminDeleteBatch = (ids) => del('/admin/batch', ids);
export const adminDeleteAll = () => del('/admin/truncate');
export const adminTestDB = () => get('/admin/testDB');
export const adminSignin = (admin) => post('/admin/signin', admin);
export const adminRegist = (admin) => post('/admin/regist', admin);


export const adminSelectByPage = (pageQuery) => get('/admin/page', pageQuery);
export const adminLogin = (admin) => post('/admin/login', admin);
export const adminUpdatePass = (updatePass) => post('/admin/updatePass', updatePass);

