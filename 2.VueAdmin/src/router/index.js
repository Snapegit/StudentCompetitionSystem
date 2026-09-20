	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import bisaixinxi from '@/views/bisaixinxi/list'
	import xuesheng from '@/views/xuesheng/list'
	import bisaileixing from '@/views/bisaileixing/list'
	import canjiabisai from '@/views/canjiabisai/list'
	import jiaoshi from '@/views/jiaoshi/list'
	import syslog from '@/views/syslog/list'
	import bisaibaoming from '@/views/bisaibaoming/list'
	import config from '@/views/config/list'
	import bisaichengji from '@/views/bisaichengji/list'
	import jiaoshiCenter from '@/views/jiaoshi/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/jiaoshiCenter',
			name: '教师个人中心',
			component: jiaoshiCenter
		}
		,{
			path: '/news',
			name: '公告信息',
			component: news
		}
		,{
			path: '/bisaixinxi',
			name: '比赛信息',
			component: bisaixinxi
		}
		,{
			path: '/xuesheng',
			name: '学生',
			component: xuesheng
		}
		,{
			path: '/bisaileixing',
			name: '比赛类型',
			component: bisaileixing
		}
		,{
			path: '/canjiabisai',
			name: '参加比赛',
			component: canjiabisai
		}
		,{
			path: '/jiaoshi',
			name: '教师',
			component: jiaoshi
		}
		,{
			path: '/syslog',
			name: '操作日志',
			component: syslog
		}
		,{
			path: '/bisaibaoming',
			name: '比赛报名',
			component: bisaibaoming
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/bisaichengji',
			name: '比赛成绩',
			component: bisaichengji
		}
		]
	},
	{
		path: '/forget',
		name: 'forget',
		component: () => import('../views/forget.vue')
	}
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
