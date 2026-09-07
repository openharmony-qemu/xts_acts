import router from '@system.router';
import sensor from '@system.sensor';
import Vibrator from '@system.vibrator';

export default {
    data: {
        sensorSupported: false,
        vibSupported: false,
        accTip: '', gyroTip: '', stepTip: '', baroTip: '', hrTip: '', onBodyTip: '', vibTip: '',
        accX: 0, accY: 0, accZ: 0, accMsg: '',
        gyroX: 0, gyroY: 0, gyroZ: 0, gyroMsg: '',
        steps: 0, stepMsg: '',
        pressure: 0, baroMsg: '',
        heartRate: 0, hrMsg: '',
        onBody: '', onBodyMsg: '',
        vibState: '', vibMsg: '',
        accPassColor: '#555555', accFailColor: '#555555',
        gyroPassColor: '#555555', gyroFailColor: '#555555',
        stepPassColor: '#555555', stepFailColor: '#555555',
        baroPassColor: '#555555', baroFailColor: '#555555',
        hrPassColor: '#555555', hrFailColor: '#555555',
        onPassColor: '#555555', onFailColor: '#555555',
        vibPassColor: '#555555', vibFailColor: '#555555'
    },
    onInit() {
        this.sensorSupported = canIUse('SystemCapability.Sensors.Sensor.Lite');
        this.vibSupported = canIUse('SystemCapability.Sensors.MiscDevice.Lite');
        var sensorTip = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite，本用例跳过（勿点 pass/fail）';
        var vibTip = '当前设备不支持 SystemCapability.Sensors.MiscDevice.Lite，本用例跳过（勿点 pass/fail）';
        if (!this.sensorSupported) {
            this.accTip = sensorTip; this.gyroTip = sensorTip; this.stepTip = sensorTip;
            this.baroTip = sensorTip; this.hrTip = sensorTip; this.onBodyTip = sensorTip;
            getApp().data.testItems['api_sensor_accelerometer'].errorDetail = 'unsupported: SystemCapability.Sensors.Sensor.Lite';
            getApp().data.testItems['api_sensor_gyroscope'].errorDetail = 'unsupported: SystemCapability.Sensors.Sensor.Lite';
            getApp().data.testItems['api_sensor_step'].errorDetail = 'unsupported: SystemCapability.Sensors.Sensor.Lite';
            getApp().data.testItems['api_sensor_barometer'].errorDetail = 'unsupported: SystemCapability.Sensors.Sensor.Lite';
            getApp().data.testItems['api_sensor_heartrate'].errorDetail = 'unsupported: SystemCapability.Sensors.Sensor.Lite';
            getApp().data.testItems['api_sensor_onbody'].errorDetail = 'unsupported: SystemCapability.Sensors.Sensor.Lite';
        }
        if (!this.vibSupported) {
            this.vibTip = vibTip;
            getApp().data.testItems['api_vibrator'].errorDetail = 'unsupported: SystemCapability.Sensors.MiscDevice.Lite';
        }
    },
    onDestroy() {
        try { sensor.unsubscribeAccelerometer(); } catch (e) {}
        try { sensor.unsubscribeGyroscope(); } catch (e) {}
        try { sensor.unsubscribeStepCounter(); } catch (e) {}
        try { sensor.unsubscribeBarometer(); } catch (e) {}
        try { sensor.unsubscribeHeartRate(); } catch (e) {}
        try { sensor.unsubscribeOnBodyState(); } catch (e) {}
    },
    subAcc() {
        if (!this.sensorSupported) { this.accMsg = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite'; return; }
        let obj = this;
        try { sensor.subscribeAccelerometer({ interval: 'normal', success: function (r) { obj.accX = r.x; obj.accY = r.y; obj.accZ = r.z; obj.accMsg = 'success'; }, fail: function (d, c) { obj.accMsg = 'fail code: ' + c; getApp().data.testItems['api_sensor_accelerometer'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.accMsg = 'error: ' + e; }
    },
    unsubAcc() { if (!this.sensorSupported) { return; } try { sensor.unsubscribeAccelerometer(); this.accMsg = 'unsubscribed'; } catch (e) { this.accMsg = 'error: ' + e; } },
    subGyro() {
        if (!this.sensorSupported) { this.gyroMsg = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite'; return; }
        let obj = this;
        try { sensor.subscribeGyroscope({ interval: 'normal', success: function (r) { obj.gyroX = r.x; obj.gyroY = r.y; obj.gyroZ = r.z; obj.gyroMsg = 'success'; }, fail: function (d, c) { obj.gyroMsg = 'fail code: ' + c; getApp().data.testItems['api_sensor_gyroscope'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.gyroMsg = 'error: ' + e; }
    },
    unsubGyro() { if (!this.sensorSupported) { return; } try { sensor.unsubscribeGyroscope(); this.gyroMsg = 'unsubscribed'; } catch (e) { this.gyroMsg = 'error: ' + e; } },
    subStep() {
        if (!this.sensorSupported) { this.stepMsg = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite'; return; }
        let obj = this;
        try { sensor.subscribeStepCounter({ success: function (r) { obj.steps = r.steps; obj.stepMsg = 'success'; }, fail: function (d, c) { obj.stepMsg = 'fail code: ' + c; getApp().data.testItems['api_sensor_step'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.stepMsg = 'error: ' + e; }
    },
    unsubStep() { if (!this.sensorSupported) { return; } try { sensor.unsubscribeStepCounter(); this.stepMsg = 'unsubscribed'; } catch (e) { this.stepMsg = 'error: ' + e; } },
    subBaro() {
        if (!this.sensorSupported) { this.baroMsg = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite'; return; }
        let obj = this;
        try { sensor.subscribeBarometer({ success: function (r) { obj.pressure = r.pressure; obj.baroMsg = 'success'; }, fail: function (d, c) { obj.baroMsg = 'fail code: ' + c; getApp().data.testItems['api_sensor_barometer'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.baroMsg = 'error: ' + e; }
    },
    unsubBaro() { if (!this.sensorSupported) { return; } try { sensor.unsubscribeBarometer(); this.baroMsg = 'unsubscribed'; } catch (e) { this.baroMsg = 'error: ' + e; } },
    subHr() {
        if (!this.sensorSupported) { this.hrMsg = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite'; return; }
        let obj = this;
        try { sensor.subscribeHeartRate({ success: function (r) { obj.heartRate = r.heartRate; obj.hrMsg = 'success'; }, fail: function (d, c) { obj.hrMsg = 'fail code: ' + c; getApp().data.testItems['api_sensor_heartrate'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.hrMsg = 'error: ' + e; }
    },
    unsubHr() { if (!this.sensorSupported) { return; } try { sensor.unsubscribeHeartRate(); this.hrMsg = 'unsubscribed'; } catch (e) { this.hrMsg = 'error: ' + e; } },
    subOnBody() {
        if (!this.sensorSupported) { this.onBodyMsg = '当前设备不支持 SystemCapability.Sensors.Sensor.Lite'; return; }
        let obj = this;
        try { sensor.subscribeOnBodyState({ success: function (r) { obj.onBody = r.value; obj.onBodyMsg = 'success'; }, fail: function (d, c) { obj.onBodyMsg = 'fail code: ' + c; getApp().data.testItems['api_sensor_onbody'].errorDetail = 'subscribe fail, code: ' + c; } }); } catch (e) { this.onBodyMsg = 'error: ' + e; }
    },
    unsubOnBody() { if (!this.sensorSupported) { return; } try { sensor.unsubscribeOnBodyState(); this.onBodyMsg = 'unsubscribed'; } catch (e) { this.onBodyMsg = 'error: ' + e; } },
    vibrateShort() {
        if (!this.vibSupported) { this.vibMsg = '当前设备不支持 SystemCapability.Sensors.MiscDevice.Lite'; return; }
        let obj = this;
        try { Vibrator.vibrate({ mode: 'short', success: function () { obj.vibState = '短振动'; obj.vibMsg = 'success'; }, fail: function () { obj.vibMsg = 'fail'; getApp().data.testItems['api_vibrator'].errorDetail = 'vibrate short fail'; } }); } catch (e) { this.vibMsg = 'error: ' + e; }
    },
    vibrateLong() {
        if (!this.vibSupported) { this.vibMsg = '当前设备不支持 SystemCapability.Sensors.MiscDevice.Lite'; return; }
        let obj = this;
        try { Vibrator.vibrate({ mode: 'long', success: function () { obj.vibState = '长振动'; obj.vibMsg = 'success'; }, fail: function () { obj.vibMsg = 'fail'; getApp().data.testItems['api_vibrator'].errorDetail = 'vibrate long fail'; } }); } catch (e) { this.vibMsg = 'error: ' + e; }
    },
    passAcc() { if (getApp().data.testItems['api_sensor_accelerometer'].status === 'pass') { getApp().data.testItems['api_sensor_accelerometer'].status = 'null'; this.accPassColor = '#555555'; this.accFailColor = '#555555'; } else { getApp().data.testItems['api_sensor_accelerometer'].status = 'pass'; this.accPassColor = '#4caf50'; this.accFailColor = '#555555'; } },
    failAcc() { if (getApp().data.testItems['api_sensor_accelerometer'].status === 'fail') { getApp().data.testItems['api_sensor_accelerometer'].status = 'null'; this.accFailColor = '#555555'; this.accPassColor = '#555555'; } else { getApp().data.testItems['api_sensor_accelerometer'].status = 'fail'; this.accFailColor = '#f44336'; this.accPassColor = '#555555'; } },
    passGyro() { if (getApp().data.testItems['api_sensor_gyroscope'].status === 'pass') { getApp().data.testItems['api_sensor_gyroscope'].status = 'null'; this.gyroPassColor = '#555555'; this.gyroFailColor = '#555555'; } else { getApp().data.testItems['api_sensor_gyroscope'].status = 'pass'; this.gyroPassColor = '#4caf50'; this.gyroFailColor = '#555555'; } },
    failGyro() { if (getApp().data.testItems['api_sensor_gyroscope'].status === 'fail') { getApp().data.testItems['api_sensor_gyroscope'].status = 'null'; this.gyroFailColor = '#555555'; this.gyroPassColor = '#555555'; } else { getApp().data.testItems['api_sensor_gyroscope'].status = 'fail'; this.gyroFailColor = '#f44336'; this.gyroPassColor = '#555555'; } },
    passStep() { if (getApp().data.testItems['api_sensor_step'].status === 'pass') { getApp().data.testItems['api_sensor_step'].status = 'null'; this.stepPassColor = '#555555'; this.stepFailColor = '#555555'; } else { getApp().data.testItems['api_sensor_step'].status = 'pass'; this.stepPassColor = '#4caf50'; this.stepFailColor = '#555555'; } },
    failStep() { if (getApp().data.testItems['api_sensor_step'].status === 'fail') { getApp().data.testItems['api_sensor_step'].status = 'null'; this.stepFailColor = '#555555'; this.stepPassColor = '#555555'; } else { getApp().data.testItems['api_sensor_step'].status = 'fail'; this.stepFailColor = '#f44336'; this.stepPassColor = '#555555'; } },
    passBaro() { if (getApp().data.testItems['api_sensor_barometer'].status === 'pass') { getApp().data.testItems['api_sensor_barometer'].status = 'null'; this.baroPassColor = '#555555'; this.baroFailColor = '#555555'; } else { getApp().data.testItems['api_sensor_barometer'].status = 'pass'; this.baroPassColor = '#4caf50'; this.baroFailColor = '#555555'; } },
    failBaro() { if (getApp().data.testItems['api_sensor_barometer'].status === 'fail') { getApp().data.testItems['api_sensor_barometer'].status = 'null'; this.baroFailColor = '#555555'; this.baroPassColor = '#555555'; } else { getApp().data.testItems['api_sensor_barometer'].status = 'fail'; this.baroFailColor = '#f44336'; this.baroPassColor = '#555555'; } },
    passHr() { if (getApp().data.testItems['api_sensor_heartrate'].status === 'pass') { getApp().data.testItems['api_sensor_heartrate'].status = 'null'; this.hrPassColor = '#555555'; this.hrFailColor = '#555555'; } else { getApp().data.testItems['api_sensor_heartrate'].status = 'pass'; this.hrPassColor = '#4caf50'; this.hrFailColor = '#555555'; } },
    failHr() { if (getApp().data.testItems['api_sensor_heartrate'].status === 'fail') { getApp().data.testItems['api_sensor_heartrate'].status = 'null'; this.hrFailColor = '#555555'; this.hrPassColor = '#555555'; } else { getApp().data.testItems['api_sensor_heartrate'].status = 'fail'; this.hrFailColor = '#f44336'; this.hrPassColor = '#555555'; } },
    passOn() { if (getApp().data.testItems['api_sensor_onbody'].status === 'pass') { getApp().data.testItems['api_sensor_onbody'].status = 'null'; this.onPassColor = '#555555'; this.onFailColor = '#555555'; } else { getApp().data.testItems['api_sensor_onbody'].status = 'pass'; this.onPassColor = '#4caf50'; this.onFailColor = '#555555'; } },
    failOn() { if (getApp().data.testItems['api_sensor_onbody'].status === 'fail') { getApp().data.testItems['api_sensor_onbody'].status = 'null'; this.onFailColor = '#555555'; this.onPassColor = '#555555'; } else { getApp().data.testItems['api_sensor_onbody'].status = 'fail'; this.onFailColor = '#f44336'; this.onPassColor = '#555555'; } },
    passVib() { if (getApp().data.testItems['api_vibrator'].status === 'pass') { getApp().data.testItems['api_vibrator'].status = 'null'; this.vibPassColor = '#555555'; this.vibFailColor = '#555555'; } else { getApp().data.testItems['api_vibrator'].status = 'pass'; this.vibPassColor = '#4caf50'; this.vibFailColor = '#555555'; } },
    failVib() { if (getApp().data.testItems['api_vibrator'].status === 'fail') { getApp().data.testItems['api_vibrator'].status = 'null'; this.vibFailColor = '#555555'; this.vibPassColor = '#555555'; } else { getApp().data.testItems['api_vibrator'].status = 'fail'; this.vibFailColor = '#f44336'; this.vibPassColor = '#555555'; } },
    helpClicked() {
        getApp().data.helpData = {
            step: '本页合并 7 项传感器测试。进入自动 canIUse 检测；不支持时各测试点显示不支持信息（黄色）。支持时逐项点订阅/取消或短/长振动，观察数值更新，按该框 pass/fail（上下滑动查看）。',
            result: '7 项 pass/fail 分别上报 api_vibrator、api_sensor_step、api_sensor_barometer、api_sensor_heartrate、api_sensor_onbody、api_sensor_accelerometer、api_sensor_gyroscope。',
            url: 'pages/Sensors/index/index'
        };
        router.replace({ uri: 'pages/common/help/index' });
    },
    back() { router.replace({ uri: 'pages/index/index' }); },
    backClicked() { this.back(); }
};
