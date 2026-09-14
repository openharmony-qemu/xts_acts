/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[AudioRoutingManagerSpecErrorTest]';

export default function AudioRoutingManagerSpecErrorTest() {
  describe('audioRoutingManagerSpecErrorTest', () => {
    let audioManager: audio.AudioManager | null = null;
    let routingManager: audio.AudioRoutingManager | null = null;

    beforeAll(() => {
      console.info(`${TAG} beforeAll`);
      audioManager = audio.getAudioManager();
      routingManager = audioManager.getRoutingManager();
    });

    beforeEach(() => {
      console.info(`${TAG} beforeEach`);
    });

    afterEach(() => {
      console.info(`${TAG} afterEach`);
    });

    afterAll(() => {
      console.info(`${TAG} afterAll`);
      routingManager = null;
      audioManager = null;
    });

    /**
     * @tc.name    testGetDevicesCallbackEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_ERROR_0100
     * @tc.desc    getDevices(callback) deviceFlag is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesCallbackEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      routingManager!.getDevices(null, (err: BusinessError, devices: audio.AudioDeviceDescriptors) => {
        if (err) {
          console.error(`${TAG} testGetDevicesCallbackEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testGetDevicesCallbackEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_ERROR_0200
     * @tc.desc    getDevices(callback) deviceFlag is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesCallbackEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
        routingManager!.getDevices(undefined, (err: BusinessError, devices: audio.AudioDeviceDescriptors) => {
        if (err) {
          console.error(`${TAG} testGetDevicesCallbackEnumUndefined0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testGetDevicesCallbackEnumOutOfRange0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_ERROR_0300
     * @tc.desc    getDevices(callback) deviceFlag is out of range 999, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesCallbackEnumOutOfRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
        routingManager!.getDevices(999 as audio.DeviceFlag, (err: BusinessError, devices: audio.AudioDeviceDescriptors) => {
        if (err) {
          console.error(`${TAG} testGetDevicesCallbackEnumOutOfRange0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testGetDevicesPromiseEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_PROMISE_ERROR_0100
     * @tc.desc    getDevices(promise) deviceFlag is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesPromiseEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.getDevices(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesPromiseEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testGetDevicesPromiseEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_PROMISE_ERROR_0200
     * @tc.desc    getDevices(promise) deviceFlag is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesPromiseEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.getDevices(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesPromiseEnumUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testGetDevicesPromiseEnumOutOfRange0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_PROMISE_ERROR_0300
     * @tc.desc    getDevices(promise) deviceFlag is out of range 999, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesPromiseEnumOutOfRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.getDevices(999 as audio.DeviceFlag);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesPromiseEnumOutOfRange0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name    testGetDevicesSyncEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_DEVICES_SYNC_ERROR_0100
     * @tc.desc    getDevicesSync deviceFlag is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetDevicesSyncEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        routingManager!.getDevicesSync(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetDevicesSyncEnumUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testGetAvailableDevicesEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_AVAILABLE_DEVICES_ERROR_0100
     * @tc.desc    getAvailableDevices deviceUsage is null, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetAvailableDevicesEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        routingManager!.getAvailableDevices(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetAvailableDevicesEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testGetAvailableDevicesEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_AVAILABLE_DEVICES_ERROR_0200
     * @tc.desc    getAvailableDevices deviceUsage is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetAvailableDevicesEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        routingManager!.getAvailableDevices(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testGetAvailableDevicesEnumUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testSetCommunicationDeviceEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_SET_COMMUNICATION_DEVICE_ERROR_0100
     * @tc.desc    setCommunicationDevice deviceType is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetCommunicationDeviceEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.setCommunicationDevice(null, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetCommunicationDeviceEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testSetCommunicationDeviceEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_SET_COMMUNICATION_DEVICE_ERROR_0200
     * @tc.desc    setCommunicationDevice deviceType is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetCommunicationDeviceEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.setCommunicationDevice(undefined, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetCommunicationDeviceEnumUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testSetCommunicationDeviceEnumOutOfRange0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_SET_COMMUNICATION_DEVICE_ERROR_0300
     * @tc.desc    setCommunicationDevice deviceType is out of range 999, expect error code 6800301
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetCommunicationDeviceEnumOutOfRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.setCommunicationDevice(999 as audio.CommunicationDeviceType, true);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetCommunicationDeviceEnumOutOfRange0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800301);
        done();
      }
    });

    /**
     * @tc.name    testSetCommunicationDeviceActiveNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_SET_COMMUNICATION_DEVICE_ERROR_0400
     * @tc.desc    setCommunicationDevice active is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetCommunicationDeviceActiveNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetCommunicationDeviceActiveNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testSetCommunicationDeviceActiveUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_SET_COMMUNICATION_DEVICE_ERROR_0500
     * @tc.desc    setCommunicationDevice active is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testSetCommunicationDeviceActiveUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.setCommunicationDevice(audio.CommunicationDeviceType.SPEAKER, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSetCommunicationDeviceActiveUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testIsCommunicationDeviceActiveCallbackEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_CB_ERROR_0100
     * @tc.desc    isCommunicationDeviceActive(callback) deviceType is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActiveCallbackEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      routingManager!.isCommunicationDeviceActive(null, (err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`${TAG} testIsCommunicationDeviceActiveCallbackEnumNull0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testIsCommunicationDeviceActiveCallbackEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_CB_ERROR_0200
     * @tc.desc    isCommunicationDeviceActive(callback) deviceType is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActiveCallbackEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
        routingManager!.isCommunicationDeviceActive(undefined, (err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`${TAG} testIsCommunicationDeviceActiveCallbackEnumUndefined0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testIsCommunicationDeviceActiveCallbackEnumOutOfRange0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_CB_ERROR_0300
     * @tc.desc    isCommunicationDeviceActive(callback) deviceType is out of range 999, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActiveCallbackEnumOutOfRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
        routingManager!.isCommunicationDeviceActive(999 as audio.CommunicationDeviceType, (err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`${TAG} testIsCommunicationDeviceActiveCallbackEnumOutOfRange0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800104);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });

    });

    /**
     * @tc.name    testIsCommunicationDeviceActivePromiseEnumNull0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_PROMISE_ERROR_0100
     * @tc.desc    isCommunicationDeviceActive(promise) deviceType is null, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActivePromiseEnumNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.isCommunicationDeviceActive(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsCommunicationDeviceActivePromiseEnumNull0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testIsCommunicationDeviceActivePromiseEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_PROMISE_ERROR_0200
     * @tc.desc    isCommunicationDeviceActive(promise) deviceType is undefined, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActivePromiseEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.isCommunicationDeviceActive(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsCommunicationDeviceActivePromiseEnumUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800101);
        done();
      }
    });

    /**
     * @tc.name    testIsCommunicationDeviceActivePromiseEnumOutOfRange0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_PROMISE_ERROR_0300
     * @tc.desc    isCommunicationDeviceActive(promise) deviceType is out of range 999, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActivePromiseEnumOutOfRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await routingManager!.isCommunicationDeviceActive(999 as audio.CommunicationDeviceType);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsCommunicationDeviceActivePromiseEnumOutOfRange0100 error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6800104);
        done();
      }
    });

    /**
     * @tc.name    testIsCommunicationDeviceActiveSyncEnumUndefined0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_IS_COMMUNICATION_DEVICE_ACTIVE_SYNC_ERROR_0100
     * @tc.desc    isCommunicationDeviceActiveSync deviceType is undefined, expect error code 401
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testIsCommunicationDeviceActiveSyncEnumUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        routingManager!.isCommunicationDeviceActiveSync(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testIsCommunicationDeviceActiveSyncEnumUndefined0100 error: ${error.code}, ${error.message}`);
        expect(error.message).assertContain('parameter');
        done();
      }
    });

    /**
     * @tc.name    testGetPreferredInputDeviceForCapturerInfoSourceIllegal0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SPEC_AUDIO_ROUTING_MANAGER_GET_PREFERRED_INPUT_DEVICE_FOR_CAPTURER_INFO_ERROR_0100
     * @tc.desc    getPreferredInputDeviceForCapturerInfo capturerInfo.source is illegal 999, expect error code 6800101
     * @tc.type    FUNCTION
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('testGetPreferredInputDeviceForCapturerInfoSourceIllegal0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
    let capturerInfo: audio.AudioCapturerInfo = {
      source: 999 as audio.SourceType,
      capturerFlags: 0
    };
      routingManager!.getPreferredInputDeviceForCapturerInfo(capturerInfo, (err: BusinessError, devices: audio.AudioDeviceDescriptors) => {
        if (err) {
          console.error(`${TAG} testGetPreferredInputDeviceForCapturerInfoSourceIllegal0100 error: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(6800101);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
    });
  });
}
