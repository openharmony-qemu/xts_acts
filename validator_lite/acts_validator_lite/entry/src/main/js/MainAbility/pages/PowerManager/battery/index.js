import router from '@system.router';
import battery from '@system.battery';

export default {
    data: {
        level: 0,
        statusMsg: '',
    },

    onInit() {
    },

    onDestroy() {
    },

    getInfo() {
        let obj = this;
        try {
            battery.getStatus({
                success: function (data) {
                    obj.level = data.level * 100;
                    obj.statusMsg = 'success';
                },
                fail: function (data, code) {
                    obj.statusMsg = 'fail code: ' + code;
                    getApp().data.testItems['api_battery'].errorDetail = 'getStatus fail: code=' + code + ', data=' + data;
                }
            });
        } catch (e) {
            console.error('error: ' + e);
            getApp().data.testItems['api_battery'].errorDetail = 'getStatus error: ' + e;
            this.statusMsg = 'error: ' + e;
        }
    },

    helpClicked() {
        getApp().data.helpData = { step: '点击获取电量', result: '显示当前设备的电量百分值', url: 'pages/PowerManager/battery/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() {
        router.replace({ uri: 'pages/PowerManager/common/index/index' });
    },
    passClicked() {
        getApp().data.testItems['api_battery'].status = 'pass';
        this.back();
    },
    failClicked() {
        getApp().data.testItems['api_battery'].status = 'fail';
        this.back();
    },
    backClicked() {
        this.back();
    }
};
