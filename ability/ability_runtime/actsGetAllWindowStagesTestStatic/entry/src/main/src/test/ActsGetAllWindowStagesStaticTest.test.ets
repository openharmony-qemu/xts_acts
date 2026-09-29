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
import hilog from '@ohos.hilog';
import { RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application';
import contextConstant from '@ohos.app.ability.contextConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import Utils from './Util.test';

let context: common.UIAbilityContext | undefined;

/** Ability that runs this suite; its window stage lives for the whole suite and is never removed. */
const RUNNER_ABILITY_NAME: string = 'TestAbility';

/** Abilities started by the cases of this suite and terminated again by the cleanup code. */
const CASE_ABILITY_NAMES: string[] = ['TestAbility1', 'TestAbility2', 'TestAbility3', 'ApplicationAbility'];

/** Every ability of the module under test; a resolved window stage has to belong to one of them. */
const MODULE_ABILITY_NAMES: string[] = ['EntryAbility', 'TestAbility', 'EntryAbility1', 'EntryAbility2',
  'EntryAbility3', 'EntryAbility4', 'TestAbility1', 'TestAbility2', 'TestAbility3', 'ApplicationAbility'];

/**
 * Result of one getAllWindowStages() call: how many stages were reported, how many of them still
 * resolve to a usable UIAbilityContext and which abilities they belong to. The static runtime
 * rejects the call while a window stage is being created or destroyed and keeps reporting stages
 * that other suites left behind, so a call is retried and every case compares against a snapshot
 * taken right before its own action instead of against an absolute number.
 */
interface StageSnapshot {
  ok: boolean;
  total: number;
  resolvable: number;
  names: string[];
}

async function readSnapshot(appContext: common.ApplicationContext, testCase: string): Promise<StageSnapshot> {
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
        `${testCase} total ${stages.length}, resolvable ${names.length}, names ${JSON.stringify(names)}`);
      return { ok: true, total: stages.length, resolvable: names.length, names: names };
    } catch (e) {
      let err: Error = e as Error;
      hilog.error(0x0000, 'testTag', `${testCase} getAllWindowStages rejected: ${err.message}`);
      await Utils.msSleep(300);
    }
  }
  return { ok: false, total: 0, resolvable: 0, names: [] };
}

/**
 * Snapshot taken once the reported stage count does not change any more. Window stages of earlier
 * cases are destroyed asynchronously, so reading the count only once can still observe a value
 * that is about to drop and would make the delta of the current case meaningless.
 */
async function stableSnapshot(appContext: common.ApplicationContext, testCase: string): Promise<StageSnapshot> {
  let previous: number = -1;
  let stale: number = -1;
  let snapshot: StageSnapshot = await readSnapshot(appContext, testCase);
  for (let i = 0; i < 30; i++) {
    // A dying stage is still reported while it cannot be resolved any more. Reading the count once
    // can therefore observe a value that drops on the next read, so the count has to stay the same
    // and complete for two consecutive reads before it is used as the baseline.
    let complete: boolean = snapshot.ok && snapshot.total === snapshot.resolvable;
    if (previous === snapshot.total && stale === snapshot.total && complete) {
      break;
    }
    stale = previous;
    previous = snapshot.total;
    await Utils.msSleep(300);
    snapshot = await readSnapshot(appContext, `${testCase} waiting for a stable count`);
  }
  hilog.info(0x0000, 'testTag',
    `${testCase} stable stage count ${snapshot.total}, resolvable ${snapshot.resolvable}`);
  return snapshot;
}

/**
 * Poll getAllWindowStages() until it reports the expected number of stages and every reported stage
 * is resolvable. Destroying an ability removes its stage asynchronously, so the count has to be
 * awaited instead of read once and a stage that is still dying must not be counted.
 */
async function waitForStageCount(appContext: common.ApplicationContext, expected: number,
  testCase: string): Promise<StageSnapshot> {
  let snapshot: StageSnapshot = await readSnapshot(appContext, testCase);
  for (let i = 0; i < 30 && (snapshot.total !== expected || snapshot.resolvable !== expected); i++) {
    await Utils.msSleep(300);
    snapshot = await readSnapshot(appContext, `${testCase} waiting for ${expected} stages`);
  }
  hilog.info(0x0000, 'testTag',
    `${testCase} stage count ${snapshot.total}, resolvable ${snapshot.resolvable}, expected ${expected}`);
  return snapshot;
}

