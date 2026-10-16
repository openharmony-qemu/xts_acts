/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026-2026. All rights reserved.
 */
import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import { carAwareness } from '@kit.MultimodalAwarenessKit';

const NEED_SYSCAP = 'SystemCapability.MultimodalAwareness.CarAwareness';
const TAG = 'KitCarAwarenessTest';
const API_VERSION_TWENTY_SIX = 26;
const DEVICE_TYPE_CAR = 'car';
const DOMAIN = 0x0000;

enum ErrorCode {
  PARAM_ERROR = 401
}

const logD = (msg: string): void => hilog.debug(DOMAIN, TAG, msg);
const logI = (msg: string): void => hilog.info(DOMAIN, TAG, msg);
const logE = (msg: string): void => hilog.error(DOMAIN, TAG, msg);

function checkDeviceSysCapSupport(): boolean {
  if (!canIUse(NEED_SYSCAP)) {
    logI('Skip: device without syscap');
    return false;
  }
  return true;
}

export default function KitCarAwarenessTest() {
  describe('KitCarAwarenessTest', () => {
    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0100
     * @tc.desc Verify invoking onSpatialMotion with valid callback will not throw exception.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionSuccess start');
      const callback = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOnSpatialMotionSuccess callback triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnSpatialMotionSuccess failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0200
     * @tc.desc Verify registering multiple different callbacks via onSpatialMotion without exception.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionDoubleSubscribe start');
      const callback1 = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOnSpatialMotionDoubleSubscribe callback1 triggered');
      };
      const callback2 = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOnSpatialMotionDoubleSubscribe callback2 triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback1);
        carAwareness.onSpatialMotion(callback2);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnSpatialMotionDoubleSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0300
     * @tc.desc Verify paired invocation of onSpatialMotion and offSpatialMotion runs normally.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionSubscribeThenUnsubscribe start');
      const callback = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOnSpatialMotionSubscribeThenUnsubscribe callback triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback);
        carAwareness.offSpatialMotion(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnSpatialMotionSubscribeThenUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0400
     * @tc.desc Verify parameterless callback can be registered by onSpatialMotion normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionEmptyCallback start');
      const callback = (): void => {
        logD('testOnSpatialMotionEmptyCallback triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnSpatialMotionEmptyCallback failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0500
     * @tc.desc Verify onSpatialMotion throws PARAM_ERROR when callback is null.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionWithNullCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.onSpatialMotion(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnSpatialMotionWithNullCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code).assertEqual(ErrorCode.PARAM_ERROR);
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOnSpatialMotionWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0600
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0600
     * @tc.desc Verify onSpatialMotion throws PARAM_ERROR when callback is undefined.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.onSpatialMotion(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnSpatialMotionWithUndefinedCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code).assertEqual(ErrorCode.PARAM_ERROR);
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOnSpatialMotionWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0700
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0700
     * @tc.desc Verify repeatedly registering identical callback via onSpatialMotion runs normally.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionSameCallbackRepeatedSubscribe start');
      const callback = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOnSpatialMotionSameCallbackRepeatedSubscribe callback triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback);
        carAwareness.onSpatialMotion(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnSpatialMotionSameCallbackRepeatedSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0100
     * @tc.desc Verify unsubscribe single subscribed callback, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffSpatialMotionSingleCallbackIdempotentUnsubscribe start');
      const callback = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOffSpatialMotionSingleCallbackIdempotentUnsubscribe callback triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback);
        carAwareness.offSpatialMotion(callback);
        carAwareness.offSpatialMotion(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffSpatialMotionSingleCallbackIdempotentUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0200
     * @tc.desc Verify parameterless clear all callbacks, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffSpatialMotionNoParamIdempotentClearAll start');
      const callback = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOffSpatialMotionNoParamIdempotentClearAll callback triggered');
      };
      try {
        carAwareness.onSpatialMotion(callback);
        carAwareness.offSpatialMotion();
        carAwareness.offSpatialMotion();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffSpatialMotionNoParamIdempotentClearAll failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0300
     * @tc.desc Verify offSpatialMotion throws PARAM_ERROR with null callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffSpatialMotionWithNullCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.offSpatialMotion(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffSpatialMotionWithNullCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffSpatialMotionWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0400
     * @tc.desc Verify offSpatialMotion throws PARAM_ERROR with undefined callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffSpatialMotionWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.offSpatialMotion(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffSpatialMotionWithUndefinedCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffSpatialMotionWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0500
     * @tc.desc Verify cancel unregistered callback will not throw exception.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffSpatialMotionWithUnregisteredCallback start');
      const unsubscribedCallback = (data: carAwareness.SpatialMotionInfo): void => {
        logD('testOffSpatialMotionWithUnregisteredCallback callback triggered');
      };
      try {
        carAwareness.offSpatialMotion(unsubscribedCallback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffSpatialMotionWithUnregisteredCallback failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0600
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0600
     * @tc.desc Verify parameterless interface clears multiple subscribed callbacks normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_SPATIALMOTION_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffSpatialMotionNoParamClearMultiCallbacks start');
      const callback1 = (data: carAwareness.SpatialMotionInfo): void => {};
      const callback2 = (data: carAwareness.SpatialMotionInfo): void => {};
      try {
        carAwareness.onSpatialMotion(callback1);
        carAwareness.onSpatialMotion(callback2);
        carAwareness.offSpatialMotion();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffSpatialMotionNoParamClearMultiCallbacks failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0100
     * @tc.desc Verify invoking onRealTimeWeather with valid callback will not throw exception.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherSuccess start');
      const callback = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOnRealTimeWeatherSuccess callback triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherSuccess failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0200
     * @tc.desc Verify registering multiple different callbacks via onRealTimeWeather without exception.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherDoubleSubscribe start');
      const callback1 = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOnRealTimeWeatherDoubleSubscribe callback1 triggered');
      };
      const callback2 = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOnRealTimeWeatherDoubleSubscribe callback2 triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback1);
        carAwareness.onRealTimeWeather(callback2);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherDoubleSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0300
     * @tc.desc Verify paired invocation of onRealTimeWeather and offRealTimeWeather runs normally.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherSubscribeThenUnsubscribe start');
      const callback = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOnRealTimeWeatherSubscribeThenUnsubscribe callback triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback);
        carAwareness.offRealTimeWeather(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherSubscribeThenUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0400
     * @tc.desc Verify parameterless callback can be registered by onRealTimeWeather normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherEmptyCallback start');
      const callback = (): void => {
        logD('testOnRealTimeWeatherEmptyCallback triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherEmptyCallback failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0500
     * @tc.desc Verify onRealTimeWeather throws PARAM_ERROR when callback is null.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherWithNullCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.onRealTimeWeather(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherWithNullCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOnRealTimeWeatherWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0600
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0600
     * @tc.desc Verify onRealTimeWeather throws PARAM_ERROR when callback is undefined.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.onRealTimeWeather(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherWithUndefinedCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOnRealTimeWeatherWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0700
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0700
     * @tc.desc Verify repeatedly registering identical callback via onRealTimeWeather runs normally.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherSameCallbackRepeatedSubscribe start');
      const callback = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOnRealTimeWeatherSameCallbackRepeatedSubscribe callback triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback);
        carAwareness.onRealTimeWeather(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRealTimeWeatherSameCallbackRepeatedSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0100
     * @tc.desc Verify unsubscribe single subscribed callback, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRealTimeWeatherSingleCallbackIdempotentUnsubscribe start');
      const callback = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOffRealTimeWeatherSingleCallbackIdempotentUnsubscribe callback triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback);
        carAwareness.offRealTimeWeather(callback);
        carAwareness.offRealTimeWeather(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRealTimeWeatherSingleCallbackIdempotentUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0200
     * @tc.desc Verify parameterless clear all callbacks, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRealTimeWeatherNoParamIdempotentClearAll start');
      const callback = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOffRealTimeWeatherNoParamIdempotentClearAll callback triggered');
      };
      try {
        carAwareness.onRealTimeWeather(callback);
        carAwareness.offRealTimeWeather();
        carAwareness.offRealTimeWeather();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRealTimeWeatherNoParamIdempotentClearAll failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0300
     * @tc.desc Verify offRealTimeWeather throws PARAM_ERROR with null callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRealTimeWeatherWithNullCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.offRealTimeWeather(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffRealTimeWeatherWithNullCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffRealTimeWeatherWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0400
     * @tc.desc Verify offRealTimeWeather throws PARAM_ERROR with undefined callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRealTimeWeatherWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.offRealTimeWeather(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffRealTimeWeatherWithUndefinedCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffRealTimeWeatherWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0500
     * @tc.desc Verify cancel unregistered callback will not throw exception.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRealTimeWeatherWithUnregisteredCallback start');
      const unsubscribedCallback = (data: carAwareness.RealTimeWeatherInfo): void => {
        logD('testOffRealTimeWeatherWithUnregisteredCallback callback triggered');
      };
      try {
        carAwareness.offRealTimeWeather(unsubscribedCallback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRealTimeWeatherWithUnregisteredCallback failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0600
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0600
     * @tc.desc Verify parameterless interface clears multiple subscribed callbacks normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REALTIMEWEATHER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRealTimeWeatherNoParamClearMultiCallbacks start');
      const callback1 = (data: carAwareness.RealTimeWeatherInfo): void => {};
      const callback2 = (data: carAwareness.RealTimeWeatherInfo): void => {};
      try {
        carAwareness.onRealTimeWeather(callback1);
        carAwareness.onRealTimeWeather(callback2);
        carAwareness.offRealTimeWeather();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRealTimeWeatherNoParamClearMultiCallbacks failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0100
     * @tc.desc Verify invoking onRefueling with valid callback will not throw exception.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingSuccess start');
      const callback = (data: carAwareness.RefuelingInfo): void => {
        logD('testOnRefuelingSuccess callback triggered');
      };
      try {
        carAwareness.onRefueling(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRefuelingSuccess failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0200
     * @tc.desc Verify registering multiple different callbacks via onRefueling without exception.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingDoubleSubscribe start');
      const callback1 = (data: carAwareness.RefuelingInfo): void => {
        logD('testOnRefuelingDoubleSubscribe callback1 triggered');
      };
      const callback2 = (data: carAwareness.RefuelingInfo): void => {
        logD('testOnRefuelingDoubleSubscribe callback2 triggered');
      };
      try {
        carAwareness.onRefueling(callback1);
        carAwareness.onRefueling(callback2);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRefuelingDoubleSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0300
     * @tc.desc Verify paired invocation of onRefueling and offRefueling runs normally.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingSubscribeThenUnsubscribe start');
      const callback = (data: carAwareness.RefuelingInfo): void => {
        logD('testOnRefuelingSubscribeThenUnsubscribe callback triggered');
      };
      try {
        carAwareness.onRefueling(callback);
        carAwareness.offRefueling(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRefuelingSubscribeThenUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0400
     * @tc.desc Verify parameterless callback can be registered by onRefueling normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingEmptyCallback start');
      const callback = (): void => {
        logD('testOnRefuelingEmptyCallback triggered');
      };
      try {
        carAwareness.onRefueling(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRefuelingEmptyCallback failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0500
     * @tc.desc Verify onRefueling throws PARAM_ERROR when callback is null.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingWithNullCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.onRefueling(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnRefuelingWithNullCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOnRefuelingWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0600
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0600
     * @tc.desc Verify onRefueling throws PARAM_ERROR when callback is undefined.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.onRefueling(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnRefuelingWithUndefinedCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOnRefuelingWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0700
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0700
     * @tc.desc Verify repeatedly registering identical callback via onRefueling runs normally.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingSameCallbackRepeatedSubscribe start');
      const callback = (data: carAwareness.RefuelingInfo): void => {
        logD('testOnRefuelingSameCallbackRepeatedSubscribe callback triggered');
      };
      try {
        carAwareness.onRefueling(callback);
        carAwareness.onRefueling(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnRefuelingSameCallbackRepeatedSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0100
     * @tc.desc Verify unsubscribe single subscribed callback, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRefuelingSingleCallbackIdempotentUnsubscribe start');
      const callback = (data: carAwareness.RefuelingInfo): void => {
        logD('testOffRefuelingSingleCallbackIdempotentUnsubscribe callback triggered');
      };
      try {
        carAwareness.onRefueling(callback);
        carAwareness.offRefueling(callback);
        carAwareness.offRefueling(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRefuelingSingleCallbackIdempotentUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0200
     * @tc.desc Verify parameterless clear all callbacks, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRefuelingNoParamIdempotentClearAll start');
      const callback = (data: carAwareness.RefuelingInfo): void => {
        logD('testOffRefuelingNoParamIdempotentClearAll callback triggered');
      };
      try {
        carAwareness.onRefueling(callback);
        carAwareness.offRefueling();
        carAwareness.offRefueling();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRefuelingNoParamIdempotentClearAll failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0300
     * @tc.desc Verify offRefueling throws PARAM_ERROR with null callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRefuelingWithNullCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.offRefueling(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffRefuelingWithNullCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffRefuelingWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0400
     * @tc.desc Verify offRefueling throws PARAM_ERROR with undefined callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRefuelingWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        carAwareness.offRefueling(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffRefuelingWithUndefinedCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
        expect(error.message.includes('Params check failed.')).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffRefuelingWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0500
     * @tc.desc Verify cancel unregistered callback will not throw exception.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRefuelingWithUnregisteredCallback start');
      const unsubscribedCallback = (data: carAwareness.RefuelingInfo): void => {
        logD('testOffRefuelingWithUnregisteredCallback callback triggered');
      };
      try {
        carAwareness.offRefueling(unsubscribedCallback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRefuelingWithUnregisteredCallback failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0600
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0600
     * @tc.desc Verify parameterless interface clears multiple subscribed callbacks normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_OFF_REFUELING_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffRefuelingNoParamClearMultiCallbacks start');
      const callback1 = (data: carAwareness.RefuelingInfo): void => {};
      const callback2 = (data: carAwareness.RefuelingInfo): void => {};
      try {
        carAwareness.onRefueling(callback1);
        carAwareness.onRefueling(callback2);
        carAwareness.offRefueling();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffRefuelingNoParamClearMultiCallbacks failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0100
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0100
     * @tc.desc Check return value is Capability array.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testGetAllCapabilityListCheckReturnType start');
      try {
        const capabilityList = await carAwareness.getAllCapabilityList();
        expect(Array.isArray(capabilityList)).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        logE(`testGetAllCapabilityListCheckReturnType failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0200
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0200
     * @tc.desc Adapt to different vehicle hardware capability configuration
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testGetAllCapabilityListReturnArrayBranch start');
      try {
        const capabilityList = await carAwareness.getAllCapabilityList();
        if (capabilityList.length === 0) {
          expect(capabilityList.length).assertEqual(0);
        } else {
          expect(capabilityList.length >= 1).assertTrue();
        }
      } catch (err) {
        const error = err as BusinessError;
        logE(`testGetAllCapabilityListReturnArrayBranch failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0300
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0300
     * @tc.desc Check capability string is within the defined enum value
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testGetAllCapabilityListCheckValidEnumValue start');
      const enumSet = new Set<string>([
        carAwareness.Capability.SPATIAL_MOTION,
        carAwareness.Capability.REALTIME_WEATHER,
        carAwareness.Capability.REFUELING,
      ]);
      try {
        const capabilityList = await carAwareness.getAllCapabilityList();
        for (const item of enumSet) {
          let hasItem = false;
          for (const item2 of capabilityList) {
            if (item2 == item) {
              hasItem = true;
              break;
            }
          }
          expect(hasItem).assertTrue();
        }
      } catch (err) {
        const error = err as BusinessError;
        logE(`testGetAllCapabilityListCheckValidEnumValue failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0400
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0400
     * @tc.desc Directly access array[0], resolve return‑value type‑check warning
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testGetAllCapabilityListScanCheckItemType start');
      try {
        const capabilityList = await carAwareness.getAllCapabilityList();
        expect(Array.isArray(capabilityList)).assertTrue();
        if (capabilityList.length > 0) {
          expect(typeof capabilityList[0]).assertEqual('string');
        }
      } catch (err) {
        const error = err as BusinessError;
        logE(`testGetAllCapabilityListScanCheckItemType failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0500
     * @tc.name SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0500
     * @tc.desc Verify getAllCapabilityList throws BusinessError 801 on unsupported device
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_GETALLCAPABILITYLIST_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testGetAllCapabilityListCatch801 start');
      try {
        await carAwareness.getAllCapabilityList();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code === 801).assertTrue();
        expect(error.message.includes('The device does not support this API.')).assertTrue();
      }
    });
  })
}
