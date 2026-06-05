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

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '@ohos/hypium';
import {
  defPropOnPlainObj,
  defPropOnExistingObj,
  defPropOnArray,
  defPropOnFunction,
  defPropOnDate,
  defPropOnRegExp,
  defPropOnMap,
  defPropOnSet,
  defPropOnArrayBuffer,
  defPropOnTypedArray,
  defPropOnDataView,
  defPropOnPromise,
  defPropOnWeakMap,
  defPropOnWeakSet,
  defPropOnProxy,
  defPropOnFrozen,
  defPropOnSealed,
  defPropOnNonExtensible,
  defPropWithEmptyStrKey,
  defPropWithNumStrKey,
  defPropWithSpecialCharKey,
  defPropWithChineseKey,
  defPropWithEmojiKey,
  defPropWithUnicodeKey,
  defPropWithSymbolKey,
  defPropWithSymbolForKey,
  defPropWithLongKey,
  defPropWithKeywordKeys,
  defPropWithReservedKeys,
  defPropWithProtoKey,
  defPropWithConstructorKey,
  defPropWithEmptyDesc,
  defPropWithNullDesc,
  defPropWithUndefinedDesc,
  defPropWithNumberDesc,
  defPropWithStringDesc,
  defPropWithArrayDesc,
  defPropWithExtraProps,
  defPropWithFuncDesc,
  defPropWithInheritedDesc,
  defPropWithFrozenDesc,
  defPropReturnsObject,
  defPropChainCall,
  defPropMultipleSame,
  defPropBasicTypes,
  defPropNumberBoundary,
  defPropBigIntValue,
  defPropSymbolValue,
  defPropObjectValue,
  defPropSpecialObjValue,
  defPropCircularValue,
  defPropExplicitUndef,
  defPropNoValueDefault,
  defPropWritableTrue,
  defPropWritableFalse,
  defPropWritableFalseStrict,
  defPropDefaultWritable,
  defPropObjImmutable,
  defPropArrImmutable,
  defPropModifyViaDefineProp,
  defPropWritableToFalse,
  defPropReadonlyViaDefineProp,
  defPropValueAndWritable,
  defPropOnlyValue,
  defPropOnlyWritable,
  defPropMultiCombo,
  defPropBasicGetter,
  defPropFixedGetter,
  defPropComputedGetter,
  defPropThisGetter,
  defPropClosureGetter,
  defPropUndefGetter,
  defPropNullGetter,
  defPropErrorGetter,
  defPropFuncGetter,
  defPropSymbolGetter,
  defPropBigIntGetter,
  defPropArrayGetter,
  defPropNonFuncGetter,
  defPropBasicSetter,
  defPropClosureSetter,
  defPropThisSetter,
  defPropTypeConvertSetter,
  defPropValidateSetter,
  defPropThrowSetter,
  defPropIgnoreSetter,
  defPropWriteOnly,
  defPropNonFuncSetter,
  defPropFullAccessor,
  defPropThisAccessor,
  defPropReadonlyAccessor,
  defPropWriteOnlyAccessor,
  defPropMixedDescError,
  defPropConfigurableTrue,
  defPropConfigurableFalse,
  defPropDefaultConfigurable,
  defPropDeleteConfigurable,
  defPropDeleteNonConfigurable,
  defPropWritableTrueNonConfig,
  defPropWritableToFalseNonConfig,
  defPropFullyLocked,
  defPropSameValueNonConfig,
  defPropTypeSwitch,
  defPropEnumerableTrue,
  defPropEnumerableFalse,
  defPropDefaultEnumerable,
  defPropMixedEnumerable,
  defPropHiddenAccessible,
  defPropOwnNamesIncludes,
  defPropModifyEnumerable,
  defPropEnumerableAccessor,
  defPropDefaultAll,
  defPropModifyExisting,
  defPropModifyWritable,
  defPropModifyConfigFromTrue,
  defPropPartialModify,
  defPropModifyAssignCreated,
  defPropDataToAccessor,
  defPropAccessorToData,
  defPropSwitchTypeNonConfig,
  defPropProtoAccessor,
  defPropProtoSharedAccessor,
  defPropProtoThisAccessor,
  defPropProtoData,
  defPropProtoDataWritable,
  defPropProtoReadonly,
  defPropProtoConfigOverride,
  defPropProtoChainForIn,
  defPropObjCreateNull,
  defPropObjCreateSecondArg,
  defPropValueGetMixed,
  defPropValueSetMixed,
  defPropWritableGetMixed,
  defPropWritableSetMixed,
  defPropTargetNull,
  defPropTargetUndefined,
  defPropTargetNumber,
  defPropTargetString,
  defPropTargetBoolean,
  defPropTargetSymbol,
  defPropTargetBigInt,
  defPropModifyNonConfigValue,
  defPropModifyNonConfigEnum,
  defPropModifyNonConfigConfig,
  defPropModifyNonConfigGetter,
  defPropModifyNonConfigSetter,
  defPropSwitchAccessorToDataNonConfig,
  defPropAddOnPrevented,
  defPropAddOnSealed,
  defPropAddOnFrozen,
  defPropModifyOnFrozen,
  defPropModifyCharOnSealed,
  defPropFreezeEffect,
  defPropFreezeAccessor,
  defPropSealEffect,
  defPropPreventModify,
  defPropDefineProperties,
  defPropGetOwnPropDesc,
  defPropNestedObj,
  defPropObjWithSymbol,
  defPropObjWithFunc,
  defPropLargeObj,
  defPropUndefNullNaNInf,
  defPropLongStringValue,
  defPropDeepNested,
  defPropOverrideToString,
  defPropDeleteRedefine,
  defPropSealedWritable,
  defPropPropertyIsEnumerable,
  defPropSymbolKeysNotInKeys,
  defPropJSONStringifyEnum,
  defPropObjectAssignEnum,
  defPropCircularRef,
  defPropReflectBasic,
  defPropReflectFail,
  defPropReflectFreeze,
  defPropProxyIntercept,
  defPropTypedArraySpecial
} from './ObjectDefineProperty';

