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

function processToBooleanFlag(flag: boolean): boolean {
  return Boolean.toBoolean(flag);
}

function evaluateToBoolean(condition: boolean): string {
  let flag: boolean = Boolean.toBoolean(condition);
  return flag ? "condition is true" : "condition is false";
}

function safeToBoolean(value: boolean): boolean {
  if (typeof value !== "boolean") {
    throw new Error("Expected boolean type");
  }
  return Boolean.toBoolean(value);
}

function mapToBoolean(fn: (value: boolean) => boolean): boolean {
  return fn(true);
}

class BooleanToBooleanUtils {
  static normalize(value: boolean): boolean {
    return Boolean.toBoolean(value);
  }

  static invert(value: boolean): boolean {
    return !Boolean.toBoolean(value);
  }

  static combine(values: boolean[]): boolean {
    return values.every((value: boolean): boolean => {
      return Boolean.toBoolean(value);
    });
  }
}

export default function BooleanToBooleanStaticTest(): void {
  describe("BooleanToBooleanStaticTest", (): void => {
    beforeAll((): void => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0100
     * @tc.name      testBooleanToBooleanRequiredParameter
     * @tc.desc      Boolean.toBoolean(value: boolean) returns the input boolean value directly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRequiredParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(true)).assertEqual(true);
      expect(Boolean.toBoolean(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0200
     * @tc.name      testBooleanToBooleanMissingParameterCompileConstraint
     * @tc.desc      Boolean.toBoolean() without the value parameter is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanMissingParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0300
     * @tc.name      testBooleanToBooleanExtraParameterCompileConstraint
     * @tc.desc      Boolean.toBoolean() passing more than one parameter is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanExtraParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0400
     * @tc.name      testBooleanToBooleanTrueValue
     * @tc.desc      Boolean.toBoolean(true) returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanTrueValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool: boolean = Boolean.toBoolean(true);
      expect(bool).assertEqual(true);
      expect(bool === true).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0500
     * @tc.name      testBooleanToBooleanFalseValue
     * @tc.desc      Boolean.toBoolean(false) returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanFalseValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool: boolean = Boolean.toBoolean(false);
      expect(bool).assertEqual(false);
      expect(bool === false).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0600
     * @tc.name      testBooleanToBooleanRejectsNumberCompileConstraint
     * @tc.desc      Boolean.toBoolean() rejects number parameters by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRejectsNumberCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0700
     * @tc.name      testBooleanToBooleanRejectsStringCompileConstraint
     * @tc.desc      Boolean.toBoolean() rejects string parameters by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRejectsStringCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0800
     * @tc.name      testBooleanToBooleanRejectsNullCompileConstraint
     * @tc.desc      Boolean.toBoolean() rejects null by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRejectsNullCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_0900
     * @tc.name      testBooleanToBooleanRejectsUndefinedCompileConstraint
     * @tc.desc      Boolean.toBoolean() rejects undefined by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRejectsUndefinedCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1000
     * @tc.name      testBooleanToBooleanRejectsObjectCompileConstraint
     * @tc.desc      Boolean.toBoolean() rejects object/array/function inputs by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRejectsObjectCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1100
     * @tc.name      testBooleanToBooleanReturnsBooleanType
     * @tc.desc      Boolean.toBoolean() returns primitive boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanReturnsBooleanType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Boolean.toBoolean(true);
      let result2: boolean = Boolean.toBoolean(false);
      expect(typeof result1).assertEqual("boolean");
      expect(typeof result2).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1200
     * @tc.name      testBooleanToBooleanKeepsInputIdentity
     * @tc.desc      Boolean.toBoolean() returns the exact input value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanKeepsInputIdentity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: boolean = true;
      let input2: boolean = false;
      expect(Boolean.toBoolean(input1) === input1).assertEqual(true);
      expect(Boolean.toBoolean(input2) === input2).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1300
     * @tc.name      testBooleanToBooleanMultipleCallsConsistency
     * @tc.desc      Boolean.toBoolean() returns consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanMultipleCallsConsistency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1: boolean = Boolean.toBoolean(true);
      let bool2: boolean = Boolean.toBoolean(true);
      let bool3: boolean = Boolean.toBoolean(true);
      expect(bool1).assertEqual(true);
      expect(bool2).assertEqual(true);
      expect(bool3).assertEqual(true);
      expect(bool1 === bool2).assertEqual(true);
      expect(bool2 === bool3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1400
     * @tc.name      testBooleanToBooleanPrimitiveOperations
     * @tc.desc      Boolean.toBoolean() result can be used in boolean operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanPrimitiveOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Boolean.toBoolean(true);
      expect(result && true).assertEqual(true);
      expect(result || false).assertEqual(true);
      expect(!result).assertEqual(false);
      expect(result ? "yes" : "no").assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1500
     * @tc.name      testBooleanToBooleanReturnsOnlyBooleanBoundaryValues
     * @tc.desc      Boolean.toBoolean() only returns true or false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanReturnsOnlyBooleanBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: boolean[] = [true, false];
      values.forEach((value: boolean): void => {
        let result: boolean = Boolean.toBoolean(value);
        expect(result).assertEqual(value);
        expect(result === true || result === false).assertEqual(true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1600
     * @tc.name      testBooleanToBooleanComparedWithDoubleNegation
     * @tc.desc      Boolean.toBoolean() matches double negation results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanComparedWithDoubleNegation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1: boolean = true;
      let value2: boolean = false;
      expect(Boolean.toBoolean(value1)).assertEqual(!!value1);
      expect(Boolean.toBoolean(value2)).assertEqual(!!value2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1700
     * @tc.name      testBooleanToBooleanComparedWithInvoke
     * @tc.desc      Boolean.toBoolean() matches Boolean.$_invoke<boolean>() results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanComparedWithInvoke", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: boolean = true;
      let result1: boolean = Boolean.toBoolean(value);
      let result2: boolean = Boolean.$_invoke<boolean>(value);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1800
     * @tc.name      testBooleanToBooleanStaticMethodExists
     * @tc.desc      Boolean.toBoolean is a function and can be called statically.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanStaticMethodExists", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Boolean.toBoolean).assertEqual("function");
      expect(Boolean.toBoolean(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_1900
     * @tc.name      testBooleanToBooleanExplicitConversionScenario
     * @tc.desc      Boolean.toBoolean() can be used as an explicit conversion helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanExplicitConversionScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processToBooleanFlag(true)).assertEqual(true);
      expect(processToBooleanFlag(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2000
     * @tc.name      testBooleanToBooleanTypeSafeConversion
     * @tc.desc      Boolean.toBoolean() can be used in type-safe conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanTypeSafeConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(safeToBoolean(true)).assertEqual(true);
      expect(safeToBoolean(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2100
     * @tc.name      testBooleanToBooleanCallPerformance
     * @tc.desc      Boolean.toBoolean() performance in loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let start: number = Date.now();
      for (let i: int = 0; i < 1000; i++) {
        let value: boolean = i % 2 === 0;
        expect(Boolean.toBoolean(value)).assertEqual(value);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2200
     * @tc.name      testBooleanToBooleanComparedWithDirectUsePerformance
     * @tc.desc      Boolean.toBoolean() compared with direct boolean use.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanComparedWithDirectUsePerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let start1: number = Date.now();
      for (let i: int = 0; i < 1000; i++) {
        let value: boolean = true;
        expect(Boolean.toBoolean(value)).assertEqual(true);
      }
      let start2: number = Date.now();
      for (let i: int = 0; i < 1000; i++) {
        let value: boolean = true;
        expect(value).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2300
     * @tc.name      testBooleanToBooleanContinuousCalls
     * @tc.desc      Boolean.toBoolean() chained continuous calls return same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanContinuousCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: boolean = true;
      let result1: boolean = Boolean.toBoolean(value);
      let result2: boolean = Boolean.toBoolean(result1);
      let result3: boolean = Boolean.toBoolean(result2);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2400
     * @tc.name      testBooleanToBooleanNestedExpression
     * @tc.desc      Boolean.toBoolean() works in nested expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanNestedExpression", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = true;
      let result: boolean = Boolean.toBoolean(Boolean.toBoolean(Boolean.toBoolean(flag)));
      let value: int = Boolean.toBoolean(flag) ? 1 : 0;
      expect(result).assertEqual(true);
      expect(value).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2500
     * @tc.name      testBooleanToBooleanFunctionalProgramming
     * @tc.desc      Boolean.toBoolean() can be used in functional programming patterns.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanFunctionalProgramming", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = mapToBoolean((value: boolean): boolean => {
        return Boolean.toBoolean(value);
      });
      let values: boolean[] = [true, false, true, false];
      let results: boolean[] = values.map((value: boolean): boolean => {
        return Boolean.toBoolean(value);
      });
      expect(result).assertEqual(true);
      expect(results.length).assertEqual(4);
      expect(results[0]).assertEqual(true);
      expect(results[1]).assertEqual(false);
      expect(results[2]).assertEqual(true);
      expect(results[3]).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2600
     * @tc.name      testBooleanToBooleanChainedUsage
     * @tc.desc      Boolean.toBoolean() result can be used in chained expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanChainedUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = true;
      let bool: boolean = Boolean.toBoolean(flag);
      expect(!bool).assertEqual(false);
      expect(bool ? "yes" : "no").assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2700
     * @tc.name      testBooleanToBooleanBestPracticeExplicitConversion
     * @tc.desc      Boolean.toBoolean() as best practice for explicit conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanBestPracticeExplicitConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(evaluateToBoolean(true)).assertEqual("condition is true");
      expect(evaluateToBoolean(false)).assertEqual("condition is false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2800
     * @tc.name      testBooleanToBooleanDataValidation
     * @tc.desc      Boolean.toBoolean() can be used for data validation via utility class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanDataValidation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BooleanToBooleanUtils.normalize(true)).assertEqual(true);
      expect(BooleanToBooleanUtils.normalize(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_2900
     * @tc.name      testBooleanToBooleanApiWrapper
     * @tc.desc      Boolean.toBoolean() can be wrapped in utility methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanApiWrapper", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BooleanToBooleanUtils.normalize(true)).assertEqual(true);
      expect(BooleanToBooleanUtils.invert(true)).assertEqual(false);
      expect(BooleanToBooleanUtils.combine([true, true, true])).assertEqual(true);
      expect(BooleanToBooleanUtils.combine([true, false, true])).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_3000
     * @tc.name      testBooleanToBooleanTypeInference
     * @tc.desc      Boolean.toBoolean() result type inference works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanTypeInference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1: boolean = Boolean.toBoolean(true);
      let result: boolean = processToBooleanFlag(bool1);
      expect(typeof bool1).assertEqual("boolean");
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_STATIC_3100
     * @tc.name      testBooleanToBooleanTypeAssertionNotNeeded
     * @tc.desc      Boolean.toBoolean() returns boolean without type assertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanTypeAssertionNotNeeded", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: boolean = true;
      let result: boolean = Boolean.toBoolean(value);
      expect(result).assertEqual(true);
      expect(typeof result).assertEqual("boolean");
    })
  })
}
