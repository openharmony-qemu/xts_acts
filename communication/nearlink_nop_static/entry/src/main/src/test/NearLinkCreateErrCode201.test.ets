'use static'
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-static/src/main/indexStatic';
import manager from '@ohos.nearlink.manager';
import remoteDevice from '@ohos.nearlink.remoteDevice';
import hilog from '@ohos.hilog';

export default function nearLinkErrCodeCreate201Test(): void {
  let ADDRESS = "22:33:44:55:66:77"
  let RemoteD: remoteDevice.RemoteDevice | undefined = undefined;
  describe('nearLinkErrCodeCreate201Test', () => {
    let return_boolean: boolean
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      try {
        return_boolean = manager.isNearLinkSupported();
        RemoteD = remoteDevice.createRemoteDevice(ADDRESS);
        hilog.info(0x0000, 'testTag', '%{public}s', 'nearLink createRemoteDevice result:' + RemoteD);
        expect(true).assertEqual(RemoteD !== null);
      } catch (error){
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', `api is not support`);
            expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll end');
      done();
    })
    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach');
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll');
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0400
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0400
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let deviceClass = RemoteD!.getDeviceClass();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] getDeviceClass = ' + JSON.stringify(deviceClass));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(return_boolean === true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0100
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0100
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await RemoteD!.startPairing();
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(return_boolean === true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0600
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0600
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let acbState = RemoteD!.getAcbState();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] getAcbState = ' + JSON.stringify(acbState));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(return_boolean === true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0500
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0500
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let connectionState = RemoteD!.getConnectionState();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] getConnectionState = ' + JSON.stringify(connectionState));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(return_boolean === true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0300
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0300
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let name = RemoteD!.getDeviceName();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] getDeviceName = ' + JSON.stringify(name));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(return_boolean === true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0700
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0700
     * @tc.desc getDeviceInformation 201 API24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caseName = 'LOG_SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0700';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} test start`);
      try {
        let result: remoteDevice.DeviceInformation = RemoteD!.getDeviceInformation();
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} getDeviceInformation:` + result);
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} api is not support`);
            expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(201);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} test end`);
    })

    /**
     * @tc.number SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_0200
     * @tc.name SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0200
     * @tc.desc Check the return value of the interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_RemoteDevice_Nop_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let state = RemoteD!.getPairingState();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearLink_test] getPairingState = ' + JSON.stringify(state));
        expect().assertFail();
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', '[NearLink Test] fail ' + JSON.stringify(error.code) + JSON.stringify(error.message));
        if (error.code === 801) {
          expect(return_boolean === false).assertTrue();
        } else {
          expect(return_boolean === true).assertTrue();
          expect(error.code).assertEqual(201);
        }
      }
      done();
    })
  })
}
