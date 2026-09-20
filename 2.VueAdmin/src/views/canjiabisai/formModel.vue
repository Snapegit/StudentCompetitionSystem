<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="比赛名称" prop="bisaimingcheng">
							<el-input class="list_inp" v-model="form.bisaimingcheng" placeholder="比赛名称"
								 type="text" 								:readonly="!isAdd||disabledForm.bisaimingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="比赛类型" prop="bisaileixing">
							<el-input class="list_inp" v-model="form.bisaileixing" placeholder="比赛类型"
								 type="text" 								:readonly="!isAdd||disabledForm.bisaileixing?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="比赛地点" prop="bisaididian">
							<el-input class="list_inp" v-model="form.bisaididian" placeholder="比赛地点"
								 type="text" 								:readonly="!isAdd||disabledForm.bisaididian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="作品名称" prop="zuopinmingcheng">
							<el-input class="list_inp" v-model="form.zuopinmingcheng" placeholder="作品名称"
								 type="text" 								:readonly="!isAdd||disabledForm.zuopinmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="作品详情" prop="zuopinxiangqing">
							<uploads
								:disabled="!isAdd||disabledForm.zuopinxiangqing?true:false"
								type="file"
								action="file/upload" 
								tip="请上传作品详情" 
								:limit="1" 
								style="width: 100%;text-align: left;"
								:fileUrls="form.zuopinxiangqing?form.zuopinxiangqing:''" 
								@change="zuopinxiangqingUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="教师工号" prop="jiaoshigonghao">
							<el-input class="list_inp" v-model="form.jiaoshigonghao" placeholder="教师工号"
								 type="text" 								:readonly="!isAdd||disabledForm.jiaoshigonghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="教师姓名" prop="jiaoshixingming">
							<el-input class="list_inp" v-model="form.jiaoshixingming" placeholder="教师姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.jiaoshixingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="学号" prop="xuehao">
							<el-input class="list_inp" v-model="form.xuehao" placeholder="学号"
								 type="text" 								:readonly="!isAdd||disabledForm.xuehao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="学生姓名" prop="xueshengxingming">
							<el-input class="list_inp" v-model="form.xueshengxingming" placeholder="学生姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.xueshengxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="队伍名称" prop="duiwumingcheng">
							<el-input class="list_inp" v-model="form.duiwumingcheng" placeholder="队伍名称"
								 type="text" 								:readonly="!isAdd||disabledForm.duiwumingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="参加时间" prop="canjiashijian">
							<el-date-picker
								class="list_date"
								v-model="form.canjiashijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.canjiashijian?true:false"
								placeholder="请选择参加时间" />
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'canjiabisai'
	const formName = '参加比赛'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		bisaimingcheng : false,
		bisaileixing : false,
		bisaididian : false,
		zuopinmingcheng : false,
		zuopinxiangqing : false,
		jiaoshigonghao : false,
		jiaoshixingming : false,
		xuehao : false,
		xueshengxingming : false,
		duiwumingcheng : false,
		canjiashijian : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
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
		bisaididian: [
		],
		zuopinmingcheng: [
		],
		zuopinxiangqing: [
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
		canjiashijian: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//作品详情上传回调
	const zuopinxiangqingUploadSuccess=(e)=>{
		form.value.zuopinxiangqing = e
	}
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			bisaimingcheng: '',
			bisaileixing: '',
			bisaididian: '',
			zuopinmingcheng: '',
			zuopinxiangqing: '',
			jiaoshigonghao: '',
			jiaoshixingming: '',
			xuehao: '',
			xueshengxingming: '',
			duiwumingcheng: '',
			canjiashijian: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.canjiashijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
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
				if(x=='bisaididian'){
					form.value.bisaididian = row[x];
					disabledForm.value.bisaididian = true;
					continue;
				}
				if(x=='zuopinmingcheng'){
					form.value.zuopinmingcheng = row[x];
					disabledForm.value.zuopinmingcheng = true;
					continue;
				}
				if(x=='zuopinxiangqing'){
					form.value.zuopinxiangqing = row[x];
					disabledForm.value.zuopinxiangqing = true;
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
				if(x=='canjiashijian'){
					form.value.canjiashijian = row[x];
					disabledForm.value.canjiashijian = true;
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
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('xuehao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.xuehao = json.xuehao
				disabledForm.value.xuehao = true;
			}
			if(json.hasOwnProperty('xueshengxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.xueshengxingming = json.xueshengxingming
				disabledForm.value.xueshengxingming = true;
			}
			if(json.hasOwnProperty('duiwumingcheng')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.duiwumingcheng = json.duiwumingcheng
				disabledForm.value.duiwumingcheng = true;
			}
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.zuopinxiangqing!=null) {
			form.value.zuopinxiangqing = form.value.zuopinxiangqing.replace(new RegExp(context?.$config.url,"g"),"");
		}
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
									formVisible.value = false
									emit('formModelChange')
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
							formVisible.value = false
							emit('formModelChange')
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
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 0px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #139666;
					border-radius: 0px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
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
					border: 1px solid #139666;
					border-radius: 0px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				//文件上传样式
				.upload-demo {
					width: 100%;
					//外部盒子
					.el-upload-dragger {
						border: 1px solid #139666;
						cursor: pointer;
						background-color: #fff;
						border-radius: 0px;
						overflow: hidden;
						width: 360px;
						box-sizing: border-box;
						text-align: center;
						height: auto;
					}
					//图标
					.el-icon--upload {
						margin: 0;
						color: #139666;
						font-size: 48px;
						line-height: 48px;
					}
					//提示文字
					.el-upload__text {
						margin: 0px 0 0;
						color: #999;
						font-size: 14px;
						em {
							color: #139666;
						}
					}
					//提示文字
					.el-upload__tip {
						margin: 0px 0 0;
						color: #999;
						font-size: 14px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: #999;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: #139666;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
		}
	}
</style>