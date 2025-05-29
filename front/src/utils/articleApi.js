import { get, post, put, del } from '@/utils/request';

export const articleSelectAll = () => get('/article');
export const articleSelectById = (id) => get(`/article/${id}`);
export const articleSelectByTitle = (title) => get(`/article/${title}`);
export const articleRetrieveById = (id) => get('/article/id', { id });
export const articleInsert = (article) => post('/article', article);
export const articleUpdate = (article) => put('/article', article);
export const articleDeleteById = (id) => del(`/article/delete/${id}`);
export const articleDeleteBatch = (ids) => del('/article/batch', ids);
export const articleDeleteAll = () => del('/article/truncate');
export const articleTestDB = () => get('/article/testDB');
export const articleSelectByPage = (pageQuery) => get('/article/page', pageQuery);



