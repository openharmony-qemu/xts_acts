import router from '@system.router';
import brightness from '@system.brightness';

export default {
    data: {
        value: 0,
        getValue : 0,
        statusMsg: '',
        supported: false,
        tipMsg: '',
    },

    onInit() {
        this.supported = canIUse('SystemCapability.PowerManager.DisplayPowerManager.Lite');
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            getApp().data.testItems['api_brightness_value'].errorDetail = 'unsupported: SystemCapability.PowerManager.DisplayPowerManager.Lite';
        }
    },

    getBrightnessValue() {
        let obj = this;
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
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
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
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
        getApp().data.helpData = {
            step: '进入页面自动通过 canIUse 检测 SystemCapability.PowerManager.DisplayPowerManager.Lite；支持时点击获取亮度按钮或拖动滑动条，不支持时直接点 back 跳过',
            result: '获取/调节亮度显示 success → 点 pass；报错 → 点 fail；设备不支持该能力 → 点 back（记为 untested）',
            url: 'pages/PowerManager/brightness/value/index'
        };
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
