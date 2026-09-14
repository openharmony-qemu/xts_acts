import router from '@system.router';
import battery from '@system.battery';
import brightness from '@system.brightness';

export default {
    data: {
        batSupported: false, batTip: '', batLevel: 0, batStatus: '',
        brSupported: false, brTip: '', bvValue: 0, bvGetValue: 0, bvStatus: '',
        bmModeType: '', bmModeStr: ['手动调', '自动调'], bmKeepScreen: true, bmStatus: '',
        batPassColor: '#555555', batFailColor: '#555555',
        bvPassColor: '#555555', bvFailColor: '#555555',
        bmPassColor: '#555555', bmFailColor: '#555555'
    },
    onInit() {
        this.batSupported = canIUse('SystemCapability.PowerManager.BatteryManager.Lite');
        if (!this.batSupported) {
            this.batTip = '当前设备不支持 SystemCapability.PowerManager.BatteryManager.Lite，本用例跳过（勿点 pass/fail）';
            getApp().data.testItems['api_battery'].errorDetail = 'unsupported: SystemCapability.PowerManager.BatteryManager.Lite';
        }
        this.brSupported = canIUse('SystemCapability.PowerManager.DisplayPowerManager.Lite');
        if (!this.brSupported) {
            this.brTip = '当前设备不支持 SystemCapability.PowerManager.DisplayPowerManager.Lite，本用例跳过（勿点 pass/fail）';
            getApp().data.testItems['api_brightness_value'].errorDetail = 'unsupported: SystemCapability.PowerManager.DisplayPowerManager.Lite';
            getApp().data.testItems['api_brightness_mode'].errorDetail = 'unsupported: SystemCapability.PowerManager.DisplayPowerManager.Lite';
        }
    },
    getBatInfo() {
        if (!this.batSupported) { this.batStatus = '当前设备不支持'; return; }
        let o = this;
        try { battery.getStatus({ success: function (d) { o.batLevel = d.level * 100; o.batStatus = 'success'; }, fail: function (d, c) { o.batStatus = 'fail code: ' + c; getApp().data.testItems['api_battery'].errorDetail = 'getStatus fail: code=' + c; } }); } catch (e) { this.batStatus = 'error: ' + e; }
    },
    getBrightnessValue() {
        if (!this.brSupported) { this.bvStatus = '当前设备不支持'; return; }
        let o = this;
        try { brightness.getValue({ success: function (d) { o.bvGetValue = d.value; o.bvValue = o.bvGetValue; o.bvStatus = 'success'; }, fail: function (d, c) { o.bvStatus = 'fail code: ' + c; getApp().data.testItems['api_brightness_value'].errorDetail = 'getValue fail: code=' + c; } }); } catch (e) { this.bvStatus = 'error: ' + e; }
    },
    bvClickSlider() { this.bvSetBrightness(this.bvValue); },
    bvValueChange(v) { this.bvValue = v.progress; this.bvSetBrightness(this.bvValue); },
    bvSetBrightness(v) {
        if (!this.brSupported) { this.bvStatus = '当前设备不支持'; return; }
        let o = this;
        try { brightness.setValue({ value: v, success: function () { o.bvStatus = 'success'; }, fail: function (d, c) { o.bvStatus = 'fail code: ' + c; getApp().data.testItems['api_brightness_value'].errorDetail = 'setValue fail: code=' + c; } }); } catch (e) { this.bvStatus = 'error: ' + e; }
    },
    getBrightnessMode() {
        if (!this.brSupported) { this.bmStatus = '当前设备不支持'; return; }
        let o = this;
        try { brightness.getMode({ success: function (d) { o.bmModeType = o.bmModeStr[d.mode]; o.bmStatus = 'success'; }, fail: function (d, c) { o.bmStatus = 'fail code: ' + c; getApp().data.testItems['api_brightness_mode'].errorDetail = 'getMode fail: code=' + c; } }); } catch (e) { this.bmStatus = 'error: ' + e; }
    },
    setBrightnessMode(mode) {
        if (!this.brSupported) { this.bmStatus = '当前设备不支持'; return; }
        let o = this;
        try { brightness.setMode({ mode: mode, success: function () { o.bmStatus = 'success'; o.getBrightnessMode(); }, fail: function (d, c) { o.bmStatus = 'fail code: ' + c; getApp().data.testItems['api_brightness_mode'].errorDetail = 'setMode fail: code=' + c; } }); } catch (e) { this.bmStatus = 'error: ' + e; }
    },
    keepScreenChange() {
        if (!this.brSupported) { this.bmStatus = '当前设备不支持'; return; }
        this.bmKeepScreen = !this.bmKeepScreen;
        let o = this;
        try { brightness.setKeepScreenOn({ keepScreenOn: o.bmKeepScreen, success: function () { o.bmStatus = 'success'; }, fail: function (d, c) { o.bmStatus = 'fail code: ' + c; getApp().data.testItems['api_brightness_mode'].errorDetail = 'setKeepScreenOn fail: code=' + c; } }); } catch (e) { this.bmStatus = 'error: ' + e; }
    },
    passBat() { if (getApp().data.testItems['api_battery'].status === 'pass') { getApp().data.testItems['api_battery'].status = 'null'; this.batPassColor = '#555555'; this.batFailColor = '#555555'; } else { getApp().data.testItems['api_battery'].status = 'pass'; this.batPassColor = '#4caf50'; this.batFailColor = '#555555'; } },
    failBat() { if (getApp().data.testItems['api_battery'].status === 'fail') { getApp().data.testItems['api_battery'].status = 'null'; this.batFailColor = '#555555'; this.batPassColor = '#555555'; } else { getApp().data.testItems['api_battery'].status = 'fail'; this.batFailColor = '#f44336'; this.batPassColor = '#555555'; } },
    passBv() { if (getApp().data.testItems['api_brightness_value'].status === 'pass') { getApp().data.testItems['api_brightness_value'].status = 'null'; this.bvPassColor = '#555555'; this.bvFailColor = '#555555'; } else { getApp().data.testItems['api_brightness_value'].status = 'pass'; this.bvPassColor = '#4caf50'; this.bvFailColor = '#555555'; } },
    failBv() { if (getApp().data.testItems['api_brightness_value'].status === 'fail') { getApp().data.testItems['api_brightness_value'].status = 'null'; this.bvFailColor = '#555555'; this.bvPassColor = '#555555'; } else { getApp().data.testItems['api_brightness_value'].status = 'fail'; this.bvFailColor = '#f44336'; this.bvPassColor = '#555555'; } },
    passBm() { if (getApp().data.testItems['api_brightness_mode'].status === 'pass') { getApp().data.testItems['api_brightness_mode'].status = 'null'; this.bmPassColor = '#555555'; this.bmFailColor = '#555555'; } else { getApp().data.testItems['api_brightness_mode'].status = 'pass'; this.bmPassColor = '#4caf50'; this.bmFailColor = '#555555'; } },
    failBm() { if (getApp().data.testItems['api_brightness_mode'].status === 'fail') { getApp().data.testItems['api_brightness_mode'].status = 'null'; this.bmFailColor = '#555555'; this.bmPassColor = '#555555'; } else { getApp().data.testItems['api_brightness_mode'].status = 'fail'; this.bmFailColor = '#f44336'; this.bmPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = { step: '本页合并 3 项电源测试。进入自动 canIUse 检测；不支持时跳过。支持时（上下滑动查看）：电量点获取电量；亮度值拖动滑动条或点获取亮度；亮度模式获取/切换模式、拨动常亮开关。', result: '3 项 pass/fail 分别上报 api_battery、api_brightness_value、api_brightness_mode。', url: 'pages/PowerManager/power/index' };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
