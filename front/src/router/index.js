import {createRouter, createWebHistory} from 'vue-router'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {path: '/', redirect: '/manager/data'},
        {path: '/manager', name: 'manager', component: ()=>import('../views/manager.vue'), children: [
            {path: 'home', name: 'home_child', component: ()=>import('../views/home.vue') },
            {path: 'test', name: 'test_child', component: ()=>import('../views/test.vue') },
            {path: 'data', name: 'data', component: ()=>import('../views/data.vue') },
        ]},
        {path: '/home', name: 'home', meta: {title: '主页'},component: ()=>import('../views/home.vue')},
        {path: '/test', name: 'test', meta: {title: '测试页'}, component: ()=>import('../views/test.vue')},
        {path: '/404', name: '404', meta: {title: '404页面'}, component: ()=>import('../views/404.vue')},
        {path: '/:pathMatch(.*)', redirect: '/404'},
    ]
})

// router.beforeEach((to, from, next) => {
//     document.title = to.meta.title;
//     next();
// })

export default router;