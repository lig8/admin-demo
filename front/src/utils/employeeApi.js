import { get, post, put, del } from '@/utils/request';

export const selectAll = () => get('/employee');
export const selectById = (id) => get(`/employee/${id}`);
export const retrieveById = (id) => get('/employee/id', { id });
export const insert = (employee) => post('/employee', employee);
export const update = (employee) => put('/employee', employee);
export const deleteById = (id) => del(`/employee/delete/${id}`);
export const deleteBatch = (ids) => del('/employee/batch', ids);
export const deleteAll = () => del('/employee/truncate');
export const testDB = () => get('/employee/testDB');
export const selectByPage = (pageQuery) => get('/employee/page', pageQuery);
