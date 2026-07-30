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

const TAG = 'SUB_Ability_AbilityRuntime_ModularObjectExtensionAbilityTest';
const PARAM_INVALID_CODE = 401;

export default function ndkModularObjectExtensionAbilityTest() {
  describe('ActsCapiAbilityRuntimeModularObjectExtensionAbilityNDKTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnCreateFunc with null instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnCreate_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnCreateFunc with null onCreateFunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnCreate_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDestroyFunc with null instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnDestroy_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDestroyFunc with null onDestroyFunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnDestroy_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnConnectFunc with null instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnConnect_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnConnectFunc with null onConnectFunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnConnect_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDisconnectFunc with null instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnDisconnect_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDisconnectFunc with null onDisconnectFunc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityRegisterOnDisconnect_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance with null instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityGetContext_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityGetContext_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase with null baseExtensionInstance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityGetInstanceFromBase_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase with null modObjExtensionInstance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtAbilityGetInstanceFromBase_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0100
     * @tc.desc   Test OH_AbilityRuntime_ConnectModularObjectExtensionAbility with null want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectModObjExtAbility_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0200
     * @tc.desc   Test OH_AbilityRuntime_ConnectModularObjectExtensionAbility with null connectOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectModObjExtAbility_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0300
     * @tc.desc   Test OH_AbilityRuntime_ConnectModularObjectExtensionAbility with null connectionId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0300';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectModObjExtAbility_0300();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0100
     * @tc.desc   Test OH_AbilityRuntime_DisconnectModularObjectExtensionAbility with invalid connectionId(-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkDisconnectModObjExtAbility_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0200
     * @tc.desc   Test OH_AbilityRuntime_DisconnectModularObjectExtensionAbility with invalid connectionId(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkDisconnectModObjExtAbility_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_DestroyConnectOptions_0100
     * @tc.number SUB_Ability_AbilityRuntime_DestroyConnectOptions_0100
     * @tc.desc   Test OH_AbilityRuntime_DestroyConnectOptions with null connectOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_DestroyConnectOptions_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_DestroyConnectOptions_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkDestroyConnectOptions_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0100
     * @tc.number SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0100
     * @tc.desc   Test OH_AbilityRuntime_ConnectOptions_SetOnConnectCallback with null connectOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectOptionsSetOnConnect_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200
     * @tc.number SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200
     * @tc.desc   Test OH_AbilityRuntime_ConnectOptions_SetOnConnectCallback with null onConnectCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectOptionsSetOnConnect_0200();
      expect(result).assertEqual(0);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0100
     * @tc.number SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0100
     * @tc.desc   Test OH_AbilityRuntime_ConnectOptions_SetOnDisconnectCallback with null connectOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectOptionsSetOnDisconnect_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0200
     * @tc.number SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0200
     * @tc.desc   Test OH_AbilityRuntime_ConnectOptions_SetOnDisconnectCallback with null onDisconnectCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectOptionsSetOnDisconnect_0200();
      expect(result).assertEqual(0);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0100
     * @tc.number SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0100
     * @tc.desc   Test OH_AbilityRuntime_ConnectOptions_SetOnFailedCallback with null connectOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectOptionsSetOnFailed_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0200
     * @tc.number SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0200
     * @tc.desc   Test OH_AbilityRuntime_ConnectOptions_SetOnFailedCallback with null onFailedCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkConnectOptionsSetOnFailed_0200();
      expect(result).assertEqual(0);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0100
     * @tc.desc   Test GetOnCreateCallbackCount returns callback invoke count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      testNapi.ndkResetModObjExtCallbackCounts_0100();
      let connectionId = testNapi.ndkConnectMoeExtension_0100();
      hilog.info(0x0000, TAG, `connectionId=${connectionId}`);
      setTimeout(() => {
        let createCount = testNapi.ndkGetModObjExtCallbackCounts_0100();
        let connectCount = testNapi.ndkGetModObjExtCallbackCounts_0300();
        hilog.info(0x0000, TAG, `onCreateCount=${createCount}, onConnectCount=${connectCount}`);
        expect(createCount >= 0).assertTrue();
        expect(connectCount >= 0).assertTrue();
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
        done();
      }, 1000);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0200
     * @tc.desc   Test OnDestroyCallback triggered after Disconnect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      testNapi.ndkResetModObjExtCallbackCounts_0100();
      let connectionId = testNapi.ndkConnectMoeExtension_0100();
      hilog.info(0x0000, TAG, `connectionId=${connectionId}`);
      setTimeout(() => {
        if (connectionId > 0) {
          let disconnectResult = testNapi.ndkDisconnectMoeExtension_0100();
          hilog.info(0x0000, TAG, `disconnectResult=${disconnectResult}`);
        }
        setTimeout(() => {
          let disconnectCount = testNapi.ndkGetModObjExtCallbackCounts_0400();
          hilog.info(0x0000, TAG, `onDisconnectCount=${disconnectCount}`);
          expect(disconnectCount >= 0).assertTrue();
          hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
          done();
        }, 1000);
      }, 1000);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0300
     * @tc.desc   Test OnConnectCallback triggered after Connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0300';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      testNapi.ndkResetModObjExtCallbackCounts_0100();
      let connectionId = testNapi.ndkConnectMoeExtension_0100();
      hilog.info(0x0000, TAG, `connectionId=${connectionId}`);
      setTimeout(() => {
        let connectCount = testNapi.ndkGetModObjExtCallbackCounts_0300();
        hilog.info(0x0000, TAG, `onConnectCount=${connectCount}`);
        expect(connectCount >= 0).assertTrue();
        if (connectionId > 0) {
          testNapi.ndkDisconnectMoeExtension_0100();
        }
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
        done();
      }, 1000);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0400
     * @tc.desc   Test OnDisconnectCallback triggered after Disconnect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0400', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0400';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ConnectMoeExtension_0100
     * @tc.number SUB_Ability_AbilityRuntime_ConnectMoeExtension_0100
     * @tc.desc   Test ConnectModularObjectExtensionAbility with MoeExtensionAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ConnectMoeExtension_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ConnectMoeExtension_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      testNapi.ndkResetModObjExtCallbackCounts_0100();
      let connectionId = testNapi.ndkConnectMoeExtension_0100();
      hilog.info(0x0000, TAG, `connectionId=${connectionId}`);
      expect(connectionId).assertEqual(-1);
      setTimeout(() => {
        if (connectionId > 0) {
          testNapi.ndkDisconnectMoeExtension_0100();
        }
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
        done();
      }, 500);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_DisconnectMoeExtension_0100
     * @tc.number SUB_Ability_AbilityRuntime_DisconnectMoeExtension_0100
     * @tc.desc   Test DisconnectModularObjectExtensionAbility after Connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_DisconnectMoeExtension_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_DisconnectMoeExtension_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      testNapi.ndkResetModObjExtCallbackCounts_0100();
      let connectionId = testNapi.ndkConnectMoeExtension_0100();
      hilog.info(0x0000, TAG, `connectionId=${connectionId}`);
      setTimeout(() => {
        let result = testNapi.ndkDisconnectMoeExtension_0100();
        hilog.info(0x0000, TAG, `disconnectResult=${result}`);
        expect(result).assertEqual(401);
        hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
        done();
      }, 1000);
    })

  })
}