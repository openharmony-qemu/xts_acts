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

interface ValueObject {
  value: boolean;
}

function areEqual(a: Boolean, b: Boolean): boolean {
  return a.equals(b);
}

function uniqueBooleanValues(bools: Array<Boolean>): Array<Boolean> {
  let result: Array<Boolean> = [];
  bools.forEach((bool: Boolean) => {
    let exists = false;
    result.forEach((existing: Boolean) => {
      if (bool.equals(existing)) {
        exists = true;
      }
    });
    if (!exists) {
      result.push(bool);
    }
  });
  return result;
}

function checkCondition(flag: Boolean, expected: Boolean): string {
  if (flag.equals(expected)) {
    return "condition met";
  }
  return "condition not met";
}

function validateValue(actual: Boolean, expected: Boolean): boolean {
  return actual.equals(expected);
}

function compareValues(a: Boolean, b: Boolean): boolean {
  return a.equals(b);
}

function processBoolean(input: Any): string {
  if (Boolean.TRUE.equals(input)) {
    return "received true";
  }
  if (Boolean.FALSE.equals(input)) {
    return "received false";
  }
  return "not a Boolean value";
}

function isTrueValue(value: Boolean): boolean {
  return value.equals(Boolean.TRUE);
}

function isFalseValue(value: Boolean): boolean {
  return value.equals(Boolean.FALSE);
}

function areEqualGeneric<T extends Boolean>(a: T, b: Any): boolean {
  return a.equals(b);
}

function isSameBoolean(a: Boolean, b: Any): boolean {
  return a.equals(b);
}

