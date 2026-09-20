const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '公告信息',
					icon: 'icon-common18',
					child:[
						{
							name:'公告信息',
							url:'/index/newsList'
						},
					]
				},
				{
					name: '比赛信息管理',
					icon: 'icon-common22',
					child:[
						{
							name:'比赛信息',
							url:'/index/bisaixinxiList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "学生竞赛管理系统"
        } 
    }
}
export default config
