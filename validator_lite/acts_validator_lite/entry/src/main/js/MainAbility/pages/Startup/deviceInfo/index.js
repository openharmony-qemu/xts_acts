import router from '@system.router';
import device from '@system.device';

export default {
    data: {
        resultText: '',
        statusMsg: '',
        dPassColor: '#555555', dFailColor: '#555555'
    },
    clickAction() {
        let obj = this;
        try {
            device.getInfo({
                success: function(data) {
                    obj.resultText = 'brand: ' + data.brand + '\n' +
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
                    obj.statusMsg = 'success';
                },
                fail: function(data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    getApp().data.testItems['api_deviceinfo'].errorDetail = 'getInfo fail: code=' + code + ', data=' + data;
                },
                complete: function() {}
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_deviceinfo'].errorDetail = 'getInfo error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },
    passD() { if (getApp().data.testItems['api_deviceinfo'].status === 'pass') { getApp().data.testItems['api_deviceinfo'].status = 'null'; this.dPassColor = '#555555'; this.dFailColor = '#555555'; } else { getApp().data.testItems['api_deviceinfo'].status = 'pass'; this.dPassColor = '#4caf50'; this.dFailColor = '#555555'; } },
    failD() { if (getApp().data.testItems['api_deviceinfo'].status === 'fail') { getApp().data.testItems['api_deviceinfo'].status = 'null'; this.dFailColor = '#555555'; this.dPassColor = '#555555'; } else { getApp().data.testItems['api_deviceinfo'].status = 'fail'; this.dFailColor = '#f44336'; this.dPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = { step: '点获取信息按钮，显示设备信息', result: '屏幕显示 brand/model/language 等', url: 'pages/Startup/deviceInfo/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
