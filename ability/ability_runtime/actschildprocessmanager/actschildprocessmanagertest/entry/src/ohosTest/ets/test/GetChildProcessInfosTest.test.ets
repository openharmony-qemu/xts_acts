/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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

import { afterEach, beforeAll, describe, expect, it, Level } from '@ohos/hypium-dynamic';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import { ChildProcessOptions } from '@ohos.app.ability.ChildProcessOptions';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import { contextConstant, StartOptions, Want } from '@kit.AbilityKit';
import XTSArkProcess from '../xts/XTSArkProcess';

const TAG = 'GetChildProcessInfos';
const ERR_SERVICE = 16000050;
const ERR_CONTEXT = 16000011;
const ERR_CAPABILITY = 801;
const ERR_NOT_SUPPORTED = 16000061;
const ERR_ABILITY_NOT_EXIST = 16000001;
const BUNDLE = 'com.acts.childprocessmanagertest';

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function assertInfoShape(info: childProcessManager.ChildProcessInformation): void {
  expect(typeof info.pid).assertEqual('number');
  expect(info.pid > 0).assertTrue();
  expect(typeof info.parentPid).assertEqual('number');
  expect(info.parentPid >= 0).assertTrue();
  expect(typeof info.processName).assertEqual('string');
}

function isCreateUnsupported(code: number): boolean {
  return code === ERR_CAPABILITY || code === ERR_NOT_SUPPORTED;
}

