'use static';
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
import { afterEach, beforeAll, describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import { ChildProcessOptions } from '@ohos.app.ability.ChildProcessOptions';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

const TAG: string = 'GetChildProcessInfosStatic';
const ERR_CAPABILITY: number = 801;
const ERR_NOT_SUPPORTED: number = 16000061;

function assertInfoShape(info: childProcessManager.ChildProcessInformation): void {
  expect(info.pid > 0).assertTrue();
  expect(info.parentPid >= 0).assertTrue();
  expect(info.processName.length >= 0).assertTrue();
}

function isCreateUnsupported(code: number): boolean {
  return code === ERR_CAPABILITY || code === ERR_NOT_SUPPORTED;
}

export default function getChildProcessInfosStaticTest(): void {
  describe('GetChildProcessInfosStaticTest', () => {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let arkProcessPath: string = './ets/xts/InfosArkProcess.ets';
    let pid: number = 0;

    beforeAll((): void => {
      console.info(`${TAG} beforeAll`);
    });

    afterEach(async (): Promise<void> => {
      if (pid > 0) {
        await abilityDelegator.executeShellCommand(`kill -9 ${pid}`);
        await Utils.msSleep(500);
        pid = 0;
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_Return_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_Return_static_0100
     * @tc.desc   getChildProcessInfos return cover: Array shape / ChildProcessInformation fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_Return_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let infos: Array<childProcessManager.ChildProcessInformation> =
          await childProcessManager.getChildProcessInfos();
        expect(infos.length >= 0).assertTrue();
        let len: int = infos.length as int;
        for (let i: int = 0; i < len; i++) {
          assertInfoShape(infos[i]);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterArk_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterArk_static_0100
     * @tc.desc   After optional ark child create, getChildProcessInfos returns infos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetChildProcessInfos_AfterArk_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let createErr: number = -1;
        try {
          let args: ChildProcessArgs = { entryParams: 'static_infos' };
          let options: ChildProcessOptions = { isolationMode: false };
          pid = await childProcessManager.startArkChildProcess(arkProcessPath, args, options);
        } catch (e) {
          createErr = e.code;
        }
        if (createErr !== -1) {
          console.info(`${TAG} AfterArk createErr=${createErr}`);
          expect(isCreateUnsupported(createErr)).assertTrue();
          let infos: Array<childProcessManager.ChildProcessInformation> =
            await childProcessManager.getChildProcessInfos();
          expect(infos.length >= 0).assertTrue();
          return;
        }
        expect(pid > 0).assertTrue();
        await Utils.msSleep(1000);
        let infos: Array<childProcessManager.ChildProcessInformation> =
          await childProcessManager.getChildProcessInfos();
        let found: boolean = false;
        let len: int = infos.length as int;
        for (let i: int = 0; i < len; i++) {
          assertInfoShape(infos[i]);
          if (infos[i].pid === pid) {
            found = true;
          }
        }
        expect(found).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_Return_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_Return_static_0100
     * @tc.desc   getUIAbilityChildProcessInfos return cover: Array from ApplicationContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityChildProcessInfos_Return_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let appContext = abilityDelegator.getAppContext().getApplicationContext();
        let infos: Array<childProcessManager.ChildProcessInformation> =
          await appContext.getUIAbilityChildProcessInfos();
        expect(infos.length >= 0).assertTrue();
        let len: int = infos.length as int;
        for (let i: int = 0; i < len; i++) {
          assertInfoShape(infos[i]);
        }
      });

  });
}
