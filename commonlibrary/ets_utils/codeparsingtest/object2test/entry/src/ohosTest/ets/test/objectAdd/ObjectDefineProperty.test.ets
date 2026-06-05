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
