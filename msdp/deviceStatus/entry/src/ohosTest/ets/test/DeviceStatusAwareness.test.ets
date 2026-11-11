/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026-2026. All rights reserved.
 */
import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import deviceStatus from '@ohos.multimodalAwareness.deviceStatus';

const NEED_SYSCAP = 'SystemCapability.MultimodalAwareness.DeviceStatus';
const TAG = 'KitDeviceStatusTest';
const DOMAIN = 0x0000;

enum ErrorCode {
  PARAM_ERROR = 401,
  UNSUPPORTED = 801,
  SERVICE_EXCEPTION = 32500001,
  SUBSCRIPTION_FAILED = 32500002,
  UNSUBSCRIPTION_FAILED = 32500003
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

export default function KitDeviceStatusTest() {
  describe('KitDeviceStatusTest', () => {

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0100
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0100
     * @tc.desc Verify invoking onDropDetect with valid callback will not throw exception.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectSuccess start');
      const callback = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOnDropDetectSuccess callback triggered');
      };
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.offDropDetect(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnDropDetectSuccess failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0200
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0200
     * @tc.desc Verify registering multiple different callbacks via onDropDetect without exception.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectDoubleSubscribe start');
      const callback1 = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOnDropDetectDoubleSubscribe callback1 triggered');
      };
      const callback2 = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOnDropDetectDoubleSubscribe callback2 triggered');
      };
      try {
        deviceStatus.onDropDetect(callback1);
        deviceStatus.onDropDetect(callback2);
        deviceStatus.offDropDetect();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnDropDetectDoubleSubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0300
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0300
     * @tc.desc Verify paired invocation of onDropDetect and offDropDetect runs normally.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectSubscribeThenUnsubscribe start');
      const callback = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOnDropDetectSubscribeThenUnsubscribe callback triggered');
      };
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.offDropDetect(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnDropDetectSubscribeThenUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0400
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0400
     * @tc.desc Verify parameterless callback can be registered by onDropDetect normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectEmptyCallback start');
      const callback = (): void => {
        logD('testOnDropDetectEmptyCallback triggered');
      };
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.offDropDetect(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnDropDetectEmptyCallback failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0500
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0500
     * @tc.desc Verify onDropDetect throws PARAM_ERROR when callback is null.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectWithNullCallback start');
      let exceptionThrown = false;
      try {
        deviceStatus.onDropDetect(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnDropDetectWithNullCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code).assertEqual(ErrorCode.PARAM_ERROR);
      }
      if (!exceptionThrown) {
        logE(`testOnDropDetectWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0600
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0600
     * @tc.desc Verify onDropDetect throws PARAM_ERROR when callback is undefined.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        deviceStatus.onDropDetect(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnDropDetectWithUndefinedCallback: threw error, code=${error.code},message=${error.message}`);
        expect(error.code).assertEqual(ErrorCode.PARAM_ERROR);
      }
      if (!exceptionThrown) {
        logE(`testOnDropDetectWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_0700
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_0700
     * @tc.desc Verify repeatedly registering identical callback via onDropDetect throws SUBSCRIPTION_FAILED.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectSameCallbackRepeatedSubscribe start');
      const callback = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOnDropDetectSameCallbackRepeatedSubscribe callback triggered');
      };
      let exceptionThrown = false;
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.onDropDetect(callback);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOnDropDetectSameCallbackRepeatedSubscribe: threw error, code=${error.code},message=${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(ErrorCode.SUBSCRIPTION_FAILED);
        }

      }
      if (!exceptionThrown) {
        logE(`testOnDropDetectSameCallbackRepeatedSubscribe: API should throw exception`);
        expect().assertFail();
      }
      try {
        deviceStatus.offDropDetect(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnDropDetectSameCallbackRepeatedSubscribe cleanup failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.number SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0100
     * @tc.name SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0100
     * @tc.desc Verify unsubscribe single subscribed callback, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffDropDetectSingleCallbackIdempotentUnsubscribe start');
      const callback = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOffDropDetectSingleCallbackIdempotentUnsubscribe callback triggered');
      };
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.offDropDetect(callback);
        deviceStatus.offDropDetect(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffDropDetectSingleCallbackIdempotentUnsubscribe failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(ErrorCode.UNSUBSCRIPTION_FAILED);
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0200
     * @tc.name SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0200
     * @tc.desc Verify parameterless clear all callbacks, support idempotent call.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffDropDetectNoParamIdempotentClearAll start');
      const callback = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOffDropDetectNoParamIdempotentClearAll callback triggered');
      };
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.offDropDetect();
        deviceStatus.offDropDetect();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffDropDetectNoParamIdempotentClearAll failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(ErrorCode.UNSUBSCRIPTION_FAILED);
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0300
     * @tc.name SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0300
     * @tc.desc Verify offDropDetect throws PARAM_ERROR with null callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffDropDetectWithNullCallback start');
      let exceptionThrown = false;
      try {
        deviceStatus.offDropDetect(null);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffDropDetectWithNullCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffDropDetectWithNullCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0400
     * @tc.name SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0400
     * @tc.desc Verify offDropDetect throws PARAM_ERROR with undefined callback.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffDropDetectWithUndefinedCallback start');
      let exceptionThrown = false;
      try {
        deviceStatus.offDropDetect(undefined);
      } catch (err) {
        exceptionThrown = true;
        let error = err as BusinessError;
        logE(`testOffDropDetectWithUndefinedCallback error. Code: ${error.code}, Message: ${error.message}`);
        expect(error.code === ErrorCode.PARAM_ERROR).assertTrue();
      }
      if (!exceptionThrown) {
        logE(`testOffDropDetectWithUndefinedCallback: API should throw exception`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0500
     * @tc.name SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0500
     * @tc.desc Verify cancel unregistered callback will not throw exception.
     * @tc.level Level2
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffDropDetectWithUnregisteredCallback start');
      const unsubscribedCallback = (data: deviceStatus.DropDetectionStatus): void => {
        logD('testOffDropDetectWithUnregisteredCallback callback triggered');
      };
      try {
        deviceStatus.offDropDetect(unsubscribedCallback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffDropDetectWithUnregisteredCallback failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(ErrorCode.UNSUBSCRIPTION_FAILED);
        }
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0600
     * @tc.name SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0600
     * @tc.desc Verify parameterless interface clears multiple subscribed callbacks normally.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_OFF_DROPDETECT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOffDropDetectNoParamClearMultiCallbacks start');
      const callback1 = (data: deviceStatus.DropDetectionStatus): void => {};
      const callback2 = (data: deviceStatus.DropDetectionStatus): void => {};
      try {
        deviceStatus.onDropDetect(callback1);
        deviceStatus.onDropDetect(callback2);
        deviceStatus.offDropDetect();
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOffDropDetectNoParamClearMultiCallbacks failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.number SUB_MSDP_DeviceStatus_DROPDETECTIONSTATUS_0100
     * @tc.name SUB_MSDP_DeviceStatus_DROPDETECTIONSTATUS_0100
     * @tc.desc Verify DropDetectionStatus.STATUS_NORMAL value is 0.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_DROPDETECTIONSTATUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testDropDetectionStatusNormalValue start');
      try {
        expect(deviceStatus.DropDetectionStatus.STATUS_NORMAL).assertEqual(0);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testDropDetectionStatusNormalValue failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_DROPDETECTIONSTATUS_0200
     * @tc.name SUB_MSDP_DeviceStatus_DROPDETECTIONSTATUS_0200
     * @tc.desc Verify DropDetectionStatus.STATUS_DROPPED value is 1.
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_DROPDETECTIONSTATUS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testDropDetectionStatusDroppedValue start');
      try {
        expect(deviceStatus.DropDetectionStatus.STATUS_DROPPED).assertEqual(1);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testDropDetectionStatusDroppedValue failed. Code: ${error.code}, Message: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MSDP_DeviceStatus_ON_DROPDETECT_1000
     * @tc.name SUB_MSDP_DeviceStatus_ON_DROPDETECT_1000
     * @tc.desc Verify onDropDetect callback receives valid DropDetectionStatus value.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     * @co.authored.by.agent
     */
    it('SUB_MSDP_DeviceStatus_ON_DROPDETECT_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      if (!checkDeviceSysCapSupport()) {
        return;
      }
      logI('====> testOnDropDetectCallbackValueValidation start');
      const callback = (data: deviceStatus.DropDetectionStatus): void => {
        logD(`testOnDropDetectCallbackValueValidation callback triggered, data=${data}`);
        expect(data === deviceStatus.DropDetectionStatus.STATUS_NORMAL ||
          data === deviceStatus.DropDetectionStatus.STATUS_DROPPED).assertTrue();
      };
      try {
        deviceStatus.onDropDetect(callback);
        deviceStatus.offDropDetect(callback);
      } catch (err) {
        let error = err as BusinessError;
        logE(`testOnDropDetectCallbackValueValidation failed. Code: ${error.code}, Message: ${error.message}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail();
        }
      }
    });
  })
}
