import { get, post, put, del } from '@/utils/request';

export const employeeSelectAll = () => get('/employee');
export const employeeSelectById = (id) => get(`/employee/${id}`);
export const employeeRetrieveById = (id) => get('/employee/id', { id });
export const employeeInsert = (employee) => post('/employee', employee);
export const employeeUpdate = (employee) => put('/employee', employee);
export const employeeDeleteById = (id) => del(`/employee/delete/${id}`);
export const employeeDeleteBatch = (ids) => del('/employee/batch', ids);
export const employeeDeleteAll = () => del('/employee/truncate');
export const employeeTestDB = () => get('/employee/testDB');
export const employeeSelectByPage = (pageQuery) => get('/employee/page', pageQuery);
export const employeeLogin = (employee) => post('/employee/login', employee);
export const employeeRegist = (employee) => post('/employee/regist', employee);
export const employeeUpdatePass = (updatePass) => post('/employee/updatePass', updatePass);

