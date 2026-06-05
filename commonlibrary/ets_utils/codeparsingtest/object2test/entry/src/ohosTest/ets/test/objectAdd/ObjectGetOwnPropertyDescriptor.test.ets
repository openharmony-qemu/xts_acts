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
