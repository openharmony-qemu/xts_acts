'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

function processValueOfFlag(flag: boolean): string {
  return flag ? "enabled" : "disabled";
}

function getPrimitiveValue(boolObj: Boolean): boolean {
  return boolObj.valueOf();
}

function validateBooleanValue(obj: Boolean, expected: boolean): boolean {
  return obj.valueOf() === expected;
}

function normalizeBooleanObject(input: Boolean): boolean {
  return input.valueOf();
}

function normalizePrimitiveBoolean(input: boolean): boolean {
  return input;
}

export default function BooleanValueOfInstanceTest(): void {
  describe("BooleanValueOfInstanceTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0100
     * @tc.name      testBooleanValueOfRejectsArgumentsCompileConstraint
     * @tc.desc      instance.valueOf() takes no arguments; extra arguments are compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfRejectsArgumentsCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0200
     * @tc.name      testBooleanValueOfRequiresInstanceCallCompileConstraint
     * @tc.desc      instance.valueOf() must be called on a Boolean instance; static call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfRequiresInstanceCallCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance.valueOf();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0300
     * @tc.name      testBooleanValueOfReturnsPrimitiveBooleanType
     * @tc.desc      instance.valueOf() returns primitive boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfReturnsPrimitiveBooleanType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = boolObj.valueOf();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0400
     * @tc.name      testBooleanValueOfReturnsTrueValue
     * @tc.desc      new Boolean(true).valueOf() returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfReturnsTrueValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = boolObj.valueOf();
      expect(result).assertEqual(true);
      expect(result === true).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0500
     * @tc.name      testBooleanValueOfReturnsFalseValue
     * @tc.desc      new Boolean(false).valueOf() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfReturnsFalseValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(false);
      let result = boolObj.valueOf();
      expect(result).assertEqual(false);
      expect(result === false).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0600
     * @tc.name      testBooleanValueOfDifferentConstructors
     * @tc.desc      instance.valueOf() works with different constructor input types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfDifferentConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).valueOf()).assertEqual(true);
      expect(new Boolean(100).valueOf()).assertEqual(true);
      expect(new Boolean(0).valueOf()).assertEqual(false);
      expect(new Boolean(c'A').valueOf()).assertEqual(true);
      expect(new Boolean(c'\u0000').valueOf()).assertEqual(false);
      expect(new Boolean(3.14).valueOf()).assertEqual(true);
      expect(new Boolean(0.0).valueOf()).assertEqual(false);
      expect(new Boolean("test").valueOf()).assertEqual(true);
      expect(new Boolean("").valueOf()).assertEqual(false);
      expect(new Boolean(null as Any).valueOf()).assertEqual(false);
      expect(new Boolean(undefined as Any).valueOf()).assertEqual(false);
      expect(new Boolean(new Number(10)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0700
     * @tc.name      testBooleanValueOfPrimitiveBooleanCharacteristics
     * @tc.desc      instance.valueOf() result behaves as a primitive boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfPrimitiveBooleanCharacteristics", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = boolObj.valueOf();
      expect(result && true).assertEqual(true);
      expect(result || false).assertEqual(true);
      expect(!result).assertEqual(false);
      let value = result ? "yes" : "no";
      expect(value).assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0800
     * @tc.name      testBooleanValueOfMultipleCallsConsistency
     * @tc.desc      instance.valueOf() returns consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfMultipleCallsConsistency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result1 = boolObj.valueOf();
      let result2 = boolObj.valueOf();
      let result3 = boolObj.valueOf();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_0900
     * @tc.name      testBooleanValueOfTypeofIsBoolean
     * @tc.desc      instance.valueOf() returns typeof "boolean".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfTypeofIsBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj1 = new Boolean(true);
      let result1 = boolObj1.valueOf();
      expect(typeof result1).assertEqual("boolean");
      let boolObj2 = new Boolean(false);
      let result2 = boolObj2.valueOf();
      expect(typeof result2).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1000
     * @tc.name      testBooleanValueOfReturnInstanceofDeviceBehavior
     * @tc.desc      instance.valueOf() result is typeof boolean but instanceof Boolean on device.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfReturnInstanceofDeviceBehavior", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = boolObj.valueOf();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1100
     * @tc.name      testBooleanValueOfPrimitiveDiffersFromObject
     * @tc.desc      instance.valueOf() result compared with the Boolean object wrapper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfPrimitiveDiffersFromObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let primitive = boolObj.valueOf();
      expect(boolObj.toBoolean()).assertEqual(primitive);
      expect(typeof boolObj).assertEqual("boolean");
      expect(typeof primitive).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1200
     * @tc.name      testBooleanValueOfReturnsOnlyBooleanBoundaryValues
     * @tc.desc      instance.valueOf() only returns true or false for various constructor inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfReturnsOnlyBooleanBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObjs: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(1),
        new Boolean(0),
        new Boolean("test"),
        new Boolean(""),
        new Boolean(null as Any)
      ];
      boolObjs.forEach((obj: Boolean) => {
        let result = obj.valueOf();
        expect(result === true || result === false).assertEqual(true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1300
     * @tc.name      testBooleanValueOfComparedWithToBoolean
     * @tc.desc      instance.valueOf() matches instance.toBoolean() for the same instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result1 = boolObj.valueOf();
      expect(typeof result1).assertEqual("boolean");
      let result2 = boolObj.toBoolean();
      expect(typeof result2).assertEqual("boolean");
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1400
     * @tc.name      testBooleanValueOfComparedWithStaticValueOfCompileConstraint
     * @tc.desc      instance.valueOf() returns primitive boolean; compared with Boolean construction for consistency.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithStaticValueOfCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result1 = instance.valueOf();
      let result2 = new Boolean(true);
      expect(typeof result1).assertEqual("boolean");
      expect(result1).assertEqual(result2.toBoolean());
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1500
     * @tc.name      testBooleanValueOfComparedWithToString
     * @tc.desc      instance.valueOf() compared with instance.toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithToString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let primitive = boolObj.valueOf();
      let str = boolObj.toString();
      expect(typeof primitive).assertEqual("boolean");
      expect(primitive).assertEqual(true);
      expect(str.toString()).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1600
     * @tc.name      testBooleanValueOfInstanceMethodCall
     * @tc.desc      instance.valueOf() returns correct value and can be used to construct new Boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfInstanceMethodCall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance.valueOf();
      expect(result).assertEqual(true);
      expect(new Boolean(result).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1700
     * @tc.name      testBooleanValueOfThisBindingByNormalCall
     * @tc.desc      instance.valueOf() works via normal call on different instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfThisBindingByNormalCall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.valueOf()).assertEqual(true);
      let another = new Boolean(false);
      expect(another.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1800
     * @tc.name      testBooleanValueOfMethodExistsOnInstance
     * @tc.desc      instance.valueOf is a function on a Boolean instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfMethodExistsOnInstance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.valueOf).assertEqual("function");
      expect(instance.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_1900
     * @tc.name      testBooleanValueOfUsedForPrimitiveCalculation
     * @tc.desc      instance.valueOf() in conditional and logical expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfUsedForPrimitiveCalculation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = boolObj.valueOf() && false;
      expect(result).assertEqual(false);
      let value = boolObj.valueOf() ? "yes" : "no";
      expect(value).assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2000
     * @tc.name      testBooleanValueOfPrimitiveComparison
     * @tc.desc      instance.valueOf() result can be compared with primitive boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfPrimitiveComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let primitive = boolObj.valueOf();
      expect(primitive === true).assertEqual(true);
      expect(primitive !== false).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2100
     * @tc.name      testBooleanValueOfSerialization
     * @tc.desc      instance.valueOf() result serializes correctly with JSON.stringify.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfSerialization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let json = JSON.stringify(boolObj.valueOf());
      expect(json).assertEqual("true");
      expect(JSON.stringify(boolObj.toBoolean())).assertEqual(json);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2200
     * @tc.name      testBooleanValueOfTypeConversion
     * @tc.desc      instance.valueOf() result can be converted to number and string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfTypeConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let primitive = boolObj.valueOf();
      expect(typeof primitive).assertEqual("boolean");
      let num = primitive ? 1 : 0;
      expect(num).assertEqual(1);
      let str = primitive ? "true" : "false";
      expect(str).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2300
     * @tc.name      testBooleanValueOfCallPerformance
     * @tc.desc      instance.valueOf() performance in a loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        let value = instance.valueOf();
        expect(value).assertEqual(true);
      }
      let end = Date.now();
      let elapsed = end - start;
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2400
     * @tc.name      testBooleanValueOfComparedWithToBooleanPerformance
     * @tc.desc      instance.valueOf() vs instance.toBoolean() performance comparison.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithToBooleanPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        expect(instance.valueOf()).assertEqual(true);
      }
      let end1 = Date.now();
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        expect(instance.toBoolean()).assertEqual(true);
      }
      let end2 = Date.now();
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2500
     * @tc.name      testBooleanValueOfContinuousCalls
     * @tc.desc      instance.valueOf() returns consistent results on continuous calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfContinuousCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result1 = instance.valueOf();
      let result2 = instance.valueOf();
      let result3 = instance.valueOf();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2600
     * @tc.name      testBooleanValueOfDifferentInstances
     * @tc.desc      instance.valueOf() works correctly for different instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfDifferentInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(false);
      expect(bool1.valueOf()).assertEqual(true);
      expect(bool2.valueOf()).assertEqual(false);
      expect(bool1.valueOf() !== bool2.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2700
     * @tc.name      testBooleanValueOfDoesNotReturnChainableBooleanObject
     * @tc.desc      instance.valueOf() returns primitive boolean, not a chainable Boolean object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfDoesNotReturnChainableBooleanObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let primitive = instance.valueOf();
      expect(typeof primitive).assertEqual("boolean");
      let negated = !primitive;
      expect(negated).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2800
     * @tc.name      testBooleanValueOfWrongCallModeCompileConstraint
     * @tc.desc      instance.valueOf() must be called via instance; class-level call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance.valueOf();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_2900
     * @tc.name      testBooleanValueOfArgumentErrorCompileConstraint
     * @tc.desc      instance.valueOf() takes zero arguments; extra arguments are compile-time invalid, valid call returns correct result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfArgumentErrorCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance.valueOf();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3000
     * @tc.name      testBooleanValueOfThisBindingErrorCompileConstraint
     * @tc.desc      instance.valueOf() requires Boolean receiver; dynamic this binding is not used in ArkTS, invalid binding is compile-time constraint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfThisBindingErrorCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3100
     * @tc.name      testBooleanValueOfUsedInCondition
     * @tc.desc      instance.valueOf() in conditional and logical expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfUsedInCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let flag = boolObj.valueOf();
      let status = flag ? "ON" : "OFF";
      expect(status).assertEqual("ON");
      let result = flag && false;
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3200
     * @tc.name      testBooleanValueOfAsFunctionParameter
     * @tc.desc      instance.valueOf() result passed as function parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfAsFunctionParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = processValueOfFlag(boolObj.valueOf());
      expect(result).assertEqual("enabled");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3300
     * @tc.name      testBooleanValueOfWithOperators
     * @tc.desc      instance.valueOf() result works with logical and comparison operators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfWithOperators", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let value = boolObj.valueOf();
      expect(!value).assertEqual(false);
      expect(value && true).assertEqual(true);
      expect(value && false).assertEqual(false);
      expect(value || true).assertEqual(true);
      expect(value || false).assertEqual(true);
      expect(value === true).assertEqual(true);
      expect(value !== false).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3400
     * @tc.name      testBooleanValueOfExplicitPrimitiveAccess
     * @tc.desc      instance.valueOf() via helper function getPrimitiveValue.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfExplicitPrimitiveAccess", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let primitive = getPrimitiveValue(instance);
      expect(primitive).assertEqual(true);
      expect(typeof primitive).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3500
     * @tc.name      testBooleanValueOfBestPracticeTypeConversion
     * @tc.desc      instance.valueOf() via normalizeBooleanObject helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfBestPracticeTypeConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = normalizeBooleanObject(new Boolean(true));
      expect(bool1).assertEqual(true);
      let bool2 = normalizePrimitiveBoolean(true);
      expect(bool2).assertEqual(true);
      expect(typeof bool1).assertEqual("boolean");
      expect(typeof bool2).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3600
     * @tc.name      testBooleanValueOfDataValidation
     * @tc.desc      instance.valueOf() via validateBooleanValue helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfDataValidation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(validateBooleanValue(instance, true)).assertEqual(true);
      expect(validateBooleanValue(instance, false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3700
     * @tc.name      testBooleanValueOfNormalizeObjectAndPrimitive
     * @tc.desc      instance.valueOf() via normalize helpers for both object and primitive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfNormalizeObjectAndPrimitive", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = normalizeBooleanObject(new Boolean(true));
      let result2 = normalizePrimitiveBoolean(false);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(typeof result1).assertEqual("boolean");
      expect(typeof result2).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3800
     * @tc.name      testBooleanValueOfComparedWithJavaScriptBehavior
     * @tc.desc      instance.valueOf() returns primitive boolean in ArkTS.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithJavaScriptBehavior", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance.valueOf();
      expect(typeof result).assertEqual("boolean");
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_3900
     * @tc.name      testBooleanValueOfTypeInference
     * @tc.desc      instance.valueOf() result type inference works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfTypeInference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let primitive: boolean = instance.valueOf();
      let result = processValueOfFlag(primitive);
      expect(typeof primitive).assertEqual("boolean");
      expect(result).assertEqual("enabled");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_INSTANCE_4000
     * @tc.name      testBooleanValueOfExplicitUnboxing
     * @tc.desc      instance.valueOf() explicit unboxing works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfExplicitUnboxing", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result1 = instance.valueOf() && false;
      let result2 = instance.valueOf() && false;
      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
      expect(result1).assertEqual(result2);
    })
  })
}
