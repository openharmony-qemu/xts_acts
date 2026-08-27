import router from '@system.router';
import brightness from '@system.brightness';

export default {
    data: {
        value: 0,
        getValue : 0,
        statusMsg: '',
    },

    onInit() {
    },

    getBrightnessValue() {
        let obj = this;
        try {
            brightness.getValue({
                success: function (data) {
                    obj.getValue = data.value;
                    this.value = this.getValue;
                    obj.statusMsg = 'success';
                },
                fail: function (data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    getApp().data.testItems['api_brightness_value'].errorDetail = 'getValue fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_brightness_value'].errorDetail = 'getValue error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    clickSlider() {
        this.setBrightness(this.value);
    },

    valueChange(value) {
        this.value = value.progress;
        this.setBrightness(this.value);
    },

    setBrightness(value) {
        let obj = this;
        try {
            brightness.setValue({
                value: value,
                success: function () {
                    obj.statusMsg = 'success';
                },
                fail: function (data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
                    getApp().data.testItems['api_brightness_value'].errorDetail = 'setValue fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_brightness_value'].errorDetail = 'setValue error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    onDestroy() {
    },

    helpClicked() {
        getApp().data.helpData = { step: '获取亮度、拖动滑动条', result: '获取亮度值，调节滑动条屏幕明暗变化', url: 'pages/PowerManager/brightness/value/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/PowerManager/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_brightness_value'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_brightness_value'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
