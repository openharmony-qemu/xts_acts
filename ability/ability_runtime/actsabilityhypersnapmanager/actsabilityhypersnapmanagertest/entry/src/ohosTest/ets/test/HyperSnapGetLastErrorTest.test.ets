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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium-dynamic';
import hyperSnapManager from '@ohos.app.ability.hyperSnapManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const TAG = 'HyperSnapGetLastError';
const ERR_SERVICE = 16000050;

function isValidErrorCode(code: number): boolean {
  return code >= hyperSnapManager.HyperSnapErrorCode.ERR_OK &&
    code <= hyperSnapManager.HyperSnapErrorCode.ERR_LAST_PROCESS_NOT_FULLY_EXITED;
}

function assertErrorInfo(info: hyperSnapManager.HyperSnapErrorInfo): void {
  expect(info !== undefined).assertTrue();
  expect(info !== null).assertTrue();
  // Cover all HyperSnapErrorInfo properties: code / msg / occurTimeStamp.
  expect(info.code !== undefined).assertTrue();
  expect(isValidErrorCode(info.code as number)).assertTrue();
  expect(info.msg !== undefined).assertTrue();
  expect(typeof info.msg).assertEqual('string');
  expect(info.occurTimeStamp !== undefined).assertTrue();
  expect(typeof info.occurTimeStamp).assertEqual('number');
  expect(info.occurTimeStamp >= 0).assertTrue();
}

export default function hyperSnapGetLastErrorTest() {
  describe('hyperSnapGetLastErrorTest', () => {
    beforeAll(async (done: Function) => {
      console.log(`${TAG} beforeAll called`);
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Type_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Type_0100
     * @tc.desc   Assert HyperSnapErrorType enum Numeric values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Type_0100', Level.LEVEL0,
      async (done: Function) => {
        expect(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT).assertEqual(0);
        expect(hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Code_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Code_0100
     * @tc.desc   Assert HyperSnapErrorCode enum Numeric values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Code_0100', Level.LEVEL0,
      async (done: Function) => {
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_OK).assertEqual(0);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SYSTEM_INNER).assertEqual(1);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SNAPSHOT_EXIST).assertEqual(2);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_PROCESS_IS_RUNNING).assertEqual(3);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SNAPSHOT_PROCESS_IS_DIED).assertEqual(4);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SNAPSHOT_IS_INTERRUPTED).assertEqual(5);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_EXISTS_ILLEGAL_BINDER).assertEqual(6);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_LAST_PROCESS_NOT_FULLY_EXITED).assertEqual(7);
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Create_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Create_0100
     * @tc.desc   getLastError(CREATE_SNAPSHOT) covers return HyperSnapErrorInfo.code/msg/occurTimeStamp
     *     or BusinessError 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Create_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
          hilog.info(0x0000, TAG, 'Create_0100 code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          assertErrorInfo(info);
          expect(info.code).assertEqual(info.code);
          expect(info.msg.length >= 0).assertTrue();
          expect(info.occurTimeStamp >= 0).assertTrue();
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'Create_0100 catch code=%{public}d', err.code);
          expect(err.code).assertEqual(ERR_SERVICE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Fork_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Fork_0100
     * @tc.desc   Call getLastError(FORK_FROM_SNAPSHOT); expect info or 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Fork_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT);
          hilog.info(0x0000, TAG, 'Fork_0100 code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          assertErrorInfo(info);
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'Fork_0100 catch code=%{public}d', err.code);
          expect(err.code).assertEqual(ERR_SERVICE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Indep_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Indep_0100
     * @tc.desc   Query both errType scenarios; each returns independent HyperSnapErrorInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Indep_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let createInfo = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
          let forkInfo = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT);
          assertErrorInfo(createInfo);
          assertErrorInfo(forkInfo);
          hilog.info(0x0000, TAG, 'Indep create=%{public}d fork=%{public}d',
            createInfo.code, forkInfo.code);
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'Indep_0100 catch code=%{public}d', err.code);
          expect(err.code).assertEqual(ERR_SERVICE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueZero_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueZero_0100
     * @tc.desc   Call getLastError(0); expect info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueZero_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(0);
          hilog.info(0x0000, TAG, 'ValueZero code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          assertErrorInfo(info);
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'ValueZero catch code=%{public}d', err.code);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueOne_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueOne_0100
     * @tc.desc   Call getLastError(1); expect info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueOne_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(1);
          hilog.info(0x0000, TAG, 'ValueOne code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          assertErrorInfo(info);
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'ValueOne catch code=%{public}d', err.code);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueThree_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueThree_0100
     * @tc.desc   Call getLastError(3); expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueThree_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(3);
          hilog.info(0x0000, TAG, 'ValueThree code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          expect().assertFail();
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'ValueThree catch code=%{public}d', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueUndefined_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueUndefined_0100
     * @tc.desc   Call getLastError(undefined); expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueUndefined_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(undefined);
          hilog.info(0x0000, TAG, 'ValueUndefined code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          expect().assertFail();
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'ValueUndefined catch code=%{public}d', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueNull_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueNull_0100
     * @tc.desc   Call getLastError(null); expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_ValueNull_0100', Level.LEVEL0,
      async (done: Function) => {
        try {
          let info = await hyperSnapManager.getLastError(null);
          hilog.info(0x0000, TAG, 'ValueNull code=%{public}d msg=%{public}s ts=%{public}d',
            info.code, info.msg, info.occurTimeStamp);
          expect().assertFail();
        } catch (e) {
          let err = e as BusinessError;
          hilog.info(0x0000, TAG, 'ValueNull catch code=%{public}d', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      });
  });
}
