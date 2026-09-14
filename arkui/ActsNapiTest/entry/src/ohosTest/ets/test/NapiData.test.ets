/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import testNapi from 'libnapiData.so';

export default function dataTest() {
  describe('ActsDataTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name testNapiData0001
     * @tc.number SUB_NAPI_DATA_STATIC_0100
     * @tc.desc Normal Date, verify napi_is_date returns true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData001';
      console.info(`${caseName} START`);
      const now: Date = new Date();
      expect(testNapi.isDate(now)).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testNapiData0002
     * @tc.number SUB_NAPI_DATA_STATIC_0200
     * @tc.desc Call napi_is_date on Invalid Date, verify it is still treated as Date.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData002';
      console.info(`${caseName} START`);
      const invalidDate: Date = new Date(NaN);
      expect(testNapi.isDate(invalidDate)).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testNapiData0003
     * @tc.number SUB_NAPI_DATA_STATIC_0300
     * @tc.desc Call napi_is_date on an object created from Date.prototype, verify it is not a Date instance.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData003';
      console.info(`${caseName} START`);
      expect(testNapi.isDatePrototypeObject()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testNapiData0004
     * @tc.number SUB_NAPI_DATA_STATIC_0400
     * @tc.desc Call napi_is_date on a frozen Date, verify it is still a Date.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData004';
      console.info(`${caseName} START`);
      expect(testNapi.isFrozenDate()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testNapiData0005
     * @tc.number SUB_NAPI_DATA_STATIC_0500
     * @tc.desc Call napi_is_date in an isolated Ark runtime, verify cross-realm Date is recognized.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData005';
      console.info(`${caseName} START`);
      expect(testNapi.isDateCrossRealm()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testNapiData0006
     * @tc.number SUB_NAPI_DATA_STATIC_0600
     * @tc.desc After clearing pending exception, napi_is_date should work normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData006';
      console.info(`${caseName} START`);
      expect(testNapi.isDateAfterExceptionClear()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testNapiData0007
     * @tc.number SUB_NAPI_DATA_STATIC_0700
     * @tc.desc Call napi_is_date on Invalid Date with pending exception, verify behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testNapiData0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testNapiData007';
      console.info(`${caseName} START`);
      expect(testNapi.isDateWithMultipleExceptions()).assertTrue();
      console.info(`${caseName} END`);
    });

    // ===== napi_delete_callsite_info 测试 =====
    /**
     * @tc.name testDeleteCallsiteInfoNormalParams0008
     * @tc.number SUB_NAPI_DATA_DELETE_CALLSITE_INFO_NORMAL_0800
     * @tc.desc Verify napi_delete_callsite_info with valid parameters returns napi_ok
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testDeleteCallsiteInfoNormalParams0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testDeleteCallsiteInfoNormalParams008';
      console.info(`${caseName} START`);
      expect(testNapi.testDeleteCallsiteInfoNormalParams()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDeleteCallsiteInfoCombination0009
     * @tc.number SUB_NAPI_DATA_DELETE_CALLSITE_INFO_COMBINATION_0900
     * @tc.desc Verify napi_delete_callsite_info combination with create_type_error and throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testDeleteCallsiteInfoCombination0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testDeleteCallsiteInfoCombination009';
      console.info(`${caseName} START`);
      expect(testNapi.testDeleteCallsiteInfoCombination()).assertTrue();
      console.info(`${caseName} END`);
    });

    // ===== node_api_get_module_file_name 测试 =====
    /**
     * @tc.name testGetModuleFileNameNormalParams0010
     * @tc.number SUB_NAPI_DATA_GET_MODULE_FILE_NAME_NORMAL_1000
     * @tc.desc Verify node_api_get_module_file_name returns napi_ok and valid filename
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testGetModuleFileNameNormalParams0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testGetModuleFileNameNormalParams010';
      console.info(`${caseName} START`);
      expect(testNapi.testGetModuleFileNameNormalParams()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testGetModuleFileNameAbnormalParams0011
     * @tc.number SUB_NAPI_DATA_GET_MODULE_FILE_NAME_ABNORMAL_PARAMS_1100
     * @tc.desc Verify node_api_get_module_file_name returns error for NULL result pointer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testGetModuleFileNameAbnormalParams0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testGetModuleFileNameAbnormalParams011';
      console.info(`${caseName} START`);
      expect(testNapi.testGetModuleFileNameAbnormalParams()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testGetModuleFileNameReturnValue0012
     * @tc.number SUB_NAPI_DATA_GET_MODULE_FILE_NAME_RETURN_VALUE_1200
     * @tc.desc Verify node_api_get_module_file_name returns path matching actual module file
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testGetModuleFileNameReturnValue0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testGetModuleFileNameReturnValue012';
      console.info(`${caseName} START`);
      expect(testNapi.testGetModuleFileNameReturnValue()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testThrowBusinessErrorCombination0013
     * @tc.number SUB_NAPI_DATA_THROW_BUSINESS_ERROR_COMBINATION_1300
     * @tc.desc Verify napi_throw_business_error combination with napi_create_error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testThrowBusinessErrorCombination0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testThrowBusinessErrorCombination013';
      console.info(`${caseName} START`);
      expect(testNapi.testThrowBusinessErrorCombination()).assertTrue();
      console.info(`${caseName} END`);
    });

    // ===== napi_serialize 测试 =====
    /**
     * @tc.name testSerializeNullValue0014
     * @tc.number SUB_NAPI_DATA_SERIALIZE_NULL_VALUE_1400
     * @tc.desc Verify napi_serialize returns error for NULL value parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSerializeNullValue0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName = 'testSerializeNullValue014';
      console.info(`${caseName} START`);
      expect(testNapi.testSerializeNullValue()).assertTrue();
      console.info(`${caseName} END`);
    });

    // ===== napi_switch_ark_context 测试 =====
    /**
     * @tc.name testSwitchArkContextReturnValue0015
     * @tc.number SUB_NAPI_DATA_SWITCH_ARK_CONTEXT_RETURN_VALUE_1500
     * @tc.desc Verify napi_switch_ark_context switches context and allows object creation in new context
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSwitchArkContextReturnValue0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testSwitchArkContextReturnValue015';
      console.info(`${caseName} START`);
      expect(testNapi.testSwitchArkContextReturnValue()).assertTrue();
      console.info(`${caseName} END`);
    });

    // ===== node_api_get_module_file_name 组合场景 =====
    /**
     * @tc.name testGetModuleFileNameCombination0016
     * @tc.number SUB_NAPI_DATA_GET_MODULE_FILE_NAME_COMBINATION_1600
     * @tc.desc Verify get_module_file_name path can be used for resource file location
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testGetModuleFileNameCombination0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testGetModuleFileNameCombination016';
      console.info(`${caseName} START`);
      expect(testNapi.testGetModuleFileNameCombination()).assertTrue();
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testModuleRegisterCombination0017
     * @tc.number SUB_NAPI_DATA_MODULE_REGISTER_COMBINATION_1700
     * @tc.desc Verify napi_module_register combination with define_properties and module setup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testModuleRegisterCombination0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
      const caseName = 'testModuleRegisterCombination017';
      console.info(`${caseName} START`);
      expect(testNapi.testModuleRegisterCombination()).assertTrue();
      console.info(`${caseName} END`);
    });
  });
}