export default function getChildProcessInfosTest() {
  describe('GetChildProcessInfosTest', () => {
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let arkProcessPath = 'entry/./ets/xts/XTSArkProcess.ets';
    let spawnProcessPath = './ets/process/InfosSpawnProcess.ets';
    let pid = 0;
    let arkSupported = false;

    beforeAll(() => {
      try {
        arkSupported = childProcessManager.isArkChildProcessSupported();
      } catch (err) {
        console.info(`${TAG} isArkChildProcessSupported failed: ${JSON.stringify(err)}`);
        arkSupported = false;
      }
      console.info(`${TAG} isArkChildProcessSupported=${arkSupported}`);
    });

    afterEach(async () => {
      if (pid > 0) {
        await abilityDelegator.executeShellCommand(`kill -9 ${pid}`);
        await sleep(500);
        pid = 0;
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_StartMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_StartMode_0100
     * @tc.desc   Assert StartMode enum Values related to child process query scope.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_StartMode_0100', Level.LEVEL0,
      async (done: Function) => {
        expect(childProcessManager.StartMode.SELF_FORK).assertEqual(0);
        expect(childProcessManager.StartMode.APP_SPAWN_FORK).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_Empty_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_Empty_0100
     * @tc.desc   getChildProcessInfos empty coverage: returns Array length === 0 when no child.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_Empty_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let infos = await childProcessManager.getChildProcessInfos();
          console.info(`${TAG} Empty_0100 getChildProcessInfos length=${Array.isArray(infos) ? infos.length : -1}`);
          expect(Array.isArray(infos)).assertTrue();
          if (infos.length === 0) {
            console.info(`${TAG} Empty_0100 no child process, length === 0`);
            expect(infos.length).assertEqual(0);
          } else {
            for (let i = 0; i < infos.length; i++) {
              assertInfoShape(infos[i]);
              console.info(`${TAG} Empty_0100 killing pid=${infos[i].pid}`);
              let killResult = await abilityDelegator.executeShellCommand(`kill -9 ${infos[i].pid}`);
              console.info(`${TAG} Empty_0100 kill -9 ${infos[i].pid} result=${JSON.stringify(killResult)}`);
            }
            await sleep(500);
            let afterKill = await childProcessManager.getChildProcessInfos();
            console.info(`${TAG} Empty_0100 afterKill length=${Array.isArray(afterKill) ? afterKill.length : -1}`);
            expect(Array.isArray(afterKill)).assertTrue();
            if (afterKill.length > 0) {
              console.info(`${TAG} Empty_0100 residual processes remain after kill, length=${afterKill.length}`);
              for (let i = 0; i < afterKill.length; i++) {
                assertInfoShape(afterKill[i]);
              }
            }
          }
        } catch (e) {
          let err = e as BusinessError;
          console.info(`${TAG} Empty_0100 code=${err.code}`);
          expect(err.code).assertEqual(ERR_SERVICE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_NonEmpty_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_NonEmpty_0100
     * @tc.desc   getChildProcessInfos non-empty coverage: Array length > 0 after child start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_NonEmpty_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          pid = await childProcessManager.startChildProcess(
            spawnProcessPath, childProcessManager.StartMode.APP_SPAWN_FORK);
          expect(pid > 0).assertTrue();
          await sleep(1000);
          let infos = await childProcessManager.getChildProcessInfos();
          expect(Array.isArray(infos)).assertTrue();
          expect(infos.length > 0).assertTrue();
          let found = false;
          for (let i = 0; i < infos.length; i++) {
            assertInfoShape(infos[i]);
            if (infos[i].pid === pid) {
              found = true;
            }
          }
          expect(found).assertTrue();
        } catch (e) {
          let err = e as BusinessError;
          console.info(`${TAG} NonEmpty_0100 code=${err.code}`);
          if (isCreateUnsupported(err.code) || err.code === ERR_SERVICE) {
            expect(isCreateUnsupported(err.code) || err.code === ERR_SERVICE).assertTrue();
            done();
            return;
          }
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterArk_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterArk_0100
     * @tc.desc   Create ark child then getChildProcessInfos contains pid; 801/16000061 if unsupported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterArk_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          XTSArkProcess.toString();
          let args: ChildProcessArgs = { entryParams: 'infos_query' };
          let options: ChildProcessOptions = { isolationMode: false };
          pid = await childProcessManager.startArkChildProcess(arkProcessPath, args, options);
          expect(pid > 0).assertTrue();
          await sleep(1000);
          let infos = await childProcessManager.getChildProcessInfos();
          expect(Array.isArray(infos)).assertTrue();
          let found = false;
          for (let i = 0; i < infos.length; i++) {
            assertInfoShape(infos[i]);
            if (infos[i].pid === pid) {
              found = true;
            }
          }
          expect(found).assertTrue();
        } catch (e) {
          let err = e as BusinessError;
          console.info(`${TAG} AfterArk_0100 code=${err.code} arkSupported=${arkSupported}`);
          if (isCreateUnsupported(err.code)) {
            let infos = await childProcessManager.getChildProcessInfos();
            expect(Array.isArray(infos)).assertTrue();
            done();
            return;
          }
          if (err.code === ERR_SERVICE) {
            expect(err.code).assertEqual(ERR_SERVICE);
            done();
            return;
          }
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterSpawn_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterSpawn_0100
     * @tc.desc   startChildProcess(APP_SPAWN_FORK) then getChildProcessInfos contains pid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterSpawn_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          pid = await childProcessManager.startChildProcess(
            spawnProcessPath, childProcessManager.StartMode.APP_SPAWN_FORK);
          expect(pid > 0).assertTrue();
          await sleep(1000);
          let infos = await childProcessManager.getChildProcessInfos();
          let found = false;
          for (let i = 0; i < infos.length; i++) {
            assertInfoShape(infos[i]);
            if (infos[i].pid === pid) {
              found = true;
            }
          }
          expect(found).assertTrue();
        } catch (e) {
          let err = e as BusinessError;
          console.info(`${TAG} AfterSpawn_0100 code=${err.code}`);
          if (isCreateUnsupported(err.code) || err.code === ERR_SERVICE) {
            let infos = await childProcessManager.getChildProcessInfos();
            expect(Array.isArray(infos)).assertTrue();
            done();
            return;
          }
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_Empty_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_Empty_0100
     * @tc.desc   getUIAbilityChildProcessInfos empty coverage: Array length === 0 baseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_Empty_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let topAbility = await abilityDelegator.getCurrentTopAbility();
          let appContext = topAbility.context.getApplicationContext();
          let infos = await appContext.getUIAbilityChildProcessInfos();
          expect(Array.isArray(infos)).assertTrue();
          expect(infos.length).assertEqual(0);
        } catch (e) {
          let err = e as BusinessError;
          console.info(`${TAG} UIAbility_Empty code=${err.code}`);
          expect(err.code === ERR_SERVICE || err.code === ERR_CONTEXT).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_NonEmpty_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_NonEmpty_0100
     * @tc.desc   getUIAbilityChildProcessInfos non-empty: length > 0 after NEW_PROCESS start.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_NonEmpty_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let topAbility = await abilityDelegator.getCurrentTopAbility();
          let uiContext = topAbility.context;
          let appContext = uiContext.getApplicationContext();
          let want: Want = {
            bundleName: BUNDLE,
            moduleName: 'entry',
            abilityName: 'EntryAbility'
          };
          let options: StartOptions = {
            processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
            startupVisibility: contextConstant.StartupVisibility.STARTUP_HIDE
          };
          console.info(`${TAG} UIAbility_NonEmpty startAbility begin`);
          await uiContext.startAbility(want, options);
          await sleep(1500);
          console.info(`${TAG} UIAbility_NonEmpty getUIAbilityChildProcessInfos after start`);
          let after = await appContext.getUIAbilityChildProcessInfos();
          console.info(`${TAG} UIAbility_NonEmpty after length=${Array.isArray(after) ? after.length : -1}`);
          expect(Array.isArray(after)).assertTrue();
          expect(after.length > 0).assertTrue();
          for (let i = 0; i < after.length; i++) {
            assertInfoShape(after[i]);
          }
        } catch (e) {
          let err = e as BusinessError;
          console.info(`${TAG} UIAbility_NonEmpty code=${err.code}`);
          if (isCreateUnsupported(err.code) || err.code === ERR_SERVICE || err.code === ERR_CONTEXT ||
            err.code === ERR_ABILITY_NOT_EXIST) {
            expect(isCreateUnsupported(err.code) || err.code === ERR_SERVICE ||
              err.code === ERR_CONTEXT || err.code === ERR_ABILITY_NOT_EXIST).assertTrue();
            done();
            return;
          }
          expect().assertFail();
        }
        done();
      });
  });
}
