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
      context = AppStorage.get<common.AbilityStageContext>("AbilityStageContext") as common.AbilityStageContext
      hilog.info(domain, tag, 'beforeAll end');
    })


    /**
     * @tc.number    : ABILITY_TEST_COLORMODE_Static_0100
     * @tc.name      : AbilityStageContext001
     * @tc.desc      : test filed of colorMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('AbilityStageContext001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'AbilityStageContext001 info ' + JSON.stringify(context));
      try {
        hilog.info(domain, tag, 'AbilityStageContext001 info ' + JSON.stringify(context));
        if (context) {
          expect(context != null).assertTrue();
          let abilityInfo = context.currentHapModuleInfo;
          hilog.info(domain, tag, 'AbilityStageContext001 info ' + JSON.stringify(abilityInfo));
          expect(abilityInfo != null).assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + abilityInfo.name);
          expect(abilityInfo.name == "entry").assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.icon: ` + abilityInfo.icon);
          expect(abilityInfo.icon == "$media:layered_image").assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.iconId: ` + abilityInfo.iconId);
          expect(typeof (abilityInfo.iconId) == 'long').assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.label: ` + abilityInfo.label);
          expect(abilityInfo.label == "$string:EntryAbility_label").assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.labelId: ` + abilityInfo.labelId);
          expect(typeof (abilityInfo.labelId) == 'long').assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.description: ` + abilityInfo.description);
          expect(abilityInfo.description == "$string:EntryAbility_desc").assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.descriptionId: ` + abilityInfo.descriptionId);
          expect(typeof (abilityInfo.descriptionId) == 'long').assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.mainElementName: ` + abilityInfo.mainElementName);
          expect(abilityInfo.mainElementName == "MyAbilityStage").assertTrue();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.metadata: ` + abilityInfo.metadata.length);
          expect(abilityInfo.metadata.length >= 0).assertTrue();

          let config = context.config
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.language);
          expect(context.config.language).not().assertUndefined();
          expect(context.config.language).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.colorMode);
          expect(context.config.colorMode).not().assertUndefined();
          expect(context.config.colorMode).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.direction);
          expect(context.config.direction).not().assertUndefined();
          expect(context.config.direction).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.screenDensity);
          expect(context.config.screenDensity).not().assertUndefined();
          expect(context.config.screenDensity).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.displayId);
          expect(context.config.displayId).not().assertUndefined();
          expect(context.config.displayId).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.hasPointerDevice);
          expect(context.config.hasPointerDevice).not().assertUndefined();
          expect(context.config.hasPointerDevice).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.fontId);
          expect(context.config.fontId).not().assertUndefined();
          expect(context.config.fontId).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.fontSizeScale);
          expect(context.config.fontSizeScale).not().assertUndefined();
          expect(context.config.fontSizeScale).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.fontWeightScale);
          expect(context.config.fontWeightScale).not().assertUndefined();
          expect(context.config.fontWeightScale).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.mcc);
          expect(context.config.mcc).not().assertUndefined();
          expect(context.config.mcc).not().assertNull();
          hilog.info(domain, tag, `AbilityStageContext001 abilityInfo.name: ` + config.mnc);
          expect(context.config.mnc).not().assertUndefined();
          expect(context.config.mnc).not().assertNull();
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, 'testAbilityInfoStatic001 fail: ' + err);
        expect().assertFail();
        done();
      }
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
      await abilityDelegator.addAbilityStageMonitor(stageMonitor).then((data) => {
        hilog.info(domain, tag, "stageMonitor addAbilityStageMonitor promise, data = " + data);
        addMonitor = true;
      }).catch((err: BusinessError<void>): void => {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 addAbilityStageMonitor err: " + JSON.stringify(err));
        expect().assertFail()
        done()
      });
      await abilityDelegator.waitAbilityStageMonitor(stageMonitor).then((abilityStage) => {
        hilog.info(domain, tag, "stageMonitor waitAbilityStageMonitor promise, abilityStage: " + abilityStage);
      }).catch((err: BusinessError<void>): void => {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 waitAbilityStageMonitor err: " + err);
        expect(err.code).assertEqual(-1)
      })
      hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 removeAbilityStageMonitor");
      await abilityDelegator.removeAbilityStageMonitor(stageMonitor).then((data) => {
        hilog.info(domain, tag, "stageMonitor addAbilityStageMonitor promise, data = " + data);
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
        abilityDelegator.addAbilityStageMonitor(stageMonitor, (err, data) => {
          hilog.info(domain, tag,"SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback, data = " + data +
            "err: " + err);
          addMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      abilityDelegator.waitAbilityStageMonitor(stageMonitor, (err, data) => {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 waitAbilityStageMonitor callback " +
          "err = " + err + ", data = " + JSON.stringify(data));
        let moduleName1 = data?.context.currentHapModuleInfo.name;
        expect(moduleName1).assertEqual("feature_assista")
        done();
      })
      try {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor");
        abilityDelegator.removeAbilityStageMonitor(stageMonitor, (err, data) => {
          hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 removeAbilityStageMonitor callback, data = " +
            data + "err: " + err);
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
     * @tc.number: SUB_AA_AbilityStageMonitor_0900
     * @tc.name: SUB_AA_AbilityStageMonitor_0900
     * @tc.desc: Call waitAbilityStageMonitor, input monitor, timeout is 3 seconds
     * Verify that waitAbilityStageMonitor is
     * created after listening for less than 3 seconds
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let timeout = 3000;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: 'entry',
        srcEntrance: './ets/Application/MyAbilityStage.ts',
      }
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        abilityDelegator.addAbilityStageMonitor(stageMonitor, (err, data) => {
          hilog.info(domain, tag,"SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback, data = " + data +
            "err: " + err);
          addMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      abilityDelegator.waitAbilityStageMonitor(stageMonitor, timeout, (error, data) => {
        if (error) {
          hilog.info(domain, tag,`SUB_AA_AbilityStageMonitor_0900 fail, error: ${JSON.stringify(error)}`);
          expect().assertFail()
          done()
        } else {
          hilog.info(domain, tag,`SUB_AA_AbilityStageMonitor_0900 success, data: ${JSON.stringify(data)}`);
          let moduleName1 = data?.context.currentHapModuleInfo.name;
          expect(moduleName1).assertEqual("entry")
          done();
        }
      });
    })

    /**
     * @tc.number: SUB_AA_AbilityStageMonitor_1000
     * @tc.name: SUB_AA_AbilityStageMonitor_1000
     * @tc.desc: Call waitAbilityStageMonitor, input monitor, timeout is 3 seconds
     * Verify that waitAbilityStageMonitor is
     * created after listening for less than 3 seconds
     * @tc.level: 3
     */
    it('SUB_AA_AbilityStageMonitor_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let timeout: long = 3000;
      let stageMonitor: abilityDelegatorRegistry.AbilityStageMonitor = {
        moduleName: 'entry',
        srcEntrance: './ets/Application/MyAbilityStage.ts',
      }
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        abilityDelegator.addAbilityStageMonitor(stageMonitor, (err, data) => {
          hilog.info(domain, tag,"SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback, data = " + data +
            "err: " + err);
          addMonitor = true;
        })
      } catch (error) {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0800 addAbilityStageMonitor callback err: " + error);
        expect().assertFail()
        done()
      }
      abilityDelegator.waitAbilityStageMonitor(stageMonitor, timeout).then((data: AbilityStage) => {
        hilog.info(domain, tag, "stageMonitor waitAbilityStageMonitor promise, abilityStage: " + data);
          let moduleName1 = data?.context.currentHapModuleInfo.name;
          expect(moduleName1).assertEqual("entry")
          done();
      }).catch((err: BusinessError<void>): void => {
        hilog.info(domain, tag, "SUB_AA_AbilityStageMonitor_0700 waitAbilityStageMonitor err: " + err);
        expect().assertFail()
        done()
      });
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
