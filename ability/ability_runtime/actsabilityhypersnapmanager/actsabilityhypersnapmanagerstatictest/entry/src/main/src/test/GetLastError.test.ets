'use static'
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
import { describe, it, expect, Level } from '../../../hypium/index';
import hyperSnapManager from '@ohos.app.ability.hyperSnapManager';
import hilog from '@ohos.hilog';

const TAG: string = 'HyperSnapGetLastErrorStatic';
const ERR_SERVICE: number = 16000050;

function codeValue(code: hyperSnapManager.HyperSnapErrorCode): number {
  return code.valueOf();
}

function isValidErrorCode(code: hyperSnapManager.HyperSnapErrorCode): boolean {
  let v: number = codeValue(code);
  return v >= 0 && v <= 7;
}

function assertErrorInfo(info: hyperSnapManager.HyperSnapErrorInfo): void {
  expect(isValidErrorCode(info.code)).assertTrue();
  expect(info.msg.length >= 0).assertTrue();
  expect(info.occurTimeStamp >= 0).assertTrue();
}

export default function getLastErrorTest(): void {
  describe('HyperSnapGetLastErrorStaticTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Type_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Type_static_0100
     * @tc.desc   Assert HyperSnapErrorType enum numeric values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Type_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        expect(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT.valueOf()).assertEqual(0);
        expect(hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT.valueOf()).assertEqual(1);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Code_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Code_static_0100
     * @tc.desc   Assert HyperSnapErrorCode enum numeric values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Enum_Code_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_OK.valueOf()).assertEqual(0);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SYSTEM_INNER.valueOf()).assertEqual(1);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SNAPSHOT_EXIST.valueOf()).assertEqual(2);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_PROCESS_IS_RUNNING.valueOf()).assertEqual(3);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SNAPSHOT_PROCESS_IS_DIED.valueOf()).assertEqual(4);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_SNAPSHOT_IS_INTERRUPTED.valueOf()).assertEqual(5);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_EXISTS_ILLEGAL_BINDER.valueOf()).assertEqual(6);
        expect(hyperSnapManager.HyperSnapErrorCode.ERR_LAST_PROCESS_NOT_FULLY_EXITED.valueOf())
          .assertEqual(7);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Create_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Create_static_0100
     * @tc.desc   Call getLastError(CREATE_SNAPSHOT); expect info or 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Create_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let errCode: number = -1;
        let info: hyperSnapManager.HyperSnapErrorInfo | undefined = undefined;
        try {
          info = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        } catch (e) {
          errCode = e.code;
        }
        if (errCode !== -1) {
          hilog.info(0x0000, TAG, 'Create_static catch=%{public}d', errCode);
          expect(errCode).assertEqual(ERR_SERVICE);
          return;
        }
        expect(info !== undefined).assertTrue();
        if (info !== undefined) {
          hilog.info(0x0000, TAG, 'Create_static code=%{public}d', codeValue(info.code));
          assertErrorInfo(info);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Fork_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Fork_static_0100
     * @tc.desc   Call getLastError(FORK_FROM_SNAPSHOT); expect info or 16000050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Fork_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let errCode: number = -1;
        let info: hyperSnapManager.HyperSnapErrorInfo | undefined = undefined;
        try {
          info = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT);
        } catch (e) {
          errCode = e.code;
        }
        if (errCode !== -1) {
          hilog.info(0x0000, TAG, 'Fork_static catch=%{public}d', errCode);
          expect(errCode).assertEqual(ERR_SERVICE);
          return;
        }
        expect(info !== undefined).assertTrue();
        if (info !== undefined) {
          hilog.info(0x0000, TAG, 'Fork_static code=%{public}d', codeValue(info.code));
          assertErrorInfo(info);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Indep_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Indep_static_0100
     * @tc.desc   Query both errType scenarios independently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Indep_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let createErr: number = -1;
        let forkErr: number = -1;
        let createInfo: hyperSnapManager.HyperSnapErrorInfo | undefined = undefined;
        let forkInfo: hyperSnapManager.HyperSnapErrorInfo | undefined = undefined;
        try {
          createInfo = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        } catch (e) {
          createErr = e.code;
        }
        try {
          forkInfo = await hyperSnapManager.getLastError(
            hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT);
        } catch (e) {
          forkErr = e.code;
        }
        if (createErr !== -1 || forkErr !== -1) {
          let code: number = createErr !== -1 ? createErr : forkErr;
          hilog.info(0x0000, TAG, 'Indep_static catch=%{public}d', code);
          expect(code).assertEqual(ERR_SERVICE);
          return;
        }
        expect(createInfo !== undefined).assertTrue();
        expect(forkInfo !== undefined).assertTrue();
        if (createInfo !== undefined) {
          assertErrorInfo(createInfo);
        }
        if (forkInfo !== undefined) {
          assertErrorInfo(forkInfo);
        }
      });
  });
}
