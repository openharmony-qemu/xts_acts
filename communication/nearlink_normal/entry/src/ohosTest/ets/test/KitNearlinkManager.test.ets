/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import manager from '@ohos.nearlink.manager';
import { clickRequestPermission } from './ClickRequestPermission';
import { sleep } from './Sleep';
import { openNearLink } from './OpenNearLink';
import {clickOpenNearLinkSwitch, clickCloseNearLinkSwitch, system_support_nearlink} from './Tools'
export default function nearLinkManagerTest() {
  describe('nearLinkManagerTest', () => {
    let TIME_SLEEP = 2000;
    let sleState: manager.NearlinkState;
    let return_boolean: boolean;
    beforeAll(async (done:Function) => {
      console.info('beforeAll start');
      await clickRequestPermission("辅助包执行");
      await sleep(TIME_SLEEP);
      return_boolean = manager.isNearLinkSupported();
      console.info('beforeAll end');
      done();
    });
    beforeEach(async (done:Function) => {
      console.info('beforeEach start');
      await openNearLink();
      console.info('beforeEach end');
      done();
    })
    afterEach(() => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })
    /**
     * @tc.number SUB_Communication_XTS_NearLink_Manager_Enum_0100
     * @tc.name SUB_Communication_XTS_NearLink_Manager_Enum_0100
     * @tc.desc NearlinkState enum values test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Manager_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let caseName = 'SUB_Communication_XTS_NearLink_Manager_Enum_0100';
        console.info(`${caseName} test start`);
        try {
          let STATE_TURNING_ON: manager.NearlinkState = manager.NearlinkState.STATE_TURNING_ON;
          console.info(`${caseName} STATE_TURNING_ON result:` + STATE_TURNING_ON);
          expect(STATE_TURNING_ON).assertEqual(0);
          let STATE_ON: manager.NearlinkState = manager.NearlinkState.STATE_ON;
          console.info(`${caseName} STATE_ON result:` + STATE_ON);
          expect(STATE_ON).assertEqual(1);
          let STATE_TURNING_OFF: manager.NearlinkState = manager.NearlinkState.STATE_TURNING_OFF;
          console.info(`${caseName} STATE_TURNING_OFF result:` + STATE_TURNING_OFF);
          expect(STATE_TURNING_OFF).assertEqual(2);
          let STATE_OFF: manager.NearlinkState = manager.NearlinkState.STATE_OFF;
          console.info(`${caseName} STATE_OFF result:` + STATE_OFF);
          expect(STATE_OFF).assertEqual(3);
        } catch (error) {
          console.info(`${caseName} NearlinkState error.code` + error.code + `,errMessage:` + error.message);
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      })
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_0100
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0100
     * @tc.desc  createPort normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let state = manager.getState();
        console.info('[Nearlink Test] STATE_TURNING_ON:' + JSON.stringify(state));
        expect(typeof state).assertEqual('number');
        const enumvalue: number[] = [manager.NearlinkState.STATE_TURNING_ON, manager.NearlinkState.STATE_ON, manager.NearlinkState.STATE_TURNING_OFF, manager.NearlinkState.STATE_OFF];
        expect(enumvalue.includes(state)).assertTrue();
      }catch (err){
        console.info("[NearLink_test]nearLink state fail "+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_0200
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0200
     * @tc.desc  getLocalName normal test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try{
        let getLocalName = manager.getLocalName();
        console.info('[Nearlink Test] getLocalName NewName = '+ getLocalName);
        expect(typeof getLocalName).assertEqual('string');
      } catch (err){
        console.info("[NearLink_test]nearLink getLocalName fail "+JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_0300
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0300
     * @tc.desc  getPairedDevices test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let pairDevice: Array<string> = manager.getPairedDevices();
        console.info('[Nearlink Test] getPairedDevices info: '+ pairDevice);
        expect(Array.isArray(pairDevice)).assertTrue();
        if (pairDevice.length > 0) {
          console.info('[Nearlink Test] getPairedDevices info: '+ pairDevice[0]);
          expect(pairDevice.length > 0).assertTrue();
        } else {
          expect(pairDevice.length === 0).assertTrue();
        }
      }catch (err) {
        console.info('[Nearlink Test]getPairedDevices fail '+ JSON.stringify(err));
        if (err.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_0400
     * @tc.number SUB_Communication_XTS_NearLink_Manager_0400
     * @tc.desc  stateChange event test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let onReceiveEvent=(result :manager.NearlinkState) => {
        console.info('[Nearlink Test] stateChange = ' + JSON.stringify(result));
        sleState = result;
        expect(result === manager.NearlinkState.STATE_TURNING_ON || result === manager.NearlinkState.STATE_ON ||
          result === manager.NearlinkState.STATE_TURNING_OFF || result === manager.NearlinkState.STATE_OFF).assertTrue();
      };
      try {
        manager.onStateChange(onReceiveEvent);
        await clickCloseNearLinkSwitch();
        for(let i = 0;i <= 100;i++) {
          if (sleState === manager.NearlinkState.STATE_OFF) {
            console.info('[Nearlink Test]  close success111');
            break;
          } else {
            await sleep(100);
          }
        }
        let disableState = manager.getState();
        console.info('[Nearlink Test]  close success2222 is ' + disableState);
        expect(disableState).assertEqual(manager.NearlinkState.STATE_OFF);
        await clickOpenNearLinkSwitch();
        for(let i = 0;i <= 100;i++) {
          if (sleState === manager.NearlinkState.STATE_ON) {
            console.info('[Nearlink Test]  open success3333');
            break;
          } else {
            await sleep(100);
          }
        }
        let enableState = manager.getState();
        console.info('[Nearlink Test]  open success4444 is ' + enableState);
        expect(enableState).assertEqual(manager.NearlinkState.STATE_ON);
        manager.offStateChange(onReceiveEvent);
      } catch (error) {
        console.error(`[Nearlink Test] StateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLink_Manager_ISSUP_0100
     * @tc.number SUB_Communication_XTS_NearLink_Manager_ISSUP_0100
     * @tc.desc  isNearLinkSupported method test.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('SUB_Communication_XTS_NearLink_Manager_ISSUP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let return_boolean: boolean = manager.isNearLinkSupported();
        console.error('[Nearlink Test]isNearLinkSupported fail ' +  return_boolean);
        expect(return_boolean === true || return_boolean === false).assertTrue();
      }catch (err) {
        console.error('[Nearlink Test]isNearLinkSupported fail '+ JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_XTS_NearLink_Manager_ISSUP_0200
     * @tc.name SUB_Communication_XTS_NearLink_Manager_ISSUP_0200
     * @tc.desc 获取布尔类型的系统参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLink_Manager_ISSUP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLink_Manager_ISSUP_0200';
      console.info(`${caseName} test start`);
      try {
        let value: string = await system_support_nearlink();
        let isEnabled: boolean = value === "true";
        console.info(`${caseName} Nearlink is nearlink support status: ${isEnabled}`);
        if (isEnabled) {
          expect(return_boolean === true).assertTrue();
        } else {
          expect(return_boolean === false).assertTrue();
        }
      } catch (e) {
        console.error(`${caseName} Failed to : ${e}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    })

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_0100
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0100
     * @tc.desc manager.onStateChange normal call with callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_0100';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: manager.NearlinkState) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        manager.onStateChange(onReceiveEvent);
        manager.offStateChange(onReceiveEvent);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onStateChange/offStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_0200
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0200
     * @tc.desc manager onStateChange with callback, offStateChange without callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_0200';
      console.info(`${caseName} test start`);
      let onReceiveEvent = (result: manager.NearlinkState) => {
        console.info(`${caseName} NearLink_test result = ` + JSON.stringify(result));
      }
      try {
        manager.onStateChange(onReceiveEvent);
        manager.offStateChange();
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onStateChange/offStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_0300
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0300
     * @tc.desc manager.onStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_0300';
      console.info(`${caseName} test start`);
      try {
        manager.onStateChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_0400
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0400
     * @tc.desc manager.offStateChange with null callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_0400';
      console.info(`${caseName} test start`);
      try {
        manager.offStateChange(null);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_0500
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0500
     * @tc.desc manager.onStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_0500';
      console.info(`${caseName} test start`);
      try {
        manager.onStateChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] onStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name SUB_Communication_XTS_NearLinkPub_Manager_On_0600
     * @tc.number SUB_Communication_XTS_NearLinkPub_Manager_On_0600
     * @tc.desc manager.offStateChange with undefined callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_Communication_XTS_NearLinkPub_Manager_On_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Communication_XTS_NearLinkPub_Manager_On_0600';
      console.info(`${caseName} test start`);
      try {
        manager.offStateChange(undefined);
      } catch (error) {
        console.error(`${caseName}[NearLink_test] offStateChange error, code is ${error.code},message is ${error.message}`);
        if (error.code === 801) {
          console.info('[Nearlink Test] api is not support');
          expect(return_boolean === false).assertTrue();
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
  })
}

