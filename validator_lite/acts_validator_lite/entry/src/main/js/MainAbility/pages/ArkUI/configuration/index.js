import router from '@system.router';
import configuration from '@system.configuration';

export default {
    data: {
        resultText: '',
        statusMsg: '',
        supported: false,
        tipMsg: '',
    },

    onInit() {
        this.supported = canIUse('SystemCapability.ArkUI.ArkUI.Lite');
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.ArkUI.ArkUI.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            getApp().data.testItems['api_configuration'].errorDetail = 'unsupported: SystemCapability.ArkUI.ArkUI.Lite';
        }
    },

    onDestroy() {
    },

    getInfo() {
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.ArkUI.ArkUI.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
        try {
            let info = configuration.getLocale();
            this.resultText = '语言: ' + info.language + '\n国家: ' + info.countryOrRegion + '\n文字布局方向: ' + info.dir;
            this.statusMsg = 'success';
        } catch (e) {
            console.error('getLocale error: ' + e);
            getApp().data.testItems['api_configuration'].errorDetail = 'getLocale error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    helpClicked() {
        getApp().data.helpData = {
            step: '进入页面自动通过 canIUse 检测 SystemCapability.ArkUI.ArkUI.Lite；支持时点击获取信息按钮，不支持时直接点 back 跳过',
            result: '显示语言/国家/布局方向 success → 点 pass；获取报错 → 点 fail；设备不支持该能力 → 点 back（记为 untested）',
            url: 'pages/ArkUI/configuration/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/ArkUI/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_configuration'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_configuration'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
