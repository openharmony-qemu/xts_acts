import { imageFrames as frames } from '../../../common/js/general';
import { showPage } from '../../../common/js/swiper';
import router from '@system.router';
import app from '@system.app';
import configuration from '@system.configuration';

export default {
    data: {
        frames,
        animatorState: null,
        defaultTime: '',
        time: '',
        index: 0,
        aPassColor: '#555555', aFailColor: '#555555',
        pPassColor: '#555555', pFailColor: '#555555',
        sPassColor: '#555555', sFailColor: '#555555',
        switchStatus: false,
        iPassColor: '#555555', iFailColor: '#555555',
        stPassColor: '#555555', stFailColor: '#555555',
        lpColor: '#5265ef', lpFlag: false, lpPointX: 0, lpPointY: 0, lpTimeStamp: 0,
        spColor: '#5265ef', spFlag: false, spDirection: '', spDistance: 0, spPointX: 0, spPointY: 0, spTimeStamp: 0,
        lpPassColor: '#555555', lpFailColor: '#555555',
        spPassColor: '#555555', spFailColor: '#555555',
        appResult: '',
        appStatus: '',
        cfgResult: '',
        cfgStatus: '',
        cfgSupported: false,
        cfgTip: '',
        toValue: 'show',
        toStatus: '',
        toTimeoutId: -1,
        tiIndex: 0,
        tiStatus: '',
        tiIntervalID: -1,
        appPassColor: '#555555', appFailColor: '#555555',
        cfgPassColor: '#555555', cfgFailColor: '#555555',
        toPassColor: '#555555', toFailColor: '#555555',
        tiPassColor: '#555555', tiFailColor: '#555555'
    },
    onInit() {
        this.defaultTime = this.now();
        this.time = this.defaultTime;
        this.cfgSupported = canIUse('SystemCapability.ArkUI.ArkUI.Lite');
        if (!this.cfgSupported) {
            this.cfgStatus = '当前设备不支持 SystemCapability.ArkUI.ArkUI.Lite';
            this.cfgTip = '设备不支持该能力，本用例跳过（勿点 pass/fail）';
            getApp().data.testItems['api_configuration'].errorDetail = 'unsupported: SystemCapability.ArkUI.ArkUI.Lite';
        }
    },
    onDestroy() {
        try { clearTimeout(this.toTimeoutId); } catch (e) {}
        try { clearInterval(this.tiIntervalID); } catch (e) {}
    },
    showPage: showPage,
    handleStart() { let a = this.$refs.animator; a.start(); this.animatorState = a.getState(); },
    handlePause() { let a = this.$refs.animator; a.pause(); this.animatorState = a.getState(); },
    handleResume() { let a = this.$refs.animator; a.resume(); this.animatorState = a.getState(); },
    handleStop() { let a = this.$refs.animator; a.stop(); this.animatorState = a.getState(); },
    handleChange(data) { this.time = this.concat(data.hour, data.minute); },
    now() { let d = new Date(); return this.concat(d.getHours(), d.getMinutes()); },
    fill(v) { return (v > 9 ? '' : '0') + v; },
    concat(h, m) { return this.fill(h) + ':' + this.fill(m); },
    onSwitchChange(e) { this.switchStatus = e.checked; },
    longPressEvent(e) {
        if (this.lpFlag) { this.lpColor = 16766720; this.lpFlag = false; } else { this.lpColor = 32768; this.lpFlag = true; }
        this.lpPointX = e.globalX; this.lpPointY = e.globalY; this.lpTimeStamp = e.timestamp;
    },
    swipeEvent(e) {
        if (this.spFlag) { this.spColor = 16766720; this.spFlag = false; } else { this.spColor = 32768; this.spFlag = true; }
        this.spDirection = e.direction; this.spDistance = e.distance; this.spPointX = e.globalX; this.spPointY = e.globalY; this.spTimeStamp = e.timestamp;
    },
    getAppInfo() {
        try {
            let info = app.getInfo();
            this.appResult = '名称: ' + info.appName + '\n版本名称: ' + info.versionName + '\n版本号: ' + info.versionCode;
            this.appStatus = 'success';
        } catch (e) { console.error('error: ' + e); this.appStatus = 'error: ' + e; }
    },
    getCfgInfo() {
        if (!this.cfgSupported) { this.cfgStatus = '当前设备不支持 SystemCapability.ArkUI.ArkUI.Lite'; this.cfgTip = '设备不支持该能力，本用例跳过（勿点 pass/fail）'; return; }
        try {
            let info = configuration.getLocale();
            this.cfgResult = '语言: ' + info.language + '\n国家: ' + info.countryOrRegion + '\n文字布局方向: ' + info.dir;
            this.cfgStatus = 'success';
        } catch (e) { console.error('getLocale error: ' + e); getApp().data.testItems['api_configuration'].errorDetail = 'getLocale error: ' + e; this.cfgStatus = 'error: ' + e; }
    },
    startTimeout() {
        this.toValue = 'show';
        if (this.toTimeoutId !== -1) { clearTimeout(this.toTimeoutId); }
        try { this.toTimeoutId = setTimeout(function () { this.toValue = 'once_timer success'; this.toStatus = 'timer fired'; }.bind(this), 3000); this.toStatus = 'waiting 3s...'; } catch (e) { console.error('error: ' + e); this.toStatus = 'error: ' + e; }
    },
    clearTimeoutBtn() { clearTimeout(this.toTimeoutId); this.toStatus = 'cleared'; },
    startInterval() {
        this.tiIndex = 0;
        if (this.tiIntervalID !== -1) { clearInterval(this.tiIntervalID); }
        try { this.tiIntervalID = setInterval(function () { this.tiIndex = this.tiIndex + 1; }.bind(this), 1000); this.tiStatus = 'running'; } catch (e) { console.error('error: ' + e); this.tiStatus = 'error: ' + e; }
    },
    clearIntervalBtn() { clearInterval(this.tiIntervalID); this.tiStatus = 'cleared'; },
    passA() { getApp().data.testItems['image_animator'].status = 'pass'; this.aPassColor = '#4caf50'; this.aFailColor = '#555555'; },
    failA() { getApp().data.testItems['image_animator'].status = 'fail'; this.aFailColor = '#f44336'; this.aPassColor = '#555555'; },
    passP() { getApp().data.testItems['picker_view'].status = 'pass'; this.pPassColor = '#4caf50'; this.pFailColor = '#555555'; },
    failP() { getApp().data.testItems['picker_view'].status = 'fail'; this.pFailColor = '#f44336'; this.pPassColor = '#555555'; },
    passS() { getApp().data.testItems['swiper'].status = 'pass'; this.sPassColor = '#4caf50'; this.sFailColor = '#555555'; },
    failS() { getApp().data.testItems['swiper'].status = 'fail'; this.sFailColor = '#f44336'; this.sPassColor = '#555555'; },
    passI() { getApp().data.testItems['image_display'].status = 'pass'; this.iPassColor = '#4caf50'; this.iFailColor = '#555555'; },
    failI() { getApp().data.testItems['image_display'].status = 'fail'; this.iFailColor = '#f44336'; this.iPassColor = '#555555'; },
    passSt() { getApp().data.testItems['switch_toggle'].status = 'pass'; this.stPassColor = '#4caf50'; this.stFailColor = '#555555'; },
    failSt() { getApp().data.testItems['switch_toggle'].status = 'fail'; this.stFailColor = '#f44336'; this.stPassColor = '#555555'; },
    passLp() { getApp().data.testItems['event_longpress'].status = 'pass'; this.lpPassColor = '#4caf50'; this.lpFailColor = '#555555'; },
    failLp() { getApp().data.testItems['event_longpress'].status = 'fail'; this.lpFailColor = '#f44336'; this.lpPassColor = '#555555'; },
    passSp() { getApp().data.testItems['event_swipe'].status = 'pass'; this.spPassColor = '#4caf50'; this.spFailColor = '#555555'; },
    failSp() { getApp().data.testItems['event_swipe'].status = 'fail'; this.spFailColor = '#f44336'; this.spPassColor = '#555555'; },
    passApp() { getApp().data.testItems['api_app'].status = 'pass'; this.appPassColor = '#4caf50'; this.appFailColor = '#555555'; },
    failApp() { getApp().data.testItems['api_app'].status = 'fail'; this.appFailColor = '#f44336'; this.appPassColor = '#555555'; },
    passCfg() { getApp().data.testItems['api_configuration'].status = 'pass'; this.cfgPassColor = '#4caf50'; this.cfgFailColor = '#555555'; },
    failCfg() { getApp().data.testItems['api_configuration'].status = 'fail'; this.cfgFailColor = '#f44336'; this.cfgPassColor = '#555555'; },
    passTo() { getApp().data.testItems['api_timer_timeout'].status = 'pass'; this.toPassColor = '#4caf50'; this.toFailColor = '#555555'; },
    failTo() { getApp().data.testItems['api_timer_timeout'].status = 'fail'; this.toFailColor = '#f44336'; this.toPassColor = '#555555'; },
    passTi() { getApp().data.testItems['api_timer_interval'].status = 'pass'; this.tiPassColor = '#4caf50'; this.tiFailColor = '#555555'; },
    failTi() { getApp().data.testItems['api_timer_interval'].status = 'fail'; this.tiFailColor = '#f44336'; this.tiPassColor = '#555555'; },
    helpClicked() {
        getApp().data.helpData = {
            step: '本页合并 11 项测试，每个方框独立判定（上下滑动查看）：\n· 图片动画 image-animator：点播放/暂停/恢复/停止；pass/fail\n· 选择器 picker-view：滑动选择时间；pass/fail\n· 滑动 swiper：方框内上下滑动切换页面；pass/fail\n· 图片 image：观察图片正常显示；pass/fail\n· 开关 switch：点击开关切换状态；pass/fail\n· 长按 longpress：长按彩色区域看变化；pass/fail\n· 滑动事件 swipe：在彩色区域滑动看变化；pass/fail\n· 应用 app：点获取信息显示应用名/版本；pass/fail\n· 配置 configuration：canIUse 检测，支持时获取语言/国家/方向；pass/fail\n· 定时器 timeout：startTimer 3s 后变化，clearTimer 停止；pass/fail\n· 定时器 interval：startInterval 每 1s 加 1，clearInterval 停止；pass/fail\n完成后点底部 back',
            result: '11 项 pass/fail 分别上报 image_animator、picker_view、swiper、image_display、switch_toggle、event_longpress、event_swipe、api_app、api_configuration、api_timer_timeout、api_timer_interval。点 pass 变绿、fail 变红。',
            url: 'pages/ArkUI/ui_advanced/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/ArkUI/common/index/index' }); },
    backClicked() { this.back(); }
};
