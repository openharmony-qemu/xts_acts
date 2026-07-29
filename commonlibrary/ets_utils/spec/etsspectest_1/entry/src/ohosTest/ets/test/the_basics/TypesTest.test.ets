/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe, expect, it, Level, Size, TestType
} from '@ohos/hypium';
import {
  assertArrayRuntimeType,
  assertArrayTypeofMethods,
  assertBigIntBasicValues,
  assertBooleanBasicValues,
  assertCrossModuleArrayTypeConsistency,
  assertCrossModuleClassInstanceof,
  assertCrossModuleFunctionTypeConsistency,
  assertFunctionObjectTypeof,
  assertInstanceofArray,
  assertInstanceofClassInheritanceChain,
  assertInstanceofClassInstance,
  assertNullToBooleanFalsy,
  assertNullEqualsUndefined,
  assertNullStrictNotUndefined,
  assertNumberBasicValues,
  assertNumberEqualsBigInt,
  assertNumberSpecialValues,
  assertObjectBasicPropertyAccess,
  assertStringBasicValues,
  assertSymbolCreationUniqueness,
  assertSymbolPropertyKeyForIn,
  assertToBooleanFalsyValues,
  assertToBooleanTruthyValues,
  assertToNumberString,
  assertToPrimitiveObjectOperator,
  assertToStringNumber,
  assertTypeConversionComparisonEquality,
  assertTypeofBigInt,
  assertTypeofNull,
  assertTypeofPlusOperatorCombination,
  assertTypeofSymbol,
  assertTypeofUndefined,
  assertUndefinedToBooleanFalsy,
  assertTypeofObject
} from './TypesHelper';

