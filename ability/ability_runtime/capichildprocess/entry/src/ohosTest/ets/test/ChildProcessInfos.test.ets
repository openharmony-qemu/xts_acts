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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import testNapi from 'libentry.so';

const ERR_PARAM = 401;
const ERR_BUFFER_TOO_SMALL = 16000179;
const IDX_CODE = 0;
const IDX_COUNT = 1;
const IDX_INDEX_CODE = 2;
const IDX_PID = 3;
const IDX_PID_CODE = 4;
const IDX_NAME_CODE = 5;
const IDX_NAME_LEN = 6;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function childProcessInfosTest() {
  describe('ActsCapiChildProcessInfosTest', () => {
    let mpEnable: boolean = false;
    let ncpEnable: boolean = false;

    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync(
          'persist.sys.abilityms.multi_process_model') === 'true';
      } catch (err) {
        console.info(`ChildProcessInfos Get mpEnable error: ${JSON.stringify(err)}`);
        mpEnable = false;
      }
      try {
        ncpEnable = systemParameterEnhance.getSync(
          'persist.sys.abilityms.start_native_child_process') === 'true';
      } catch (err) {
        console.info(`ChildProcessInfos Get ncpEnable error: ${JSON.stringify(err)}`);
        ncpEnable = false;
      }
    });

    afterEach(async () => {
      try {
        testNapi.requestExitChildProcess(0);
      } catch (err) {
        console.info(`ChildProcessInfos afterEach exit: ${JSON.stringify(err)}`);
      }
      await sleep(200);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_Invalid_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_Invalid_0100
     * @tc.desc   OH_Ability_AcquireChildProcessInfos returns 401 on null infos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_Invalid_0100', Level.LEVEL0,
      () => {
        expect(testNapi.acquireChildProcessInfosInvalidParam()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_Empty_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_Empty_0100
     * @tc.desc   OH_Ability_AcquireChildProcessInfos succeeds and can be released
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_Empty_0100', Level.LEVEL0,
      () => {
        let res: number[] = testNapi.acquireChildProcessInfosEmpty();
        expect(res[IDX_CODE]).assertEqual(0);
        expect(res[IDX_COUNT] >= 0).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_Invalid_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_Invalid_0100
     * @tc.desc   OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos returns 401 on null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_Invalid_0100', Level.LEVEL0,
      () => {
        expect(testNapi.acquireUIAbilityChildProcessInfosInvalidParam()).assertEqual(
          ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_Empty_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_Empty_0100
     * @tc.desc   OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_Empty_0100', Level.LEVEL0,
      () => {
        let res: number[] = testNapi.acquireUIAbilityChildProcessInfosEmpty();
        expect(res[IDX_CODE]).assertEqual(0);
        expect(res[IDX_COUNT] >= 0).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_Invalid_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_Invalid_0100
     * @tc.desc   OH_AbilityRuntime_GetChildProcessInfoByIndex returns 401 on null handle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_Invalid_0100', Level.LEVEL0,
      () => {
        expect(testNapi.getChildProcessInfoByIndexInvalid()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_Invalid_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_Invalid_0100
     * @tc.desc   OH_AbilityRuntime_ChildProcessInfo_GetPid returns 401 on null info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_Invalid_0100', Level.LEVEL0,
      () => {
        expect(testNapi.childProcessInfoGetPidInvalid()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_Invalid_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_Invalid_0100
     * @tc.desc   OH_AbilityRuntime_ChildProcessInfo_GetProcessName returns 401 on null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_Invalid_0100', Level.LEVEL0,
      () => {
        expect(testNapi.childProcessInfoGetProcessNameInvalid()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Release_Null_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Release_Null_0100
     * @tc.desc   OH_AbilityRuntime_ReleaseChildProcessInfos tolerates null handles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Release_Null_0100', Level.LEVEL0,
      () => {
        expect(testNapi.releaseChildProcessInfosNull()).assertEqual(0);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Query_Native_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Query_Native_0100
     * @tc.desc   After native child start, acquire/index/pid/name/release succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Query_Native_0100', Level.LEVEL0,
      async (done: Function) => {
        let tag = 'ChildProcessInfos_Query_Native_0100';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable) {
            expect(16010004).assertEqual(ret);
            done();
            return;
          }
          if (!ncpEnable) {
            expect(801).assertEqual(ret);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          let info: number[] = testNapi.queryNativeChildProcessInfos();
          console.info(`${tag} info=${JSON.stringify(info)}`);
          expect(info[IDX_CODE]).assertEqual(0);
          expect(info[IDX_COUNT] > 0).assertTrue();
          expect(info[IDX_INDEX_CODE]).assertEqual(0);
          expect(info[IDX_PID_CODE]).assertEqual(0);
          expect(info[IDX_PID] > 0).assertTrue();
          expect(info[IDX_NAME_CODE]).assertEqual(0);
          expect(info[IDX_NAME_LEN] > 0).assertTrue();
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
          await sleep(600);
        } catch (err) {
          console.info(`${tag} error: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_SmallBuf_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_SmallBuf_0100
     * @tc.desc   GetProcessName returns BUFFER_TOO_SMALL when buffer is too small
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_SmallBuf_0100', Level.LEVEL0,
      async (done: Function) => {
        let tag = 'ChildProcessInfos_GetName_SmallBuf_0100';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable || !ncpEnable) {
            console.info(`${tag} skip create unsupported ret=${ret}`);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          let code: number = testNapi.childProcessInfoGetProcessNameBufferTooSmall();
          expect(code).assertEqual(ERR_BUFFER_TOO_SMALL);
          expect(1).assertEqual(testNapi.requestExitChildProcess(0));
          await sleep(600);
        } catch (err) {
          console.info(`${tag} error: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
        } finally {
          done();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Query_UIAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Query_UIAbility_0100
     * @tc.desc   OH_AbilityRuntime_AcquireUIAbilityChildProcessInfos query path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Query_UIAbility_0100', Level.LEVEL0,
      () => {
        let info: number[] = testNapi.queryUIAbilityChildProcessInfos();
        expect(info[IDX_CODE]).assertEqual(0);
        expect(info[IDX_COUNT] >= 0).assertTrue();
        if (info[IDX_COUNT] > 0) {
          expect(info[IDX_INDEX_CODE]).assertEqual(0);
          expect(info[IDX_PID_CODE]).assertEqual(0);
          expect(info[IDX_PID] > 0).assertTrue();
          expect(info[IDX_NAME_CODE]).assertEqual(0);
        }
      });
  });
}
