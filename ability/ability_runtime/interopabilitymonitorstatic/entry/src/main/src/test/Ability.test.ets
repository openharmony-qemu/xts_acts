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
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';

let tag = "ActsInteropAbilityMonitorStatic";
let testAbilityContext:common.UIAbilityContext;

export default function abilityTest() {

  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let monitor: abilityDelegatorRegistry.InteropAbilityMonitor;
  let TAG = "";

  describe('ActsInteropAbilityMonitorStatic', () => {
    beforeAll(async() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      await Utils.msSleep(2000)
      delegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsinteropabilitymonitorstatictest.static")
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
    })
    afterEach(async () => {
      hilog.info(0x0000, tag, '%{public}s', TAG + " afterEach each called");
      await Utils.msSleep(3000);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddInteropAbilityMonitorSync_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AddInteropAbilityMonitorSync_static_0100
     * @tc.desc   Use addInteropAbilityMonitorSync to add a monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddInteropAbilityMonitorSync_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddInteropAbilityMonitorSync_static_0100";
      hilog.info(0x0000, tag, '%{public}s', TAG + " start");
      let onAbilityCreate = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onAbilityCreate");
        expect(false).assertTrue();
      }
      let onAbilityForeground = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + " onAbilityForeground");
        expect(false).assertTrue();
      }
      let onAbilityBackground = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onAbilityBackground ====>");
        expect(false).assertTrue();
      }
      let onAbilityDestroy = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + " onAbilityDestroy====>");
        expect(false).assertTrue();
        done();
      }
      let onWindowStageCreate = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onWindowStageCreate====>");
        expect(false).assertTrue();
      }
      let onWindowStageRestore = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onWindowStageRestore====>");
        expect(false).assertTrue();
      }
      let onWindowStageDestroy = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onWindowStageDestroy====>");
        expect(false).assertTrue();
      }

      monitor = {
        abilityName: 'MainAbility2',
        moduleName:"entry",
        onAbilityCreate: onAbilityCreate,
        onAbilityForeground: onAbilityForeground,
        onAbilityBackground: onAbilityBackground,
        onAbilityDestroy: onAbilityDestroy,
        onWindowStageCreate: onWindowStageCreate,
        onWindowStageRestore: onWindowStageRestore,
        onWindowStageDestroy: onWindowStageDestroy,
      };
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>addInteropAbilityMonitorSync start");
      delegator.addInteropAbilityMonitorSync(monitor);
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>addInteropAbilityMonitorSync success====>");
      delegator.startAbility({
        bundleName: 'com.open.harmony.actsinteropabilitymonitorstatictest.static',
        abilityName: 'MainAbility2'
      }).then(() => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>startAbility success");
      });
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveInteropAbilityMonitorSync_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_RemoveInteropAbilityMonitorSync_static_0100
     * @tc.desc   Use removeInteropAbilityMonitorSync to remove a monitor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveInteropAbilityMonitorSync_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveInteropAbilityMonitorSync_static_0100";
      hilog.info(0x0000, tag, '%{public}s', TAG + " start");
      let onAbilityCreate = (ability: Any) => {
        hilog.info(0x0000, tag, '%{public}s', TAG + "====>onAbilityCreate");
        expect(false).assertTrue();
      }

      monitor = {
        abilityName: 'MainAbility2',
        moduleName:"entry",
        onAbilityCreate: onAbilityCreate,
      };
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>addInteropAbilityMonitorSync start");
      delegator.addInteropAbilityMonitorSync(monitor);
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>addInteropAbilityMonitorSync success====>");
      
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>removeInteropAbilityMonitorSync start");
      delegator.removeInteropAbilityMonitorSync(monitor);
      hilog.info(0x0000, tag, '%{public}s', TAG + "====>removeInteropAbilityMonitorSync success====>");
      done();
    })

  })
}