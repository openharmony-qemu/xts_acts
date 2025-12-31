/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import { Want, WantAgent, wantAgent, } from '@kit.AbilityKit';


let wantAgentData: WantAgent;
let wantAgentInfo1: wantAgent.WantAgentInfo = {
  wants: [
    {
      bundleName: 'com.example.getwantagentwithuserid',
      abilityName: 'EntryAbility',
    } as Want
  ],
  actionType: wantAgent.OperationType.START_ABILITY,
  requestCode: 0,
  wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
  userId: 100
};
let wantAgentInfo2: wantAgent.WantAgentInfo = {
  wants: [
    {
      bundleName: 'com.example.myapplication2',
      abilityName: 'TestAbility',
      moduleName: 'entry',
    } as Want
  ],
  actionType: wantAgent.OperationType.START_ABILITY,
  requestCode: 0,
  wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
  userId: 101
};
let testTag: string = 'testTag';

export default function getWantAgentWithUserIdTest() {
  describe('getWantAgentWithUserIdTest', () => {
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0100
     * @tc.name      SUB_Ability_GetWantAgent_Test_0100
     * @tc.desc      test GetWantAgent promise success with userID 100 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0100", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0100';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        expect(data !== null).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      });
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })

    /**
     * @tc.number SUB_Ability_GetWantAgent_Test_0200
     * @tc.name SUB_Ability_GetWantAgent_Test_0200
     * @tc.desc test GetWantAgent CallBack success with userID 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0200", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0200';
      wantAgent.getWantAgent(wantAgentInfo1, (err: BusinessError, data: WantAgent) => {
        if (err) {
          hilog.error(0x0000, TEST_CASE_NAME, `getWantAgentCallback failed! ${err.code} ${err.message}`);
          expect().assertFail();
          done();
        } else {
          hilog.info(0x0000, TEST_CASE_NAME, `getWantAgentPromise success, data ${JSON.stringify(wantAgentData)}`);
          expect(wantAgentData !== null).assertTrue();
          done()
        }
      })
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0300
     * @tc.name      SUB_Ability_GetWantAgent_Test_0300
     * @tc.desc      test GetWantAgent promise success with not contain userID 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0300", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0300';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        expect(data !== null).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      });
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number   SUB_Ability_GetWantAgent_Test_0400
     * @tc.name     SUB_Ability_GetWantAgent_Test_0400
     * @tc.desc     test GetWantAgent callback  with not contain userID
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0400", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0400';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo1, (err: BusinessError, data: WantAgent) => {
        if (err) {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect().assertFail();
          done();
        } else {
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          expect(data !== null).assertTrue();
          done();
        }
      })
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0500
     * @tc.name      SUB_Ability_GetWantAgent_Test_0500
     * @tc.desc      test GetWantAgent promise parameter null errcode 401 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0500", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0500';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      try {
        wantAgent.getWantAgent(null).then((data) => {
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
          done();
        });
      } catch (err) {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
        done();
      }
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0600
     * @tc.name      SUB_Ability_GetWantAgent_Test_0600
     * @tc.desc      test GetWantAgent promise parameter undefined errcode 401 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0600", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0600';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      try {
        wantAgent.getWantAgent(undefined).then((data) => {
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
          done();
        });
      } catch (err) {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
        done();
      }
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0700
     * @tc.name      SUB_Ability_GetWantAgent_Test_0700
     * @tc.desc      test GetWantAgent CallBack parameter null errcode 401 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0700", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0700';
      try {
        wantAgent.getWantAgent(null, (err: BusinessError, data: WantAgent) => {
          if (err) {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
            done();
          } else {
            hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
        done();
      }
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0800
     * @tc.name      SUB_Ability_GetWantAgent_Test_0800
     * @tc.desc      test GetWantAgent CallBack parameter undefined errcode 401 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0800", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0800';
      try {
        wantAgent.getWantAgent(undefined, (err: BusinessError, data: WantAgent) => {
          if (err) {
            hilog.error(0x0000, testTag,
              `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
            done();
          } else {
            hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect(err.code).assertEqual(401);
        expect(err.message).assertEqual("Parameter error! Info must be a WantAgentInfo.");
        done();
      }
    })

    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_0900
     * @tc.name      SUB_Ability_GetWantAgent_Test_0900
     * @tc.desc      test GetWantAgent promise parameter with userID -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_Ability_GetWantAgent_Test_0900", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_0900';
      wantAgent.getWantAgent(wantAgentInfo1).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        expect(data !== null).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      });
    })

    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_1000
     * @tc.name      SUB_Ability_GetWantAgent_Test_1000
     * @tc.desc      test GetWantAgent promise errcode 16000151
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("SUB_Ability_GetWantAgent_Test_1000", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_1000';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo2).then((data) => {
        hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, testTag,
          `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
        expect(err.code).assertEqual(16000151);
        expect(err.message).assertEqual('Invalid wantAgent object.');
        done();
      });
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
    /**
     * @tc.number    SUB_Ability_GetWantAgent_Test_1100
     * @tc.name      SUB_Ability_GetWantAgent_Test_1100
     * @tc.desc      test GetWantAgent CallBack errcode 16000151
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("SUB_Ability_GetWantAgent_Test_1100", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_GetWantAgent_Test_1100';
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} Start`);
      wantAgent.getWantAgent(wantAgentInfo2, (err: BusinessError, data: WantAgent) => {
        if (err) {
          hilog.error(0x0000, testTag,
            `${TEST_CASE_NAME} getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          expect(err.code).assertEqual(16000151);
          expect(err.message).assertEqual('Invalid wantAgent object.');
          done();
        } else {
          wantAgentData = data;
          hilog.info(0x0000, testTag, `${TEST_CASE_NAME} getWantAgentPromise success, data ${JSON.stringify(data)}`);
          expect().assertFail();
          done();
        }
      })
      hilog.info(0x0000, testTag, `${TEST_CASE_NAME} End`);
    })
  })
}