import router from '@system.router';
import battery from '@system.battery';

export default {
    data: {
        level: 0,
        statusMsg: '',
        supported: false,
        tipMsg: '',
    },

    onInit() {
        this.supported = canIUse('SystemCapability.PowerManager.BatteryManager.Lite');
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.BatteryManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            getApp().data.testItems['api_battery'].errorDetail = 'unsupported: SystemCapability.PowerManager.BatteryManager.Lite';
        }
    },

    onDestroy() {
    },

    getInfo() {
        let obj = this;
        if (!this.supported) {
            this.statusMsg = '当前设备不支持 SystemCapability.PowerManager.BatteryManager.Lite';
            this.tipMsg = '设备不支持该能力，本用例跳过，请点 back 返回（勿点 pass/fail）';
            return;
        }
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
        getApp().data.helpData = {
            step: '进入页面自动通过 canIUse 检测 SystemCapability.PowerManager.BatteryManager.Lite；支持时点击获取电量按钮，不支持时直接点 back 跳过',
            result: '获取电量显示 success → 点 pass；获取报错 → 点 fail；设备不支持该能力 → 点 back（记为 untested）',
            url: 'pages/PowerManager/battery/index'
        };
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
