
<template>
	<div class="app-contain" :style='{"minHeight":"100vh","padding":"0","margin":"20px auto 60px","borderRadius":"20px","background":"none","width":"1200px","position":"relative","height":"100%"}'>
		<div class="bread_view">
			<el-breadcrumb separator=">" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<el-form ref="formRef" :model="form" class="add_form" label-width="120px" :rules="rules">
			<el-row>
				<el-col :span="12">
					<el-form-item label="比赛名称" prop="bisaimingcheng">
						<el-input class="list_inp" v-model="form.bisaimingcheng" placeholder="比赛名称"
							 type="text" 							:readonly="!isAdd||disabledForm.bisaimingcheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="比赛类型" prop="bisaileixing">
						<el-input class="list_inp" v-model="form.bisaileixing" placeholder="比赛类型"
							 type="text" 							:readonly="!isAdd||disabledForm.bisaileixing?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="教师工号" prop="jiaoshigonghao">
						<el-input class="list_inp" v-model="form.jiaoshigonghao" placeholder="教师工号"
							 type="text" 							:readonly="!isAdd||disabledForm.jiaoshigonghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="教师姓名" prop="jiaoshixingming">
						<el-input class="list_inp" v-model="form.jiaoshixingming" placeholder="教师姓名"
							 type="text" 							:readonly="!isAdd||disabledForm.jiaoshixingming?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="学号" prop="xuehao">
						<el-input class="list_inp" v-model="form.xuehao" placeholder="学号"
							 type="text" 							:readonly="!isAdd||disabledForm.xuehao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="学生姓名" prop="xueshengxingming">
						<el-input class="list_inp" v-model="form.xueshengxingming" placeholder="学生姓名"
							 type="text" 							:readonly="!isAdd||disabledForm.xueshengxingming?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="队伍名称" prop="duiwumingcheng">
						<el-input class="list_inp" v-model="form.duiwumingcheng" placeholder="队伍名称"
							 type="text" 							:readonly="!isAdd||disabledForm.duiwumingcheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="比赛分数" prop="bisaifenshu">
						<el-input class="list_inp" v-model.number="form.bisaifenshu" placeholder="比赛分数"
							 type="text" 							:readonly="!isAdd||disabledForm.bisaifenshu?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="登记日期" prop="dengjiriqi">
						<el-date-picker
							class="list_date"
							v-model="form.dengjiriqi"
							format="YYYY-MM-DD HH:mm:ss"
							value-format="YYYY-MM-DD HH:mm:ss"
							type="datetime"
							style="width:100%;"
							:readonly="!isAdd||disabledForm.dengjiriqi?true:false"
							placeholder="请选择登记日期" />
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="比赛内容" prop="bisaineirong">
						<el-input v-model="form.bisaineirong" placeholder="比赛内容" type="textarea"
						:readonly="!isAdd||disabledForm.bisaineirong?true:false"
						/>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="获奖信息" prop="huojiangxinxi">
						<el-input v-model="form.huojiangxinxi" placeholder="获奖信息" type="textarea"
						:readonly="!isAdd||disabledForm.huojiangxinxi?true:false"
						/>
					</el-form-item>
				</el-col>
			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">取消</el-button>
				<el-button class="formModel_confirm" @click="save"
					type="success"
					>
					保存
				</el-button>
			</div>
		</el-form>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'bisaichengji'
	const formName = '比赛成绩'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//form表单
	const form = ref({
		bisaimingcheng: '',
		bisaileixing: '',
		bisaineirong: '',
		jiaoshigonghao: '',
		jiaoshixingming: '',
		xuehao: '',
		xueshengxingming: '',
		duiwumingcheng: '',
		bisaifenshu: '',
		dengjiriqi: '',
		huojiangxinxi: '',
		crossuserid: '',
		crossrefid: '',
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const disabledForm = ref({
		bisaimingcheng : false,
		bisaileixing : false,
		bisaineirong : false,
		jiaoshigonghao : false,
		jiaoshixingming : false,
		xuehao : false,
		xueshengxingming : false,
		duiwumingcheng : false,
		bisaifenshu : false,
		dengjiriqi : false,
		huojiangxinxi : false,
		crossuserid : false,
		crossrefid : false,
	})
	const isAdd = ref(false)
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		bisaimingcheng: [
		],
		bisaileixing: [
		],
		bisaineirong: [
		],
		jiaoshigonghao: [
		],
		jiaoshixingming: [
		],
		xuehao: [
		],
		xueshengxingming: [
		],
		duiwumingcheng: [
		],
		bisaifenshu: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		dengjiriqi: [
		],
		huojiangxinxi: [
		],
		crossuserid: [
		],
		crossrefid: [
		],
	})
	//methods

	//methods
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init = (formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null) => {
			form.value.dengjiriqi = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			// getInfo()
			for(let x in row){
				if(x=='bisaimingcheng'){
					form.value.bisaimingcheng = row[x];
					disabledForm.value.bisaimingcheng = true;
					continue;
				}
				if(x=='bisaileixing'){
					form.value.bisaileixing = row[x];
					disabledForm.value.bisaileixing = true;
					continue;
				}
				if(x=='bisaineirong'){
					form.value.bisaineirong = row[x];
					disabledForm.value.bisaineirong = true;
					continue;
				}
				if(x=='jiaoshigonghao'){
					form.value.jiaoshigonghao = row[x];
					disabledForm.value.jiaoshigonghao = true;
					continue;
				}
				if(x=='jiaoshixingming'){
					form.value.jiaoshixingming = row[x];
					disabledForm.value.jiaoshixingming = true;
					continue;
				}
				if(x=='xuehao'){
					form.value.xuehao = row[x];
					disabledForm.value.xuehao = true;
					continue;
				}
				if(x=='xueshengxingming'){
					form.value.xueshengxingming = row[x];
					disabledForm.value.xueshengxingming = true;
					continue;
				}
				if(x=='duiwumingcheng'){
					form.value.duiwumingcheng = row[x];
					disabledForm.value.duiwumingcheng = true;
					continue;
				}
				if(x=='bisaifenshu'){
					form.value.bisaifenshu = row[x];
					disabledForm.value.bisaifenshu = true;
					continue;
				}
				if(x=='dengjiriqi'){
					form.value.dengjiriqi = row[x];
					disabledForm.value.dengjiriqi = true;
					continue;
				}
				if(x=='huojiangxinxi'){
					form.value.huojiangxinxi = row[x];
					disabledForm.value.huojiangxinxi = true;
					continue;
				}
				if(x=='crossuserid'){
					form.value.crossuserid = row[x];
					disabledForm.value.crossuserid = true;
					continue;
				}
				if(x=='crossrefid'){
					form.value.crossrefid = row[x];
					disabledForm.value.crossrefid = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
		}
		context?.$http({
			url: `${context?.$toolUtil.storageGet('frontSessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('xuehao') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.xuehao = json.xuehao
				disabledForm.value.xuehao = true;
			}
			if(json.hasOwnProperty('xueshengxingming') && context?.$toolUtil.storageGet("frontRole")!="管理员"){
				form.value.xueshengxingming = json.xueshengxingming
				disabledForm.value.xueshengxingming = true;
			}
		})
	}
	//初始化
	//取消
	const backClick = () => {
		history.back()
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									history.back()
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							history.back()
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
	onMounted(()=>{
		type.value = route.query.type?route.query.type:'add'
		let row = null
		let table = null
		let statusColumnName = null
		let tips = null
		let statusColumnValue = null
		if(type.value == 'cross'){
			row = context?.$toolUtil.storageGet('crossObj')?JSON.parse(context?.$toolUtil.storageGet('crossObj')):{}
			table = context?.$toolUtil.storageGet('crossTable')
			statusColumnName = context?.$toolUtil.storageGet('crossStatusColumnName')
			tips = context?.$toolUtil.storageGet('crossTips')
			statusColumnValue = context?.$toolUtil.storageGet('crossStatusColumnValue')
		}
		init(route.query.id?route.query.id:null, type.value,'', row, table, statusColumnName, tips, statusColumnValue)
	})
	
</script>
<style lang="scss" scoped>
	// 面包屑盒子
	.bread_view {
		border-radius: 0px;
		padding: 0px 20px 10px;
		margin: 0px auto;
		background: none;
		width: calc(100% - 0px);
		border-color: #66666650;
		border-width: 0 0 1px;
		position: relative;
		border-style: solid;
		:deep(.breadcrumb) {
			font-size: 14px;
			line-height: 1;
			.el-breadcrumb__separator {
				margin: 0 9px;
				color: #333;
				font-weight: 500;
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
		}
	}
	// 表单
	.add_form{
		border: 0px solid #27bacc30;
		border-radius: 0px;
		padding: 30px 7%;
		background: none;
		// form item
		:deep(.el-form-item) {
			border: 0px solid #eee;
			padding: 6px 0;
			margin: 0 0 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 display: block;
			 width: auto;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 150px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					padding: 0 10px;
					background: #fff;
					width: 100%;
					border-color: #ddd;
					border-width: 1px;
					line-height: 36px;
					box-sizing: border-box;
					border-style: solid;
					min-width: 350px;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				//日期选择器
				.list_date {
					border-radius: 0px;
					background: #fff;
					width: 100%;
					border-color: #ddd;
					border-width: 1px;
					line-height: 36px;
					box-sizing: border-box;
					border-style: solid;
					min-width: 300px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid #ddd;
					border-radius: 2px;
					padding: 12px;
					color: #666;
					background: #fff;
					width: 100%;
					font-size: 14px;
					min-height: 120px;
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		padding: 0 150px;
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 2px;
			padding: 0 40px;
			margin: 0 20px 0 0;
			color: #fff;
			background: #c00;
			width: auto;
			font-size: 14px;
			line-height: 40px;
			height: 40px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 2px;
			padding: 0 40px;
			margin: 0 20px 0 0;
			color: #fff;
			background: rgb(255, 153, 0);
			width: auto;
			font-size: 14px;
			line-height: 40px;
			height: 40px;
		}
		.formModel_confirm:hover {
		}
	}
</style>