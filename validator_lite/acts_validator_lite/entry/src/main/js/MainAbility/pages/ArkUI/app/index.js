import router from '@system.router';
import app from '@system.app';

export default {
    data: {
        resultText: '',
        statusMsg: ''
    },

    onInit() {
    },

    getInfo() {
        try {
            let info = app.getInfo();
            this.resultText = '名称: ' + info.appName + '\n版本名称: ' + info.versionName + '\n版本号: ' + info.versionCode;
            this.statusMsg = 'success';
        } catch (e) {
            console.error('error: ' + e);
            this.statusMsg = 'error: ' + e;
        }
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击获取信息按钮', result: '获取信息按钮正确显示应用信息', url: 'pages/ArkUI/app/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_app'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_app'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