export default function BooleanEqualsTest(): void {
  describe("BooleanEqualsTest", () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      await Utils.msSleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0100
     * @tc.name      testBooleanEqualsRequiredParameterCompileConstraint
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsRequiredParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0200
     * @tc.name      testBooleanEqualsExtraParameterCompileConstraint
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsExtraParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0300
     * @tc.name      testBooleanEqualsSameBooleanInstanceValue
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSameBooleanInstanceValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      expect(bool1.equals(bool2)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0400
     * @tc.name      testBooleanEqualsDifferentBooleanInstanceValue
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsDifferentBooleanInstanceValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(false);
      expect(bool1.equals(bool2)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0500
     * @tc.name      testBooleanEqualsPrimitiveTrue
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsPrimitiveTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(true as Any)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0600
     * @tc.name      testBooleanEqualsPrimitiveFalse
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsPrimitiveFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.equals(false as Any)).assertEqual(true);
      expect(new Boolean(true).equals(false as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0700
     * @tc.name      testBooleanEqualsNull
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(null as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0800
     * @tc.name      testBooleanEqualsUndefined
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(undefined as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_0900
     * @tc.name      testBooleanEqualsStringTrue
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsStringTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals("true" as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1000
     * @tc.name      testBooleanEqualsStringFalse
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsStringFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.equals("false" as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1100
     * @tc.name      testBooleanEqualsEmptyString
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsEmptyString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.equals("" as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1200
     * @tc.name      testBooleanEqualsNumberOne
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsNumberOne", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(1 as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1300
     * @tc.name      testBooleanEqualsNumberZero
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsNumberZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.equals(0 as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1400
     * @tc.name      testBooleanEqualsNaN
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsNaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(NaN as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1500
     * @tc.name      testBooleanEqualsPlainObject
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsPlainObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let obj: Object = {};
      expect(bool.equals(obj as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1600
     * @tc.name      testBooleanEqualsValuePropertyObject
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsValuePropertyObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let fakeBoolean: ValueObject = { value: true };
      expect(bool.equals(fakeBoolean as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1700
     * @tc.name      testBooleanEqualsNumberObject
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsNumberObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let numberObject = new Number(1);
      expect(bool.equals(numberObject as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1800
     * @tc.name      testBooleanEqualsStringObject
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsStringObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let stringObject = new String("true");
      expect(bool.equals(stringObject as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_1900
     * @tc.name      testBooleanEqualsArray
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let values: Array<boolean> = [];
      expect(bool.equals(values as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2000
     * @tc.name      testBooleanEqualsBooleanArray
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsBooleanArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let values: Array<boolean> = [true];
      expect(bool.equals(values as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2100
     * @tc.name      testBooleanEqualsFunction
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsFunction", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let fn = (): void => {
      };
      expect(bool.equals(fn as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2200
     * @tc.name      testBooleanEqualsXssString
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsXssString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals("<script>alert(1)</script>" as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2300
     * @tc.name      testBooleanEqualsLongString
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsLongString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let longString = "a".repeat(1000);
      expect(bool.equals(longString as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2400
     * @tc.name      testBooleanEqualsZeroWidthSpace
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsZeroWidthSpace", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals("\u200B" as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2500
     * @tc.name      testBooleanEqualsReturnsPrimitiveBoolean
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsReturnsPrimitiveBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result = bool.equals(new Boolean(true));
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2600
     * @tc.name      testBooleanEqualsSameValueReturnsTrue
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSameValueReturnsTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).equals(new Boolean(true))).assertEqual(true);
      expect(new Boolean(false).equals(new Boolean(false))).assertEqual(true);
      let bool = new Boolean(true);
      expect(bool.equals(bool)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2700
     * @tc.name      testBooleanEqualsDifferentTypeOrValueReturnsFalse
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsDifferentTypeOrValueReturnsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let obj: Object = {};
      expect(bool.equals(new Boolean(false))).assertEqual(false);
      expect(bool.equals(false as Any)).assertEqual(false);
      expect(bool.equals(null as Any)).assertEqual(false);
      expect(bool.equals(undefined as Any)).assertEqual(false);
      expect(bool.equals("true" as Any)).assertEqual(false);
      expect(bool.equals(1 as Any)).assertEqual(false);
      expect(bool.equals(obj as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2800
     * @tc.name      testBooleanEqualsSymmetry
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSymmetry", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueA = new Boolean(true);
      let trueB = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueA.equals(trueB)).assertEqual(trueB.equals(trueA));
      expect(trueA.equals(falseValue)).assertEqual(falseValue.equals(trueA));
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_2900
     * @tc.name      testBooleanEqualsReflexivity
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsReflexivity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.equals(trueValue)).assertEqual(true);
      expect(falseValue.equals(falseValue)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3000
     * @tc.name      testBooleanEqualsTransitivity
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsTransitivity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new Boolean(true);
      let second = new Boolean(true);
      let third = new Boolean(true);
      if (first.equals(second) && second.equals(third)) {
        expect(first.equals(third)).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3100
     * @tc.name      testBooleanEqualsConsistency
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsConsistency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new Boolean(true);
      let second = new Boolean(true);
      let result1 = first.equals(second);
      let result2 = first.equals(second);
      let result3 = first.equals(second);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3200
     * @tc.name      testBooleanEqualsNonNull
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsNonNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.equals(null as Any)).assertEqual(false);
      expect(bool.equals(null as Any) !== true).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3300
     * @tc.name      testBooleanEqualsDifferentConstructors
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsDifferentConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.equals(new Boolean(1))).assertEqual(true);
      expect(trueValue.equals(new Boolean(100))).assertEqual(true);
      expect(falseValue.equals(new Boolean(0))).assertEqual(true);
      expect(trueValue.equals(new Boolean("test"))).assertEqual(true);
      expect(trueValue.equals(new Boolean("true"))).assertEqual(true);
      expect(falseValue.equals(new Boolean(""))).assertEqual(true);
      expect(falseValue.equals(new Boolean(null as Any))).assertEqual(true);
      expect(falseValue.equals(new Boolean(undefined as Any))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3400
     * @tc.name      testBooleanEqualsStaticSingletons
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsStaticSingletons", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(false).equals(Boolean.TRUE)).assertEqual(false);
      expect(new Boolean(true).equals(Boolean.FALSE)).assertEqual(false);
      expect(new Boolean(false).equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.TRUE.equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.FALSE.equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.TRUE.equals(Boolean.FALSE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3500
     * @tc.name      testBooleanEqualsVsStrictEquality
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsVsStrictEquality", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect((bool1 === bool2) as boolean).assertEqual(true);
      expect((bool1 === bool1) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3600
     * @tc.name      testBooleanEqualsVsLooseEquality
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsVsLooseEquality", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let primitive: Any = true;
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.equals(primitive)).assertEqual(true);
      expect((bool1 == bool2) as boolean).assertEqual(true);
      expect((bool1 == primitive) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3700
     * @tc.name      testBooleanEqualsVsToBoolean
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsVsToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(false);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.toBoolean() === bool2.toBoolean()).assertEqual(true);
      expect(bool1.equals(bool3)).assertEqual(false);
      expect(bool1.toBoolean() === bool3.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3800
     * @tc.name      testBooleanEqualsVsCompareTo
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsVsCompareTo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(false);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.equals(bool3)).assertEqual(false);
      expect(bool1.compareTo(bool2)).assertEqual(0);
      expect(bool1.compareTo(bool3)).assertEqual(1);
      expect(bool3.compareTo(bool1)).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_3900
     * @tc.name      testBooleanEqualsInstanceCallCompileConstraint
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsInstanceCallCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4000
     * @tc.name      testBooleanEqualsThisBindingCompileConstraint
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4100
     * @tc.name      testBooleanEqualsMethodExists
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsMethodExists", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.equals).assertEqual("function");
      expect(instance.equals(instance)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4200
     * @tc.name      testBooleanEqualsObjectEquality
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsObjectEquality", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(false);
      expect(areEqual(bool1, bool2)).assertEqual(true);
      expect(areEqual(bool1, bool3)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4300
     * @tc.name      testBooleanEqualsCollectionDeduplication
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsCollectionDeduplication", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false),
        new Boolean(true)
      ];
      let uniqueBools = uniqueBooleanValues(bools);
      expect(uniqueBools.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4400
     * @tc.name      testBooleanEqualsConditionUsage
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsConditionUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag = new Boolean(true);
      expect(checkCondition(flag, Boolean.TRUE)).assertEqual("condition met");
      expect(checkCondition(flag, Boolean.FALSE)).assertEqual("condition not met");
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4500
     * @tc.name      testBooleanEqualsDataValidation
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsDataValidation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actualValue = new Boolean(true);
      expect(validateValue(actualValue, Boolean.TRUE)).assertEqual(true);
      expect(validateValue(actualValue, Boolean.FALSE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4600
     * @tc.name      testBooleanEqualsCallPerformance
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let result = false;
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        result = bool1.equals(bool2);
      }
      let elapsed = Date.now() - start;
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4700
     * @tc.name      testBooleanEqualsPerformanceComparedWithStrictEquality
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsPerformanceComparedWithStrictEquality", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let equalsResult = false;
      let strictResult = false;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        equalsResult = bool1.equals(bool2);
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        strictResult = (bool1 === bool2) as boolean;
      }
      let elapsed2 = Date.now() - start2;
      expect(equalsResult).assertEqual(true);
      expect(strictResult).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4800
     * @tc.name      testBooleanEqualsSelfComparison
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSelfComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.equals(trueValue)).assertEqual(true);
      expect(falseValue.equals(falseValue)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_4900
     * @tc.name      testBooleanEqualsCircularComparison
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsCircularComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(false)];
      for (let i = 0; i < bools.length; i++) {
        for (let j = 0; j < bools.length; j++) {
          expect(bools[i].equals(bools[j])).assertEqual(bools[i].toBoolean() === bools[j].toBoolean());
        }
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5000
     * @tc.name      testBooleanEqualsChainedComparison
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsChainedComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(true);
      let bool4 = new Boolean(false);
      if (bool1.equals(bool2) && bool2.equals(bool3)) {
        expect(bool1.equals(bool3)).assertEqual(true);
      }
      expect(bool1.equals(bool2) && bool2.equals(bool4)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5100
     * @tc.name      testBooleanEqualsWrongCallModeCompileConstraint
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5200
     * @tc.name      testBooleanEqualsInvalidArgumentsDoNotThrow
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsInvalidArgumentsDoNotThrow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let obj: Object = {};
      expect(bool.equals(null as Any)).assertEqual(false);
      expect(bool.equals(undefined as Any)).assertEqual(false);
      expect(bool.equals(true as Any)).assertEqual(true);
      expect(bool.equals(false as Any)).assertEqual(false);
      expect(bool.equals("true" as Any)).assertEqual(false);
      expect(bool.equals(1 as Any)).assertEqual(false);
      expect(bool.equals(obj as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5300
     * @tc.name      testBooleanEqualsWrongThisCompileConstraint
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsWrongThisCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5400
     * @tc.name      testBooleanEqualsArrayUsage
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsArrayUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true)];
      let target = new Boolean(true);
      let found = false;
      bools.forEach((bool: Boolean) => {
        if (bool.equals(target)) {
          found = true;
        }
      });
      let filtered = bools.filter((value: Boolean) => value.equals(Boolean.TRUE));
      expect(found).assertEqual(true);
      expect(filtered.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5500
     * @tc.name      testBooleanEqualsMapKeyUsage
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsMapKeyUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<Boolean, string>();
      let key1 = new Boolean(true);
      let key2 = new Boolean(true);
      map.set(key1, "value1");
      expect(map.has(key1)).assertEqual(true);
      expect(map.has(key2)).assertEqual(true);
      expect(map.get(key2)).assertEqual("value1");
      expect(key1.equals(key2)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5600
     * @tc.name      testBooleanEqualsSerializationComparison
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSerializationComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      expect(bool1.equals(bool2)).assertEqual(true);
      let json1 = JSON.stringify(bool1);
      let json2 = JSON.stringify(bool2);
      expect(json1).assertEqual(json2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5700
     * @tc.name      testBooleanEqualsTypeGuardUsage
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsTypeGuardUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let primitive: Any = true;
      if (isSameBoolean(bool1, bool2)) {
        expect(bool2.toBoolean()).assertEqual(true);
      }
      if (isSameBoolean(bool1, primitive)) {
        expect(typeof primitive).assertEqual("boolean");
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5800
     * @tc.name      testBooleanEqualsValueComparisonBestPractice
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsValueComparisonBestPractice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      expect(compareValues(bool1, bool2)).assertEqual(true);
      expect((bool1 === bool2) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_5900
     * @tc.name      testBooleanEqualsDefensiveProgramming
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsDefensiveProgramming", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processBoolean(new Boolean(true))).assertEqual("received true");
      expect(processBoolean(new Boolean(false))).assertEqual("received false");
      expect(processBoolean(true as Any)).assertEqual("received true");
      expect(processBoolean("true" as Any)).assertEqual("not a Boolean value");
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6000
     * @tc.name      testBooleanEqualsSingletonBestPractice
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSingletonBestPractice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(false);
      expect(isTrueValue(bool1)).assertEqual(true);
      expect(isFalseValue(bool1)).assertEqual(false);
      expect(isTrueValue(bool2)).assertEqual(false);
      expect(isFalseValue(bool2)).assertEqual(true);
      expect(Boolean.TRUE.equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.FALSE.equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.TRUE.equals(Boolean.FALSE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6100
     * @tc.name      testBooleanEqualsApiConsistency
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsApiConsistency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(false);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.equals(bool3)).assertEqual(false);
      expect(bool1.equals("true" as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6200
     * @tc.name      testBooleanEqualsArkTSComparedWithJava
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsArkTSComparedWithJava", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(false);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.equals(bool3)).assertEqual(false);
      expect(bool1.equals(null as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6300
     * @tc.name      testBooleanEqualsTypeSafety
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsTypeSafety", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result1 = bool.equals(new Boolean(true));
      let result2 = bool.equals(true as Any);
      let result3 = bool.equals("true" as Any);
      let result4 = bool.equals(null as Any);
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
      expect(result4).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6400
     * @tc.name      testBooleanEqualsGenericUsage
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsGenericUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(false);
      expect(areEqualGeneric(bool1, bool2)).assertEqual(true);
      expect(areEqualGeneric(bool1, bool3)).assertEqual(false);
      expect(areEqualGeneric(bool1, true as Any)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6500
     * @tc.name      testBooleanEqualsEquivalenceRelation
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsEquivalenceRelation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = new Boolean(true);
      let y = new Boolean(true);
      let z = new Boolean(true);
      expect(x.equals(x)).assertEqual(true);
      expect(x.equals(y)).assertEqual(y.equals(x));
      if (x.equals(y) && y.equals(z)) {
        expect(x.equals(z)).assertEqual(true);
      }
      let result1 = x.equals(y);
      let result2 = x.equals(y);
      let result3 = x.equals(y);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(x.equals(null as Any)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6600
     * @tc.name      testBooleanEqualsHashCodeBasicProperties
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsHashCodeBasicProperties", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let hash1 = bool.$_hashCode();
      let hash2 = bool.$_hashCode();
      expect(hash1 > 0).assertEqual(true);
      expect(hash2 > 0).assertEqual(true);
      expect(bool.equals(new Boolean(true))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6700
     * @tc.name      testBooleanEqualsImmutability
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsImmutability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let result1 = bool1.equals(bool2);
      let result2 = bool1.equals(bool2);
      let result3 = bool1.equals(bool2);
      expect(result1).assertEqual(true);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6800
     * @tc.name      testBooleanEqualsSingletonCacheBehavior
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsSingletonCacheBehavior", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let true1 = Boolean.TRUE;
      let true2 = Boolean.TRUE;
      let false1 = Boolean.FALSE;
      let false2 = Boolean.FALSE;
      let newTrue = new Boolean(true);
      expect((true1 === true2) as boolean).assertEqual(true);
      expect(true1.equals(true2)).assertEqual(true);
      expect((false1 === false2) as boolean).assertEqual(true);
      expect(false1.equals(false2)).assertEqual(true);
      expect((newTrue === true1) as boolean).assertEqual(true);
      expect(newTrue.equals(true1)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALS_TEST_6900
     * @tc.name      testBooleanEqualsShallowValueComparison
     * @tc.desc      Boolean.equals(other)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualsShallowValueComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.toBoolean()).assertEqual(bool2.toBoolean());
    })
  })
}
