/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

import napitest from 'libnapitest.so'
import worker, { MessageEvents } from '@ohos.worker';

export default function NapiApiNumberTest() {

  describe('NapiApiNumberTest', () => {
    let value: ESObject;

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiStringTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0001
     * @tc.name      testNumberCreationAndRetrieval
     * @tc.desc      Test number creation and retrieval using NAPI functions to ensure correctness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberCreationAndRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNumberCreationAndRetrieval START');
      
      try {
        // 调用C++测试函数进行数值创建和获取测试
        let result = napitest.NapiNumberTest001();
        expect(result).assertTrue();
        
        console.info('testNumberCreationAndRetrieval PASS');
      } catch (err) {
        console.error('testNumberCreationAndRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0002
     * @tc.name      testCrossTypeConversion
     * @tc.desc      Test cross-type conversion between different numeric types using NAPI functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrossTypeConversion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCrossTypeConversion START');
      
      try {
        // 调用C++测试函数进行跨类型转换测试
        let result = napitest.NapiNumberTest002();
        expect(result).assertTrue();
        
        console.info('testCrossTypeConversion PASS');
      } catch (err) {
        console.error('testCrossTypeConversion err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0003
     * @tc.name      testBoundaryValues
     * @tc.desc      Test boundary values for different numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBoundaryValues START');
      
      try {
        // 调用C++测试函数进行边界值测试
        let result = napitest.NapiNumberTest003();
        expect(result).assertTrue();
        
        console.info('testBoundaryValues PASS');
      } catch (err) {
        console.error('testBoundaryValues err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0004
     * @tc.name      testCombinedOperations
     * @tc.desc      Test combined operations of multiple create and get operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCombinedOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testCombinedOperations START');
      
      try {
        // 调用C++测试函数进行组合操作测试
        let result = napitest.NapiNumberTest004();
        expect(result).assertTrue();
        
        console.info('testCombinedOperations PASS');
      } catch (err) {
        console.error('testCombinedOperations err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0005
     * @tc.name      testTypeConversionAndOverflow
     * @tc.desc      Test type conversion and overflow handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeConversionAndOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeConversionAndOverflow START');
      
      try {
        // 调用C++测试函数进行类型转换和溢出测试
        let result = napitest.NapiNumberTest005();
        expect(result).assertTrue();
        
        console.info('testTypeConversionAndOverflow PASS');
      } catch (err) {
        console.error('testTypeConversionAndOverflow err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0006
     * @tc.name      testLargeNumbersAndPrecision
     * @tc.desc      Test large numbers and precision handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLargeNumbersAndPrecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testLargeNumbersAndPrecision START');
      
      try {
        // 调用C++测试函数进行大数值和精度测试
        let result = napitest.NapiNumberTest006();
        expect(result).assertTrue();
        
        console.info('testLargeNumbersAndPrecision PASS');
      } catch (err) {
        console.error('testLargeNumbersAndPrecision err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0007
     * @tc.name      testBooleanValueHandling
     * @tc.desc      Test boolean value creation and retrieval
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBooleanValueHandling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testBooleanValueHandling START');
      
      try {
        // 调用C++测试函数进行布尔值处理测试
        let result = napitest.NapiNumberTest007();
        expect(result).assertTrue();
        
        console.info('testBooleanValueHandling PASS');
      } catch (err) {
        console.error('testBooleanValueHandling err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_NUMBER_0008
     * @tc.name      testThreadSafety
     * @tc.desc      Test thread safety of NAPI value creation and retrieval
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testThreadSafety START');
      
      try {
        // 调用C++测试函数进行线程安全性测试
        let result = napitest.NapiNumberTest008();
        expect(result).assertTrue();
        
        console.info('testThreadSafety PASS');
      } catch (err) {
        console.error('testThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });
  })
}