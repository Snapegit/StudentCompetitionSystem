import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import newsList from '@/views/pages/news/list'
import bisaileixingList from '@/views/pages/bisaileixing/list'
import bisaileixingDetail from '@/views/pages/bisaileixing/formModel'
import bisaileixingAdd from '@/views/pages/bisaileixing/formAdd'
import bisaixinxiList from '@/views/pages/bisaixinxi/list'
import bisaixinxiDetail from '@/views/pages/bisaixinxi/formModel'
import bisaixinxiAdd from '@/views/pages/bisaixinxi/formAdd'
import bisaibaomingList from '@/views/pages/bisaibaoming/list'
import bisaibaomingDetail from '@/views/pages/bisaibaoming/formModel'
import bisaibaomingAdd from '@/views/pages/bisaibaoming/formAdd'
import bisaichengjiList from '@/views/pages/bisaichengji/list'
import bisaichengjiDetail from '@/views/pages/bisaichengji/formModel'
import bisaichengjiAdd from '@/views/pages/bisaichengji/formAdd'
import jiaoshiList from '@/views/pages/jiaoshi/list'
import jiaoshiDetail from '@/views/pages/jiaoshi/formModel'
import jiaoshiAdd from '@/views/pages/jiaoshi/formAdd'
import syslogList from '@/views/pages/syslog/list'
import syslogDetail from '@/views/pages/syslog/formModel'
import syslogAdd from '@/views/pages/syslog/formAdd'
import xueshengList from '@/views/pages/xuesheng/list'
import xueshengDetail from '@/views/pages/xuesheng/formModel'
import xueshengAdd from '@/views/pages/xuesheng/formAdd'
import xueshengRegister from '@/views/pages/xuesheng/register'
import xueshengCenter from '@/views/pages/xuesheng/center'
import canjiabisaiList from '@/views/pages/canjiabisai/list'
import canjiabisaiDetail from '@/views/pages/canjiabisai/formModel'
import canjiabisaiAdd from '@/views/pages/canjiabisai/formAdd'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'newsList',
			component: newsList
		}
		, {
			path: 'bisaileixingList',
			component: bisaileixingList
		}, {
			path: 'bisaileixingDetail',
			component: bisaileixingDetail
		}, {
			path: 'bisaileixingAdd',
			component: bisaileixingAdd
		}
		, {
			path: 'bisaixinxiList',
			component: bisaixinxiList
		}, {
			path: 'bisaixinxiDetail',
			component: bisaixinxiDetail
		}, {
			path: 'bisaixinxiAdd',
			component: bisaixinxiAdd
		}
		, {
			path: 'bisaibaomingList',
			component: bisaibaomingList
		}, {
			path: 'bisaibaomingDetail',
			component: bisaibaomingDetail
		}, {
			path: 'bisaibaomingAdd',
			component: bisaibaomingAdd
		}
		, {
			path: 'bisaichengjiList',
			component: bisaichengjiList
		}, {
			path: 'bisaichengjiDetail',
			component: bisaichengjiDetail
		}, {
			path: 'bisaichengjiAdd',
			component: bisaichengjiAdd
		}
		, {
			path: 'jiaoshiList',
			component: jiaoshiList
		}, {
			path: 'jiaoshiDetail',
			component: jiaoshiDetail
		}, {
			path: 'jiaoshiAdd',
			component: jiaoshiAdd
		}
		, {
			path: 'syslogList',
			component: syslogList
		}, {
			path: 'syslogDetail',
			component: syslogDetail
		}, {
			path: 'syslogAdd',
			component: syslogAdd
		}
		, {
			path: 'xueshengList',
			component: xueshengList
		}, {
			path: 'xueshengDetail',
			component: xueshengDetail
		}, {
			path: 'xueshengAdd',
			component: xueshengAdd
		}
		, {
			path: 'xueshengCenter',
			component: xueshengCenter
		}
		, {
			path: 'canjiabisaiList',
			component: canjiabisaiList
		}, {
			path: 'canjiabisaiDetail',
			component: canjiabisaiDetail
		}, {
			path: 'canjiabisaiAdd',
			component: canjiabisaiAdd
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/xueshengRegister',
		component: xueshengRegister
	}
	,{
		path: '/forget',
		name: 'forget',
		component: () => import('../views/pages/forget.vue')
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
