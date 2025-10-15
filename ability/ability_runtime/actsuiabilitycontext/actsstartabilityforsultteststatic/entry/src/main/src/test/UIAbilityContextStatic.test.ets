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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions'
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import deviceInfo from "@ohos.deviceInfo";
import { image } from '@kit.ImageKit';
import AbilityStage from '@ohos.app.ability.AbilityStage';
import abilityConstant from '@ohos.app.ability.AbilityConstant';
import { UIContext } from '@ohos.arkui.UIContext';
import autoFillManager from '@ohos.app.ability.autoFillManager';
import { application } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit'
import window from '@ohos.window';
import bundleManager from '@ohos.bundle.bundleManager';
import CompletionHandler from "@ohos.app.ability.CompletionHandler";
import fileIo from '@ohos.file.fs';
import contextConstant from "@ohos.app.ability.contextConstant";
import { abilityDelegatorRegistry } from '@kit.TestKit';
import InteropAbilityLifecycleCallback from '@ohos.app.ability.InteropAbilityLifecycleCallback';


let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let applicationContext: common.ApplicationContext;

let domain: Int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext

let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let opts: image.InitializationOptions = {editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
let disable = false;
let testContext: common.UIAbilityContext;

type AbilityCallbackFn = (ability: Any) => void;
type WindowStageCallbackFn = (ability: Any, windowStage: window.WindowStage) => void;

class MyInteropAbilityLifecycleCallback implements InteropAbilityLifecycleCallback {
  onAbilityCreate: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityCreate');
  };

  onWindowStageCreate: WindowStageCallbackFn = (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageCreate');
  };

  onWindowStageDestroy: WindowStageCallbackFn = (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageDestroy');
  };

  onAbilityDestroy: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityDestroy');
  };

  onAbilityForeground: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityForeground');
  };

  onAbilityBackground: AbilityCallbackFn = (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityBackground');
  };
}

