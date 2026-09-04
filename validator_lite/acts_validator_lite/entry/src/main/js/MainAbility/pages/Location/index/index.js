import router from '@system.router';
import geolocation from '@system.geolocation';

export default {
    data: {
        supported: false,
        infoResult: '',
        infoMsg: '',
        infoTip: '',
        subResult: '',
        subMsg: '',
        subTip: '',
        iPassColor: '#555555', iFailColor: '#555555',
        sPassColor: '#555555', sFailColor: '#555555'
    },
    onInit() {
        this.supported = canIUse('SystemCapability.Location.Location.Lite');
        if (!this.supported) {
            var tip = '当前设备不支持 SystemCapability.Location.Location.Lite，本用例跳过（勿点 pass/fail）';
            this.infoTip = tip;
            this.subTip = tip;
            this.infoMsg = 'unsupported';
            this.subMsg = 'unsupported';
            getApp().data.testItems['api_location_info'].errorDetail = 'unsupported: SystemCapability.Location.Location.Lite';
            getApp().data.testItems['api_location_subscribe'].errorDetail = 'unsupported: SystemCapability.Location.Location.Lite';
        }
    },
    onDestroy() { try { geolocation.unsubscribe(); } catch (e) {} },
    _fmt(d) { return '经度:' + d.longitude + ' 纬度:' + d.latitude + ' 海拔:' + d.altitude + ' 精度:' + d.accuracy + ' 时间:' + d.time; },
    getLocationInfo() {
        if (!this.supported) { this.infoMsg = '当前设备不支持 SystemCapability.Location.Location.Lite'; return; }
        let obj = this;
        try { geolocation.getLocation({ success: function (d) { obj.infoResult = obj._fmt(d); obj.infoMsg = 'success'; }, fail: function (d, c) { obj.infoMsg = 'fail code: ' + c; getApp().data.testItems['api_location_info'].errorDetail = 'getLocation fail, code: ' + c; } }); } catch (e) { this.infoMsg = 'error: ' + e; }
    },
    getLocationType() {
        if (!this.supported) { this.infoMsg = '当前设备不支持 SystemCapability.Location.Location.Lite'; return; }
        let obj = this;
        try { geolocation.getLocationType({ success: function (d) { obj.infoResult = '定位类型: ' + d.types[0]; obj.infoMsg = 'success'; }, fail: function (d, c) { obj.infoMsg = 'fail code: ' + c; getApp().data.testItems['api_location_info'].errorDetail = 'getLocationType fail, code: ' + c; } }); } catch (e) { this.infoMsg = 'error: ' + e; }
    },
    getSupportedCoordType() {
        if (!this.supported) { this.infoMsg = '当前设备不支持 SystemCapability.Location.Location.Lite'; return; }
        try { let types = geolocation.getSupportedCoordTypes(); this.infoResult = '坐标系: ' + types.join(','); this.infoMsg = 'success'; } catch (e) { this.infoMsg = 'error: ' + e; getApp().data.testItems['api_location_info'].errorDetail = 'getSupportedCoordTypes error: ' + e; }
    },
    subscribe() {
        if (!this.supported) { this.subMsg = '当前设备不支持 SystemCapability.Location.Location.Lite'; return; }
        let obj = this;
        try { geolocation.subscribe({ success: function (d) { obj.subResult = obj._fmt(d); obj.subMsg = 'success'; }, fail: function (d, c) { obj.subMsg = 'fail code: ' + c; getApp().data.testItems['api_location_subscribe'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.subMsg = 'error: ' + e; }
    },
    unsubscribe() { if (!this.supported) { return; } try { geolocation.unsubscribe(); this.subMsg = 'unsubscribed'; } catch (e) { this.subMsg = 'error: ' + e; } },
    passInfo() { if (getApp().data.testItems['api_location_info'].status === 'pass') { getApp().data.testItems['api_location_info'].status = 'null'; this.iPassColor = '#555555'; this.iFailColor = '#555555'; } else { getApp().data.testItems['api_location_info'].status = 'pass'; this.iPassColor = '#4caf50'; this.iFailColor = '#555555'; } },
    failInfo() { if (getApp().data.testItems['api_location_info'].status === 'fail') { getApp().data.testItems['api_location_info'].status = 'null'; this.iFailColor = '#555555'; this.iPassColor = '#555555'; } else { getApp().data.testItems['api_location_info'].status = 'fail'; this.iFailColor = '#f44336'; this.iPassColor = '#555555'; } },
    passSub() { if (getApp().data.testItems['api_location_subscribe'].status === 'pass') { getApp().data.testItems['api_location_subscribe'].status = 'null'; this.sPassColor = '#555555'; this.sFailColor = '#555555'; } else { getApp().data.testItems['api_location_subscribe'].status = 'pass'; this.sPassColor = '#4caf50'; this.sFailColor = '#555555'; } },
    failSub() { if (getApp().data.testItems['api_location_subscribe'].status === 'fail') { getApp().data.testItems['api_location_subscribe'].status = 'null'; this.sFailColor = '#555555'; this.sPassColor = '#555555'; } else { getApp().data.testItems['api_location_subscribe'].status = 'fail'; this.sFailColor = '#f44336'; this.sPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = {
            step: '本页合并 2 项定位测试。进入自动 canIUse 检测；不支持时各测试点显示不支持信息。支持时：定位信息点获取位置/类型/坐标系；定位订阅点订阅/取消。上下滑动查看，完成后点底部 back。',
            result: '2 项 pass/fail 分别上报 api_location_info、api_location_subscribe。',
            url: 'pages/Location/index/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
