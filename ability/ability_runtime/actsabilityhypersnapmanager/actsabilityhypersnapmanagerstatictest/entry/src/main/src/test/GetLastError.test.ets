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
import { describe, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import hyperSnapManager from '@ohos.app.ability.hyperSnapManager';
import hilog from '@ohos.hilog';

const TAG: string = 'HyperSnapGetLastErrorStatic';

function codeValue(code: hyperSnapManager.HyperSnapErrorCode): number {
  return code.valueOf();
}

async function callGetLastError(
  errType: hyperSnapManager.HyperSnapErrorType
): Promise<hyperSnapManager.HyperSnapErrorInfo> {
  return await hyperSnapManager.getLastError(errType);
}

export default function getLastErrorTest(): void {
  describe('HyperSnapGetLastErrorStaticTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_ErrorType_Create_Call_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_ErrorType_Create_Call_static_0100
     * @tc.desc   HyperSnapErrorType.CREATE_SNAPSHOT call cover: valueOf===0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_ErrorType_Create_Call_static_0100', Level.LEVEL0,
      (): void => {
        expect(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT.valueOf()).assertEqual(0);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_ErrorType_Fork_Call_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_ErrorType_Fork_Call_static_0100
     * @tc.desc   HyperSnapErrorType.FORK_FROM_SNAPSHOT call cover: valueOf===1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_ErrorType_Fork_Call_static_0100', Level.LEVEL0,
      (): void => {
        expect(hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT.valueOf()).assertEqual(1);
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Call_Create_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Call_Create_static_0100
     * @tc.desc   getLastError call cover: CREATE_SNAPSHOT returns HyperSnapErrorInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Call_Create_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let info: hyperSnapManager.HyperSnapErrorInfo =
          await callGetLastError(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        hilog.info(0x0000, TAG, 'Call_Create code=%{public}d', codeValue(info.code));
        expect(codeValue(info.code) >= 0).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Input_Fork_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Input_Fork_static_0100
     * @tc.desc   getLastError input cover: FORK_FROM_SNAPSHOT as errType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Input_Fork_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let info: hyperSnapManager.HyperSnapErrorInfo =
          await callGetLastError(hyperSnapManager.HyperSnapErrorType.FORK_FROM_SNAPSHOT);
        expect(typeof info.msg).assertEqual('string');
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Code_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Code_static_0100
     * @tc.desc   HyperSnapErrorInfo.code call cover: enum range 0..7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Code_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let info: hyperSnapManager.HyperSnapErrorInfo =
          await callGetLastError(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        let v: number = codeValue(info.code);
        expect(v >= 0 && v <= 7).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Msg_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Msg_static_0100
     * @tc.desc   HyperSnapErrorInfo.msg call cover: typeof string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Msg_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let info: hyperSnapManager.HyperSnapErrorInfo =
          await callGetLastError(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        expect(typeof info.msg).assertEqual('string');
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Stamp_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Stamp_static_0100
     * @tc.desc   HyperSnapErrorInfo.occurTimeStamp call cover: >=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_ErrorInfo_Stamp_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let info: hyperSnapManager.HyperSnapErrorInfo =
          await callGetLastError(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        expect(info.occurTimeStamp >= 0).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Return_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Return_static_0100
     * @tc.desc   getLastError return cover: HyperSnapErrorInfo fields present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnap_GetLastError_Return_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let info: hyperSnapManager.HyperSnapErrorInfo =
          await callGetLastError(hyperSnapManager.HyperSnapErrorType.CREATE_SNAPSHOT);
        expect(codeValue(info.code) >= 0 && codeValue(info.code) <= 7).assertTrue();
        expect(typeof info.msg).assertEqual('string');
        expect(info.occurTimeStamp >= 0).assertTrue();
      });

  });
}