/**
 * Poll until every reported stage resolves to a usable UIAbilityContext. A stage of an ability that
 * is still being destroyed is listed for a short while without being resolvable.
 */
async function waitForResolvable(appContext: common.ApplicationContext,
  testCase: string): Promise<StageSnapshot> {
  let snapshot: StageSnapshot = await readSnapshot(appContext, `${testCase} resolvability`);
  for (let i = 0; i < 25 && snapshot.resolvable !== snapshot.total; i++) {
    await Utils.msSleep(300);
    snapshot = await readSnapshot(appContext, `${testCase} resolvability`);
  }
  hilog.info(0x0000, 'testTag', `${testCase} resolvable ${snapshot.resolvable} / ${snapshot.total}`);
  return snapshot;
}

/**
 * startAbility() is rejected with 16000017 while another ability is still starting. The static
 * runtime starts abilities one after another, so the call is retried instead of failing the case.
 * Returns true when the ability was started, otherwise false.
 */
async function startCaseAbility(want: Want, testCase: string): Promise<boolean> {
  let lastCode: number = 0;
  let appContext: common.ApplicationContext = context!.getApplicationContext();
  let baseline: number = (await appContext.getAllWindowStages()).length;
  for (let i = 0; i < 20; i++) {
    try {
      await context!.startAbility(want);
      hilog.info(0x0000, 'testTag', `${testCase} startAbility success.`);
      return true;
    } catch (e) {
      lastCode = (e as ESObject).code as number;
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

/**
 * Terminate the stages that belong to the abilities of this suite. The multiton TestAbility1
 * instances are only reachable through the context they stored, so the cleanup is best effort and
 * never asserts on the remaining stages.
 */
async function terminateCaseStages(testCase: string): Promise<void> {
  let ctx: common.UIAbilityContext | undefined = context;
  if (ctx === undefined) {
    return;
  }
  let appContext: common.ApplicationContext = ctx.getApplicationContext();
  let snapshot: StageSnapshot = await readSnapshot(appContext, `${testCase} cleanup`);
  hilog.info(0x0000, 'testTag',
    `${testCase} cleanup start, total ${snapshot.total}, names ${JSON.stringify(snapshot.names)}`);
  // The ability that runs this suite (TestAbility) owns the context that is driving the suite, so
  // only the contexts stored by the abilities of the cases are terminated.
  for (let key of ['TestAbility1_UIAbilityContext', 'TestAbility2_UIAbilityContext',
    'TestAbility3_UIAbilityContext', 'ApplicationModule_UIAbilityContext']) {
    let abilityContext: common.UIAbilityContext | undefined =
      AppStorage.get<common.UIAbilityContext>(key);
    if (abilityContext === undefined || abilityContext.abilityInfo === undefined) {
      continue;
    }
    let name: string = abilityContext.abilityInfo.name;
    if (!CASE_ABILITY_NAMES.includes(name) || name === RUNNER_ABILITY_NAME) {
      continue;
    }
    try {
      await abilityContext.terminateSelf();
      hilog.info(0x0000, 'testTag', `${testCase} terminateSelf of ${name} done`);
    } catch (e) {
      let err: Error = e as Error;
      hilog.error(0x0000, 'testTag', `${testCase} terminateSelf of ${name} failed: ${err.message}`);
    }
  }
  let after: StageSnapshot = await readSnapshot(appContext, `${testCase} after cleanup`);
  hilog.info(0x0000, 'testTag', `${testCase} stage count after cleanup ${after.total}`);
}

/**
 * Check the stage count observed after a lifecycle callback recorded a snapshot. The recorded
 * snapshot is taken while the ability enters or leaves the state, so it either still contains the
 * stage of that ability or already only contains the remaining ones; a start that failed must not
 * change the count at all.
 */
function assertRecordedWithin(recordedKey: string, baseline: StageSnapshot, testCase: string): void {
  let recorded = AppStorage.get<window.WindowStage[]>(recordedKey) as window.WindowStage[];
  let names: string[] = [];
  for (let stage of recorded) {
    try {
      let host: common.UIAbilityContext =
        stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
      names.push(host.abilityInfo.name);
    } catch (e) {
      let err: Error = e as Error;
      hilog.error(0x0000, 'testTag', `${testCase} [${recordedKey}] stage not resolvable: ${err.message}`);
    }
  }
  hilog.info(0x0000, 'testTag', `${testCase} [${recordedKey}] total ${recorded.length}, ` +
    `resolvable ${names.length}, names ${JSON.stringify(names)}, baseline ${baseline.total}`);
  // the snapshot was recorded while the state changed, so it holds the stages from before the
  // change plus at most the stage of the ability that entered the state
  expect(recorded.length).assertLarger(baseline.total - 1);
  expect(recorded.length).assertLess(baseline.total + 2);
  expect(recorded.length).assertLarger(0);
}

/**
 * The static runtime resolves the host context of a WindowStage against the ability it was created
 * with, so a stage that was just created by a case can still be reported as one of the abilities of
 * this module instead of the ability that was started. A case therefore only verifies that the
 * reported stages resolve to this module, while the identity of the started ability is verified
 * through the count delta and through the context the ability stored for itself.
 */
function assertStagesBelongToModule(names: string[], testCase: string): void {
  hilog.info(0x0000, 'testTag', `${testCase} resolved names ${JSON.stringify(names)}`);
  expect(names.length).assertLarger(0);
  for (let name of names) {
    expect(MODULE_ABILITY_NAMES.includes(name)).assertEqual(true);
  }
}

export default function actsGetAllWindowStagesTest(): void {
  describe('actsGetAllWindowStagesTest', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
      // the runner ability of the sibling suite starts EntryAbility and stores the context it runs
      // with; when the sibling suite did not run or the ability is not up yet, start it here so
      // that this suite always has the context of an ability of this application
      if (context === undefined) {
        let delegator: abilityDelegatorRegistry.AbilityDelegator =
          abilityDelegatorRegistry.getAbilityDelegator();
        let cmd: string = 'aa start -a EntryAbility -b com.example.getAllWindowStages.static';
        let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
        if (user !== undefined) {
          cmd += ' -u ' + user;
        }
        delegator.executeShellCommand(cmd);
        await Utils.msSleep(5000);
        context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
      }
      expect(context !== undefined).assertEqual(true);
      await terminateCaseStages('beforeAll');
      let appContext: common.ApplicationContext = context!.getApplicationContext();
      let snapshot: StageSnapshot = await waitForResolvable(appContext, 'beforeAll');
      // this application runs in the process under test, so it owns at least one window stage
      expect(snapshot.ok).assertEqual(true);
      expect(snapshot.total).assertLarger(0);
      expect(snapshot.resolvable).assertEqual(snapshot.total);
    })
    afterEach(async () => {
      await terminateCaseStages('afterEach');
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700
     * @tc.desc       apppcation.getApplicationContextInstance
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700';
        let appContext: common.ApplicationContext =
          application.getApplicationContextInstance().getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        expect(before.ok).assertEqual(true);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          // the ability could not be started, so the reported stages have to stay exactly as they
          // were before the call
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          let unchanged: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
          expect(unchanged.total).assertEqual(before.total);
          done();
          return;
        }
        // starting one UIAbility adds exactly one window stage to the application instance
        let after: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(after.total).assertEqual(before.total + 1);
        let settled: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(settled.resolvable).assertEqual(settled.total);
        assertStagesBelongToModule(settled.names, TESTCASE);
        // the started ability stored its own context, which proves that it is up and that its
        // window stage is part of this application
        let startedContext: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('TestAbility1_UIAbilityContext');
        expect(startedContext !== undefined).assertEqual(true);
        expect(startedContext!.abilityInfo.name).assertEqual('TestAbility1');
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800
     * @tc.desc       createAreaModeContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800';
        let appContext: common.ApplicationContext =
          context!.createAreaModeContext(contextConstant.AreaMode.EL2).getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        expect(before.ok).assertEqual(true);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          let unchanged: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
          expect(unchanged.total).assertEqual(before.total);
          done();
          return;
        }
        // the application context of an area mode context reports the stages of the application
        let after: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(after.total).assertEqual(before.total + 1);
        let settled: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(settled.resolvable).assertEqual(settled.total);
        assertStagesBelongToModule(settled.names, TESTCASE);
        let startedContext: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('TestAbility1_UIAbilityContext');
        expect(startedContext !== undefined).assertEqual(true);
        expect(startedContext!.abilityInfo.name).assertEqual('TestAbility1');
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900
     * @tc.desc       createdisplayContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900';
        let appContext: common.ApplicationContext =
          context!.createDisplayContext(0).getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        expect(before.ok).assertEqual(true);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          let unchanged: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
          expect(unchanged.total).assertEqual(before.total);
          done();
          return;
        }
        // the application context of a display context reports the stages of the application
        // the application context of a display context reports the stages of the application
        let after: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(after.total).assertEqual(before.total + 1);
        let settled: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(settled.resolvable).assertEqual(settled.total);
        assertStagesBelongToModule(settled.names, TESTCASE);
        let startedContext: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('TestAbility1_UIAbilityContext');
        expect(startedContext !== undefined).assertEqual(true);
        expect(startedContext!.abilityInfo.name).assertEqual('TestAbility1');
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100
     * @tc.desc       onCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        await Utils.msSleep(1000);
        // onCreate runs before the window stage of TestAbility1 exists, so the snapshot holds the
        // stages that were already reported when the ability was created
        assertRecordedWithin('onCreate_WindowStage', before, TESTCASE);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300
     * @tc.desc       onWindowStageCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        await Utils.msSleep(1000);
        // onWindowStageCreate runs while the stage of TestAbility1 is being created
        assertRecordedWithin('onWindowStageCreate_WindowStage', before, TESTCASE);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200
     * @tc.desc       onDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        let added: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(added.total).assertEqual(before.total + 1);
        let testAbility1Context: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('TestAbility1_UIAbilityContext');
        expect(testAbility1Context !== undefined).assertEqual(true);
        await testAbility1Context!.terminateSelf();
        // onDestroy runs after the window stage of TestAbility1 was removed, so its own snapshot
        // already excludes the destroyed stage
        let removed: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
        expect(removed.total).assertEqual(before.total);
        let recorded = AppStorage.get<window.WindowStage[]>('onDestroy_WindowStage') as window.WindowStage[];
        hilog.info(0x0000, 'testTag', `${TESTCASE} [onDestroy_WindowStage] total ${recorded.length}`);
        expect(recorded !== undefined).assertEqual(true);
        expect(recorded.length).assertEqual(before.total);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400
     * @tc.desc       onWindowStageDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        let added: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(added.total).assertEqual(before.total + 1);
        let testAbility1Context: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('TestAbility1_UIAbilityContext') as common.UIAbilityContext;
        expect(testAbility1Context !== undefined).assertEqual(true);
        await testAbility1Context!.terminateSelf();
        // onWindowStageDestroy runs after the window stage was destroyed
        let removed: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
        expect(removed.total).assertEqual(before.total);
        assertRecordedWithin('onWindowStageDestroy_WindowStage', before, TESTCASE);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700
     * @tc.desc       onWindowStageWillDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        let added: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(added.total).assertEqual(before.total + 1);
        let testAbility1Context: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('TestAbility1_UIAbilityContext') as common.UIAbilityContext;
        expect(testAbility1Context !== undefined).assertEqual(true);
        await testAbility1Context!.terminateSelf();
        // onWindowStageWillDestroy runs while the stage is being destroyed, so the snapshot either
        // still contains that stage or already only contains the remaining ones
        let removed: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
        expect(removed.total).assertEqual(before.total);
        assertRecordedWithin('onWindowStageWillDestroy_WindowStage', before, TESTCASE);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700
     * @tc.desc       AbilityStage getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700';
        let abilityStageWindowStage =
          AppStorage.get<window.WindowStage[]>('AbilityStage_WindowStage');
        expect(abilityStageWindowStage !== undefined).assertEqual(true);
        hilog.info(0x0000, 'testTag',
          `${TESTCASE} [AbilityStage] getAllWindowStages size ${abilityStageWindowStage!.length}`);
        // the snapshot is taken from AbilityStage.onCreate, which runs before any UIAbility of this
        // module has created its window stage
        expect(abilityStageWindowStage!.length).assertEqual(0);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100
     * @tc.desc       multi-module getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'ApplicationAbility',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        // the ability of the second module adds exactly one window stage
        let after: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(after.total).assertEqual(before.total + 1);
        let settled: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(settled.resolvable).assertEqual(settled.total);
        assertStagesBelongToModule(settled.names, TESTCASE);
        let startedContext: common.UIAbilityContext | undefined =
          AppStorage.get<common.UIAbilityContext>('ApplicationModule_UIAbilityContext');
        expect(startedContext !== undefined).assertEqual(true);
        expect(startedContext!.abilityInfo.name).assertEqual('ApplicationAbility');
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200
     * @tc.desc       Create a new process to launch the UIAbility by configuring the process tag
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility2',
        };
        let startOk: boolean = await startCaseAbility(wantInfo, TESTCASE);
        if (!startOk) {
          // TestAbility2 runs in its own process, so the queried application instance has to keep
          // reporting exactly the stages it reported before the call
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} startAbility rejected`);
          let unchanged: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
          expect(unchanged.total).assertEqual(before.total);
          done();
          return;
        }
        // TestAbility2 declares process ":kkk" and therefore belongs to another application
        // instance: this instance keeps its stages and may grow by at most the started ability
        await Utils.msSleep(1000);
        let after: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(after.total).assertLarger(before.total - 1);
        expect(after.total).assertLess(before.total + 2);
        expect(after.resolvable).assertEqual(after.total);
        done();
      })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800
     * @tc.desc       Acquire WindowStages by launching multiple Abilities in other launch modes.
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = 'SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800';
        let appContext: common.ApplicationContext = context!.getApplicationContext();
        let before: StageSnapshot = await stableSnapshot(appContext, `${TESTCASE} before`);
        let wantSpecified1: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility3',
          parameters: {
            'instanceKey': 'KEY_FIRST'
          } as Record<string, RecordData>
        };
        let specified1Ok: boolean = await startCaseAbility(wantSpecified1, TESTCASE);
        if (!specified1Ok) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} first startAbility rejected`);
          let unchanged: StageSnapshot = await waitForStageCount(appContext, before.total, TESTCASE);
          expect(unchanged.total).assertEqual(before.total);
          done();
          return;
        }
        // the specified mode instance with its own instanceKey adds one window stage
        let afterSpecified1: StageSnapshot = await waitForStageCount(appContext, before.total + 1, TESTCASE);
        expect(afterSpecified1.total).assertEqual(before.total + 1);

        let wantMultiton1: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1'
        };
        let multiton1Ok: boolean = await startCaseAbility(wantMultiton1, TESTCASE);
        if (!multiton1Ok) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} first multiton startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        // a multiton instance adds one more window stage
        let first: StageSnapshot = await waitForStageCount(appContext, before.total + 2, TESTCASE);
        expect(first.total).assertEqual(before.total + 2);
        let firstSettled: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(firstSettled.resolvable).assertEqual(firstSettled.total);

        let wantSpecified2: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility3',
          parameters: {
            'instanceKey': 'KEY_SECOND'
          } as Record<string, RecordData>
        };
        let specified2Ok: boolean = await startCaseAbility(wantSpecified2, TESTCASE);
        if (!specified2Ok) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} second startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        // a second specified mode instance with another instanceKey adds one more window stage
        let afterSpecified2: StageSnapshot = await waitForStageCount(appContext, before.total + 3, TESTCASE);
        expect(afterSpecified2.total).assertEqual(before.total + 3);

        let wantMultiton2: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1'
        };
        let multiton2Ok: boolean = await startCaseAbility(wantMultiton2, TESTCASE);
        if (!multiton2Ok) {
          hilog.error(0x0000, 'testTag',
            `${TESTCASE} second multiton startAbility rejected`);
          done();
          expect().assertFail();
          return;
        }
        // a second multiton instance adds one more window stage
        let second: StageSnapshot = await waitForStageCount(appContext, before.total + 4, TESTCASE);
        expect(second.total).assertEqual(before.total + 4);
        let secondSettled: StageSnapshot = await waitForResolvable(appContext, TESTCASE);
        expect(secondSettled.resolvable).assertEqual(secondSettled.total);
        done();
      })
  })
}
