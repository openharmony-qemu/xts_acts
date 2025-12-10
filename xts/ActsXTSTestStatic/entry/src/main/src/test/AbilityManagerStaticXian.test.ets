/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityManager from "@ohos.app.ability.abilityManager"

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityManagerStaticTest() {
  describe('abilityManagerStaticTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200
     * @tc.desc   Call UIAbilityContext showAbility succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'MainAbility1'
      };
      try {
        context.startAbility(want, (err: BusinessError<void>|null) => {
          if (err?.code) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            return;
          }
          hilog.info(domain, tag,'startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(domain, tag,`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      context.showAbility().then(() => {
        hilog.info(domain, tag,`showAbility success`);
      }).catch((err: BusinessError): void => {
        hilog.info(domain, tag,`showAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            hilog.info(domain, tag,"getSync" + JSON.stringify(info));
            if (info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            hilog.info(domain, tag,"getSync unexpected error: " + e);
          }
        }
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0100
     * @tc.desc   Call UIAbilityContext startAbilityForResult succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0100`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        await context.startAbilityForResult(want).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100
     * @tc.desc   Call UIAbilityContext hideAbility succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'MainAbility1'
      };
      try {
        context.startAbility(want, (err: BusinessError<void>|null) => {
          if (err?.code) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            return;
          }
          hilog.info(domain, tag,'startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(domain, tag,`startAbility failed, code is ${code}, message is ${message}`);
      }
      let info: string;
      context.hideAbility().then(() => {
        hilog.info(domain, tag,`highAbility success`);
      }).catch((err: BusinessError): void => {
        hilog.info(domain, tag,`highAbility fail, err: ${JSON.stringify(err)}`);
        if (err.code === 801) {
          done();
        } else {
          try {
            let info: string =
              systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            hilog.info(domain, tag,"getSync" + JSON.stringify(info));
            if(info == "true")
            {
              expect(err.code).assertEqual(16000067);
              done();
            }
          } catch (e) {
            hilog.info(domain, tag,"getSync unexpected error: " + e);
          }
        }
      });
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0900
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0900
     * @tc.desc   Verify isRamConstrainedDevice(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0900`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_0900 begin');
      try {
        appManager.isRamConstrainedDevice((err, data)=>{
          expect(typeof data).assertEqual('boolean');
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800
     * @tc.desc   API test for context.setRestoreEnabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let par: boolean = true
      try {
        context.setRestoreEnabled(par);
        hilog.info(domain, tag, 'setRestoreEnabled success ');
        expect(par).assertTrue()
        done();
      } catch (error) {
        hilog.info(domain, tag, 'setRestoreEnabled failed ' + JSON.stringify(error));
        let code = (error as BusinessError).code;
        expect(code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0200
     * @tc.desc   Call UIAbilityContext startAbilityForResult failed.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0200`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityForResultest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbilityForResult(want).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300
     * @tc.desc   API test for context.SetAbilityInstanceInfo errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "it begin");
      try {
        await context.setAbilityInstanceInfo('', pixelMap);
        hilog.info(domain, tag, "fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(domain,  tag, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        let code = (err as BusinessError).code;
        try { expect(code).assertEqual(401); } catch (err) {}
        hilog.info(domain, tag, "success");
        done();
      }
    });

    /**
     * @tc.name   Public_API_Test_App_Manager_Static_0100
     * @tc.number Public_API_Test_App_Manager_Static_0100
     * @tc.desc   Test the third-party application get ProcessState enum will be right
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Public_API_Test_App_Manager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(appManager.ProcessState.STATE_CREATE + '').assertEqual('0');
      expect(appManager.ProcessState.STATE_FOREGROUND + '').assertEqual('1');
      expect(appManager.ProcessState.STATE_ACTIVE + '').assertEqual('2');
      expect(appManager.ProcessState.STATE_BACKGROUND + '').assertEqual('3');
      expect(appManager.ProcessState.STATE_DESTROY + '').assertEqual('4');
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0300
     * @tc.desc   Call UIAbilityContext startAbilityForResult with options succeeded.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0300`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1',
      };
      let options: StartOptions = {
        displayId: 0,
      };
      try {
        await context.startAbilityForResult(want, options).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect().assertFail();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100
     * @tc.desc   API test for context.SetAbilityInstanceInfo errcode 801, 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag , "it begin");
      try {
        await context.setAbilityInstanceInfo('instance label', pixelMap)
          .catch((err: BusinessError): void => {
            hilog.info(domain, tag , "setAbilityInstanceInfo failed: " + JSON.stringify(err))
            let code = err?.code;
            if (code === 801) {
              hilog.info(domain, tag , "device not support multi instance");
              done();
            } else {
              hilog.info(domain, tag , "setAbilityInstanceInfo err: " + code)
              try { expect(code).assertEqual(201); } catch (err) {}
              done();
            }
          });
      } catch (err) {
        hilog.info(domain, tag , "setAbilityInstanceInfo error: " + JSON.stringify(err))
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_1100
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_1100
     * @tc.desc   Verify getAppMemorySize(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_1100`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_1100 begin');
      try {
        appManager.getAppMemorySize().then((data: Int) => {
          console.log(`The size of app memory is: ${JSON.stringify(data)}`);
          expect(typeof (data)).assertEqual("number");
          expect(data).assertLarger(0);
          done();
        }).catch((err: BusinessError): void => {
          expect().assertFail();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0400
     * @tc.desc   Call UIAbilityContext startAbilityForResult with options failed.(promise),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0400`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options).then(() => {
          hilog.info(domain, tag, `startAbilityForResult success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbilityForResult error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000001);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HookAbility_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_HookAbility_Static_0700
     * @tc.desc   API test for context.revokeDelegator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_HookAbility_Static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain,  tag , " it begin");
      if (disable) {
        done();
        return;
      }
      context.revokeDelegator().then(() => {
        hilog.info(domain,  tag ,'%{public}s', 'revokeDelegator success');
      }).catch((err: BusinessError): void => {
        expect(err.code).assertEqual(16000084);
        hilog.info(domain,  tag , '%{public}s revokeDelegator failed', JSON.stringify(err));
        done();
      });
      hilog.info(domain,  tag , '%{public}s', '--end');
    });

    /**
     * @tc.name   System_API_Test_Ability_Manager_Static_0400
     * @tc.number System_API_Test_Ability_Manager_Static_0400
     * @tc.desc   Test the third-party application without permission call getAbilityRunningInfos only get self info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("System_API_Test_Ability_Manager_Static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = 'System_API_Test_Ability_Manager_Static_0400';
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.systemapitest.static");
      await Utils.msSleep(2000);
      abilityManager.getAbilityRunningInfos()
        .then((data: abilityManager.AbilityRunningInfo[]): void => {
          hilog.info(domain, tag, 'data: ' + JSON.stringify(data[0]));
          expect(data.length + '').assertEqual('1');
          expect(data[0].ability.bundleName).assertEqual('com.example.systemapitest.static');
          expect(data[0].pid).assertLargerOrEqual(0);
          expect(data[0].uid).assertLargerOrEqual(0);
          expect(data[0].processName).assertEqual("com.example.systemapitest.static");
          expect(data[0].abilityState).not().assertNull();
          expect(data[0].startTime).assertLarger(0);
          done();
        })
        .catch((err: BusinessError): void => {
          hilog.info(domain, tag, ' err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.number SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.desc   Expect: failed with code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        application.createPluginModuleContext(context, '', '')
          .then((data: string): void => {
            hilog.info(0x0000, 'testTag', 'createPluginModuleContext success data:' + JSON.stringify(data));
          })
          .catch((err: BusinessError): void => {
            hilog.info(0x0000, 'testTag', `createPluginModuleContext faiiled code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err: BusinessError) {
        hilog.info(domain,  tag , 'createPluginModuleContext Failed: ' + JSON.stringify(err));
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_1200
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_1200
     * @tc.desc   Verify getAppMemorySize(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_1200`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_1200 begin');
      try {
        appManager.getAppMemorySize((err: BusinessError| null, data: Int | undefined)=>{
          expect(typeof (data)).assertEqual("number");
          expect(data).assertLarger(0);
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0500
     * @tc.desc   Call UIAbilityContext startAbilityForResult succeeded.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0500`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1'
      };
      try {
        context.startAbilityForResult(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground,expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100`;
      console.log(`${tag}, it begin`);
      try {
        let appCloneIndex: Int = applicationContext.getCurrentAppCloneIndex();
      } catch (err: BusinessError) {
        console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
        expect(err?.code).assertEqual(16000071);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0600
     * @tc.desc   Call UIAbilityContext startAbilityForResult failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0600`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbilityerror'
      };
      try {
        context.startAbilityForResult(want, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0100
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0100
     * @tc.desc   Test the return value of the isRunningInStabilityTest interface(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0100`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_0100 begin');
      try {
        appManager.isRunningInStabilityTest().then((data: boolean)=>{
          hilog.info(domain, tag, 'isRunningInStabilityTest success, pid: ' + data);
          expect(data).assertFalse();
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
          expect().assertFail();
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, ' isRunningInStabilityTest error, errorCode: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0700
     * @tc.desc   Call UIAbilityContext startAbilityForResult with options succeeded.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect(true).assertTrue()
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} on applicationStateChange`);
          const cb = new CustomApplicationStateChangeCallback();
          applicationContext.onApplicationStateChange(cb);

          hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
          await uiAbilityContext.moveAbilityToBackground()
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
          expect(cb.isBackground).assertTrue();

          hilog.info(domain, tag, `${itName} start EntryAbility ability`);
          await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
          expect(cb.isForeground).assertTrue();

          hilog.info(domain, tag, `${itName} off applicationStateChange`);
          applicationContext.offApplicationStateChange(cb);
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, `${itName} end`);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0800
     * @tc.desc   Call UIAbilityContext startAbility with options failed.(callback),
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_startAbilityForResult_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbilityForResult_Static_0800`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.startabilityforresulttest.static',
        abilityName: 'EntryAbilityerror'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError<void> | null) => {
          if (err && err.code !== 0) {
            hilog.info(domain, tag,`startAbilityForResult failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            hilog.info(domain, tag, `startAbilityForResult success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbilityForResult fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   System_API_Test_App_Manager_Static_1700
     * @tc.number System_API_Test_App_Manager_Static_1700
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_App_Manager_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let bundleName = "com.ohos.application";
      try {
        appManager.killProcessesByBundleName(bundleName, false).then(() => {
          hilog.info(domain, tag, 'System_API_Test_App_Manager_Static_1700 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1700 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (paramError: BusinessError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1700 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200`;
        try {
          hilog.info(domain, tag, `${itName} on applicationStateChange`);
          const cb = new CustomApplicationStateChangeCallback();
          applicationContext.onApplicationStateChange(cb);

          hilog.info(domain, tag, `${itName} off applicationStateChange`);
          applicationContext.offApplicationStateChange(cb);

          hilog.info(domain, tag, `${itName} start EntryAbility1 ability`);
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'EntryAbility1'
          }
          await uiAbilityContext.startAbility(want);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} EntryAbility1 moveAbilityToBackground`);
          const uiAbilityContext1 = AppStorage.get<common.UIAbilityContext>("UIAbilityContext1") as common.UIAbilityContext;
          await uiAbilityContext1.moveAbilityToBackground();
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
          await uiAbilityContext.moveAbilityToBackground();
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
          expect(cb.isBackground).assertFalse();

          hilog.info(domain, tag, `${itName} start EntryAbility ability`);
          await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
          expect(cb.isForeground).assertFalse();
        } catch (err: BusinessError) {
          expect().assertFail();
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0200
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0200
     * @tc.desc   Test the return value of the isRunningInStabilityTest interface(CallBack).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0200`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_0200 begin');
      try {
        appManager.isRunningInStabilityTest((err, data)=>{
          hilog.info(domain, tag, 'isRunningInStabilityTest success, pid: ' + data);
          expect(data).assertFalse();
          done();
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300`;
        try {
          hilog.info(domain, tag, `${itName} on applicationStateChange`);
          const cb = new CustomApplicationStateChangeCallback();
          applicationContext.onApplicationStateChange(cb);

          hilog.info(domain, tag, `${itName} off applicationStateChange`);
          applicationContext.offApplicationStateChange();

          hilog.info(domain, tag, `${itName} start EntryAbility1 ability`);
          const want: Want = {
            bundleName: `${BUNDLE_NAME}`,
            abilityName: 'EntryAbility1'
          }
          await uiAbilityContext.startAbility(want);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} EntryAbility1 moveAbilityToBackground`);
          const uiAbilityContext1 = AppStorage.get<common.UIAbilityContext>("UIAbilityContext1") as common.UIAbilityContext;
          await uiAbilityContext1.moveAbilityToBackground();
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
          await uiAbilityContext.moveAbilityToBackground();
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
          expect(cb.isBackground).assertFalse();

          hilog.info(domain, tag, `${itName} start EntryAbility ability`);
          await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
          expect(cb.isForeground).assertFalse();
        } catch (err: BusinessError) {
          expect().assertFail();
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      });


    /**
     * @tc.name   System_API_Test_Ability_Manager_Static_0900
     * @tc.number System_API_Test_Ability_Manager_Static_0900
     * @tc.desc   cover all value of abilityState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("System_API_Test_Ability_Manager_Static_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `System_API_Test_Ability_Manager_Static_0900`;
      hilog.info(domain, tag, 'test begin');
      try {
        expect(abilityManager.AbilityState.INITIAL + '').assertEqual('0');
        expect(abilityManager.AbilityState.FOCUS + '').assertEqual('2');
        expect(abilityManager.AbilityState.FOREGROUND + '').assertEqual('9');
        expect(abilityManager.AbilityState.BACKGROUND + '').assertEqual('10');
        expect(abilityManager.AbilityState.FOREGROUNDING + '').assertEqual('11');
        expect(abilityManager.AbilityState.BACKGROUNDING + '').assertEqual('12');
        hilog.info(domain, tag, 'test end');
        done();
      } catch (error) {
        hilog.info(domain, tag,' failed: ' + JSON.stringify(error));
        expect().assertFail()
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100
     * @tc.desc   onInteropAbilityLifecycle（）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          let cb: InteropAbilityLifecycleCallback = new MyInteropAbilityLifecycleCallback()
          hilog.info(domain, tag, `${itName} onInteropAbilityLifecycle`);
          applicationContext.onInteropAbilityLifecycle(cb)
          hilog.info(domain, tag, `${itName} offInteropAbilityLifecycle`);
          applicationContext.offInteropAbilityLifecycle(cb);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, `${itName} end`);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0400
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0400
     * @tc.desc   Verify that isAppRunning is called when no permission is available(appCloneIndex).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0400`;
      hilog.info(domain, tag, `SUB_Ability_AbilityBase_AppManager_Static_0400 begin`);
      try {
        appManager.isAppRunning('com.example.systemapitest.static', 0).then((data: boolean)=>{
          hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
          expect(data).assertFalse();
          done();
        }).catch((err: BusinessError): void=>{
          hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200
     * @tc.desc   offInteropAbilityLifecycle（） no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          let cb: InteropAbilityLifecycleCallback = new MyInteropAbilityLifecycleCallback()
          applicationContext.offInteropAbilityLifecycle(cb);
          expect().assertFail()
          done()
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect(err.code === 401).assertTrue();
          hilog.info(domain, tag, `${itName} end`);
          done();
        }
      });

    /**
     * @tc.name   System_API_Test_App_Manager_Static_1800
     * @tc.number System_API_Test_App_Manager_Static_1800
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_App_Manager_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let bundleName = "com.ohos.application";
      try {
        appManager.killProcessesByBundleName(bundleName, false, 0).then(() => {
          hilog.info(domain, tag, 'System_API_Test_App_Manager_Static_1800 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1800 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (paramError: BusinessError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1800 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground,expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_static_0100`;
      hilog.info(domain, tag, `it begin`);
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        hilog.info(domain, tag, 'getAbilityDelegator success');
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.moveabilitytobgtest.static")
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'start success');
        let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
        hilog.info(domain, tag, 'getcontext success, context: ' + context);
        context.moveAbilityToBackground().then(async () => {
          await Utils.msSleep(2000);
          hilog.info(domain, tag, `moveAbilityToBackground success.`);
          let result = AppStorage.get<string>("onBackground")
          expect(result + '').assertEqual('SUCCESS');
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
          if(JSON.stringify(err?.code) == '16000061'){
            done();
          }else{
            expect().assertFail()
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `moveAbilityToBackground fail: ` + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0500
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0500
     * @tc.desc   Verify that isAppRunning is called when no permission is available(no appCloneIndex)).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0500`;
      hilog.info(domain, tag, `SUB_Ability_AbilityBase_AppManager_Static_0500 begin`);
      try {
        appManager.isAppRunning('com.example.systemapitest.static').then((data: boolean)=>{
          hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
          expect(data).assertFalse();
          done();
        }).catch((err: BusinessError): void=>{
          hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground twice, expecting to return 16000065 on the second attempt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200`;
      hilog.info(domain, tag, `it begin`);
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        hilog.info(domain, tag, 'getAbilityDelegator success');
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.moveabilitytobgtest.static")
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'start success');
        let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
        hilog.info(domain, tag, 'getcontext success, context: ' + context);
        context.moveAbilityToBackground().then(() => {
          hilog.info(domain, tag, `moveAbilityToBackground success.`);
          let result = AppStorage.get<string>("onBackground")
          expect(result + '').assertEqual('SUCCESS');
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
        });
        await Utils.msSleep(2000);
        context.moveAbilityToBackground().then(() => {
          hilog.info(domain, tag, `moveAbilityToBackground success.`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `moveAbilityToBackground error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000065);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `moveAbilityToBackground fail: ` + err);
        expect().assertFail();
        done();
      }
    });
  })
}
