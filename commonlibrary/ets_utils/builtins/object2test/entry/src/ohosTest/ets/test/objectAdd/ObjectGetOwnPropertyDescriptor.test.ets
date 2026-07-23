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
  getDescPlainDataProp,
  getDescWithVarPropName,
  getDescNumberVal,
  getDescBooleanVal,
  getDescNullVal,
  getDescUndefinedVal,
  getDescArrayVal,
  getDescFunctionVal,
  getDescRegexVal,
  getDescMapVal,
  getDescSetVal,
  getDescErrorVal,
  getDescDateVal,
  getDescSymbolVal,
  getDescArrayLength,
  getDescArrayIndexZero,
  getDescFunctionPrototype,
  getDescFunctionLength,
  getDescStringIndex,
  getDescTypedArrayIndex,
  getDescTypedArrayLength,
  getDescObjTypePlainObj,
  getDescObjTypeArray,
  getDescObjTypeFunction,
  getDescObjTypeDate,
  getDescObjTypeRegex,
  getDescObjTypeMap,
  getDescObjTypeSet,
  getDescObjTypeArrayBuffer,
  getDescObjTypeTypedArray,
  getDescObjTypeDataView,
  getDescObjTypeWeakMap,
  getDescObjTypeWeakSet,
  getDescObjTypeProxy,
  getDescObjTypePromise,
  getDescPropTypeString,
  getDescPropTypeNumber,
  getDescEmptyStrName,
  getDescNumStrName,
  getDescSpecialCharName,
  getDescChineseName,
  getDescEmojiName,
  getDescUnicodeName,
  getDescLongName,
  getDescKeywordName,
  getDescProtoName,
  getDescValueString,
  getDescValueNumber,
  getDescValueBoolean,
  getDescValueNull,
  getDescValueUndefined,
  getDescValueObject,
  getDescValueArray,
  getDescValueFunction,
  getDescValueRegex,
  getDescValueMap,
  getDescValueSet,
  getDescValueError,
  getDescValueDate,
  getDescValueSymbol,
  getDescWritableTrue,
  getDescWritableFalse,
  getDescWritableAfterFreeze,
  getDescTypedArrayIndexWritable,
  getDescTypedArrayLengthWritable,
  getDescArrayLengthWritable,
  getDescStringIndexWritable,
  getDescEnumerableTrue,
  getDescEnumerableFalse,
  getDescArrayLengthEnumerable,
  getDescTypedArrayIndexEnumerable,
  getDescStringIndexEnumerable,
  getDescErrorMessageEnumerable,
  getDescFunctionNameLengthEnumerable,
  getDescSymbolPropEnumerable,
  getDescConfigurableTrue,
  getDescConfigurableFalse,
  getDescConfigurableAfterSeal,
  getDescConfigurableAfterFreeze,
  getDescTypedArrayIndexConfigurable,
  getDescTypedArrayLengthConfigurable,
  getDescArrayLengthConfigurable,
  getDescStringIndexConfigurable,
  getDescFuncPrototypeConfigurable,
  getDescLiteralGetter,
  getDescDefinePropGetter,
  getDescPrivateGetter,
  getDescComputedGetter,
  getDescArrowGetter,
  getDescNestedGetter,
  getDescFuncGetter,
  getDescErrorGetter,
  getDescLazyGetter,
  getDescLiteralSetter,
  getDescDefinePropSetter,
  getDescValidatingSetter,
  getDescSideEffectSetter,
  getDescTransformSetter,
  getDescErrorSetter,
  getDescBothGetterSetter,
  getDescBothDefProp,
  getDescBindBoth,
  getDescPrivateViaGetterSetter,
  getDescClassGetterSetter,
  getDescNonEnumGetter,
  getDescNonConfGetter,
  getDescNonDelGetter,
  getDescFrozenGetter,
  getDescSealedGetterSetter,
  getDescConvertToData,
  getDescCannotConvertNonConf,
  getDescAllFalse,
  getDescReadOnlyEnum,
  getDescWritableNonEnum,
  getDescNonDelButWritable,
  getDescDelButReadOnly,
  getDescConvertAccToData,
  getDescModifyWritableToFalse,
  getDescModifyEnumerable,
  getDescFreezePlainObj,
  getDescFreezeNested,
  getDescFreezeWithGetter,
  getDescFreezeArray,
  getDescFreezeFunction,
  getDescDetectFrozen,
  getDescSealPlainObj,
  getDescSealReadOnly,
  getDescSealNested,
  getDescSealArray,
  getDescDetectSealed,
  getDescPreventExtPlainObj,
  getDescPreventExtDefineProp,
  getDescPreventExtModifyDesc,
  getDescPreventExtArray,
  getDescDetectExtensible,
  getDescProtoNotOwn,
  getDescProtoExplicit,
  getDescConstructorNotOwn,
  getDescClassConstructor,
  getDescArrayPrototypePush,
  getDescFuncPrototypeApply,
  getDescStrPrototypeSplit,
  getDescNumPrototypeToFixed,
  getDescMathPI,
  getDescJSONParse,
  getDescReflectGet,
  getDescAtomicsAdd,
  getDescSymbolProp,
  getDescAnonSymbolProp,
  getDescGlobalSymbolProp,
  getDescSymbolKeyFor,
  getDescMultiSymbolProp,
  getDescMixedSymStr,
  getDescNonEnumSymbol,
  getDescNonConfSymbol,
  getDescSymbolAccessor,
  getDescSymbolIterator,
  getDescSymbolToStringTag,
  getDescSymbolHasInstance,
  getDescSymbolToPrimitive,
  getDescSymbolSpecies,
  getDescSymbolMatch,
  getDescSymbolReplace,
  getDescSymbolSearch,
  getDescSymbolSplit,
  getDescSymbolConcatSpreadable,
  getDescSymbolUnscopables,
  getDescSymbolAsyncIterator,
  getDescSymbolDispose,
  getDescSymbolMetadata,
  getDescObjKeysNoSymbol,
  getDescObjGetNamesNoSymbol,
  getDescObjGetSymbols,
  getDescReflectOwnKeys,
  getDescForInNoSymbol,
  getDescDeleteSymbol,
  getDescDeleteNonConfSymbol,
  getDescFreezeSymbolCannotDelete,
  getDescNonexistReturnUndef,
  getDescProtoPropReturnUndef,
  getDescEmptyObjAnyProp,
  getDescNullObjThrows,
  getDescDataDescStructure,
  getDescDataDescTypes,
  getDescDataDescImmutable,
  getDescDataDescReusable,
  getDescAccessorDescStructure,
  getDescAccessorGetSetTypes,
  getDescCallGetterFromDesc,
  getDescCallSetterFromDesc,
  getDescObjIsPlainObj,
  getDescObjProtoChain,
  getDescObjCanFreeze,
  getDescObjCanSeal,
  getDescObjCanAddProps,
  getDescObjJSONSerialize,
  getDescNullArg,
  getDescUndefArg,
  getDescES5Primitive,
  getDescMissingSecondArg,
  getDescExtraArgs,
  getDescProxyProperty,
  getDescProxyIntercept,
  getDescProxyVirtualProp,
  getDescProxyInconsistent,
  getDescCopyProp,
  getDescCopyAccessor,
  getDescCopyNonConfigurable,
  getDescCopyModifyDesc,
  getDescBatchCopy,
  getDescBatchCopyAccessor,
  getDescCreateWithDesc,
  getDescAssignEnumOnly,
  getDescAssignSymbol,
  getDescAssignNoGetter,
  getDescAllDescsMatch,
  getDescAllDescsNonEnum,
  getDescFreezeCompare,
  getDescSealCompare,
  getDescPreventExtCompare,
  getDescKeysEnumRel,
  getDescValuesEnumRel,
  getDescEntriesEnumRel,
  getDescGetNamesNonEnum,
  getDescGetNamesNoSymbol,
  getDescGetSymbolsAll,
  getDescGetSymbolsNonEnum,
  getDescReflectSame,
  getDescReflectPrimitive,
  getDescReflectNull,
  getDescHasOwnProp,
  getDescHasOwnNonEnum,
  getDescForInEnumOnly,
  getDescHasOwnPropCheck,
  getDescHasOwnPropNonEnum,
  getDescPropIsEnumerable,
  getDescPropIsEnumOwnOnly,
  getDescDeleteConfigurableProp,
  getDescDeleteNonConfProp,
  getDescDeleteNonexist,
  getDescDeleteProtoProp
} from './ObjectGetOwnPropertyDescriptor';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ObjectGetOwnPropertyDescriptorTest() {
  describe('ObjectGetOwnPropertyDescriptorTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })/**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest001
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0001
     * @tc.desc   Verify getting data property descriptor from plain object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPlainDataProp();
      expect(result.value).assertEqual('test');
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(true);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest002
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0002
     * @tc.desc   Verify getting non-existent property returns undefined
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescWithVarPropName();
      expect(result.value).assertEqual('value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest003
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0003
     * @tc.desc   Verify only own properties are returned, not prototype chain properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNumberVal();
      expect(result.value).assertEqual(42);
      expect(result.type).assertEqual('number');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest004
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0004
     * @tc.desc   Verify returned descriptor object is mutable, modifications do not affect original property
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescBooleanVal();
      expect(result.trueValue).assertEqual(true);
      expect(result.falseValue).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest005
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0005
     * @tc.desc   Verify returned descriptor object contains correct properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNullVal();
      expect(result.value).assertEqual(null);
      expect(result.isNull).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest006
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0006
     * @tc.desc   Verify plain Object as first argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescUndefinedVal();
      expect(result.value).assertEqual(undefined);
      expect(result.isUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest007
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0007
     * @tc.desc   Verify array object as first argument, getting array index properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayVal();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(3);
      expect(result.firstVal).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest008
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0008
     * @tc.desc   Verify function object as first argument, getting function properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFunctionVal();
      expect(result.isFunction).assertEqual(true);
      expect(result.result).assertEqual(5);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest009
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0009
     * @tc.desc   Verify Date object as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescRegexVal();
      console.log("1111",result.isRegex)
      expect(result.isRegex).assertEqual(true);
      expect(result.source).assertEqual('hello');
      expect(result.flags).assertEqual('gi');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest010
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0010
     * @tc.desc   Verify RegExp object as first argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescMapVal();
      expect(result.isMap).assertEqual(true);
      expect(result.size).assertEqual(2);
      expect(result.valA).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest011
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0011
     * @tc.desc   Verify string as first argument is coerced to String object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSetVal();
      expect(result.isSet).assertEqual(true);
      expect(result.size).assertEqual(3);
      expect(result.hasOne).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest012
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0012
     * @tc.desc   Verify number as first argument is coerced to Number object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescErrorVal();
      expect(result.isError).assertEqual(true);
      expect(result.message).assertEqual('test error');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest013
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0013
     * @tc.desc   Verify boolean as first argument is coerced to Boolean object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDateVal();
      expect(result.isDate).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest014
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0014
     * @tc.desc   Verify BigInt as first argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolVal();
      expect(result.valueIsSym).assertEqual(true);
      expect(result.type).assertEqual('symbol');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest015
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0015
     * @tc.desc   Verify Symbol as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayLength();
      expect(result.value).assertEqual(3);
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest016
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0016
     * @tc.desc   Verify Map object as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayIndexZero();
      expect(result.value).assertEqual(10);
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(true);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest017
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0017
     * @tc.desc   Verify Set object as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFunctionPrototype();
      expect(result.isObject).assertEqual(true);
      expect(result.writable).assertEqual(true);
      expect(result.configurable).assertEqual(false);
    });



     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest018
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0018
     * @tc.desc   Verify WeakSet object as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFunctionLength();
      expect(result.value).assertEqual(3);
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest019
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0019
     * @tc.desc   Verify ArrayBuffer object as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescStringIndex();
      expect(result.value).assertEqual('h');
      expect(result.writable).assertEqual(false);
      expect(result.enumerable).assertEqual(true);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest020
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0020
     * @tc.desc   Verify various TypedArray objects as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayIndex();
      expect(result.value).assertEqual(1);
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(true);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest021
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0021
     * @tc.desc   Verify DataView object as first argument
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayLength();
      expect(result.value).assertEqual(3);
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest022
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0022
     * @tc.desc   Verify Promise object as first argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypePlainObj();
      expect(result.value).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest023
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0023
     * @tc.desc   Verify Error object as first argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeArray();
      expect(result.value).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest024
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0024
     * @tc.desc   Verify getting property descriptor from frozen object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeFunction();
      expect(typeof result.value).assertEqual('string');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest025
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0025
     * @tc.desc   Verify getting property descriptor from sealed object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeDate();
      expect(result.isFunction).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest026
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0026
     * @tc.desc   Verify getting property descriptor from non-extensible object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeRegex();
      expect(result.value).assertEqual('test');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest027
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0027
     * @tc.desc   Verify null as first argument throws TypeError
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeMap();
      expect(result.hasDesc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest028
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0028
     * @tc.desc   Verify undefined as first argument throws TypeError
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeSet();
      expect(result.hasDesc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest029
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0029
     * @tc.desc   Verify empty object as first argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeArrayBuffer();
      expect(result.value).assertEqual(8);
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest030
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0030
     * @tc.desc   Verify object with many properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeTypedArray();
      expect(result.value).assertEqual(4);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest031
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0031
     * @tc.desc   Verify deeply nested object structure
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeDataView();
      expect(result.value).assertEqual(8);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest032
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0032
     * @tc.desc   Verify using plain string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeWeakMap();
      expect(result.hasDesc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest033
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0033
     * @tc.desc   Verify using empty string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeWeakSet();
      expect(result.hasDesc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest034
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0034
     * @tc.desc   Verify using special characters as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypeProxy();
      expect(result.value).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest035
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0035
     * @tc.desc   Verify using full ASCII character set as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjTypePromise();
      expect(result.hasDesc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest036
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0036
     * @tc.desc   Verify using Unicode emoji as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPropTypeString();
      expect(result.value).assertEqual('value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest037
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0037
     * @tc.desc   Verify using Unicode escape sequences as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPropTypeNumber();
      expect(result.value).assertEqual('zero');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest038
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0038
     * @tc.desc   Verify using numeric string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescEmptyStrName();
      expect(result.value).assertEqual('emptyKey');
      expect(result.writable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest039
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0039
     * @tc.desc   Verify using very long string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNumStrName();
      expect(result.value).assertEqual('numeric');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest040
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0040
     * @tc.desc   Verify using JavaScript keywords as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSpecialCharName();
      expect(result.value).assertEqual('special');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest041
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0041
     * @tc.desc   Verify using reserved words as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescChineseName();
      expect(result.value).assertEqual('chinese');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest042
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0042
     * @tc.desc   Verify using Symbol as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescEmojiName();
      expect(result.value).assertEqual('emoji');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest043
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0043
     * @tc.desc   Verify using global Symbol from Symbol.for() as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescUnicodeName();
      expect(result.value).assertEqual('hello');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest044
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0044
     * @tc.desc   Verify using Symbol without description as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescLongName();
      expect(result.value).assertEqual('long');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest045
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0045
     * @tc.desc   Verify object with multiple Symbol properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescKeywordName();
      expect(result.value).assertEqual('classVal');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest046
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0046
     * @tc.desc   Verify object with both Symbol and string property names
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProtoName();
      expect(result.hasDesc).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest047
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0047
     * @tc.desc   Verify using built-in Symbol as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueString();
      expect(result.value).assertEqual('stringValue');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest048
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0048
     * @tc.desc   Verify using positive integer as index property name
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueNumber();
      expect(result.value).assertEqual(123);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest049
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0049
     * @tc.desc   Verify using negative number as property name (converted to string)
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueBoolean();
      expect(result.falseValue).assertEqual(false);
      expect(result.trueValue).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest050
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0050
     * @tc.desc   Verify using float as property name (converted to string)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueNull();
      expect(result.value).assertEqual(null);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest051
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0051
     * @tc.desc   Verify using 0 as index property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueUndefined();
      expect(result.value).assertEqual(undefined);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest052
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0052
     * @tc.desc   Verify using large integer as index property name
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueObject();
      expect(result.isObject).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest053
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0053
     * @tc.desc   Verify boolean converted to string property name
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueArray();
      expect(result.isArray).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest054
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0054
     * @tc.desc   Verify object converted to string as property name
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueFunction();
      expect(result.isFunction).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest055
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0055
     * @tc.desc   Verify array converted to string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueRegex();
      expect(result.isRegex).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest056
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0056
     * @tc.desc   Verify function converted to string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueMap();
      expect(result.isMap).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest057
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0057
     * @tc.desc   Verify BigInt converted to string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueSet();
      expect(result.isSet).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest058
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0058
     * @tc.desc   Verify null converted to string "null" as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueError();
      expect(result.isError).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest059
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0059
     * @tc.desc   Verify undefined converted to string "undefined" as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueDate();
      expect(result.isDate).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest060
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0060
     * @tc.desc   Verify NaN converted to string "NaN" as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValueSymbol();
      expect(result.isSym).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest061
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0061
     * @tc.desc   Verify Infinity converted to string as property name
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescWritableTrue();
      expect(result.writable).assertEqual(true);
      expect(result.newValue).assertEqual(200);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest062
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0062
     * @tc.desc   Verify property values of primitive types (string, number, boolean, etc.)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescWritableFalse();
      expect(result.writable).assertEqual(false);
      expect(result.value).assertEqual(100);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest063
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0063
     * @tc.desc   Verify property values of special numeric values (NaN, Infinity, -0, etc.)
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescWritableAfterFreeze();
      expect(result.writableBefore).assertEqual(true);
      expect(result.writableAfter).assertEqual(false);
      expect(result.frozen).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest064
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0064
     * @tc.desc   Verify property values of Number boundary values
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayIndexWritable();
      expect(result.writable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest065
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0065
     * @tc.desc   Verify property value of BigInt type
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayLengthWritable();
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest066
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0066
     * @tc.desc   Verify property values of complex types (object, array, function, etc.)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayLengthWritable();
      expect(result.writable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest067
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0067
     * @tc.desc   Verify property value of TypedArray type
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescStringIndexWritable();
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest068
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0068
     * @tc.desc   Verify property values of Map, Set, WeakMap collection types
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescEnumerableTrue();
      expect(result.enumerable).assertEqual(true);
      expect(result.appearsInKeys).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest069
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0069
     * @tc.desc   Verify property value of Promise object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescEnumerableFalse();
      expect(result.enumerable).assertEqual(false);
      expect(result.notInKeys).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest070
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0070
     * @tc.desc   Verify property value of RegExp object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayLengthEnumerable();
      expect(result.enumerable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest071
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0071
     * @tc.desc   Verify property value of ArrayBuffer object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayIndexEnumerable();
      expect(result.enumerable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest072
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0072
     * @tc.desc   Verify property value of DataView object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescStringIndexEnumerable();
      expect(result.enumerable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest073
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0073
     * @tc.desc   Verify property value of various Error types
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescErrorMessageEnumerable();
      expect(result.enumerable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest074
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0074
     * @tc.desc   Verify property value of Date object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFunctionNameLengthEnumerable();
      expect(result.nameEnum).assertEqual(false);
      expect(result.lengthEnum).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest075
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0075
     * @tc.desc   Verify property value of Symbol type
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolPropEnumerable();
      expect(result.enumerable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest076
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0076
     * @tc.desc   Verify writable property descriptor has writable=true
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConfigurableTrue();
      expect(result.configurable).assertEqual(true);
      expect(result.deleteSuccess).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest077
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0077
     * @tc.desc   Verify non-writable property descriptor has writable=false
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConfigurableFalse();
      expect(result.configurable).assertEqual(false);
      expect(result.deleteFailed).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest078
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0078
     * @tc.desc   Verify writable becomes false after Object.freeze()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConfigurableAfterSeal();
      expect(result.beforeSeal).assertEqual(true);
      expect(result.afterSeal).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest079
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0079
     * @tc.desc   Verify TypedArray index property writable is true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConfigurableAfterFreeze();
      expect(result.beforeFreeze).assertEqual(true);
      expect(result.afterFreeze).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest080
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0080
     * @tc.desc   Verify TypedArray length property writable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayIndexConfigurable();
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest081
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0081
     * @tc.desc   Verify array length property writable is true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTypedArrayLengthConfigurable();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest082
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0082
     * @tc.desc   Verify String object index property writable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayLengthConfigurable();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest083
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0083
     * @tc.desc   Verify enumerable property appears in for-in loop
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescStringIndexConfigurable();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest084
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0084
     * @tc.desc   Verify non-enumerable property does not appear in for-in loop
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFuncPrototypeConfigurable();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest085
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0085
     * @tc.desc   Verify array length property enumerable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescLiteralGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.setIsUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest086
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0086
     * @tc.desc   Verify TypedArray index property enumerable is true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDefinePropGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.getReturns).assertEqual(42);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest087
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0087
     * @tc.desc   Verify String object index property enumerable is true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPrivateGetter();
      expect(result.getIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest088
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0088
     * @tc.desc   Verify Error object message property enumerable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescComputedGetter();
      expect(result.sumGetIsFunc).assertEqual(true);
      expect(result.sumResult).assertEqual(30);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest089
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0089
     * @tc.desc   Verify function name and length properties enumerable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrowGetter();
      expect(result.getIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest090
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0090
     * @tc.desc   Verify Symbol property enumerable defaults to true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNestedGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.innerVal).assertEqual('deep');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest091
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0091
     * @tc.desc   Verify configurable property can be deleted and descriptor modified
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFuncGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.result).assertEqual('returned function');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest092
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0092
     * @tc.desc   Verify non-configurable property cannot be deleted or type modified
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescErrorGetter();
      expect(result.getIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest093
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0093
     * @tc.desc   Verify configurable becomes false after Object.seal()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescLazyGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.result).assertEqual('initialized');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest094
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0094
     * @tc.desc   Verify configurable becomes false after Object.freeze()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescLiteralSetter();
      expect(result.setIsFunc).assertEqual(true);
      expect(result.internalVal).assertEqual(100);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest095
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0095
     * @tc.desc   Verify TypedArray index property configurable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDefinePropSetter();
      expect(result.setIsFunc).assertEqual(true);
      expect(result.storedVal).assertEqual('test');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest096
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0096
     * @tc.desc   Verify TypedArray length property configurable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValidatingSetter();
      expect(result.setIsFunc).assertEqual(true);
      expect(result.internalVal).assertEqual(25);
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest097
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0097
     * @tc.desc   Verify array length property configurable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSideEffectSetter();
      expect(result.setIsFunc).assertEqual(true);
      expect(result.sideEffect).assertEqual('changed to 5');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest098
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0098
     * @tc.desc   Verify String object index property configurable is false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescTransformSetter();
      expect(result.setIsFunc).assertEqual(true);
      expect(result.internalVal).assertEqual(36.5);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest099
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0099
     * @tc.desc   Verify function prototype property configurable is false (except arrow functions)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescErrorSetter();
      expect(result.setIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest100
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0100
     * @tc.desc   Verify getter defined via object literal syntax
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescBothGetterSetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.setIsFunc).assertEqual(true);
      expect(result.result).assertEqual(100);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest101
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0101
     * @tc.desc   Verify getter defined via Object.defineProperty
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescBothDefProp();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.setIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest102
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0102
     * @tc.desc   Verify getter accesses internal state of object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescBindBoth();
      expect(result.xGetIsFunc).assertEqual(true);
      expect(result.yGetIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest103
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0103
     * @tc.desc   Verify getter dynamically computes return value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPrivateViaGetterSetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.setIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest104
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0104
     * @tc.desc   Verify getter this binding issue with arrow functions
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescClassGetterSetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.setIsFunc).assertEqual(true);
      expect(result.result).assertEqual(42);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest105
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0105
     * @tc.desc   Verify getter returns complex object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonEnumGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest106
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0106
     * @tc.desc   Verify getter returns function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonConfGetter();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest107
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0107
     * @tc.desc   Verify getter throws exception internally
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonDelGetter();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest108
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0108
     * @tc.desc   Verify getter implements lazy initialization
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFrozenGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest109
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0109
     * @tc.desc   Verify setter defined via object literal syntax
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSealedGetterSetter();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest110
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0110
     * @tc.desc   Verify setter defined via Object.defineProperty
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConvertToData();
      expect(result.beforeGetIsFunc).assertEqual(true);
      expect(result.afterValue).assertEqual('data');
      expect(result.afterGetIsUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest111
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0111
     * @tc.desc   Verify setter validates and filters input value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCannotConvertNonConf();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest112
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0112
     * @tc.desc   Verify setter triggers side effects
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAllFalse();
      expect(result.writable).assertEqual(false);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest113
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0113
     * @tc.desc   Verify setter transforms input value type or format
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescReadOnlyEnum();
      expect(result.writable).assertEqual(false);
      expect(result.enumerable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest114
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0114
     * @tc.desc   Verify setter throws exception internally
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescWritableNonEnum();
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest115
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0115
     * @tc.desc   Verify defining both getter and setter forms a complete accessor
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonDelButWritable();
      expect(result.configurable).assertEqual(false);
      expect(result.writable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest116
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0116
     * @tc.desc   Verify defining getter and setter simultaneously via Object.defineProperty
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDelButReadOnly();
      expect(result.configurable).assertEqual(true);
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest117
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0117
     * @tc.desc   Verify getter/setter implements relationship between properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConvertAccToData();
      expect(result.beforeGetIsFunc).assertEqual(true);
      expect(result.afterValue).assertEqual('now is data');
      expect(result.afterGetIsUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest118
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0118
     * @tc.desc   Verify getter/setter implements true private property effect
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescModifyWritableToFalse();
      expect(result.beforeWritable).assertEqual(true);
      expect(result.afterWritable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest119
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0119
     * @tc.desc   Verify getter/setter defined in class syntax
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescModifyEnumerable();
      expect(result.beforeEnum).assertEqual(true);
      expect(result.afterEnum).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest120
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0120
     * @tc.desc   Verify getter property set to non-enumerable
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezePlainObj();
      expect(result.aWritable).assertEqual(false);
      expect(result.aConf).assertEqual(false);
      expect(result.bWritable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest121
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0121
     * @tc.desc   Verify getter/setter set to non-configurable
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezeNested();
      expect(result.outerWritable).assertEqual(false);
      expect(result.nestedWritable).assertEqual(false);
      expect(result.modifiedInner).assertEqual('modified');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest122
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0122
     * @tc.desc   Verify non-configurable getter/setter cannot be deleted
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezeWithGetter();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.valueConf).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest123
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0123
     * @tc.desc   Verify getter still accessible after Object.freeze()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezeArray();
      expect(result.writable0).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest124
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0124
     * @tc.desc   Verify getter/setter cannot be deleted but internal value can be modified after Object.seal()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezeFunction();
      expect(result.writable).assertEqual(false);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest125
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0125
     * @tc.desc   Verify accessor can be converted to data property when configurable=true
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDetectFrozen();
      expect(result.afterFrozen).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest126
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0126
     * @tc.desc   Verify accessor cannot be converted to data property when configurable=false
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSealPlainObj();
      expect(result.writable).assertEqual(true);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest127
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0127
     * @tc.desc   Verify all of configurable, writable, enumerable are false
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSealReadOnly();
      expect(result.writable).assertEqual(false);
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest128
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0128
     * @tc.desc   Verify writable=false but enumerable=true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSealNested();
      expect(result.outerConf).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest129
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0129
     * @tc.desc   Verify writable=true but enumerable=false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSealArray();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest130
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0130
     * @tc.desc   Verify configurable=false but writable=true
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDetectSealed();
      expect(result.afterSealed).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest131
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0131
     * @tc.desc   Verify configurable=true but writable=false
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPreventExtPlainObj();
      expect(result.writable).assertEqual(true);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest132
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0132
     * @tc.desc   Verify converting property type when configurable=true
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPreventExtDefineProp();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest133
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0133
     * @tc.desc   Verify modifying writable attribute when configurable=true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPreventExtModifyDesc();
      expect(result.writable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest134
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0134
     * @tc.desc   Verify modifying enumerable attribute when configurable=true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPreventExtArray();
      expect(result.writableLen).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest135
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0135
     * @tc.desc   Verify all properties become writable=false and configurable=false after freeze
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDetectExtensible();
      expect(result.afterExt).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest136
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0136
     * @tc.desc   Verify freeze only affects top level, does not recursively freeze nested objects
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProtoNotOwn();
      expect(result.isUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest137
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0137
     * @tc.desc   Verify getter still callable after freeze
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProtoExplicit();
      expect(result.valueIsObj).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest138
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0138
     * @tc.desc   Verify array elements cannot be modified after freeze
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescConstructorNotOwn();
      expect(result.isUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest139
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0139
     * @tc.desc   Verify function properties cannot be modified after freeze
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescClassConstructor();
      expect(result.isUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest140
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0140
     * @tc.desc   Verify frozen state using Object.isFrozen()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescArrayPrototypePush();
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(true);
    });



     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest141
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0141
     * @tc.desc   Verify existing non-writable properties remain non-writable after seal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFuncPrototypeApply();
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest142
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0142
     * @tc.desc   Verify seal only affects top level
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescStrPrototypeSplit();
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest143
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0143
     * @tc.desc   Verify array elements cannot be deleted but can be modified after seal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNumPrototypeToFixed();
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest144
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0144
     * @tc.desc   Verify sealed state using Object.isSealed()
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescMathPI();
      expect(result.piVal).assertEqual(Math.PI);
      expect(result.piWritable).assertEqual(false);
      expect(result.piEnum).assertEqual(false);
      expect(result.piConf).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest145
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0145
     * @tc.desc   Verify new properties cannot be added but existing properties unaffected after preventExtensions
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescJSONParse();
      expect(result.parseIsFunc).assertEqual(true);
      expect(result.parseWritable).assertEqual(true);
      expect(result.parseEnum).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest146
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0146
     * @tc.desc   Verify cannot defineProperty to add new properties after preventExtensions
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescReflectGet();
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest147
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0147
     * @tc.desc   Verify existing property descriptors can be modified after preventExtensions (if configurable=true)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAtomicsAdd();
      expect(result.isFunc).assertEqual(true);
      expect(result.writable).assertEqual(true);
      expect(result.enumerable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest148
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0148
     * @tc.desc   Verify array length still modifiable after preventExtensions
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolProp();
      expect(result.value).assertEqual('symbol value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest149
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0149
     * @tc.desc   Verify extensible state using Object.isExtensible()
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAnonSymbolProp();
      expect(result.value).assertEqual('anonymous value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest150
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0150
     * @tc.desc   Verify __proto__ is usually not an own property
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescGlobalSymbolProp();
      expect(result.value).assertEqual('global value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest151
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0151
     * @tc.desc   Verify __proto__ can be explicitly defined as own property
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolKeyFor();
      expect(result.globalKey).assertEqual('sharedKey');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest152
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0152
     * @tc.desc   Verify constructor is usually a prototype chain property
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescMultiSymbolProp();
      expect(result.val1).assertEqual('value1');
      expect(result.val2).assertEqual('value2');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest153
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0153
     * @tc.desc   Verify constructor property can be customized
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescMixedSymStr();
      expect(result.stringVal).assertEqual('string value');
      expect(result.symVal).assertEqual('symbol value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest154
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0154
     * @tc.desc   Verify built-in method properties of Array.prototype
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonEnumSymbol();
      expect(result.enumerable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest155
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0155
     * @tc.desc   Verify built-in method properties of Object.prototype
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonConfSymbol();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest156
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0156
     * @tc.desc   Verify built-in method properties of Function.prototype
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolAccessor();
      expect(result.getIsFunc).assertEqual(true);
      expect(result.setIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest157
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0157
     * @tc.desc   Verify built-in method properties of String.prototype
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolIterator();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest158
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0158
     * @tc.desc   Verify built-in method properties of Number.prototype
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolToStringTag();
      expect(result.value).assertEqual('MyCustomObject');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest159
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0159
     * @tc.desc   Verify static properties and methods of Math object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolHasInstance();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest160
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0160
     * @tc.desc   Verify static method properties of JSON object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolToPrimitive();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest161
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0161
     * @tc.desc   Verify static method properties of Reflect object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolSpecies();
      expect(result.getIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest162
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0162
     * @tc.desc   Verify static method properties of Atomics object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolMatch();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest163
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0163
     * @tc.desc   Verify using Symbol as object property key
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolReplace();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest164
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0164
     * @tc.desc   Verify using Symbol without description as property key
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolSearch();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest165
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0165
     * @tc.desc   Verify using global Symbol from Symbol.for() as property key
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolSplit();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest166
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0166
     * @tc.desc   Verify key of global Symbol
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolConcatSpreadable();
      expect(result.value).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest167
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0167
     * @tc.desc   Verify object with multiple different Symbol properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolUnscopables();
      expect(result.fooTrue).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest168
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0168
     * @tc.desc   Verify object with both Symbol and string properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolAsyncIterator();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest169
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0169
     * @tc.desc   Verify Symbol property set to non-enumerable
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolDispose();
      expect(result.isFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest170
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0170
     * @tc.desc   Verify Symbol property set to non-configurable
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSymbolMetadata();
      expect(result.author).assertEqual('test');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest171
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0171
     * @tc.desc   Verify Symbol property as getter/setter
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjKeysNoSymbol();
      expect(result.includesStr).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest172
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0172
     * @tc.desc   Verify defining custom iterator
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjGetNamesNoSymbol();
      expect(result.includesKey).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest173
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0173
     * @tc.desc   Verify custom toString tag
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjGetSymbols();
      expect(result.length).assertEqual(2);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest174
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0174
     * @tc.desc   Verify custom instanceof behavior
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescReflectOwnKeys();
      expect(result.length).assertEqual(2);
      expect(result.includesStr).assertEqual(true);
      expect(result.includesSym).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest175
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0175
     * @tc.desc   Verify custom type conversion behavior
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescForInNoSymbol();
      expect(result.includesSym).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest176
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0176
     * @tc.desc   Verify defining constructor for derived object creation
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDeleteSymbol();
      expect(result.afterIsUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest177
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0177
     * @tc.desc   Verify custom String.prototype.match behavior
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDeleteNonConfSymbol();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest178
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0178
     * @tc.desc   Verify custom String.prototype.replace behavior
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezeSymbolCannotDelete();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest179
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0179
     * @tc.desc   Verify custom String.prototype.search behavior
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNonexistReturnUndef();
      expect(result.desc).assertEqual(undefined);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest180
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0180
     * @tc.desc   Verify custom String.prototype.split behavior
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProtoPropReturnUndef();
      expect(result.isUndef).assertEqual('NOT_UNDEF');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest181
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0181
     * @tc.desc   Verify controlling Array.prototype.concat spread behavior
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescEmptyObjAnyProp();
      expect(result.desc).assertEqual(undefined);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest182
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0182
     * @tc.desc   Verify defining properties unavailable in with statements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNullObjThrows();
      expect(result.threwNull).assertEqual('TypeError');
      expect(result.threwUndef).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest183
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0183
     * @tc.desc   Verify defining async iterator
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDataDescStructure();
      expect(result.hasValue).assertEqual(true);
      expect(result.hasWritable).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest184
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0184
     * @tc.desc   Verify defining resource cleanup behavior
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDataDescTypes();
      expect(result.valueType).assertEqual('number');
      expect(result.writableType).assertEqual('boolean');
      expect(result.enumerableType).assertEqual('boolean');
      expect(result.configurableType).assertEqual('boolean');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest185
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0185
     * @tc.desc   Verify defining metadata decorator
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDataDescImmutable();
      expect(result.origValue).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest186
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0186
     * @tc.desc   Verify Object.keys() only returns string properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDataDescReusable();
      expect(result.copiedVal).assertEqual(42);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest187
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0187
     * @tc.desc   Verify Object.getOwnPropertyNames() only returns string property names
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAccessorDescStructure();
      expect(result.hasGet).assertEqual(true);
      expect(result.hasSet).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest188
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0188
     * @tc.desc   Verify Object.getOwnPropertySymbols() returns all Symbol properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAccessorGetSetTypes();
      expect(result.getterGetIsFunc).assertEqual(true);
      expect(result.setterSetIsFunc).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest189
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0189
     * @tc.desc   Verify Reflect.ownKeys() returns string and Symbol properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCallGetterFromDesc();
      expect(result.calledOnObj).assertEqual(100);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest190
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0190
     * @tc.desc   Verify for-in loop only iterates enumerable string properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCallSetterFromDesc();
      expect(result.internalVal).assertEqual(100);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest191
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0191
     * @tc.desc   Verify configurable Symbol property can be deleted
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjIsPlainObj();
      expect(result.constIsObj).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest192
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0192
     * @tc.desc   Verify non-configurable Symbol property cannot be deleted
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjProtoChain();
      expect(result.protoIsObjProto).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest193
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0193
     * @tc.desc   Verify Symbol property cannot be deleted after freeze
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjCanFreeze();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest194
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0194
     * @tc.desc   Verify non-existent property returns undefined
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjCanSeal();
      expect(result.isSealed).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest195
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0195
     * @tc.desc   Verify property on prototype chain but not own property returns undefined
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjCanAddProps();
      expect(result.tsIsNum).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest196
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0196
     * @tc.desc   Verify empty object returns undefined for any property lookup
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescObjJSONSerialize();
      expect(result.parsedValue).assertEqual(42);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest197
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0197
     * @tc.desc   Verify null or undefined as first argument throws TypeError
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescNullArg();
      expect(result.threwTypeError).assertEqual('TypeError');
      expect(result.errorName).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest198
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0198
     * @tc.desc   Verify data property descriptor contains value, writable, enumerable, configurable
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescUndefArg();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest199
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0199
     * @tc.desc   Verify types of data descriptor properties
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescES5Primitive();
      expect(result.hasDesc).assertEqual(true);
      expect(result.threw).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest200
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0200
     * @tc.desc   Verify modifying returned descriptor does not affect original property
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescMissingSecondArg();
      expect(result.desc).assertEqual(undefined);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest201
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0201
     * @tc.desc   Verify returned descriptor can be used for other operations
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescExtraArgs();
      expect(result.value).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest202
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0202
     * @tc.desc   Verify accessor property descriptor contains get, set, enumerable, configurable
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProxyProperty();
      expect(result.value).assertEqual('value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest203
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0203
     * @tc.desc   Verify types of accessor descriptor get/set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProxyIntercept();
      expect(result.value).assertEqual('intercepted');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest204
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0204
     * @tc.desc   Verify getter function in descriptor can be called
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProxyVirtualProp();
      expect(result.threw).assertEqual(true);
      expect(result.isTypeError).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest205
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0205
     * @tc.desc   Verify setter function in descriptor can be called
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescProxyInconsistent();
      expect(result.value).assertEqual(undefined);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest206
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0206
     * @tc.desc   Verify descriptor is a plain Object instance
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCopyProp();
      expect(result.targetVal).assertEqual('value');
      expect(result.targetDescVal).assertEqual('value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest207
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0207
     * @tc.desc   Verify descriptor object prototype chain is normal
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCopyAccessor();
      expect(result.result).assertEqual(42);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest208
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0208
     * @tc.desc   Verify returned descriptor object can be frozen
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCopyNonConfigurable();
      expect(result.configurable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest209
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0209
     * @tc.desc   Verify returned descriptor object can be sealed
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCopyModifyDesc();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest210
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0210
     * @tc.desc   Verify new properties can be added to descriptor object
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescBatchCopy();
      expect(result.a).assertEqual(1);
      expect(result.b).assertEqual(2);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest211
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0211
     * @tc.desc   Verify data descriptor can be serialized to JSON
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescBatchCopyAccessor();
      expect(result.value).assertEqual(42);
      expect(result.name).assertEqual('source');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest212
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0212
     * @tc.desc   Verify null as first argument throws TypeError
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescCreateWithDesc();
      expect(result.ownDescVal).assertEqual('value');
      expect(result.inheritedDescUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest213
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0213
     * @tc.desc   Verify undefined as first argument throws TypeError
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAssignEnumOnly();
      expect(result.visible).assertEqual('shown');
      expect(result.hiddenUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest214
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0214
     * @tc.desc   Verify primitive type as first argument throws TypeError in ES5
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAssignSymbol();
      expect(result.symVal).assertEqual('symbol value');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest215
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0215
     * @tc.desc   Verify missing second argument returns undefined
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAssignNoGetter();
      expect(result.targetGetIsUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest216
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0216
     * @tc.desc   Verify extra arguments are ignored
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAllDescsMatch();
      expect(result.valMatch).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest217
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0217
     * @tc.desc   Verify accessing property descriptor via Proxy
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescAllDescsNonEnum();
      expect(result.enumFalse).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest218
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0218
     * @tc.desc   Verify Proxy custom getOwnPropertyDescriptor behavior
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescFreezeCompare();
      expect(result.beforeWritable).assertEqual(true);
      expect(result.afterWritable).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest219
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0219
     * @tc.desc   Verify Proxy throws TypeError when returning configurable=false for non-existent property
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescSealCompare();
      expect(result.beforeConf).assertEqual(true);
      expect(result.afterConf).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest220
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0220
     * @tc.desc   Verify Proxy throws TypeError when returned descriptor violates consistency rules
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPreventExtCompare();
      expect(result.confSame).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest221
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0221
     * @tc.desc   Verify using getOwnPropertyDescriptor to get descriptor and copying via defineProperty
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescKeysEnumRel();
      expect(result.hasVisible).assertEqual(true);
      expect(result.hasHidden).assertEqual(false);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest222
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0222
     * @tc.desc   Verify copying getter/setter property to another object
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescValuesEnumRel();
      expect(result.hasShown).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest223
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0223
     * @tc.desc   Verify copying non-configurable property (configurable must be false)
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescEntriesEnumRel();
      expect(result.length).assertEqual(1);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest224
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0224
     * @tc.desc   Verify modifying descriptor before copying
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescGetNamesNonEnum();
      expect(result.hasB).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest225
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0225
     * @tc.desc   Verify batch copying properties using getOwnPropertyDescriptors
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescGetNamesNoSymbol();
      expect(result.symDescExists).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest226
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0226
     * @tc.desc   Verify batch copying object with getter/setter
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescGetSymbolsAll();
      expect(result.length).assertEqual(2);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest227
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0227
     * @tc.desc   Verify using Object.create second argument to pass descriptors
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescGetSymbolsNonEnum();
      expect(result.hasSym).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest228
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0228
     * @tc.desc   Verify Object.assign only copies enumerable own properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescReflectSame();
      expect(result.valSame).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest229
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0229
     * @tc.desc   Verify Object.assign copies Symbol properties (Symbol is enumerable)
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescReflectPrimitive();
      expect(result.reflectThrew).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest230
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0230
     * @tc.desc   Verify Object.assign calls getter to get value rather than copying getter function
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescReflectNull();
      expect(result.objThrew).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest231
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0231
     * @tc.desc   Verify Object.getOwnPropertyDescriptors returns all own property descriptors
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescHasOwnProp();
      expect(result.descExists).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest232
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0232
     * @tc.desc   Verify Object.getOwnPropertyDescriptors includes non-enumerable properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescHasOwnNonEnum();
      expect(result.descExists).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest233
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0233
     * @tc.desc   Verify property descriptor changes before and after freeze
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescForInEnumOnly();
      expect(result.hasEnum).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest234
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0234
     * @tc.desc   Verify property descriptor changes before and after seal
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescHasOwnPropCheck();
      expect(result.hasOwnProp).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest235
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0235
     * @tc.desc   Verify preventExtensions does not change existing property descriptors
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescHasOwnPropNonEnum();
      expect(result.hasOwnProp).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest236
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0236
     * @tc.desc   Verify only enumerable=true properties appear in Object.keys
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPropIsEnumerable();
      expect(result.visibleIsEnum).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest237
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0237
     * @tc.desc   Verify only enumerable=true property values appear in Object.values
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescPropIsEnumOwnOnly();
      expect(result.descUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest238
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0238
     * @tc.desc   Verify only enumerable=true properties appear in Object.entries
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDeleteConfigurableProp();
      expect(result.afterUndef).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest239
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0239
     * @tc.desc   Verify Object.getOwnPropertyNames includes all string properties (including non-enumerable)
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDeleteNonConfProp();
      expect(result.threw).assertEqual('TypeError');
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest240
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0240
     * @tc.desc   Verify Object.getOwnPropertyNames does not include Symbol properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDeleteNonexist();
      expect(result.result).assertEqual(true);
    });

     /**
     * @tc.name   ObjectGetOwnPropertyDescriptorTest241
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYDESCRIPTOR_TEST_0241
     * @tc.desc   Verify Object.getOwnPropertySymbols returns all Symbol properties
     * @tc.size   MediumTest
     * @tc.level  Level 2
     */
    it('ObjectGetOwnPropertyDescriptorTest241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = getDescDeleteProtoProp();
      expect(result.stillAccessible).assertEqual(true);
    });
  });
};
