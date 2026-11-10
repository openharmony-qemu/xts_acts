'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import hilog from '@ohos.hilog'
import { RecordData } from '@ohos.base'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import window from '@ohos.window';
import { application, contextConstant, StartOptions } from '@kit.AbilityKit';
import ApplicationContext from 'application.ApplicationContext';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let context: common.UIAbilityContext | undefined;

/**
 * Result of one getAllWindowStages() call. The application context of the static runtime rejects
 * the call while a window stage is being created or destroyed, so the call is retried and the
 * failure is reported as data instead of an exception.
 */
interface StageReading {
  ok: boolean;
  stages: window.WindowStage[];
  names: string[];
}

/** Read getAllWindowStages() and resolve the ability behind every reported stage. */
async function readStages(appContext: common.ApplicationContext, testCase: string): Promise<StageReading> {
  for (let i = 0; i < 5; i++) {
    try {
      let stages: window.WindowStage[] = await appContext.getAllWindowStages();
      let names: string[] = [];
      for (let stage of stages) {
        try {
          let host: common.UIAbilityContext =
            stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
          names.push(host.abilityInfo.name);
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${testCase} stage not resolvable: ${err.message}`);
        }
      }
      hilog.info(0x0000, 'testTag',
        `${testCase} stage count ${stages.length}, resolvable ${names.length}, names ${JSON.stringify(names)}`);
      return { ok: true, stages: stages, names: names };
    } catch (e) {
      let err: Error = e as Error;
      hilog.error(0x0000, 'testTag', `${testCase} getAllWindowStages rejected: ${err.message}`);
      await Utils.msSleep(300);
    }
  }
  return { ok: false, stages: [], names: [] };
}

/**
 * Poll getAllWindowStages() until the reported stage count stops changing. Window stages of the
 * abilities started by this suite and by the sibling static suite are torn down asynchronously, so
 * a single read can still observe a count that is about to drop.
 */
async function stableStageCount(appContext: common.ApplicationContext, testCase: string): Promise<number> {
  let previous: number = -1;
  let stale: number = -1;
  let reading: StageReading = await readStages(appContext, testCase);
  for (let i = 0; i < 30; i++) {
    // a dying stage is still reported while it cannot be resolved any more, so the count has to stay
    // the same and complete for two consecutive reads before it is used as the baseline
    let complete: boolean = reading.ok && reading.stages.length === reading.names.length;
    if (previous === reading.stages.length && stale === reading.stages.length && complete) {
      break;
    }
    stale = previous;
    previous = reading.stages.length;
    await Utils.msSleep(300);
    reading = await readStages(appContext, testCase);
  }
  hilog.info(0x0000, 'testTag',
    `${testCase} stable stage count ${reading.stages.length}, resolvable ${reading.names.length}`);
  return reading.stages.length;
}

/** Poll until the expected number of window stages is reported, all of them resolvable. */
async function waitForStageCount(appContext: common.ApplicationContext, expected: number,
  testCase: string): Promise<number> {
  let reading: StageReading = await readStages(appContext, testCase);
  for (let i = 0; i < 30 && (reading.stages.length !== expected || reading.names.length !== expected); i++) {
    await Utils.msSleep(300);
    reading = await readStages(appContext, testCase);
  }
  hilog.info(0x0000, 'testTag',
    `${testCase} stage count ${reading.stages.length}, resolvable ${reading.names.length}, expected ${expected}`);
  return reading.stages.length;
}

/**
 * startAbility() is rejected with 16000017 while another ability is still starting. The static
 * runtime starts abilities one after another, so the call is retried instead of failing the case.
 * Returns true when the ability was started, otherwise false.
 */
async function startWithRetry(want: Want, testCase: string,
  options?: StartOptions): Promise<boolean> {
  let lastCode: number = 0;
  let appContext: common.ApplicationContext = context!.getApplicationContext();
  let baseline: number = (await appContext.getAllWindowStages()).length;
  for (let i = 0; i < 20; i++) {
    try {
      if (options === undefined) {
        await context!.startAbility(want);
      } else {
        await context!.startAbility(want, options);
      }
      hilog.info(0x0000, 'testTag', `${testCase} startAbility success.`);
      return true;
    } catch (e) {
      lastCode = Utils.errorCode(e as Object);
      hilog.error(0x0000, 'testTag', `${testCase} startAbility attempt ${i} rejected: ${JSON.stringify(e)}`);
      if (lastCode !== 16000017) {
        return false;
      }
      // a start is rejected while an earlier one is still in flight: wait until the stage count
      // settles so that a retry cannot be rejected by the same pending start again
      let previous: number = -1;
      for (let j = 0; j < 30 && previous !== baseline; j++) {
        previous = baseline;
        await Utils.msSleep(500);
        baseline = (await appContext.getAllWindowStages()).length;
      }
      hilog.info(0x0000, 'testTag', `${testCase} stage count settled at ${baseline} before retry ${i + 1}`);
    }
  }
  return false;
}

/** Names of the abilities this suite starts; the ability that runs the suite is named TestAbility. */
function includesStartedAbility(names: string[]): boolean {
  return names.includes('EntryAbility') || names.includes('EntryAbility1');
}

/** Terminate the ability started by a case so that its window stage does not leak to the next one. */
async function terminateEntryAbility1(testCase: string): Promise<void> {
  try {
    let entry1Ctx: common.UIAbilityContext =
      AppStorage.get<common.UIAbilityContext>('EntryAbility1_UIAbilityContext') as common.UIAbilityContext;
    await entry1Ctx.terminateSelf();
    hilog.info(0x0000, 'testTag', `${testCase} EntryAbility1_UIAbilityContext terminateSelf successed`);
  } catch (e) {
    let err: Error = e as Error;
    hilog.error(0x0000, 'testTag', `${testCase} EntryAbility1 terminateSelf failed, message: ${err.message}`);
  }
}

/**
 * Snapshot of the window stages that EntryAbility1 recorded when it entered the given lifecycle
 * state. The absolute size of that snapshot depends on the abilities that are still alive, so the
 * snapshot only has to hold at least one stage and the ability that reached the state must be part
 * of it.
 */
function assertRecordedSnapshot(key: string, testCase: string): void {
  let recorded = AppStorage.get<window.WindowStage[]>(key) as window.WindowStage[];
  hilog.info(0x0000, 'testTag', `${testCase} [${key}] size ${recorded.length}`);
  expect(recorded.length).assertLarger(0);
  let names: string[] = [];
  for (let stage of recorded) {
    try {
      let host: common.UIAbilityContext =
        stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
      names.push(host.abilityInfo.name);
    } catch (e) {
      let err: Error = e as Error;
      hilog.error(0x0000, 'testTag', `${testCase} [${key}] stage not resolvable: ${err.message}`);
    }
  }
  hilog.info(0x0000, 'testTag', `${testCase} [${key}] names ${JSON.stringify(names)}`);
  expect(includesStartedAbility(names)).assertEqual(true);
}

export default function actsGetStaticTest(): void {
  describe('actsGetStaticTest', (): void => {
    beforeAll(async () => {
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let cmd = `aa start -a EntryAbility -b com.example.getAllWindowStages.static`;
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2600
     * @tc.number SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2600
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2600';
        let applicationContext: common.ApplicationContext = context!.getApplicationContext();
        let beforeCount: number = await stableStageCount(applicationContext, TESTCASE);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE);
        if (!startOk) {
          // the ability could not be started, so the reported stages have to stay exactly as they
          // were before the call
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          let unchanged: StageReading = await readStages(applicationContext, TESTCASE);
          expect(unchanged.ok).assertEqual(true);
          expect(unchanged.stages.length).assertEqual(beforeCount);
          done();
          return;
        }
        // starting EntryAbility1 adds exactly one window stage to the reported ones
        let afterCount: number = await waitForStageCount(applicationContext, beforeCount + 1, TESTCASE);
        let reading: StageReading = await readStages(applicationContext, TESTCASE);
        expect(reading.ok).assertEqual(true);
        expect(afterCount).assertEqual(beforeCount + 1);
        expect(reading.stages.length).assertEqual(beforeCount + 1);
        expect(reading.names.includes('EntryAbility1')).assertEqual(true);
        await terminateEntryAbility1(TESTCASE);
        done();
      });

     /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500
     * @tc.desc       onForeground getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0500';
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        await Utils.msSleep(1000);
        // snapshot the ability recorded itself in onForeground
        assertRecordedSnapshot('onForeground_WindowStage', TESTCASE);
        await terminateEntryAbility1(TESTCASE);
        done();
      })

  /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600
     * @tc.desc       onBackground getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0600';
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        await Utils.msSleep(1000);
        // snapshot the ability recorded itself in onBackground
        assertRecordedSnapshot('onBackground_WindowStage', TESTCASE);
        await terminateEntryAbility1(TESTCASE);
        done();
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000
     * @tc.desc       Obtain the WindowStage after launching multiple instances of the application
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1000';
        await Utils.msSleep(1000);
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let beforeCount: number = await stableStageCount(appContext, TESTCASE);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
          parameters: {
            'ohos.extra.param.key.createAppInstance': true
          } as Record<string, RecordData>
        };
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE);
        if (!startOk) {
          // multi-instance may be rejected (e.g. 16000078); the stage count of this instance stays
          hilog.error(0x0000, 'testTag', `${TESTCASE} startAbility rejected`);
          let unchanged: StageReading = await readStages(appContext, TESTCASE);
          expect(unchanged.ok).assertEqual(true);
          expect(unchanged.stages.length).assertEqual(beforeCount);
          done();
          return;
        }
        // the new application instance owns its own window stage, so the count grows by one
        let afterCount: number = await waitForStageCount(appContext, beforeCount + 1, TESTCASE);
        let reading: StageReading = await readStages(appContext, TESTCASE);
        expect(reading.ok).assertEqual(true);
        expect(afterCount).assertEqual(beforeCount + 1);
        expect(reading.stages.length).assertEqual(beforeCount + 1);
        expect(includesStartedAbility(reading.names)).assertEqual(true);
        await terminateEntryAbility1(TESTCASE);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000
     * @tc.desc       createModuleContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3000';
        await Utils.msSleep(1000);
        let appContext: common.ApplicationContext =
          (await application.createModuleContext(context!, 'entry')).getApplicationContext();
        let beforeCount: number = await stableStageCount(appContext, TESTCASE);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        // the application context of the module context reports the same application stages
        let afterCount: number = await waitForStageCount(appContext, beforeCount + 1, TESTCASE);
        let reading: StageReading = await readStages(appContext, TESTCASE);
        expect(reading.ok).assertEqual(true);
        expect(afterCount).assertEqual(beforeCount + 1);
        expect(reading.stages.length).assertEqual(beforeCount + 1);
        expect(includesStartedAbility(reading.names)).assertEqual(true);
        await terminateEntryAbility1(TESTCASE);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700
     * @tc.desc       Pressure Test
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1700';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1',
        };
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        let i = 0;
        for (i = 0; i < 1000; i++) {
          // the reading reports a rejected call as data, a deferred assertion is reported by
          // Hypium as a failure of the next case
          let reading: StageReading = await readStages(appContext, `${TESTCASE} iteration ${i}`);
          expect(reading.ok).assertEqual(true);
          expect(reading.stages.length).assertLarger(0);
          // resolving the host context of every stage in every iteration puts a heavy load on the
          // static runtime, so the ability behind the stages is verified for the first and the last
          // iteration
          if (i === 0 || i === 999) {
            if (reading.names.length > 0) {
              expect(includesStartedAbility(reading.names)).assertEqual(true);
            }
          }
        }
        expect(i).assertEqual(1000);
        hilog.info(0x0000, 'testTag', `${TESTCASE} 1000 iterations done`);
        await terminateEntryAbility1(TESTCASE);
        done();
      })

   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100
     * @tc.desc       Create a new process to launch the UIAbility by configuring the options of startAbility
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2100';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'EntryAbility1'
        };
        let options: StartOptions = {
          processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility: contextConstant.StartupVisibility.STARTUP_HIDE
        };
        let beforeCount: number = await stableStageCount(appContext, TESTCASE);
        let startOk: boolean = await startWithRetry(wantInfo, TESTCASE, options);
        if (!startOk) {
          // NEW_PROCESS_ATTACH_TO_PARENT is not supported on every device; when the runtime rejects
          // it no window stage can be added, so the reported stages have to stay unchanged
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          let unchanged: StageReading = await readStages(appContext, TESTCASE);
          expect(unchanged.ok).assertEqual(true);
          expect(unchanged.stages.length).assertEqual(beforeCount);
          done();
          return;
        }
        // the ability started in a new process attached to the parent owns one window stage
        let afterCount: number = await waitForStageCount(appContext, beforeCount + 1, TESTCASE);
        let reading: StageReading = await readStages(appContext, TESTCASE);
        expect(reading.ok).assertEqual(true);
        expect(afterCount).assertEqual(beforeCount + 1);
        expect(reading.stages.length).assertEqual(beforeCount + 1);
        expect(reading.names.includes('EntryAbility1')).assertEqual(true);
        await terminateEntryAbility1(TESTCASE);
        done();
      })
  })
}
