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

export default function NapiApiObjectTest() {

  describe('NapiApiObjectTest', () => {
    let value: ESObject;

    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiObjectTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0001
     * @tc.name      testObjectCreationPrototypeFreezeAndTypeCheck
     * @tc.desc      Test object creation, prototype retrieval, freezing and type checking functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectCreationPrototypeFreezeAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectCreationPrototypeFreezeAndTypeCheck START');
      
      try {
        // 调用C++测试函数进行对象创建、原型获取、冻结和类型检查测试
        let result = napitest.NapiObjectTest001();
        expect(result).assertTrue();
        
        console.info('testObjectCreationPrototypeFreezeAndTypeCheck PASS');
      } catch (err) {
        console.error('testObjectCreationPrototypeFreezeAndTypeCheck err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0002
     * @tc.name      testObjectTypeTagCreationAndVerification
     * @tc.desc      Test object type tag creation and verification functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectTypeTagCreationAndVerification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectTypeTagCreationAndVerification START');
      
      try {
        // 调用C++测试函数进行对象类型标签创建和验证测试
        let result = napitest.NapiObjectTest002();
        expect(result).assertTrue();
        
        console.info('testObjectTypeTagCreationAndVerification PASS');
      } catch (err) {
        console.error('testObjectTypeTagCreationAndVerification err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0003
     * @tc.name      testExternalObjectCreationAndValueRetrieval
     * @tc.desc      Test external object creation and value retrieval functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExternalObjectCreationAndValueRetrieval', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testExternalObjectCreationAndValueRetrieval START');
      
      try {
        // 调用C++测试函数进行外部对象创建和值获取测试
        let result = napitest.NapiObjectTest003();
        expect(result).assertTrue();
        
        console.info('testExternalObjectCreationAndValueRetrieval PASS');
      } catch (err) {
        console.error('testExternalObjectCreationAndValueRetrieval err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0004
     * @tc.name      testObjectPropertyOperationsUnderDifferentProtectionLevels
     * @tc.desc      Test object property operations under different protection levels
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectPropertyOperationsUnderDifferentProtectionLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testObjectPropertyOperationsUnderDifferentProtectionLevels START');
      
      try {
        // 调用C++测试函数进行不同保护级别下的对象属性操作测试
        let result = napitest.NapiObjectTest004();
        expect(result).assertTrue();
        
        console.info('testObjectPropertyOperationsUnderDifferentProtectionLevels PASS');
      } catch (err) {
        console.error('testObjectPropertyOperationsUnderDifferentProtectionLevels err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0005
     * @tc.name      testSymbolCreationAndTypeCheck
     * @tc.desc      Test Symbol creation and type checking functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSymbolCreationAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testSymbolCreationAndTypeCheck START');
      
      try {
        // 调用C++测试函数进行Symbol创建和类型检查测试
        let result = napitest.NapiObjectTest005();
        expect(result).assertTrue();
        
        console.info('testSymbolCreationAndTypeCheck PASS');
      } catch (err) {
        console.error('testSymbolCreationAndTypeCheck err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0006
     * @tc.name      testTypeTagWithExternalObjectCombination
     * @tc.desc      Test type tag with external object combination usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeTagWithExternalObjectCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeTagWithExternalObjectCombination START');
      
      try {
        // 调用C++测试函数进行类型标签与外部对象组合使用测试
        let result = napitest.NapiObjectTest006();
        
        if (result) {
          console.info('[TestTypeTagWithExternalObjectCombination] SUCCESS - Type tag and external object operations completed');
        } else {
          console.error('[TestTypeTagWithExternalObjectCombination] FAILED - Test returned false');
        }
        
        expect(result).assertTrue();
        
        console.info('testTypeTagWithExternalObjectCombination PASS');
      } catch (err) {
        console.error('testTypeTagWithExternalObjectCombination err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0007
     * @tc.name      testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels
     * @tc.desc      Test Symbol as object property key under different protection levels
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels START');
      
      try {
        // 调用C++测试函数进行Symbol作为对象属性键在不同保护级别下的行为测试
        let result = napitest.NapiObjectTest007();
        expect(result).assertTrue();
        
        console.info('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels PASS');
      } catch (err) {
        console.error('testSymbolAsObjectPropertyKeyUnderDifferentProtectionLevels err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0008
     * @tc.name      testTypeTagBehaviorInPrototypeChain
     * @tc.desc      Test type tag behavior in prototype chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeTagBehaviorInPrototypeChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testTypeTagBehaviorInPrototypeChain START');
      
      try {
        // 调用C++测试函数进行类型标签在原型链中的行为测试
        let result = napitest.NapiObjectTest008();
        expect(result).assertTrue();
        
        console.info('testTypeTagBehaviorInPrototypeChain PASS');
      } catch (err) {
        console.error('testTypeTagBehaviorInPrototypeChain err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0009
     * @tc.name      testExternalObjectWithPrototypeMethodInteraction
     * @tc.desc      Test external object interaction with prototype methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExternalObjectWithPrototypeMethodInteraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testExternalObjectWithPrototypeMethodInteraction START');
      
      try {
        // 调用C++测试函数进行外部对象与原型方法交互测试
        let result = napitest.NapiObjectTest009();
        expect(result).assertTrue();
        
        console.info('testExternalObjectWithPrototypeMethodInteraction PASS');
      } catch (err) {
        console.error('testExternalObjectWithPrototypeMethodInteraction err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0010
     * @tc.name      testObjectThreadSafety
     * @tc.desc      Test thread safety of object-related NAPI functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testObjectThreadSafety START');
      
      try {
        // 调用C++测试函数进行对象相关函数的线程安全性测试
        let result = napitest.NapiObjectTest010();
        expect(result).assertTrue();
        
        console.info('testObjectThreadSafety PASS');
      } catch (err) {
        console.error('testObjectThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0011
     * @tc.name      testExternalObjectThreadSafety
     * @tc.desc      Test thread safety of external object NAPI functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExternalObjectThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testExternalObjectThreadSafety START');
      
      try {
        // 调用C++测试函数进行外部对象函数的线程安全性测试
        let result = napitest.NapiObjectTest011();
        expect(result).assertTrue();
        
        console.info('testExternalObjectThreadSafety PASS');
      } catch (err) {
        console.error('testExternalObjectThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_OBJECT_0012
     * @tc.name      testSymbolThreadSafety
     * @tc.desc      Test thread safety of Symbol NAPI functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSymbolThreadSafety', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testSymbolThreadSafety START');
      
      try {
        // 调用C++测试函数进行Symbol函数的线程安全性测试
        let result = napitest.NapiObjectTest012();
        expect(result).assertTrue();
        
        console.info('testSymbolThreadSafety PASS');
      } catch (err) {
        console.error('testSymbolThreadSafety err msg: ' + err.message);
        expect().assertFail();
      }
    });
  })
}
