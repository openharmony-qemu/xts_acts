import router from '@system.router';
import brightness from '@system.brightness';

export default {
    data: {
        modeType: '',
        modeStr: ['手动调', '自动调'],
        keepScreen: true,
        statusMsg: '',
        supported: false,
        tipMsg: '',
    },

    onInit() {
        this.supported = canIUse('SystemCapability.PowerManager.DisplayPowerManager.Lite');
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            getApp().data.testItems['api_brightness_mode'].errorDetail = 'unsupported: SystemCapability.PowerManager.DisplayPowerManager.Lite';
        }
    },

    getBrightnessMode() {
        let obj = this;
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
        try {
            brightness.getMode({
                success: function (data) {
                    obj.modeType = obj.modeStr[data.mode];
                    obj.statusMsg = 'success';
                },
                fail: function (data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    getApp().data.testItems['api_brightness_mode'].errorDetail = 'getMode fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_brightness_mode'].errorDetail = 'getMode error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    setBrightnessMode(mode) {
        let obj = this;
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
        try {
            brightness.setMode({
                mode: mode,
                success() {
                    obj.statusMsg = 'success';
                    obj.getBrightnessMode();
                },
                fail(data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
                    getApp().data.testItems['api_brightness_mode'].errorDetail = 'setMode fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_brightness_mode'].errorDetail = 'setMode error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    keepScreenChange() {
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
        this.keepScreen = !this.keepScreen;
        let obj = this;
        try {
            brightness.setKeepScreenOn({
                keepScreenOn: obj.keepScreen,
                success() {
                    obj.statusMsg = 'success';
                },
                fail(data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
                    getApp().data.testItems['api_brightness_mode'].errorDetail = 'setKeepScreenOn fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_brightness_mode'].errorDetail = 'setKeepScreenOn error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    onDestroy() {
    },

    helpClicked() {
        getApp().data.helpData = {
            step: '进入页面自动通过 canIUse 检测 SystemCapability.PowerManager.DisplayPowerManager.Lite；支持时获取模式、切换模式、拨动常亮开关，不支持时直接点 back 跳过',
            result: '各操作显示 success → 点 pass；报错 → 点 fail；设备不支持该能力 → 点 back（记为 untested）',
            url: 'pages/PowerManager/brightness/mode/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/PowerManager/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_brightness_mode'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_brightness_mode'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
