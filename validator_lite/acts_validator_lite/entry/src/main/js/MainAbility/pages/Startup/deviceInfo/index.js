import router from '@system.router';
import device from '@system.device';

export default {
    data: {
        resultText: '',
        statusMsg: '',
    },

    clickAction() {
        let obj = this;
        try {
            device.getInfo({
                success: function(data) {
                    let str = 'brand: ' + data.brand + '\n' +
                            'manufacturer: ' + data.manufacturer + '\n' +
                            'model: ' + data.model + '\n' +
                            'product: ' + data.product + '\n' +
                            'language: ' + data.language + '\n' +
                            'region: ' + data.region + '\n' +
                            'windowHeight: ' + data.windowHeight + '\n' +
                            'windowWidth: ' + data.windowWidth + '\n' +
                            'screenDensity: ' + data.screenDensity + '\n' +
                            'screenShape: ' + data.screenShape + '\n' +
                            'apiVersion: ' + data.apiVersion + '\n' +
                            'deviceType: ' + data.deviceType;
                    obj.resultText = str;
                    obj.statusMsg = 'success';
                },
                fail: function(data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    getApp().data.testItems['api_deviceinfo'].errorDetail = 'getInfo fail: code=' + code + ', data=' + data;
                },
                complete: function() {
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_deviceinfo'].errorDetail = 'getInfo error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击获取信息按钮', result: '屏幕上显示设备信息', url: 'pages/Startup/deviceInfo/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_deviceinfo'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_deviceinfo'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
