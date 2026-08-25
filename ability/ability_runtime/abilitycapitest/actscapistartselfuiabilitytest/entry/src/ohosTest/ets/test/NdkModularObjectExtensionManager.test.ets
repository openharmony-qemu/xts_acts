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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_ModularObjectExtensionManagerTest';
const PARAM_INVALID_CODE = 401;

export default function ndkModularObjectExtensionManagerTest() {
  describe('ActsCapiAbilityRuntimeModularObjectExtensionManagerNDKTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0100
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode with null extensionInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoLaunchMode_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0200
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode with null launchMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoLaunchMode_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0100
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode with null extensionInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoProcessMode_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0200
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode with null processMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoProcessMode_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0100
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode with null extensionInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoThreadMode_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0200
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode with null threadMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoThreadMode_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0100
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoElementName with null extensionInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoElementName_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0200
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoElementName with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoElementName_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0100
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState with null extensionInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoDisableState_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0200
     * @tc.desc   Test OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState with null isDisabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoDisableState_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AcquireSelfModObjExtInfos_0100
     * @tc.number SUB_Ability_AbilityRuntime_AcquireSelfModObjExtInfos_0100
     * @tc.desc   Test OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos with null outOwnedAllExtensionInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_AcquireSelfModObjExtInfos_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_AcquireSelfModObjExtInfos_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkAcquireSelfModObjExtInfos_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ReleaseAllExtensionInfos_0100
     * @tc.number SUB_Ability_AbilityRuntime_ReleaseAllExtensionInfos_0100
     * @tc.desc   Test OH_AbilityRuntime_ReleaseAllExtensionInfos with null allExtensionInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ReleaseAllExtensionInfos_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ReleaseAllExtensionInfos_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkReleaseAllExtensionInfos_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0100
     * @tc.desc   Test OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos with null allExtensionInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetCountFromAllModObjExtInfos_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0200
     * @tc.desc   Test OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos with null count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetCountFromAllModObjExtInfos_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0100
     * @tc.desc   Test OH_AbilityRuntime_GetModObjExtensionInfoByIndex with null allExtensionInfos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoByIndex_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0200
     * @tc.desc   Test OH_AbilityRuntime_GetModObjExtensionInfoByIndex with null extensionInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoByIndex_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0300
     * @tc.desc   Test OH_AbilityRuntime_GetModObjExtensionInfoByIndex with invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0300';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkGetModObjExtInfoByIndex_0300();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessMode_Bundle_0100
     * @tc.number SUB_Ability_AbilityRuntime_ProcessMode_Bundle_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_PROCESS_MODE_BUNDLE enum value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ProcessMode_Bundle_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ProcessMode_Bundle_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkProcessModeBundle_0100();
      expect(result).assertEqual(0);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessMode_Type_0100
     * @tc.number SUB_Ability_AbilityRuntime_ProcessMode_Type_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_PROCESS_MODE_TYPE enum value is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ProcessMode_Type_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ProcessMode_Type_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkProcessModeType_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ProcessMode_Instance_0100
     * @tc.number SUB_Ability_AbilityRuntime_ProcessMode_Instance_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_PROCESS_MODE_INSTANCE enum value is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ProcessMode_Instance_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ProcessMode_Instance_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkProcessModeInstance_0100();
      expect(result).assertEqual(2);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ThreadMode_Bundle_0100
     * @tc.number SUB_Ability_AbilityRuntime_ThreadMode_Bundle_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_THREAD_MODE_BUNDLE enum value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ThreadMode_Bundle_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ThreadMode_Bundle_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkThreadModeBundle_0100();
      expect(result).assertEqual(0);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ThreadMode_Type_0100
     * @tc.number SUB_Ability_AbilityRuntime_ThreadMode_Type_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_THREAD_MODE_TYPE enum value is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ThreadMode_Type_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ThreadMode_Type_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkThreadModeType_0100();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ThreadMode_Instance_0100
     * @tc.number SUB_Ability_AbilityRuntime_ThreadMode_Instance_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_THREAD_MODE_INSTANCE enum value is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ThreadMode_Instance_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ThreadMode_Instance_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkThreadModeInstance_0100();
      expect(result).assertEqual(2);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LaunchMode_InProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_LaunchMode_InProcess_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_LAUNCH_MODE_IN_PROCESS enum value is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LaunchMode_InProcess_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_LaunchMode_InProcess_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkThreadLaunchMode_0100();
      expect(result).assertEqual(0);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_LaunchMode_CrossProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_LaunchMode_CrossProcess_0100
     * @tc.desc   Test OH_ABILITY_RUNTIME_LAUNCH_MODE_CROSS_PROCESS enum value is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_LaunchMode_CrossProcess_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_LaunchMode_CrossProcess_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkThreadLaunchMode_0200();
      expect(result).assertEqual(1);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

  })
}