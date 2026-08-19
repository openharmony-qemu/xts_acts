import router from '@system.router';
import configuration from '@system.configuration';

export default {
    data: {
        resultText: '',
        statusMsg: ''
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');
    },

    getInfo() {
        try {
            let info = configuration.getLocale();
            console.log(JSON.stringify(info));
            this.resultText = '语言: ' + info.language + '\n国家: ' + info.countryOrRegion + '\n文字布局方向: ' + info.dir;
            this.statusMsg = 'success';
        } catch (e) {
            console.error('getLocale error: ' + e);
            getApp().data.testItems.api_configuration.errorDetail = 'getLocale error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击获取信息', result: '正确显示应用当前的语言和地区', url: 'pages/ArkUI/configuration/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.api_configuration.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.api_configuration.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
