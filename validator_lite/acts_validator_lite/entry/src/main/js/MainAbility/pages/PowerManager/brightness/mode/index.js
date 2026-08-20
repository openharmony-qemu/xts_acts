import router from '@system.router';
import brightness from '@system.brightness';

export default {
    data: {
        modeType: '',
        modeStr: ['手动调', '自动调'],
        keepScreen: true,
        statusMsg: '',
    },

    onInit() {
        console.info('onInit');
    },

    getBrightnessMode() {
        let obj = this;
        try {
            brightness.getMode({
                success: function (data) {
                    obj.modeType = obj.modeStr[data.mode];
                    obj.statusMsg = 'success';
                    console.info('success get brightness mode:' + data.mode);
                },
                fail: function (data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    console.info('get brightness fail, code: ' + code + ', data: ' + data);
                    getApp().data.testItems.api_brightness_mode.errorDetail = 'getMode fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems.api_brightness_mode.errorDetail = 'getMode error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    setBrightnessMode(mode) {
        let obj = this;
        try {
            brightness.setMode({
                mode: mode,
                success() {
                    obj.statusMsg = 'success';
                    console.info('set mode success mode: ' + mode);
                    obj.getBrightnessMode();
                },
                fail(data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
                    getApp().data.testItems.api_brightness_mode.errorDetail = 'setMode fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems.api_brightness_mode.errorDetail = 'setMode error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    keepScreenChange() {
        this.keepScreen = !this.keepScreen;
        let obj = this;
        try {
            brightness.setKeepScreenOn({
                keepScreenOn: obj.keepScreen,
                success() {
                    obj.statusMsg = 'success';
                    console.info('set keep screen on success');
                },
                fail(data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
                    getApp().data.testItems.api_brightness_mode.errorDetail = 'setKeepScreenOn fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems.api_brightness_mode.errorDetail = 'setKeepScreenOn error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    onDestroy() {
        console.info('onDestroy');
    },

    helpClicked() {
        getApp().data.helpData = { step: '获取模式、模式类型、常亮开关', result: '显示亮度模式，切换模式后变化', url: 'pages/PowerManager/brightness/mode/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/PowerManager/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems.api_brightness_mode.status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems.api_brightness_mode.status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
