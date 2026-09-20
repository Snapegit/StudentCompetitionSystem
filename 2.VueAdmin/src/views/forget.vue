<template>
	<div>
		<div class="forget_view">
			<el-form :model="forgetForm" class="forget_box">
				<div class="forget_title">学生竞赛管理系统{{pageType==1?'找回密码':pageType==2?'输入密保':'重置密码'}}</div>
				<div class="tab_line">
					<div class="line"></div>
					<div class="num_line">
						<div class="line_number" :class="pageType==1?'line_number1':'',pageType>1?'line_number2':''"><div class="number" v-if="pageType<2">1</div><el-icon v-else><Check /></el-icon></div>
						<div class="line_number" :class="pageType==2?'line_number1':'',pageType>2?'line_number2':''"><div class="number" v-if="pageType<3">2</div><el-icon v-else><Check /></el-icon></div>
						<div class="line_number" :class="pageType==3?'line_number1':''"><div class="number">3</div></div>
					</div>
				</div>
				<div class="list_item" v-if="pageType==1">
					<div class="item_label">账号：</div>
					<el-input class="list_inp" v-model="forgetForm.username" placeholder="请输入账号" />
				</div>
				<div class="list_item" v-if="pageType==2">
					<div class="item_label">密保问题：</div>
					<el-input class="list_inp" v-model="userForm.pquestion" placeholder="请输入密保问题" />
				</div>
				<div class="list_item" v-if="pageType==2">
					<div class="item_label">密保答案：</div>
					<el-input class="list_inp" v-model="forgetForm.myanswer" placeholder="请输入密保答案" />
				</div>
				<div class="list_item" v-if="pageType==3">
					<div class="item_label">密码：</div>
					<el-input class="list_inp" v-model="forgetForm.mima" type="password" placeholder="请输入密码" />
				</div>
				<div class="list_item" v-if="pageType==3">
					<div class="item_label">确认密码：</div>
					<el-input class="list_inp" v-model="forgetForm.mima2" type="password" placeholder="请输入确认密码" />
				</div>
				<div class="list_btn">
					<el-button v-if="pageType==1" type="success" @click="getSecurity">获取密保</el-button>
					<el-button v-if="pageType==2" type="primary" @click="validateSecurity">确认密保</el-button>
					<el-button v-if="pageType==3" type="warning" @click="updatePassword">重置密码</el-button>
					<div class="r-login" @click="close">已有账号，直接登录</div>
				</div>
			</el-form>
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const pageType = ref(1)
	const forgetForm = ref({})
	const userForm = ref({})
    //获取密保问题
    const getSecurity=()=>{
            forgetForm.value.role = 'jiaoshi'
		if(!forgetForm.value.role) {
		    context?.$toolUtil.message('请选择角色','error');
		    return false
		}
		if(!forgetForm.value.username){
			context?.$toolUtil.message('请输入账号','error');
		    return false
		}
		context?.$http({
			url:forgetForm.value.role + `/security?username=${forgetForm.value.username}`,
			method:'get',
		}).then(res=>{
			if(res.data.data){
				userForm.value = res.data.data
				pageType.value = 2
			}else{
				context?.$toolUtil.message('未获取到用户信息','error');
			}
		})
	}
	//验证密保问题
	const validateSecurity=()=>{
		if(userForm.value.panswer != forgetForm.value.myanswer){
			context?.$toolUtil.message('答案输入不正确','error');
			return false
		}
		context?.$toolUtil.message('答案正确','success',()=>{
			pageType.value = 3
		})
	}
	const updatePassword=()=>{
		if(forgetForm.value.mima!=forgetForm.value.mima2){
			context?.$toolUtil.message('两次密码输入不一致','error')
			return false
		}
		userForm.value.mima = forgetForm.value.mima
		userForm.value.password = forgetForm.value.mima
		context?.$http({
			url:forgetForm.value.role + `/update`,
			method:'post',
			data:userForm.value
		}).then(res=>{
			context?.$toolUtil.message('修改密码成功','success',obj=>{
				close()
			});
		})
	}
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
</script>

