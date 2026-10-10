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
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number: SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0100
     * @tc.name: SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0100
     * @tc.desc: Call onSpatialMotion without permission, expect error code 201.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_SPATIALMOTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnSpatialMotionNoPermission start');
      const callback = (info: carAwareness.SpatialMotionInfo) => {};
      try {
        carAwareness.onSpatialMotion(callback);
        expect().assertFail();
      } catch (err) {
        const error = err as BusinessError;
        logE(`testOnSpatialMotionNoPermission failed. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code).assertEqual(201);
        expect(error.message.includes('Permission check failed.')).assertTrue();
      }
    });

    /**
     * @tc.number: SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0100
     * @tc.name: SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0100
     * @tc.desc: Call onRealTimeWeather without permission, expect error code 201.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REALTIMEWEATHER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRealTimeWeatherNoPermission start');
      const callback = (info: carAwareness.RealTimeWeatherInfo) => {};
      try {
        carAwareness.onRealTimeWeather(callback);
        expect().assertFail();
      } catch (err) {
        const error = err as BusinessError;
        logE(`testOnRealTimeWeatherNoPermission failed. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code).assertEqual(201);
        expect(error.message.includes('Permission check failed.')).assertTrue();
      }
    });

    /**
     * @tc.number: SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0100
     * @tc.name: SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0100
     * @tc.desc: Call onRefueling without permission, expect error code 201.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_CARAWARENESS_ON_REFUELING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnRefuelingNoPermission start');
      const callback = (info: carAwareness.RefuelingInfo) => {};
      try {
        carAwareness.onRefueling(callback);
        expect().assertFail();
      } catch (err) {
        const error = err as BusinessError;
        logE(`testOnRefuelingNoPermission failed. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code).assertEqual(201);
        expect(error.message.includes('Permission check failed.')).assertTrue();
      }
    });

  })
}
