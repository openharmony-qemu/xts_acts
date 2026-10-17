import router from '@system.router';
import healthService from '@hms.health.service';
 	 
 	 
export default {
 	data: {
		sensorSupported: false,
		sensorTip: '',
 	    onSensor: '',
 	    onSensorMsg: '',
 	    sensorPassColor: '#555555',
 	    sensorFailColor: '#555555'
 	},
 	onInit() {
		this.sensorSupported = canIUse('SystemCapability.Health.HealthService.Lite');
		var sensorTip = '当前设备不支持 SystemCapability.Health.HealthService.Lite，本用例跳过（勿点 pass/fail）';
		if (!this.sensorSupported) {
			this.sensorTip = sensorTip;
			getApp().data.testItems.api_oh_workout_sensor.errorDetail =
 	            'unsupported: SystemCapability.Health.HealthService.Lite';
		}
 	},
 	onDestroy() {
 	},
 	openSensor() {
 	    this.onSensor = '开启sensor';
 	    try {
 	        healthService.workout.load('libentry.so', (result) => {
				this.onSensorMsg = 'load success' + result.operationCode;
			});
 	    } catch (err) {
 	        this.onSensorMsg = JSON.stringify(err);
 	        getApp().data.testItems.api_oh_workout_sensor.errorDetail = 'open sensor fail, err: ' + JSON.stringify(err);
 	    }
	},
 	closeSensor() {
 	    this.onSensor = '关闭sensor';
 	    try {
 	        healthService.workout.unload('libentry.so', (result) => {
				this.onSensorMsg = 'unload success' + result.operationCode;
			});
 	    } catch (err) {
 	        this.onSensorMsg = JSON.stringify(err);
 	        getApp().data.testItems.api_oh_workout_sensor.errorDetail = 'close sensor fail, err: ' + JSON.stringify(err);
 	    }
 	},
 	passSensor() {
 	    if (getApp().data.testItems.api_oh_workout_sensor.status === 'pass') {
 	        getApp().data.testItems.api_oh_workout_sensor.status = 'null';
 	        this.sensorPassColor = '#555555';
 	        this.sensorFailColor = '#555555';
 	    } else {
 	        getApp().data.testItems.api_oh_workout_sensor.status = 'pass';
 	        this.sensorPassColor = '#4caf50';
 	        this.sensorFailColor = '#555555';
 	    }
 	},
 	failSensor() {
 	    if (getApp().data.testItems.api_oh_workout_sensor.status === 'fail') {
 	        getApp().data.testItems.api_oh_workout_sensor.status = 'null';
 	        this.sensorFailColor = '#555555';
 	        this.sensorPassColor = '#555555';
 	    } else {
 	        getApp().data.testItems.api_oh_workout_sensor.status = 'fail';
 	        this.sensorFailColor = '#f44336';
 	        this.sensorPassColor = '#555555';
 	    }
 	},
 	helpClicked() {
 	    getApp().data.helpData = {
 	        step: '本页合并 1 项WorkoutSensors传感器测试。支持时逐项点开启/关闭sensor，观察数值更新，按该框 pass/fail（上下滑动查看）。',
 	        result: '1项 pass/fail 分别上报 openSensor/closeSensor。',
 	        url: 'pages/Sensors/common/index/index'
 	    };
 	    router.replace({ uri: 'pages/common/help/index' });
 	},
 	back() {
 	    router.replace({ uri: 'pages/Sensors/common/index/index' });
 	},
 	backClicked() {
 	    this.back();
 	}
};