export default function ObjectDefinePropertyTest() {
  describe('ObjectDefinePropertyTest', () => {

    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name   ObjectDefinePropertyTest001
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0001
     * @tc.desc   Use plain object as target for defineProperty
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnPlainObj();
      expect(r.result).assertEqual(true);
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest002
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0002
     * @tc.desc   Define new property on object with existing properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnExistingObj();
      expect(r.newProp).assertEqual(2);
      expect(r.existing).assertEqual('value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest003
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0003
     * @tc.desc   Define property on array object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnArray();
      expect(r.customProp).assertEqual('test');
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest004
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0004
     * @tc.desc   Define property on function object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnFunction()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest005
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0005
     * @tc.desc   Define property on Date object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnDate()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest006
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0006
     * @tc.desc   Define property on RegExp object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnRegExp()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest007
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0007
     * @tc.desc   Define property on Map object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnMap();
      expect(r.customProp).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest008
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0008
     * @tc.desc   Define property on Set object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnSet();
      expect(r.customProp).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest009
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0009
     * @tc.desc   Define property on ArrayBuffer object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnArrayBuffer();
      expect(r.customProp).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest010
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0010
     * @tc.desc   Define property on TypedArray object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnTypedArray();
      expect(r.customProp).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest011
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0011
     * @tc.desc   Define property on DataView object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnDataView()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest012
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0012
     * @tc.desc   Define property on Promise object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnPromise()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest013
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0013
     * @tc.desc   Define property on WeakMap object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnWeakMap()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest014
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0014
     * @tc.desc   Define property on WeakSet object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnWeakSet()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest015
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0015
     * @tc.desc   Define property on frozen object should throw TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnFrozen()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest016
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0016
     * @tc.desc   Define new property on sealed object should throw TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnSealed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest017
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0017
     * @tc.desc   Define new property on non-extensible object should throw TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnNonExtensible()).assertEqual("TypeError");
    });



    /**
     * @tc.name   ObjectDefinePropertyTest018
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0018
     * @tc.desc   Verify defineProperty with empty string key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithEmptyStrKey()).assertEqual('empty');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest019
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0019
     * @tc.desc   Verify defineProperty with numeric string key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithNumStrKey()).assertEqual('zero');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest020
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0020
     * @tc.desc   Verify defineProperty with special character key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithSpecialCharKey()).assertEqual('special');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest021
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0021
     * @tc.desc   Verify defineProperty with Chinese character key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithChineseKey()).assertEqual('中文值');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest022
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0022
     * @tc.desc   Verify defineProperty with emoji key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithEmojiKey()).assertEqual('emoji');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest023
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0023
     * @tc.desc   Verify defineProperty with Symbol key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWithSymbolKey();
      expect(r.exists).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest024
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0024
     * @tc.desc   Verify defineProperty with Symbol.for key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithSymbolForKey()).assertEqual('global symbol value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest025
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0025
     * @tc.desc   Verify defineProperty with long string key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithLongKey()).assertEqual('long value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest026
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0026
     * @tc.desc   Verify defineProperty with keyword keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWithKeywordKeys();
      expect(r.classVal).assertEqual('keyword');
      expect(r.funcVal).assertEqual('keyword');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest027
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0027
     * @tc.desc   Verify defineProperty with reserved word keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWithReservedKeys();
      expect(r.implVal).assertEqual('reserved');
      expect(r.ifaceVal).assertEqual('reserved');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest028
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0028
     * @tc.desc   Verify defineProperty with __proto__ key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithProtoKey()).assertEqual('proto value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest029
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0029
     * @tc.desc   Verify overriding constructor property via defineProperty
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithConstructorKey()).assertEqual('custom constructor');
    });



    /**
     * @tc.name   ObjectDefinePropertyTest030
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0030
     * @tc.desc   Verify empty descriptor object applies all defaults
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWithEmptyDesc();
      expect(r.value).assertEqual(undefined);
      expect(r.writable).assertEqual(false);
      expect(r.enumerable).assertEqual(false);
      expect(r.configurable).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest031
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0031
     * @tc.desc   Verify null descriptor throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithNullDesc()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest032
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0032
     * @tc.desc   Verify undefined descriptor throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithUndefinedDesc()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest033
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0033
     * @tc.desc   Verify number descriptor throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithNumberDesc()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest034
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0034
     * @tc.desc   Verify string descriptor throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithStringDesc()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest035
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0035
     * @tc.desc   Verify array as descriptor treated as object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithArrayDesc()).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest036
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0036
     * @tc.desc   Verify descriptor with extra properties are ignored
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithExtraProps()).assertEqual(1);
    });



    /**
     * @tc.name   ObjectDefinePropertyTest037
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0037
     * @tc.desc   Verify defineProperty returns the modified object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropReturnsObject()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest038
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0038
     * @tc.desc   Verify chain-call defineProperty
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropChainCall();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest039
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0039
     * @tc.desc   Verify multiple defineProperty on the same property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropMultipleSame();
      expect(r.returnsObj).assertEqual(true);
      expect(r.value).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest040
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0040
     * @tc.desc   Verify basic data types as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropBasicTypes();
      expect(r.num).assertEqual(42);
      expect(r.str).assertEqual('hello');
      expect(r.bool).assertEqual(true);
      expect(r.nullVal).assertEqual(null);
      expect(r.undef).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest041
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0041
     * @tc.desc   Verify number boundary values as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropNumberBoundary();
      expect(r.isZero).assertEqual(true);
      expect(r.isNegZero).assertEqual(true);
      expect(r.isInf).assertEqual(true);
      expect(r.isNaN).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest042
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0042
     * @tc.desc   Verify BigInt as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropBigIntValue();
      expect(r.bigint).assertEqual(9007199254740991n);
      expect(r.type).assertEqual('bigint');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest043
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0043
     * @tc.desc   Verify Symbol as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropSymbolValue();
      expect(r.equals).assertEqual(true);
      expect(r.type).assertEqual('symbol');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest044
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0044
     * @tc.desc   Verify object types as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropObjectValue();
      expect(r.aVal).assertEqual(1);
      expect(r.arrVal).assertEqual(1);
      expect(r.funcVal).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest045
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0045
     * @tc.desc   Verify special objects as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropSpecialObjValue();
      expect(r.isDate).assertEqual(true);
      expect(r.regexTest).assertEqual(true);
      expect(r.mapGet).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest046
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0046
     * @tc.desc   Verify circular reference value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropCircularValue()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest047
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0047
     * @tc.desc   Verify explicitly set value to undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     *
     *
     */
    it('ObjectDefinePropertyTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropExplicitUndef();
      expect(r.hasProp).assertEqual(true);
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest048
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0048
     * @tc.desc   Verify not setting value defaults to undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropNoValueDefault();
      expect(r.value).assertEqual(undefined);
      expect(r.hasValueKey).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest049
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0049
     * @tc.desc   Verify writable true allows reassignment
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableTrue()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest050
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0050
     * @tc.desc   Verify writable false prevents reassignment
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableFalse()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest051
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0051
     * @tc.desc   Verify writable false throws in strict mode
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableFalseStrict()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest052
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0052
     * @tc.desc   Verify default writable is false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDefaultWritable()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest053
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0053
     * @tc.desc   Verify non-writable object inner properties can be modified
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropObjImmutable();
      expect(r.innerModified).assertEqual(2);
      expect(r.stillSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest054
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0054
     * @tc.desc   Verify non-writable array inner elements can be modified
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropArrImmutable();
      expect(r.length).assertEqual(4);
      expect(r.unchanged).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest055
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0055
     * @tc.desc   Verify modify via defineProperty on readonly configurable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyViaDefineProp()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest056
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0056
     * @tc.desc   Verify writable changed from true to false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableToFalse()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest057
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0057
     * @tc.desc   Verify readonly property modified via defineProperty
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropReadonlyViaDefineProp()).assertEqual(2);
    });



    /**
     * @tc.name   ObjectDefinePropertyTest058
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0058
     * @tc.desc   Verify both value and writable set
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropValueAndWritable()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest059
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0059
     * @tc.desc   Verify only value set, writable defaults to false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnlyValue()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest060
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0060
     * @tc.desc   Verify only writable set, value defaults to undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOnlyWritable();
      expect(r.value).assertEqual(undefined);
      expect(r.writable).assertEqual(true);
      expect(r.newVal).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest061
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0061
     * @tc.desc   Verify multiple properties with different combos
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropMultiCombo();
      expect(r.readonly).assertEqual(1);
      expect(r.writable).assertEqual(20);
      expect(r.defaultVal).assertEqual(3);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest062
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0062
     * @tc.desc   Verify basic getter definition
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropBasicGetter()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest063
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0063
     * @tc.desc   Verify getter returns fixed value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropFixedGetter()).assertEqual('fixed value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest064
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0064
     * @tc.desc   Verify getter returns computed value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropComputedGetter();
      expect(r.v1).assertEqual(1);
      expect(r.v2).assertEqual(2);
      expect(r.v3).assertEqual(3);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest065
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0065
     * @tc.desc   Verify getter uses this to access other properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropThisGetter()).assertEqual(20);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest066
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0066
     * @tc.desc   Verify getter closure references external variable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropClosureGetter();
      expect(r.v1).assertEqual('hidden');
      expect(r.v2).assertEqual('changed');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest067
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0067
     * @tc.desc   Verify getter returns undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropUndefGetter();
      expect(r.value).assertEqual(undefined);
      expect(r.hasProp).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest068
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0068
     * @tc.desc   Verify getter returns null
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropNullGetter()).assertEqual(null);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest069
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0069
     * @tc.desc   Verify getter throws error
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropErrorGetter()).assertEqual('Getter error');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest070
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0070
     * @tc.desc   Verify getter returns function
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropFuncGetter()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest071
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0071
     * @tc.desc   Verify getter returns Symbol
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropSymbolGetter()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest072
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0072
     * @tc.desc   Verify getter returns BigInt
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropBigIntGetter()).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest073
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0073
     * @tc.desc   Verify getter returns array
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropArrayGetter();
      expect(r.first).assertEqual(1);
      expect(r.len).assertEqual(3);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest074
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0074
     * @tc.desc   Verify getter set to non-function throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropNonFuncGetter()).assertEqual("TypeError");
    });


    /**
     * @tc.name   ObjectDefinePropertyTest075
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0075
     * @tc.desc   Verify basic setter definition
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropBasicSetter()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest076
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0076
     * @tc.desc   Verify setter closure stores value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropClosureSetter()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest077
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0077
     * @tc.desc   Verify setter stores to this
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropThisSetter();
      expect(r.value).assertEqual(42);
      expect(r.internal).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest078
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0078
     * @tc.desc   Verify setter performs type conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTypeConvertSetter()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest079
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0079
     * @tc.desc   Verify setter validates value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropValidateSetter();
      expect(r.value).assertEqual(25);
      expect(r.errorMsg).assertEqual('Age cannot be negative');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest080
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0080
     * @tc.desc   Verify setter throws error
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropThrowSetter()).assertEqual('This property is read-only');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest081
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0081
     * @tc.desc   Verify setter ignores certain values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropIgnoreSetter()).assertEqual(5);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest082
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0082
     * @tc.desc   Verify write-only property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWriteOnly();
      expect(r.getResult).assertEqual(undefined);
      expect(r.stored).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest083
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0083
     * @tc.desc   Verify setter set to non-function throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropNonFuncSetter()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest084
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0084
     * @tc.desc   Verify full accessor property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropFullAccessor()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest085
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0085
     * @tc.desc   Verify getter and setter use this correctly
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropThisAccessor();
      expect(r.name).assertEqual('HELLO');
      expect(r.internal).assertEqual('hello');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest086
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0086
     * @tc.desc   Verify readonly accessor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropReadonlyAccessor()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest087
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0087
     * @tc.desc   Verify write-only accessor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWriteOnlyAccessor();
      expect(r.getResult).assertEqual(undefined);
      expect(r.stored).assertEqual('secret123');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest088
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0088
     * @tc.desc   Verify data and accessor cannot be mixed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropMixedDescError()).assertEqual("TypeError");
    });



    /**
     * @tc.name   ObjectDefinePropertyTest089
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0089
     * @tc.desc   Verify configurable true allows reconfiguration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropConfigurableTrue()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest090
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0090
     * @tc.desc   Verify configurable false prevents reconfiguration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropConfigurableFalse()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest091
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0091
     * @tc.desc   Verify default configurable is false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDefaultConfigurable()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest092
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0092
     * @tc.desc   Verify configurable property can be deleted
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDeleteConfigurable()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest093
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0093
     * @tc.desc   Verify non-configurable property cannot be deleted
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDeleteNonConfigurable()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest094
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0094
     * @tc.desc   Verify writable true non-configurable can reassign
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableTrueNonConfig()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest095
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0095
     * @tc.desc   Verify writable can change to false on non-configurable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropWritableToFalseNonConfig();
      expect(r.writable).assertEqual(false);
      expect(r.configurable).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest096
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0096
     * @tc.desc   Verify fully locked property cannot be modified
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropFullyLocked()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest097
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0097
     * @tc.desc   Verify same value modification on non-configurable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropSameValueNonConfig()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest098
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0098
     * @tc.desc   Verify type switch between data and accessor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTypeSwitch()).assertEqual(3);
    });



    /**
     * @tc.name   ObjectDefinePropertyTest099
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0099
     * @tc.desc   Verify enumerable true appears in Object.keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropEnumerableTrue()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest100
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0100
     * @tc.desc   Verify enumerable false hidden from Object.keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropEnumerableFalse();
      expect(r.inKeys).assertEqual(false);
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest101
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0101
     * @tc.desc   Verify default enumerable is false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDefaultEnumerable()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest102
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0102
     * @tc.desc   Verify Object.keys only returns enumerable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropMixedEnumerable();
      expect(r.hasA).assertEqual(true);
      expect(r.hasB).assertEqual(false);
      expect(r.hasC).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest103
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0103
     * @tc.desc   Verify non-enumerable property still accessible
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropHiddenAccessible();
      expect(r.value).assertEqual('secret');
      expect(r.inObj).assertEqual(true);
      expect(r.hasOwn).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest104
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0104
     * @tc.desc   Verify getOwnPropertyNames includes non-enumerable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropOwnNamesIncludes();
      expect(r.hasA).assertEqual(true);
      expect(r.hasB).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest105
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0105
     * @tc.desc   Verify modify enumerable on configurable property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyEnumerable()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest106
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0106
     * @tc.desc   Verify enumerable for accessor properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropEnumerableAccessor();
      expect(r.hasGetter).assertEqual(true);
      expect(r.hasHidden).assertEqual(false);
    });



    /**
     * @tc.name   ObjectDefinePropertyTest107
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0107
     * @tc.desc   Verify default all attributes are false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropDefaultAll();
      expect(r.writable).assertEqual(false);
      expect(r.enumerable).assertEqual(false);
      expect(r.configurable).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest108
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0108
     * @tc.desc   Verify modify existing data property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyExisting()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest109
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0109
     * @tc.desc   Verify modify writable characteristic
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyWritable()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest110
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0110
     * @tc.desc   Verify modify configurable from true to false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyConfigFromTrue()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest111
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0111
     * @tc.desc   Verify partial modification preserves others
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropPartialModify();
      expect(r.value).assertEqual(2);
      expect(r.writable).assertEqual(true);
      expect(r.enumerable).assertEqual(true);
      expect(r.configurable).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest112
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0112
     * @tc.desc   Verify assign-created property can be modified
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyAssignCreated()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest113
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0113
     * @tc.desc   Verify switch data to accessor property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDataToAccessor()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest114
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0114
     * @tc.desc   Verify switch accessor to data property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropAccessorToData();
      expect(r.value).assertEqual(2);
      expect(r.get).assertEqual(undefined);
      expect(r.set).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest115
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0115
     * @tc.desc   Verify cannot switch type on non-configurable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropSwitchTypeNonConfig()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest116
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0116
     * @tc.desc   Verify prototype accessor inherited
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropProtoAccessor()).assertEqual('inherited');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest117
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0117
     * @tc.desc   Verify prototype getter shared variable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropProtoSharedAccessor()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest118
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0118
     * @tc.desc   Verify this accessor on prototype
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropProtoThisAccessor();
      expect(r.aVal).assertEqual(1);
      expect(r.bVal).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest119
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0119
     * @tc.desc   Verify prototype data property inherited
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropProtoData()).assertEqual(10);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest120
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0120
     * @tc.desc   Verify writable prototype allows instance property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropProtoDataWritable();
      expect(r.val).assertEqual(20);
      expect(r.hasOwn).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest121
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0121
     * @tc.desc   Verify non-writable prototype blocks instance
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropProtoReadonly();
      expect(r.val).assertEqual(1);
      expect(r.hasOwn).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest122
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0122
     * @tc.desc   Verify prototype configurable override
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropProtoConfigOverride();
      expect(r.val).assertEqual(2);
      expect(r.hasOwn).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest123
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0123
     * @tc.desc   Verify for-in enumerates inherited enumerable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropProtoChainForIn();
      expect(r.hasY).assertEqual(true);
      expect(r.hasX).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest124
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0124
     * @tc.desc   Verify Object.create(null) with defineProperty
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropObjCreateNull();
      expect(r.val).assertEqual(1);
      expect(r.proto).assertEqual(null);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest125
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0125
     * @tc.desc   Verify Object.create second arg defines properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropObjCreateSecondArg()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest126
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0126
     * @tc.desc   Verify value and get mixed throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropValueGetMixed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest127
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0127
     * @tc.desc   Verify value and set mixed throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropValueSetMixed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest128
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0128
     * @tc.desc   Verify writable and get mixed throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableGetMixed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest129
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0129
     * @tc.desc   Verify writable and set mixed throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWritableSetMixed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest130
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0130
     * @tc.desc   Verify target null throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetNull()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest131
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0131
     * @tc.desc   Verify target undefined throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetUndefined()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest132
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0132
     * @tc.desc   Verify target number throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetNumber()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest133
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0133
     * @tc.desc   Verify target string throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetString()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest134
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0134
     * @tc.desc   Verify target boolean throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetBoolean()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest135
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0135
     * @tc.desc   Verify target Symbol throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetSymbol()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest136
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0136
     * @tc.desc   Verify target BigInt throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropTargetBigInt()).assertEqual("TypeError");
    });



    /**
     * @tc.name   ObjectDefinePropertyTest137
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0137
     * @tc.desc   Verify modify non-configurable non-writable value throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyNonConfigValue()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest138
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0138
     * @tc.desc   Verify modify non-configurable enumerable throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyNonConfigEnum()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest139
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0139
     * @tc.desc   Verify modify non-configurable configurable throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyNonConfigConfig()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest140
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0140
     * @tc.desc   Verify modify non-configurable getter throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyNonConfigGetter()).assertEqual("TypeError");
    });



    /**
     * @tc.name   ObjectDefinePropertyTest141
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0141
     * @tc.desc   Verify add property on preventedExtensions throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropAddOnPrevented()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest142
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0142
     * @tc.desc   Verify add property on sealed object throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropAddOnSealed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest143
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0143
     * @tc.desc   Verify add property on frozen object throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropAddOnFrozen()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest144
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0144
     * @tc.desc   Verify modify property on frozen object throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyOnFrozen()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest145
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0145
     * @tc.desc   Verify modify characteristics on sealed throws
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyCharOnSealed()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest146
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0146
     * @tc.desc   Verify freeze sets configurable and writable to false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropFreezeEffect();
      expect(r.writable).assertEqual(false);
      expect(r.configurable).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest147
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0147
     * @tc.desc   Verify freeze accessor getter works setter fails
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropFreezeAccessor();
      expect(r.getVal).assertEqual(1);
      expect(r.threwTypeError).assertEqual(false);

    });

    /**
     * @tc.name   ObjectDefinePropertyTest148
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0148
     * @tc.desc   Verify seal sets configurable to false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropSealEffect()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest149
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0149
     * @tc.desc   Verify preventExtensions allows modify existing
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropPreventModify()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest150
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0150
     * @tc.desc   Verify Object.defineProperties batch definition
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropDefineProperties();
      expect(r.prop1).assertEqual(1);
      expect(r.prop2).assertEqual(2);
      expect(r.accessor).assertEqual(3);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest151
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0151
     * @tc.desc   Verify getOwnPropertyDescriptor returns correct desc
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropGetOwnPropDesc();
      expect(r.value).assertEqual(1);
      expect(r.writable).assertEqual(true);
      expect(r.enumerable).assertEqual(true);
      expect(r.configurable).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest152
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0152
     * @tc.desc   Verify defineProperty on nested object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropNestedObj()).assertEqual('nested value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest153
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0153
     * @tc.desc   Verify defineProperty on object with Symbol keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropObjWithSymbol();
      expect(r.newProp).assertEqual('new value');
      expect(r.symVal).assertEqual('symbol value');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest154
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0154
     * @tc.desc   Verify defineProperty on object with function properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropObjWithFunc();
      expect(r.methodResult).assertEqual(1);
      expect(r.propVal).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest155
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0155
     * @tc.desc   Verify defineProperty on object with many properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropLargeObj();
      expect(r.newProp).assertEqual('new');
      expect(r.prop25).assertEqual(25);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest156
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0156
     * @tc.desc   Verify undefined/null/NaN/Infinity properties
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropUndefNullNaNInf();
      expect(r.undef).assertEqual(undefined);
      expect(r.undefIn).assertEqual(true);
      expect(r.nullVal).assertEqual(null);
      expect(r.nanVal).assertEqual(true);
      expect(r.infVal).assertEqual(Infinity);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest157
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0157
     * @tc.desc   Verify long string as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropLongStringValue()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest158
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0158
     * @tc.desc   Verify deeply nested object as value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDeepNested()).assertEqual('deep');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest159
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0159
     * @tc.desc   Verify override toString via defineProperty
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOverrideToString()).assertEqual('custom toString');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest160
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0160
     * @tc.desc   Verify delete and redefine property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropDeleteRedefine()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest161
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0161
     * @tc.desc   Verify sealed writable properties can be modified
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropSealedWritable();
      expect(r.writable).assertEqual(10);
      expect(r.readonly).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest162
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0162
     * @tc.desc   Verify propertyIsEnumerable reflects status
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropPropertyIsEnumerable();
      expect(r.aEnum).assertEqual(true);
      expect(r.bEnum).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest163
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0163
     * @tc.desc   Verify Symbol properties not in Object.keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropSymbolKeysNotInKeys();
      expect(r.aInKeys).assertEqual(true);
      expect(r.symInSyms).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest164
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0164
     * @tc.desc   Verify enumerable false not in JSON.stringify
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropJSONStringifyEnum()).assertEqual('{"a":1}');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest165
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0165
     * @tc.desc   Verify enumerable false not copied by Object.assign
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropObjectAssignEnum();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest166
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0166
     * @tc.desc   Verify circular reference value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropCircularRef();
      expect(r.equals).assertEqual(true);
      expect(r.nestedName).assertEqual('circular');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest167
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0167
     * @tc.desc   Verify TypedArray special value storage
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropTypedArraySpecial();
      expect(r.float32).assertEqual(Infinity);
      expect(r.int8).assertEqual(0);
      expect(r.uint8c).assertEqual(255);
    });



    /**
     * @tc.name   ObjectDefinePropertyTest168
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0168
     * @tc.desc   Verify defineProperty on Proxy object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropOnProxy()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest169
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0169
     * @tc.desc   Verify defineProperty with unicode escape sequence key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithUnicodeKey()).assertEqual('unicode');
    });

    /**
     * @tc.name   ObjectDefinePropertyTest170
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0170
     * @tc.desc   Verify function as descriptor uses its value property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithFuncDesc()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest171
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0171
     * @tc.desc   Verify descriptor with inherited properties via prototype chain
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithInheritedDesc()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest172
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0172
     * @tc.desc   Verify frozen descriptor object used as descriptor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropWithFrozenDesc()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest173
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0173
     * @tc.desc   Verify modify non-configurable accessor setter throws TypeError
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropModifyNonConfigSetter()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest174
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0174
     * @tc.desc   Verify cannot switch accessor to data on non-configurable property
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropSwitchAccessorToDataNonConfig()).assertEqual("TypeError");
    });

    /**
     * @tc.name   ObjectDefinePropertyTest175
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0175
     * @tc.desc   Verify Reflect.defineProperty returns true on success
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropReflectBasic()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest176
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0176
     * @tc.desc   Verify Reflect.defineProperty returns false on failure
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropReflectFail()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest177
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0177
     * @tc.desc   Verify Reflect.defineProperty on frozen object returns false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(defPropReflectFreeze()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefinePropertyTest178
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTDEFINEPROPERTY_TEST_0178
     * @tc.desc   Verify Proxy intercepts defineProperty operation
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectDefinePropertyTest178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = defPropProxyIntercept();
      expect(r.prop).assertEqual(1);
      expect(r.intercepted).assertEqual('prop');
    });

  })
}