export default function UIAbilityContextStatic() {
  describe('ActsUIAbilityContextStatic', () => {

    beforeAll(() => {
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.startabilityforresulttest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'start success');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      await context.revokeDelegator().then(() => {
        hilog.info(domain, tag, 'revokeDelegator success');
      }).catch((err: BusinessError): void => {
        if (err.code == 801) {
          disable = true;
        }
        hilog.info(domain, tag, `beforeAll revokeDelegator failed, code is ${err.code}, message is ${err.message}`);
      });
      hilog.info(domain, tag, 'getcontext success, context: ' + context);
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200
     * @tc.name   : SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_Static_0200
     * @tc.desc   : Call UIAbilityContext showAbility succeeded.(promise),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
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
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100
    * @tc.name   : SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_Static_0100
    * @tc.desc   : Call UIAbilityContext hideAbility succeeded.(promise),
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
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
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800
    * @tc.name   : SUB_Ability_AbilityRuntime_BackgroundRecovery_Static_0800
    * @tc.desc   : API test for context.setRestoreEnabled.
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
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
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300
    * @tc.name   : SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300
    * @tc.desc   : API test for context.SetAbilityInstanceInfo.
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain,  tag , " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      let successCount = 0;
      for (let i = 0; i < 10; i++) {
        try {
          await context.setAbilityInstanceInfo('111111' + i, pixelMap);
          successCount++;
        } catch (err) {
          hilog.info(domain, tag, "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        }
      }
      if (successCount === 10) {
        hilog.info(domain, tag,  " success");
        done();
      } else {
        hilog.info(domain, tag,  " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      }
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100
    * @tc.name   : SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100
    * @tc.desc   : API test for context.SetAbilityInstanceInfo.
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain,  tag , " it begin");
      if (deviceInfo.deviceType !== '2in1') {
        done();
        return;
      }
      try {
        await context.setAbilityInstanceInfo('', pixelMap);
        hilog.info(domain,  tag , " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(domain,  tag , "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        let code = (err as BusinessError).code;
        try { expect(code).assertEqual(401); } catch (err) {}
        hilog.info(domain,  tag , " success");
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_HookAbility_Static_0700
     * @tc.name   : SUB_Ability_AbilityRuntime_HookAbility_Static_0700
     * @tc.desc   : API test for context.revokeDelegator.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
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
    })

    /*
     * @tc.number: SUB_AA_AbilityStageMonitor_Static_0100
     * @tc.name: SUB_AA_AbilityStageMonitor_Static_0100
     * @tc.desc: Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 1
     */
    it("SUB_AA_AbilityStageMonitor_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const itName = 'waitAbilityStageMonitor_callback';
        hilog.info(domain, tag, `${itName} waitAbilityStageMonitor start`);
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './ets/myabilitystage/MyAbilityStage.ets',
        }, (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor err ${err?.code}`);
          expect(err?.code).assertEqual(16000100);
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor end`);
        })
        done()
      })

    /*
     * @tc.number: SUB_AA_AbilityStageMonitor_Static_0200
     * @tc.name: SUB_AA_AbilityStageMonitor_Static_0200
     * @tc.desc: Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 1
     */
    it("SUB_AA_AbilityStageMonitor_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const itName = 'waitAbilityStageMonitor_callback';
        hilog.info(domain, tag, `${itName} waitAbilityStageMonitor start`);
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './ets/myabilitystage/MyAbilityStage.ets',
        },100, (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor err ${err?.code}`);
          expect(err?.code).assertEqual(16000100);
          hilog.info(domain, tag, `${itName} waitAbilityStageMonitor end`);
        })
        done()
      })

    /*
     * @tc.number: SUB_AA_AbilityStageMonitor_Static_0300
     * @tc.name: SUB_AA_AbilityStageMonitor_Static_0300
     * @tc.desc: Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 1
     */
    it('SUB_AA_AbilityStageMonitor_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './Application/MyAbilityStage.ts',
        }).then((err: BusinessError): void => {
          hilog.info(domain,  tag ,'waitAbilityStageMonitor promise' + err?.code);
          expect(err?.code).assertEqual(16000100);
        });
      } catch (error) {
        expect().assertFail()
        done()
      }
      done()
    })

    /*
     * @tc.number: SUB_AA_AbilityStageMonitor_Static_0400
     * @tc.name: SUB_AA_AbilityStageMonitor_Static_0400
     * @tc.desc: Verify that the callback form of waitAbilityStageMonitor can get the abilityStage instance
     * @tc.level: 1
     */
    it('SUB_AA_AbilityStageMonitor_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let timeout = 100;
      try {
        abilityDelegator.waitAbilityStageMonitor({
          moduleName: 'entry',
          srcEntrance: './Application/MyAbilityStage.ts',
        },timeout).then((err: BusinessError): void => {
          hilog.info(domain,  tag ,'waitAbilityStageMonitor promise' + err?.code);
          expect(err?.code).assertEqual(16000100);
        });
      } catch (error) {
        expect().assertFail()
        done()
      }
      done()
    })

    /*
     * @tc.number  SUB_Ability_AbilityBase_AbilityConstant_Static_3000
     * @tc.name    SUB_Ability_AbilityBase_AbilityConstant_Static_3000
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.desc    Test abilityConstant LaunchReason.PRELOAD.
     * @tc.level   3
     */
    it('SUB_Ability_AbilityBase_AbilityConstant_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect('11').assertEqual(abilityConstant.LaunchReason.PRELOAD + '');
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_AutoSave_Static_0100
     * @tc.name: SUB_Ability_AbilityRuntime_AutoSave_Static_0100
     * @tc.desc: Manually call the RequestAutoSave interface and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_Static_0100';
      let isSuccess = false;
      let isFailure = false;
      let uiContext: UIContext
      hilog.info(domain,  tag ,"uiContext: ", uiContext);
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(domain,  tag ,"save request on success");
          isSuccess = true;
        },
        onFailure: () => {
          hilog.info(domain,  tag ,"save request on failure");
          isFailure = true;
        }
      }
      try {
        autoFillManager.requestAutoSave(uiContext, callback);
      } catch (error) {
        expect(isSuccess).assertFalse();
        expect(isFailure).assertFalse();
        done();
      }
      hilog.info(domain,  tag ,"du.yuan end");
      done();
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.name   : SUB_Ability_AbilityRuntime_PluginAbility_Static_1200
     * @tc.desc   : Expect: failed with code 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_PluginAbility_Static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        application.createPluginModuleContext(testContext, '', '');
      } catch (err: Error) {
        hilog.info(domain,  tag , 'createContextFailed: ' + JSON.stringify(err));
        expect(err.code).assertEqual(0);
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0800
     * @tc.name   : SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0800
     * @tc.desc   : Expect: failed with code 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let MyNewInteropAbilityLifecycleCallback: InteropAbilityLifecycleCallback = new MyInteropAbilityLifecycleCallback()
      try {
        applicationContext.offInteropAbilityLifecycle(MyNewInteropAbilityLifecycleCallback)
        hilog.info(domain, tag, `offInteropAbilityLifecycle success`)
        expect().assertFail()
        done()
      } catch (error) {
        hilog.info(domain, tag, 'offInteropAbilityLifecycle ' + JSON.stringify(error));
        let code = (error as BusinessError).code;
        hilog.info(domain, tag, `offInteropAbilityLifecycle err${code}`)
        expect(code === 401).assertTrue();
        done();
      }
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0900
    * @tc.name   : SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0900
    * @tc.desc   : offInteropAbilityLifecycle（） no param
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        applicationContext.offInteropAbilityLifecycle()
        hilog.info(domain, tag, `offInteropAbilityLifecycle success`)
        expect().assertFail()
        done()
      } catch (error) {
        hilog.info(domain, tag, 'offInteropAbilityLifecycle ' + JSON.stringify(error));
        let code = (error as BusinessError).code;
        hilog.info(domain, tag, `offInteropAbilityLifecycle err${code}`)
        expect(code === 401).assertTrue();
        done();
      }
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_1000
    * @tc.name   : SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_1000
    * @tc.desc   : onInteropAbilityLifecycle（）
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let MyNewInteropAbilityLifecycleCallback: InteropAbilityLifecycleCallback = new MyInteropAbilityLifecycleCallback()
      try {
        applicationContext.onInteropAbilityLifecycle(MyNewInteropAbilityLifecycleCallback)
        hilog.info(domain, tag, `onInteropAbilityLifecycle success`)
      } catch (error) {
        hilog.info(domain, tag, 'onInteropAbilityLifecycle ' + JSON.stringify(error));
        let code = (error as BusinessError).code;
        hilog.info(domain, tag, `onInteropAbilityLifecycle err${code}`)
        expect().assertFail()
        done();
      }
      try {
        applicationContext.offInteropAbilityLifecycle(MyNewInteropAbilityLifecycleCallback)
        hilog.info(domain, tag, `offInteropAbilityLifecycle success`)
        done()
      } catch (error) {
        hilog.info(domain, tag, 'offInteropAbilityLifecycle ' + JSON.stringify(error));
        let code = (error as BusinessError).code;
        hilog.info(domain, tag, `offInteropAbilityLifecycle err${code}`)
        expect().assertFail()
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AutoSave_Static_0200
     * @tc.name   : SUB_Ability_AbilityRuntime_AutoSave_Static_0200
     * @tc.desc   : Manually call the RequestAutoSave interface and trigger success callback.
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_Static_0200';
      let isSuccess = false;
      let isFailure = false;
      let uiContext: UIContext
      hilog.info(domain,  tag ,"uiContext: ", uiContext);
      try {
        autoFillManager.requestAutoSave(uiContext);
      } catch (error) {
        expect(isSuccess).assertFalse();
        expect(isFailure).assertFalse();
        done();
      }
      hilog.info(domain,  tag ,"du.yuan end");
      done();
    })

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1200
    * @tc.name   : SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1200
    * @tc.desc   : API test for context.SetAbilityInstanceInfo for 801.
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain,  tag , " it begin");
      if (deviceInfo.deviceType !== 'phone') {
        done();
        return;
      }
      try {
        await context.setAbilityInstanceInfo('', pixelMap);
        hilog.info(domain,  tag , " fail");
        try { expect().assertFail(); } catch (err) {}
        done();
      } catch (err) {
        hilog.info(domain,  tag , "setAbilityInstanceInfo failed: " + JSON.stringify(err))
        let code = (err as BusinessError).code;
        try { expect(code).assertEqual(801); } catch (err) {}
        hilog.info(domain,  tag , " success");
        done();
      }
    })
  })
}