export default function TypesTest() {
  describe('TypesTest', () => {
    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0100
     * @tc.name      testNumberBasicValues0001
     * @tc.desc      Verify basic number values including integer float and negative values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberBasicValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertNumberBasicValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0200
     * @tc.name      testNumberSpecialValues0002
     * @tc.desc      Verify number special values NaN Infinity negative Infinity and signed zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberSpecialValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertNumberSpecialValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0300
     * @tc.name      testStringBasicValues0003
     * @tc.desc      Verify basic string values including empty single and long strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringBasicValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertStringBasicValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0400
     * @tc.name      testBooleanDistinctAndNotOpposite0004
     * @tc.desc      Verify true !== false, !true === false, !false === true (ECMA-262 §6.1.3).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBooleanDistinctAndNotOpposite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertBooleanBasicValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0500
     * @tc.name      testBigIntBasicValues0005
     * @tc.desc      Verify BigInt basic values arithmetic and comparison.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBigIntBasicValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertBigIntBasicValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0600
     * @tc.name      testSymbolCreationUniqueness0006
     * @tc.desc      Verify Symbol creation returns unique symbol values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSymbolCreationUniqueness0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertSymbolCreationUniqueness()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0700
     * @tc.name      testNullBooleanFalsy0007
     * @tc.desc      Verify !null is true (ECMA-262 §7.1.2 ToBoolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullBooleanFalsy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertNullToBooleanFalsy()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0800
     * @tc.name      testUndefinedBooleanFalsy0008
     * @tc.desc      Verify !undefined is true (ECMA-262 §7.1.2 ToBoolean).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testUndefinedBooleanFalsy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertUndefinedToBooleanFalsy()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_0900
     * @tc.name      testObjectBasicPropertyAccess0009
     * @tc.desc      Verify object property access returns expected values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectBasicPropertyAccess0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertObjectBasicPropertyAccess()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1000
     * @tc.name      testArrayRuntimeType0010
     * @tc.desc      Verify array runtime type through typeof and Array isArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayRuntimeType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertArrayRuntimeType()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1100
     * @tc.name      testFunctionObjectTypeof0011
     * @tc.desc      Verify function object typeof returns function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionObjectTypeof0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertFunctionObjectTypeof()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1200
     * @tc.name      testTypeofUndefined0012
     * @tc.desc      Verify typeof undefined result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofUndefined0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeofUndefined()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1300
     * @tc.name      testTypeofNull0013
     * @tc.desc      Verify typeof null result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofNull0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeofNull()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1500
     * @tc.name      testTypeofBigInt0015
     * @tc.desc      Verify typeof bigint result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofBigInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeofBigInt()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1600
     * @tc.name      testTypeofSymbol0016
     * @tc.desc      Verify typeof symbol result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofSymbol0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeofSymbol()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1700
     * @tc.name      testInstanceofClassInstance0017
     * @tc.desc      Verify class instance passes instanceof check.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceofClassInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertInstanceofClassInstance()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1800
     * @tc.name      testInstanceofArray0018
     * @tc.desc      Verify array passes instanceof Array check.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceofArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertInstanceofArray()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_1900
     * @tc.name      testToBooleanFalsyValues0019
     * @tc.desc      Verify ToBoolean returns false for standard falsy values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToBooleanFalsyValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertToBooleanFalsyValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2000
     * @tc.name      testToBooleanTruthyValues0020
     * @tc.desc      Verify ToBoolean returns true for standard truthy values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToBooleanTruthyValues0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertToBooleanTruthyValues()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2100
     * @tc.name      testToNumberString0021
     * @tc.desc      Verify ToNumber converts numeric and nonnumeric strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToNumberString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertToNumberString()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2200
     * @tc.name      testToStringNumber0022
     * @tc.desc      Verify ToString converts number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringNumber0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertToStringNumber()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2300
     * @tc.name      testNullEqualsUndefined0023
     * @tc.desc      Verify abstract equality between null and undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullEqualsUndefined0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertNullEqualsUndefined()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2400
     * @tc.name      testNullStrictNotUndefined0024
     * @tc.desc      Verify strict equality keeps null and undefined different.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullStrictNotUndefined0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertNullStrictNotUndefined()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2500
     * @tc.name      testNumberEqualsBigInt0025
     * @tc.desc      Verify abstract equality between number and bigint values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberEqualsBigInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertNumberEqualsBigInt()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2600
     * @tc.name      testTypeofPlusOperatorCombination0026
     * @tc.desc      Verify typeof result after plus operator string concatenation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofPlusOperatorCombination0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeofPlusOperatorCombination()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2700
     * @tc.name      testInstanceofClassInheritanceChain0027
     * @tc.desc      Verify instanceof through class inheritance chain.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceofClassInheritanceChain0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertInstanceofClassInheritanceChain()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_2900
     * @tc.name      testArrayTypeofMethods0029
     * @tc.desc      Verify array typeof and common array methods together.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayTypeofMethods0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertArrayTypeofMethods()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3000
     * @tc.name      testToPrimitiveObjectOperator0030
     * @tc.desc      Verify object ToPrimitive behavior through numeric operator usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToPrimitiveObjectOperator0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertToPrimitiveObjectOperator()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3100
     * @tc.name      testTypeConversionComparisonEquality0031
     * @tc.desc      Verify type conversion during abstract equality comparison.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeConversionComparisonEquality0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeConversionComparisonEquality()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3200
     * @tc.name      testSymbolPropertyKeyForIn0032
     * @tc.desc      Verify symbol property keys are not enumerated by for in.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSymbolPropertyKeyForIn0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertSymbolPropertyKeyForIn()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3300
     * @tc.name      testCrossModuleClassInstanceof0033
     * @tc.desc      Verify class instance keeps instanceof identity across module import.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCrossModuleClassInstanceof0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertCrossModuleClassInstanceof()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3400
     * @tc.name      testCrossModuleArrayTypeConsistency0034
     * @tc.desc      Verify array runtime type is consistent across module import.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCrossModuleArrayTypeConsistency0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertCrossModuleArrayTypeConsistency()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3500
     * @tc.name      testCrossModuleFunctionTypeConsistency0035
     * @tc.desc      Verify function typeof result is consistent across module import.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCrossModuleFunctionTypeConsistency0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertCrossModuleFunctionTypeConsistency()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3600
     * @tc.name      testTypeofNumber0036
     * @tc.desc      Verify typeof number returns "number".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofNumber0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof 42).assertEqual('number')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3700
     * @tc.name      testTypeofString0037
     * @tc.desc      Verify typeof string returns "string".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof 'abc').assertEqual('string')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3800
     * @tc.name      testTypeofBoolean0038
     * @tc.desc      Verify typeof boolean returns "boolean".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofBoolean0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof true).assertEqual('boolean')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_3900
     * @tc.name      testTypeofObject0039
     * @tc.desc      Verify typeof object returns "object".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofObject0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assertTypeofObject()).assertEqual(true)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4000
     * @tc.name      testToNumberBooleanTrue0040
     * @tc.desc      Verify Number(true) is 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToNumberBooleanTrue0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Number(true)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4100
     * @tc.name      testToNumberBooleanFalse0041
     * @tc.desc      Verify Number(false) is 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToNumberBooleanFalse0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Number(false)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4200
     * @tc.name      testToNumberEmptyString0042
     * @tc.desc      Verify Number("") is 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToNumberEmptyString0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Number('')).assertEqual(0)
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4300
     * @tc.name      testToStringBooleanTrue0043
     * @tc.desc      Verify String(true) is "true".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringBooleanTrue0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(String(true)).assertEqual('true')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4400
     * @tc.name      testToStringBooleanFalse0044
     * @tc.desc      Verify String(false) is "false".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringBooleanFalse0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(String(false)).assertEqual('false')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4500
     * @tc.name      testToStringNumberValue0045
     * @tc.desc      Verify String(42) is "42".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringNumberValue0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(String(42)).assertEqual('42')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4600
     * @tc.name      testToObjectNumber0046
     * @tc.desc      Verify Object(42) creates a Number wrapper object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToObjectNumber0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: Object = Object(42)
      expect(typeof obj === 'object' && obj instanceof Number).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4700
     * @tc.name      testToObjectString0047
     * @tc.desc      Verify Object("hello") creates a String wrapper object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToObjectString0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: Object = Object('hello')
      expect(typeof obj === 'object' && obj instanceof String).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4800
     * @tc.name      testToObjectBoolean0048
     * @tc.desc      Verify Object(true) creates a Boolean wrapper object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToObjectBoolean0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: Object = Object(true)
      expect(typeof obj === 'object' && obj instanceof Boolean).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_4900
     * @tc.name      testTemplateNull0049
     * @tc.desc      Verify template literal with null produces "xnully".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTemplateNull0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(`x${null}y`).assertEqual('xnully')
    })

    /**
     * @tc.number    SUB_MODULE_TYPES_RUNTIME_5000
     * @tc.name      testTemplateUndefined0050
     * @tc.desc      Verify template literal with undefined produces "xundefinedy".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTemplateUndefined0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(`x${undefined}y`).assertEqual('xundefinedy')
    })
  })
}
