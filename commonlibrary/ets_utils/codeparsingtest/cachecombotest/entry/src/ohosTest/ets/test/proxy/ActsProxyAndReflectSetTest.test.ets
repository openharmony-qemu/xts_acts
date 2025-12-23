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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  testSetBasicProperty,
  testSetSymbolProperty,
  testSetInheritedProperty,
  testSetNonConfigurableProperty,
  testSetReadOnlyProperty,
  testSetTriggersHasTrap,
  testSetAfterRevocableRevoke,
  testSetRegExpLastIndex,
  testSetMapCustomProperty,
  testSetTriggersOwnKeysTrap,
  testSetWithReceiver,
  testSetArrayIndexProperty,
  testSetStringSymbolIterator,
  testSetUndefined,
  testSetNull,
  testSetNaN,
  testSetRegExpValue,
  testSetOnNullPrototype,
  testSetWithDifferentHandlerObject,
  testProxyString,
  testSetProtoAsProperty,
  testSetWithSymbolProperty,
  testSetTrapReturnsTrue,
  testSetArrayBufferProperty,
  testSetDataViewProperty,
  testSetErrorMessage,
  testSetPromiseThen,
  testSetWithProxyReceiver,
  testSetWeakMapProperty,
  testSetSymbolToStringTag,
  testSetConstructorProperty,
  testSetWithNonEnumerableProperty,
  testSetWithNonObjectReceiver,
  testSetArrayIndex123,
  testSetBigIntValue,
  testSetMapSetProperty,
  testSetOnSet,
  testSetOnWeakSet,
  testSetTrapThisContext,
  testSetDefineGetterProperty,
  testSetErrorStackProperty,
  testSetPromiseProperty,
  testSetSymbolHasInstanceProperty,
  testSetInfinityValue,
  testSetPropertyWithNumericString,
  testSetSymbolOnNullPrototype,
  testSetSymbolProtoProperty,
  testSetLengthOnObject,
  testSetEmptyStringProperty,
  testSetNegativeZeroValue,
  testSetMapGetProperty,
  testSetArrayIndex100,
  testSetHasOwnPropertyProperty,
  testSetFunctionCustomProperty,
  testSetSymbolIterator,
  testSetTypedArrayProperty,
  testSetProtoStringProperty,
  testSetWithSetter,
  testSetUndefinedNoGetter,
  testSetArgumentsProperty,
  testSetCallerProperty,
  testSetCalleeProperty,
  testSetFunctionPrototype,
  testSetDefineSetterProperty,
  testSetLookupGetterProperty,
  testSetLookupSetterProperty,
  testSetSymbolValue,
  testSetSymbolStringProperty,
  testSetNaNValue,
  testSetNullValue,
  testSetProtoStringOnNullPrototype,
  testSetWithTargetHasProto,
  testSetSymbolForValue,
  testSetValueOfProperty,
  testSetToLocaleStringProperty,
  testSetToJSONProperty,
  testSetPropertyIsEnumerableProperty,
  testSetNestedProxyProperty,
  testSetToStringProperty,
  testArrayLength,
  testSetSymbolAsyncIterator
} from './ActsProxyAndReflectSetTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsProxyAndReflectSetTest() {
  describe('actsProxyAndReflectSetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetBasicProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetInheritedProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNonConfigurableProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetReadOnlyProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTriggersHasTrap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0900
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetAfterRevocableRevoke();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetRegExpLastIndex();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetMapCustomProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTriggersOwnKeysTrap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithReceiver();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArrayIndexProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetStringSymbolIterator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithSetter();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetUndefined();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNaN();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetRegExpValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetOnNullPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithDifferentHandlerObject();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetProtoAsProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithSymbolProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTrapReturnsTrue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArrayBufferProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetDataViewProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetErrorMessage();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPromiseThen();
      expect(result).assertEqual(true);
    })
