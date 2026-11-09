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
const ERR_NO_ERROR = 0;
const ERR_INTERNAL = 16000050;
const IDX_ACQUIRE_ENUM_PARAM = 0;
const IDX_ACQUIRE_ENUM_INTERNAL = 1;
const IDX_CODE = 0;
const IDX_COUNT = 1;
const IDX_INDEX_CODE = 2;
const IDX_PID = 3;
const IDX_PID_CODE = 4;
const IDX_NAME_CODE = 5;
const IDX_NAME_LEN = 6;
const IDX_PARENT_PID = 7;
const IDX_PARENT_PID_CODE = 8;
const IDX_PARENT_DETAIL_CODE = 0;
const IDX_PARENT_DETAIL_PID = 1;
const IDX_PARENT_DETAIL_SELF = 2;
const IDX_ENUM_NO_ERROR = 0;
const IDX_ENUM_PARAM_INVALID = 1;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function childProcessInfosTest() {
  describe('childProcessInfosTest', () => {
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_CountNull_0110
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_CountNull_0110
     * @tc.desc   OH_Ability_AcquireChildProcessInfos returns NCP_ERR_INVALID_PARAM when count is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_CountNull_0110', Level.LEVEL0,
      () => {
        expect(testNapi.acquireChildProcessInfosCountNull()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_ErrEnum_0120
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_ErrEnum_0120
     * @tc.desc   Cover NCP_ERR_INVALID_PARAM and NCP_ERR_INTERNAL enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_Acquire_ErrEnum_0120', Level.LEVEL0,
      () => {
        let enums: number[] = testNapi.acquireChildProcessInfosErrorEnums();
        expect(enums[IDX_ACQUIRE_ENUM_PARAM]).assertEqual(ERR_PARAM);
        expect(enums[IDX_ACQUIRE_ENUM_INTERNAL]).assertEqual(ERR_INTERNAL);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_CountNull_0110
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_CountNull_0110
     * @tc.desc   AcquireUIAbilityChildProcessInfos returns PARAM_INVALID when count is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_CountNull_0110', Level.LEVEL0,
      () => {
        expect(testNapi.acquireUIAbilityChildProcessInfosCountNull()).assertEqual(
          ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_ErrEnum_0120
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_ErrEnum_0120
     * @tc.desc   Cover ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID and INTERNAL enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_AcquireUI_ErrEnum_0120', Level.LEVEL0,
      () => {
        let enums: number[] = testNapi.acquireUIAbilityChildProcessInfosErrorEnums();
        expect(enums[IDX_ACQUIRE_ENUM_PARAM]).assertEqual(ERR_PARAM);
        expect(enums[IDX_ACQUIRE_ENUM_INTERNAL]).assertEqual(ERR_INTERNAL);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_OutNull_0110
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_OutNull_0110
     * @tc.desc   GetChildProcessInfoByIndex returns PARAM_INVALID when info out is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_OutNull_0110', Level.LEVEL0,
      () => {
        expect(testNapi.getChildProcessInfoByIndexOutNull()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_Oob_0120
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_Oob_0120
     * @tc.desc   GetChildProcessInfoByIndex returns PARAM_INVALID when index >= count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetByIndex_Oob_0120', Level.LEVEL0,
      () => {
        expect(testNapi.getChildProcessInfoByIndexOob()).assertEqual(ERR_PARAM);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_Enum_0110
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_Enum_0110
     * @tc.desc   Cover GetPid NO_ERROR and PARAM_INVALID enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_Enum_0110', Level.LEVEL0,
      () => {
        let enums: number[] = testNapi.childProcessInfoGetPidErrorEnums();
        expect(enums[IDX_ENUM_NO_ERROR]).assertEqual(ERR_NO_ERROR);
        expect(enums[IDX_ENUM_PARAM_INVALID]).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Enum_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Enum_0100
     * @tc.desc   GetParentPid related AbilityRuntime_ErrorCode enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Enum_0100', Level.LEVEL0,
      () => {
        let enums: number[] = testNapi.childProcessInfoGetParentPidErrorEnums();
        expect(enums[IDX_ENUM_NO_ERROR]).assertEqual(ERR_NO_ERROR);
        expect(enums[IDX_ENUM_PARAM_INVALID]).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Invalid_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Invalid_0100
     * @tc.desc   GetParentPid returns 401 when info is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Invalid_0100',
      Level.LEVEL0, () => {
        expect(testNapi.childProcessInfoGetParentPidInvalid()).assertEqual(ERR_PARAM);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_BothNull_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_BothNull_0100
     * @tc.desc   GetParentPid returns 401 when info and parentPid are both null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_BothNull_0100',
      Level.LEVEL0, () => {
        expect(testNapi.childProcessInfoGetParentPidBothNull()).assertEqual(ERR_PARAM);
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
          expect(info[IDX_PARENT_PID_CODE]).assertEqual(0);
          expect(info[IDX_PARENT_PID] > 0).assertTrue();
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_NullOut_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_NullOut_0100
     * @tc.desc   GetParentPid returns 401 when parentPid out-param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_NullOut_0100',
      Level.LEVEL0, async (done: Function) => {
        let tag = 'ChildProcessInfos_GetParentPid_NullOut_0100';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable || !ncpEnable) {
            console.info(`${tag} skip create unsupported ret=${ret}`);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          expect(testNapi.childProcessInfoGetParentPidNullOut()).assertEqual(ERR_PARAM);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_NullOut_0120
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_NullOut_0120
     * @tc.desc   GetPid returns PARAM_INVALID when pid out-param is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetPid_NullOut_0120',
      Level.LEVEL0, async (done: Function) => {
        let tag = 'ChildProcessInfos_GetPid_NullOut_0120';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable || !ncpEnable) {
            console.info(`${tag} skip create unsupported ret=${ret}`);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          expect(testNapi.childProcessInfoGetPidNullOut()).assertEqual(ERR_PARAM);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Value_0100
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Value_0100
     * @tc.desc   GetParentPid returns NO_ERROR and parentPid equals caller getpid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetParentPid_Value_0100',
      Level.LEVEL0, async (done: Function) => {
        let tag = 'ChildProcessInfos_GetParentPid_Value_0100';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable || !ncpEnable) {
            console.info(`${tag} skip create unsupported ret=${ret}`);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          let detail: number[] = testNapi.queryChildProcessInfoParentPid();
          console.info(`${tag} detail=${JSON.stringify(detail)}`);
          expect(detail[IDX_PARENT_DETAIL_CODE]).assertEqual(ERR_NO_ERROR);
          expect(detail[IDX_PARENT_DETAIL_PID] > 0).assertTrue();
          expect(detail[IDX_PARENT_DETAIL_PID]).assertEqual(
            detail[IDX_PARENT_DETAIL_SELF]);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_SizeZero_0110
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_SizeZero_0110
     * @tc.desc   GetProcessName returns PARAM_INVALID when processNameSize is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_SizeZero_0110', Level.LEVEL0,
      async (done: Function) => {
        let tag = 'ChildProcessInfos_GetName_SizeZero_0110';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable || !ncpEnable) {
            console.info(`${tag} skip create unsupported ret=${ret}`);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          expect(testNapi.childProcessInfoGetProcessNameSizeZero()).assertEqual(ERR_PARAM);
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
     * @tc.name   SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_RequiredNull_0120
     * @tc.number SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_RequiredNull_0120
     * @tc.desc   GetProcessName returns PARAM_INVALID when requiredSize is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ChildProcessInfos_GetName_RequiredNull_0120',
      Level.LEVEL0, async (done: Function) => {
        let tag = 'ChildProcessInfos_GetName_RequiredNull_0120';
        try {
          let ret: number = testNapi.startNativeChildProcess('libentry.so');
          if (!mpEnable || !ncpEnable) {
            console.info(`${tag} skip create unsupported ret=${ret}`);
            done();
            return;
          }
          expect(0).assertEqual(ret);
          await sleep(500);
          expect(testNapi.childProcessInfoGetProcessNameRequiredNull()).assertEqual(
            ERR_PARAM);
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
          expect(info[IDX_PARENT_PID_CODE]).assertEqual(0);
          expect(info[IDX_PARENT_PID] > 0).assertTrue();
        }
      });
  });
}
