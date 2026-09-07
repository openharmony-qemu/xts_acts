export default {
  data: {
    testItems: {
      'text_largeColor': { cat: 'text', status: 'null', help: 'Check if large/medium/small text renders correctly and colored text displays in red' },
      'image_display': { cat: 'image', status: 'null', help: 'Verify image renders without distortion' },
      'progress_bar': { cat: 'progress', status: 'null', help: 'Verify progress bar displays at correct percentage' },
      'slider_drag': { cat: 'slider', status: 'null', help: 'Drag the slider, verify value updates' },
      'switch_toggle': { cat: 'switch', status: 'null', help: 'Toggle the switch, verify state changes' },
      'chart_bar_complex': { cat: 'chart', status: 'null', help: 'Verify bar chart displays multiple data series' },
      'chart_line': { cat: 'chart', status: 'null', help: 'Verify line chart renders and addData works' },
      'image_animator': { cat: 'component', status: 'null', help: 'Verify image animator play/pause/resume/stop' },
      'input': { cat: 'component', status: 'null', help: 'Verify checkbox/radio/image button interactions' },
      'list_item': { cat: 'component', status: 'null', help: 'Verify list-item scroll and content' },
      'event_longpress': { cat: 'component', status: 'null', help: 'Verify longpress event x/y/timestamp/color' },
      'event_swipe': { cat: 'component', status: 'null', help: 'Verify swipe event direction/distance/timestamp' },
      'marquee': { cat: 'component', status: 'null', help: 'Verify marquee speed change on click' },
      'opacity': { cat: 'component', status: 'null', help: 'Verify image opacity levels' },
      'picker_view': { cat: 'component', status: 'null', help: 'Verify time picker-view selection' },
      'qrcode': { cat: 'component', status: 'null', help: 'Verify qrcode value/color/background change' },
      'swiper': { cat: 'component', status: 'null', help: 'Verify swiper page switching' },
      'transition': { cat: 'component', status: 'null', help: 'Verify transition animation' },
      'api_app': { cat: 'api', status: 'null', help: 'Verify app.getInfo returns appName/versionName/versionCode' },
      'api_configuration': { cat: 'api', status: 'null', help: 'Verify @system.configuration getLocale (require SystemCapability.ArkUI.ArkUI.Lite; auto-skip as untested if unsupported)' },
      'api_timer_timeout': { cat: 'api', status: 'null', help: 'Verify setTimeout fires after 3s and clearTimer stops it' },
      'api_timer_interval': { cat: 'api', status: 'null', help: 'Verify setInterval increments every 1s and clearInterval stops' },
      'api_storage': { cat: 'api', status: 'null', help: 'Verify storage set/get/delete/clear operations' },
      'api_file': { cat: 'api', status: 'null', help: 'Verify file writeText/readText/writeArrayBuffer/readArrayBuffer/mkdir/rmdir/list/get/move/copy/delete/access' },
      'api_deviceinfo': { cat: 'api', status: 'null', help: 'Verify device.getInfo returns brand/model/language/screenDensity etc' },
      'api_brightness_value': { cat: 'api', status: 'null', help: 'Verify @system.brightness getValue/setValue (require SystemCapability.PowerManager.DisplayPowerManager.Lite; auto-skip as untested if unsupported)' },
      'api_brightness_mode': { cat: 'api', status: 'null', help: 'Verify @system.brightness getMode/setMode/setKeepScreenOn (require SystemCapability.PowerManager.DisplayPowerManager.Lite; auto-skip as untested if unsupported)' },
      'api_battery': { cat: 'api', status: 'null', help: 'Verify @system.battery getStatus (require SystemCapability.PowerManager.BatteryManager.Lite; auto-skip as untested if unsupported)' },
      'api_nfc': { cat: 'api', status: 'null', help: 'Verify NFC HceService startHCE/on/sendResponse (require SystemCapability.Communication.NFC.CardEmulation; auto-skip as untested if unsupported)' },
      'api_vibrator': { cat: 'api', status: 'null', help: 'Verify @system.vibrator vibrate short/long (require SystemCapability.Sensors.MiscDevice.Lite; auto-skip as untested if unsupported)' },
      'api_sensor_step': { cat: 'api', status: 'null', help: 'Verify @system.sensor subscribeStepCounter returns step count (require SystemCapability.Sensors.Sensor.Lite; auto-skip as untested if unsupported)' },
      'api_sensor_barometer': { cat: 'api', status: 'null', help: 'Verify @system.sensor subscribeBarometer returns pressure (require SystemCapability.Sensors.Sensor.Lite; auto-skip as untested if unsupported)' },
      'api_sensor_heartrate': { cat: 'api', status: 'null', help: 'Verify @system.sensor subscribeHeartRate returns heart rate (require SystemCapability.Sensors.Sensor.Lite; auto-skip as untested if unsupported)' },
      'api_sensor_onbody': { cat: 'api', status: 'null', help: 'Verify @system.sensor subscribeOnBodyState returns wear state (require SystemCapability.Sensors.Sensor.Lite; auto-skip as untested if unsupported)' },
      'api_sensor_accelerometer': { cat: 'api', status: 'null', help: 'Verify @system.sensor subscribeAccelerometer returns x/y/z (require SystemCapability.Sensors.Sensor.Lite; auto-skip as untested if unsupported)' },
      'api_sensor_gyroscope': { cat: 'api', status: 'null', help: 'Verify @system.sensor subscribeGyroscope returns x/y/z (require SystemCapability.Sensors.Sensor.Lite; auto-skip as untested if unsupported)' },
      'api_location_info': { cat: 'api', status: 'null', help: 'Verify @system.geolocation getLocation/getLocationType/getSupportedCoordTypes (require SystemCapability.Location.Location.Lite; auto-skip as untested if unsupported)' },
      'api_location_subscribe': { cat: 'api', status: 'null', help: 'Verify @system.geolocation subscribe/unsubscribe (require SystemCapability.Location.Location.Lite; auto-skip as untested if unsupported)' }
    }
  },
  onCreate() {
    console.info('[start] start run suites');
  },
  onDestroy() {
    console.info('[end] run suites end');
  }
}
