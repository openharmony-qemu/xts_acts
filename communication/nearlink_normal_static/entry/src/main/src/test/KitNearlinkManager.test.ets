'use static'
/**
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-static/src/main/indexStatic';
import manager from '@ohos.nearlink.manager';
import Utils from './Util.test';
import hilog from '@ohos.hilog';
export default function nearLinkManagerTest(): void {
  describe('nearLinkManagerTest', () => {
    let TIME_SLEEP = 2000;
    let sleState: manager.NearlinkState | undefined = undefined;
    let return_boolean: boolean;
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll start');
      await Utils.clickRequestPermission("辅助包执行");
      await Utils.msSleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll end');
      done();
    })
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach start');
      await Utils.openNearLink();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeEach end');
      done();
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterAll');
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_Enum_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Manager_Enum_0100
     * @tc.desc NearlinkState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Manager_Enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Communication_XTS_NearLink_Manager_Enum_static_0100';
        hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
        try {
          let STATE_TURNING_ON: manager.NearlinkState = manager.NearlinkState.STATE_TURNING_ON;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_TURNING_ON result: %{public}d', caseName, STATE_TURNING_ON);
          expect(STATE_TURNING_ON).assertEqual(0);
          let STATE_ON: manager.NearlinkState = manager.NearlinkState.STATE_ON;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_ON result: %{public}d', caseName, STATE_ON);
          expect(STATE_ON).assertEqual(1);
          let STATE_TURNING_OFF: manager.NearlinkState = manager.NearlinkState.STATE_TURNING_OFF;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_TURNING_OFF result: %{public}d', caseName, STATE_TURNING_OFF);
          expect(STATE_TURNING_OFF).assertEqual(2);
          let STATE_OFF: manager.NearlinkState = manager.NearlinkState.STATE_OFF;
          hilog.info(0x0000, 'testTag', '%{public}s STATE_OFF result: %{public}d', caseName, STATE_OFF);
          expect(STATE_OFF).assertEqual(3);
        } catch (error) {
          hilog.info(0x0000, 'testTag', '%{public}s NearlinkState error.code %{public}s,errMessage: %{public}s', caseName, JSON.stringify(error.code), JSON.stringify(error.message));
          expect().assertFail();
        }
        hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
        done();
      })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0100
     * @tc.desc  createPort normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let state = manager.getState();
        hilog.info(0x0000, 'testTag', '[Nearlink Test] STATE_TURNING_ON:%{public}s', JSON.stringify(state));
        expect(typeof state).assertEqual('int');
        const enumvalue: number[] = [manager.NearlinkState.STATE_TURNING_ON, manager.NearlinkState.STATE_ON, manager.NearlinkState.STATE_TURNING_OFF, manager.NearlinkState.STATE_OFF];
        expect(enumvalue.includes(state)).assertTrue();
      } catch (err){
        hilog.info(0x0000, 'testTag', '[NearLink_test]nearLink state fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_static_0200
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0200
     * @tc.desc  getLocalName normal test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let getLocalName = manager.getLocalName();
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getLocalName NewName = %{public}s', getLocalName);
        expect(typeof getLocalName).assertEqual('string');
      } catch (err){
        hilog.info(0x0000, 'testTag', '[NearLink_test]nearLink getLocalName fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_static_0300
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0300
     * @tc.desc  getPairedDevices test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let pairDevice: Array<string> = manager.getPairedDevices();
        hilog.info(0x0000, 'testTag', '[Nearlink Test] getPairedDevices info: %{public}s', pairDevice);
        expect(Array.isArray(pairDevice)).assertTrue();
        if (pairDevice.length > 0) {
          hilog.info(0x0000, 'testTag', '[Nearlink Test] getPairedDevices info: %{public}s', pairDevice[0]);
          expect(pairDevice.length > 0).assertTrue();
        } else {
          expect(pairDevice.length === 0).assertTrue();
        }
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[Nearlink Test]getPairedDevices fail %{public}s', JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_static_0400
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0400
     * @tc.desc  stateChange event test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let onReceiveEvent=(result :manager.NearlinkState) => {
        hilog.info(0x0000, 'testTag', '[Nearlink Test] stateChange = %{public}s', JSON.stringify(result));
        sleState = result;
        expect(result === manager.NearlinkState.STATE_TURNING_ON || result === manager.NearlinkState.STATE_ON ||
          result === manager.NearlinkState.STATE_TURNING_OFF || result === manager.NearlinkState.STATE_OFF).assertTrue();
      };
      try {
        manager.onStateChange(onReceiveEvent);
        await Utils.clickCloseNearLinkSwitch();
        for (let i = 0;i <= 100;i++) {
          if (sleState! === manager.NearlinkState.STATE_OFF) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  close success111');
            break;
          } else {
            await Utils.msSleep(100);
          }
        }
        let disableState = manager.getState();
        hilog.info(0x0000, 'testTag', '[Nearlink Test]  close success2222 is %{public}s', disableState);
        expect(disableState).assertEqual(manager.NearlinkState.STATE_OFF);
        await Utils.clickOpenNearLinkSwitch();
        for (let i = 0;i <= 100;i++) {
          if (sleState! === manager.NearlinkState.STATE_ON) {
            hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test]  open success3333');
            break;
          } else {
            await Utils.msSleep(100);
          }
        }
        let enableState = manager.getState();
        hilog.info(0x0000, 'testTag', '[Nearlink Test]  open success4444 is %{public}s', enableState);
        expect(enableState).assertEqual(manager.NearlinkState.STATE_ON);
        manager.offStateChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test] StateChange error, code is %{public}s,message is %{public}s', error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_ISSUP_static_0100
     * @tc.number SUB_Communication_XTS_NearLink_Manager_ISSUP_0100
     * @tc.desc  isNearLinkSupported method test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_ISSUP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let return_boolean: boolean = manager.isNearLinkSupported();
        hilog.error(0x0000, 'testTag', '[Nearlink Test]isNearLinkSupported fail %{public}s', return_boolean);
        expect(return_boolean === true || return_boolean === false).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', '[Nearlink Test]isNearLinkSupported fail %{public}s', JSON.stringify(err));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_ISSUP_static_0300
     * @tc.number SUB_Communication_XTS_NearLink_Manager_ISSUP_0300
     * @tc.desc  isFrameType4Supported method test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_ISSUP_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLink_Manager_ISSUP_static_0300';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] call isFrameType4Supported start');
        let isFrameType4Supported: boolean = manager.isFrameType4Supported();
        hilog.info(0x0000, 'testTag', '[Nearlink Test] isFrameType4Supported result: %{public}s', JSON.stringify(isFrameType4Supported));
        expect(isFrameType4Supported === true || isFrameType4Supported === false).assertTrue();
      } catch (err) {
        hilog.info(0x0000, 'testTag', '[NearLink_test]nearLink isFrameType4Supported fail %{public}s', JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_static_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0100
     * @tc.desc manager.onStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_static_0100';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: manager.NearlinkState) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        manager.onStateChange(onReceiveEvent);
        manager.offStateChange(onReceiveEvent);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onStateChange/offStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_static_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0200
     * @tc.desc manager onStateChange with callback, offStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_static_0200';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      let onReceiveEvent = (result: manager.NearlinkState) => {
        hilog.info(0x0000, 'testTag', '%{public}s NearLink_test result = %{public}s', caseName, JSON.stringify(result));
      }
      try {
        manager.onStateChange(onReceiveEvent);
        manager.offStateChange();
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] onStateChange/offStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_static_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0600
     * @tc.desc manager.offStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_static_0600';
      hilog.info(0x0000, 'testTag', '%{public}s test start', caseName);
      try {
        manager.offStateChange(undefined);
      } catch (error) {
        hilog.error(0x0000, 'testTag', '%{public}s[NearLink_test] offStateChange error, code is %{public}s,message is %{public}s', caseName, error.code, error.message);
        if (error.code === 801) {
          hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s test end', caseName);
      done();
    })
  })
}

