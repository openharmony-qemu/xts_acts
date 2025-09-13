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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import AbilityStage from "@ohos.app.ability.AbilityStage"

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.AbilityStageContext
let addMonitor = false;
let removeMonitor = false;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function AbilityStageContextStatic() {
  describe('AbilityStageContextStatic', () => {

    beforeAll(() => {
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.stagecontexttest.static")
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0700
     * @tc.name: SUB_AA_AbilityStageMonitor_0700
     * @tc.desc: Call the promise form of addAbilityStageMonitor to add monitoring,
     * and call the promise form of removeAbilityStageMonitor to cancel monitoring
     * Verify that addAbilityStageMonitor can add monitoring,
     * verify that removeAbilityStageMonitor can cancel monitoring
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      addMonitor = false;
      removeMonitor = false;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: 'entry',
        srcEntrance: './ets/Application/MyAbilityStage.ts',
      }
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 wait abilityStage");
      await abilityDelegator.addAbilityStageMonitor(stageMonitor).then(() => {
        hilog.info(domain, tag, "stageMonitor addAbilityStageMonitor promise success");
        addMonitor = true;
      }).catch((err: BusinessError<void>): void => {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 addAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 removeAbilityStageMonitor");
      await abilityDelegator.removeAbilityStageMonitor(stageMonitor).then(() => {
        hilog.info(domain, tag, "stageMonitor addAbilityStageMonitor promise success");
        removeMonitor = true;
      }).catch((err: BusinessError<void>): void => {
        hilog.info(domain, tag,
          "SUB_AA_AbilityStageMonitor_0700 removeAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      expect(addMonitor).assertTrue();
      expect(removeMonitor).assertTrue();
      done()
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_0800
     * @tc.name: SUB_AA_AbilityStageMonitor_0800
     * @tc.desc: Call the callback form of addAbilityStageMonitor to add monitoring,
     * and call the callback form of removeAbilityStageMonitor to cancel monitoring
     * Verify that addAbilityStageMonitor can add monitoring,
     * verify that removeAbilityStageMonitor can cancel monitoring
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      addMonitor = false;
      removeMonitor = false;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: 'entry',
        srcEntrance: './ets/Application/MyAbilityStage.ts',
      }
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 wait abilityStage");
      try {
        abilityDelegator.addAbilityStageMonitor(stageMonitor, (err) => {
          hilog.info(domain, tag,"SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback" + "err: " + err);
          addMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      try {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor");
        abilityDelegator.removeAbilityStageMonitor(stageMonitor, (err) => {
          hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor callback" + "err: " + err);
          removeMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      setTimeout(() => {
        expect(addMonitor).assertTrue()
        expect(removeMonitor).assertTrue()
        done()
      }, 6000);
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitorSync_0100
     * @tc.name: addAbilityStageMonitorSync001
     * @tc.desc: Call the synchronous method of addAbilityStageMonitorSync to add monitoring,
     * call the ynchronous method of removeAbilityStageMonitorSync to cancel monitoring
     * Verify that addAbilityStageMonitorSync can add monitoring,
     * verify that removeAbilityStageMonitorSync can cancel monitoring
     * @tc.level: 3
     */
    it('addAbilityStageMonitorSync001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      addMonitor = false;
      removeMonitor = false;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: "entry",
        srcEntrance: "./ets/Application/MyAbilityStage.ts",
      }
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitorSync_0100 wait abilityStage");
      try {
        abilityDelegator.addAbilityStageMonitorSync(stageMonitor);
        hilog.info(domain, tag,"SUB_AA_AbilityStageMonitorSync_0100 addAbilityStageMonitorSyce finish");
      } catch (error) {
        expect().assertFail()
        done()
      }
      try{
        abilityDelegator.removeAbilityStageMonitorSync(stageMonitor);
        hilog.info(domain, tag,"SUB_AA_AbilityStageMonitorSync_0100 removeAbilityStageMonitorSync finish");
      } catch(error) {
        expect().assertFail()
        done()
      }
      expect(true).assertTrue();
      done()
    })
  })
}