<style lang="scss" scoped>
	.forget_view {
		background-repeat: no-repeat;
		flex-direction: column;
		background-size: 100% 100%;
		background: url(http://clfile.zggen.cn/20231117/af5c8c517fa9421dad15d3669b128dec.jpg) no-repeat center center / cover;
		display: flex;
		min-height: 100vh;
		justify-content: center;
		align-items: center;
		position: relative;
		background-position: center center;
		// 表单盒子
		.forget_box {
			border-radius: 0px;
			padding: 30px 20px;
			margin: 0 auto;
			clip-path: polygon(95% 0, 100% 5%, 100% 100%, 0% 100%, 0 5%, 5% 0);
			background: #fff;
			display: flex;
			width: 30vw;
			justify-content: flex-start;
			flex-wrap: wrap;
			// 标题
			.forget_title {
				padding: 0px;
				margin: 0 auto 20px;
				color: #19a97b;
				font-weight: 500;
				width: 80%;
				font-size: 23px;
				text-align: center;
			}
			// tab
			// 盒子
			.tab_line{
				padding: 30px 0;
				flex-direction: column;
				display: flex;
				width: 100%;
				align-items: center;
				// 中间线
				.line{
				background: #19a97b30;
				width: 80%;
				height: 3px;
				}
				// item盒子
				.num_line{
					margin: -20px 0 0;
					display: flex;
					width: 80%;
					justify-content: space-between;
					align-items: center;
					height: 40px;
					// 默认样式
					.line_number{
						border: 4px solid #ddd;
						border-radius: 50%;
						color: #aaa;
						background: #eee;
						display: flex;
						width: 40px;
						font-size: 18px;
						justify-content: center;
						align-items: center;
						height: 40px;
					}
					// 选中样式
					.line_number1{
						color: #39c8c9;
						font-size: 22px;
						border-color: #39c8c9;
					}
					// 完成样式
					.line_number2{
						color: #19a97b;
						border-color: #19a97b;
					}
				}
			}
			// item
			.list_item {
				margin: 10px auto;
				display: flex;
				width: 80%;
				justify-content: flex-start;
				align-items: center;
				// label
				.item_label {
					background: #19a97b10;
					display: block;
					width: 130px;
					font-size: 14px;
					line-height: 36px;
					box-sizing: border-box;
					text-align: right;
					height: 36px;
				}
				// 输入框
				:deep(.list_inp) {
					border: 0px solid #ddd;
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: #19a97b10;
					width: 80%;
					line-height: 36px;
					box-sizing: border-box;
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
			}
			// 按钮盒子
			.list_btn {
				margin: 20px auto 0;
				display: flex;
				width: 80%;
				justify-content: center;
				align-items: center;
				flex-wrap: wrap;
				// 获取密保
				:deep(.el-button--success) {
					border: 0;
					cursor: pointer;
					border-radius: 0px;
					padding: 0 40px;
					margin: 0 10px 0 0;
					color: #fff;
					background: #19a97b;
					width: auto;
					font-size: 14px;
					height: 36px;
				}
				// 获取密保悬浮
				:deep(.el-button--success:hover) {
				}
				// 确认密保
				:deep(.el-button--primary) {
					border: 0;
					cursor: pointer;
					border-radius: 0px;
					padding: 0 40px;
					margin: 0 10px 0 0;
					outline: none;
					color: #fff;
					background: #19a97b;
					width: auto;
					font-size: 14px;
					height: 36px;
				}
				// 确认密保悬浮
				:deep(.el-button--primary:hover) {
				}
				// 重置密码
				:deep(.el-button--warning) {
					border: 0;
					cursor: pointer;
					border-radius: 0px;
					padding: 0 40px;
					margin: 0 10px 0 0;
					outline: none;
					color: #fff;
					background: #19a97b;
					width: auto;
					font-size: 14px;
					height: 36px;
				}
				// 重置密码悬浮
				:deep(.el-button--warning:hover) {
				}
				.r-login {
					cursor: pointer;
					padding: 10px 0 0;
					color: #999;
					width: 100%;
					font-size: 14px;
					text-align: right;
				}
			}
		}
	}

	
</style>
