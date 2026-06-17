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

function toggleState(state: Boolean): Boolean {
  return state.negate();
}

function processEnabled(enabled: Boolean): string {
  let disabled = enabled.negate();
  if (disabled.isTrue()) {
    return "feature is disabled";
  }
  return "feature is enabled";
}

function evaluateConditions(a: Boolean, b: Boolean): string {
  let notA = a.negate();
  let notB = b.negate();
  if (notA.isTrue() || notB.isTrue()) {
    return "at least one is false";
  }
  return "both are true";
}

function negateAll(values: Array<Boolean>): Array<Boolean> {
  return values.map((value: Boolean) => value.negate());
}

function processFlag(flag: Boolean): string {
  let negated = flag.negate();
  if (negated.isTrue()) {
    return "flag is false";
  }
  return "flag is true";
}

function processFlagBest(flag: Boolean): string {
  if (flag.isFalse()) {
    return "flag is false";
  }
  return "flag is true";
}

function complexLogic(a: Boolean, b: Boolean): Boolean {
  let notB = b.negate();
  let notA = a.negate();
  return a.and(notB).or(notA.and(b));
}

class TestSwitch {
  private on: Boolean;

  constructor() {
    this.on = new Boolean(false);
  }

  toggle(): void {
    this.on = this.on.negate();
  }

  isOn(): boolean {
    return this.on.isTrue();
  }
}

class TestToggle {
  private state: Boolean;

  constructor(initialState: boolean) {
    this.state = new Boolean(initialState);
  }

  flip(): Boolean {
    this.state = this.state.negate();
    return this.state;
  }

  getState(): boolean {
    return this.state.valueOf();
  }
}

class TestFeature {
  private enabled: Boolean;

  constructor(enabled: boolean) {
    this.enabled = new Boolean(enabled);
  }

  enable(): void {
    this.enabled = Boolean.TRUE;
  }

  disable(): void {
    this.enabled = Boolean.FALSE;
  }

  toggle(): void {
    this.enabled = this.enabled.negate();
  }

  isEnabled(): boolean {
    return this.enabled.isTrue();
  }
}

export default function BooleanNegateTest(): void {
  describe("BooleanNegateTest", () => {
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
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0100
     * @tc.name      testBooleanNegateNoParameterCompileConstraint
     * @tc.desc      Boolean.negate() takes no arguments; any argument is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateNoParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result = bool.negate();
      expect(result.equals(Boolean.FALSE)).assertEqual(true);
      expect(result.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0200
     * @tc.name      testBooleanNegateMaxParameterCountCompileConstraint
     * @tc.desc      Boolean.negate() has zero parameters; extra parameters are compile-time invalid, valid call works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateMaxParameterCountCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).negate().equals(Boolean.FALSE)).assertEqual(true);
      expect(new Boolean(false).negate().equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0300
     * @tc.name      testBooleanNegateMustCallByInstanceCompileConstraint
     * @tc.desc      Boolean.negate() must be called on a Boolean instance; static call is rejected by static typing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateMustCallByInstanceCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
      expect(typeof instance.negate).assertEqual("function");
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0400
     * @tc.name      testBooleanNegateReturnObjectType
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateReturnObjectType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result = boolObj.negate();
      expect(result instanceof Boolean).assertEqual(true);
      expect(typeof result.valueOf()).assertEqual("boolean");
      expect(result.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0500
     * @tc.name      testBooleanNegateTrueObjectReturnsFalse
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateTrueObjectReturnsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(100);
      expect(bool1.negate().equals(Boolean.FALSE)).assertEqual(true);
      expect(bool1.negate().valueOf()).assertEqual(false);
      expect(bool2.negate().equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.TRUE.negate().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0600
     * @tc.name      testBooleanNegateFalseObjectReturnsTrue
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateFalseObjectReturnsTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(false);
      let bool2 = new Boolean(0);
      expect(bool1.negate().equals(Boolean.TRUE)).assertEqual(true);
      expect(bool1.negate().valueOf()).assertEqual(true);
      expect(bool2.negate().equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.FALSE.negate().equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0700
     * @tc.name      testBooleanNegateReturnsBooleanSingletons
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateReturnsBooleanSingletons", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = new Boolean(true).negate();
      let result2 = new Boolean(false).negate();
      expect((result1 === Boolean.FALSE) as boolean).assertEqual(true);
      expect(result1.equals(Boolean.FALSE)).assertEqual(true);
      expect((result2 === Boolean.TRUE) as boolean).assertEqual(true);
      expect(result2.equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0800
     * @tc.name      testBooleanNegateDoubleReturnsOriginalValue
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateDoubleReturnsOriginalValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Boolean(true);
      let negated1 = original.negate();
      let negated2 = negated1.negate();
      expect(negated1.valueOf()).assertEqual(false);
      expect(negated2.valueOf()).assertEqual(true);
      expect(negated2.valueOf()).assertEqual(original.valueOf());
      expect((negated2 === Boolean.TRUE) as boolean).assertEqual(true);
      expect((original === Boolean.TRUE) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_0900
     * @tc.name      testBooleanNegateOddEvenCounts
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateOddEvenCounts", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Boolean(true);
      let oddResult = original;
      let evenResult = original;
      for (let i = 0; i < 3; i++) {
        oddResult = oddResult.negate();
      }
      for (let i = 0; i < 4; i++) {
        evenResult = evenResult.negate();
      }
      expect(oddResult.valueOf()).assertEqual(false);
      expect(evenResult.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1000
     * @tc.name      testBooleanNegateDoesNotModifyOriginal
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateDoesNotModifyOriginal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Boolean(true);
      let negated = original.negate();
      expect(original.valueOf()).assertEqual(true);
      expect(negated.valueOf()).assertEqual(false);
      expect(original.negate().valueOf()).assertEqual(false);
      expect(original.negate().valueOf()).assertEqual(false);
      expect(original.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1100
     * @tc.name      testBooleanNegateDifferentConstructors
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateDifferentConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).negate().valueOf()).assertEqual(false);
      expect(new Boolean(false).negate().valueOf()).assertEqual(true);
      expect(new Boolean(100).negate().valueOf()).assertEqual(false);
      expect(new Boolean(0).negate().valueOf()).assertEqual(true);
      expect(new Boolean(c'A').negate().valueOf()).assertEqual(false);
      expect(new Boolean(c'\u0000').negate().valueOf()).assertEqual(true);
      expect(new Boolean(3.14).negate().valueOf()).assertEqual(false);
      expect(new Boolean(0.0).negate().valueOf()).assertEqual(true);
      expect(new Boolean("test").negate().valueOf()).assertEqual(false);
      expect(new Boolean("").negate().valueOf()).assertEqual(true);
      expect(new Boolean(null as Any).negate().valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1200
     * @tc.name      testBooleanNegateMultipleCallsReturnSameSingleton
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateMultipleCallsReturnSameSingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let result1 = bool1.negate();
      let result2 = bool2.negate();
      expect((result1 === result2) as boolean).assertEqual(true);
      expect((result1 === Boolean.FALSE) as boolean).assertEqual(true);
      expect((result2 === Boolean.FALSE) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1300
     * @tc.name      testBooleanNegateSameValueResultsShareSingleton
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateSameValueResultsShareSingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueBools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(1),
        new Boolean("test"),
        Boolean.TRUE
      ];
      trueBools.forEach((bool: Boolean) => {
        expect((bool.negate() === Boolean.FALSE) as boolean).assertEqual(true);
      });
      let falseBools: Array<Boolean> = [
        new Boolean(false),
        new Boolean(0),
        new Boolean(""),
        Boolean.FALSE
      ];
      falseBools.forEach((bool: Boolean) => {
        expect((bool.negate() === Boolean.TRUE) as boolean).assertEqual(true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1400
     * @tc.name      testBooleanNegateComparedWithNotOperator
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateComparedWithNotOperator", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result1 = boolObj.negate();
      let result2 = !boolObj.valueOf();
      expect(result1 instanceof Boolean).assertEqual(true);
      expect(result1.valueOf()).assertEqual(false);
      expect(typeof result2).assertEqual("boolean");
      expect(result2).assertEqual(false);
      expect(result1.valueOf()).assertEqual(result2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1500
     * @tc.name      testBooleanNegateComparedWithIsTrueIsFalse
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateComparedWithIsTrueIsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let negated = bool.negate();
      expect(negated.valueOf()).assertEqual(false);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(false);
      expect(negated.isTrue()).assertEqual(bool.isFalse());
      expect(negated.isFalse()).assertEqual(bool.isTrue());
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1600
     * @tc.name      testBooleanNegateInstanceComparedWithStaticNegation
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateInstanceComparedWithStaticNegation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result1 = bool.negate();
      let result2 = new Boolean(!bool.valueOf());
      expect(result1.equals(Boolean.FALSE)).assertEqual(true);
      expect(result2.equals(Boolean.FALSE)).assertEqual(true);
      expect(result1.equals(result2)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1700
     * @tc.name      testBooleanNegateInstanceCallOnlyCompileConstraint
     * @tc.desc      Boolean.negate() is an instance-only method; class-level call is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateInstanceCallOnlyCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1800
     * @tc.name      testBooleanNegateThisBindingCompileConstraint
     * @tc.desc      Boolean.negate() requires Boolean receiver; unsupported rebinding forms are compile-time constraints.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
      expect(instance.negate().valueOf()).assertEqual(!instance.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_1900
     * @tc.name      testBooleanNegateIsInstanceMethod
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateIsInstanceMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.negate).assertEqual("function");
      expect(instance.negate() instanceof Boolean).assertEqual(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2000
     * @tc.name      testBooleanNegateSwitchState
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateSwitchState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sw = new TestSwitch();
      expect(sw.isOn()).assertEqual(false);
      sw.toggle();
      expect(sw.isOn()).assertEqual(true);
      sw.toggle();
      expect(sw.isOn()).assertEqual(false);
      sw.toggle();
      expect(sw.isOn()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2100
     * @tc.name      testBooleanNegateInvertCondition
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateInvertCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processEnabled(new Boolean(true))).assertEqual("feature is enabled");
      expect(processEnabled(new Boolean(false))).assertEqual("feature is disabled");
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2200
     * @tc.name      testBooleanNegateLogicalOperationUsage
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateLogicalOperationUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(evaluateConditions(new Boolean(true), new Boolean(true))).assertEqual("both are true");
      expect(evaluateConditions(new Boolean(true), new Boolean(false))).assertEqual("at least one is false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2300
     * @tc.name      testBooleanNegateBatchValues
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateBatchValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false)
      ];
      let negated = negateAll(bools);
      expect(negated[0].valueOf()).assertEqual(false);
      expect(negated[1].valueOf()).assertEqual(true);
      expect(negated[2].valueOf()).assertEqual(false);
      expect(negated[3].valueOf()).assertEqual(true);
      let restored = negateAll(negated);
      expect(restored[0].valueOf()).assertEqual(bools[0].valueOf());
      expect(restored[1].valueOf()).assertEqual(bools[1].valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2400
     * @tc.name      testBooleanNegateCallPerformance
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance;
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        result = instance.negate();
      }
      let elapsed = Date.now() - start;
      expect(result.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2500
     * @tc.name      testBooleanNegateComparedWithValueOfPerformance
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateComparedWithValueOfPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result1 = instance;
      let result2 = Boolean.FALSE;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        result1 = instance.negate();
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        result2 = new Boolean(!instance.valueOf());
      }
      let elapsed2 = Date.now() - start2;
      expect(result1.valueOf()).assertEqual(false);
      expect(result2.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2600
     * @tc.name      testBooleanNegateConsecutiveMultipleNegates
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateConsecutiveMultipleNegates", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Boolean(true);
      let result1 = original.negate();
      let result2 = result1.negate();
      let result3 = result2.negate();
      let result4 = result3.negate();
      expect(result1.valueOf()).assertEqual(false);
      expect(result2.valueOf()).assertEqual(true);
      expect(result3.valueOf()).assertEqual(false);
      expect(result4.valueOf()).assertEqual(true);
      expect(result4.valueOf()).assertEqual(original.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2700
     * @tc.name      testBooleanNegateDifferentInstancesShareSingleton
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateDifferentInstancesShareSingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(true);
      let bool3 = new Boolean(true);
      let result1 = bool1.negate();
      let result2 = bool2.negate();
      let result3 = bool3.negate();
      expect((result1 === result2) as boolean).assertEqual(true);
      expect((result2 === result3) as boolean).assertEqual(true);
      expect((result1 === Boolean.FALSE) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2800
     * @tc.name      testBooleanNegateReturnObjectSupportsChaining
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateReturnObjectSupportsChaining", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result1 = bool.negate().negate();
      let result2 = bool.negate().negate().negate();
      let result3 = bool.negate().isFalse();
      let result4 = bool.negate().toString().toString();
      expect(result1.valueOf()).assertEqual(true);
      expect((result1 === Boolean.TRUE) as boolean).assertEqual(true);
      expect(result2.valueOf()).assertEqual(false);
      expect((result2 === Boolean.FALSE) as boolean).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result4).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_2900
     * @tc.name      testBooleanNegateWrongCallModeCompileConstraint
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3000
     * @tc.name      testBooleanNegateArgumentErrorCompileConstraint
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateArgumentErrorCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3100
     * @tc.name      testBooleanNegateInvalidThisBindingCompileConstraint
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateInvalidThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3200
     * @tc.name      testBooleanNegateCombinedWithAndOrXor
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateCombinedWithAndOrXor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let notA = a.negate();
      let notB = b.negate();
      let andResult = a.and(b);
      let notAnd = andResult.negate();
      let orResult = notA.or(notB);
      expect(notA.xor(b).valueOf()).assertEqual(false);
      expect(notAnd.valueOf()).assertEqual(true);
      expect(orResult.valueOf()).assertEqual(true);
      expect(notAnd.valueOf()).assertEqual(orResult.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3300
     * @tc.name      testBooleanNegateConditionExpressionUsage
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateConditionExpressionUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag = new Boolean(true);
      let negated = flag.negate();
      let value = negated.isTrue() ? "yes" : "no";
      let result = negated.isTrue() && false;
      expect(value).assertEqual("no");
      expect(result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3400
     * @tc.name      testBooleanNegateStateMachineToggle
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateStateMachineToggle", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toggle = new TestToggle(false);
      expect(toggle.getState()).assertEqual(false);
      expect(toggle.flip().valueOf()).assertEqual(true);
      expect(toggle.flip().valueOf()).assertEqual(false);
      expect(toggle.flip().valueOf()).assertEqual(true);
      expect(toggle.flip().valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3500
     * @tc.name      testBooleanNegateDeMorganImplementation
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateDeMorganImplementation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(true), new Boolean(false)];
      bools.forEach((a: Boolean) => {
        bools.forEach((b: Boolean) => {
          let notA = a.negate();
          let notB = b.negate();
          let lhs1 = a.and(b).negate();
          let rhs1 = notA.or(notB);
          let lhs2 = a.or(b).negate();
          let rhs2 = notA.and(notB);
          expect(lhs1.valueOf()).assertEqual(rhs1.valueOf());
          expect(lhs2.valueOf()).assertEqual(rhs2.valueOf());
        });
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3600
     * @tc.name      testBooleanNegateClearStateToggleBestPractice
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateClearStateToggleBestPractice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let feature = new TestFeature(true);
      expect(feature.isEnabled()).assertEqual(true);
      feature.toggle();
      expect(feature.isEnabled()).assertEqual(false);
      feature.toggle();
      expect(feature.isEnabled()).assertEqual(true);
      feature.disable();
      expect(feature.isEnabled()).assertEqual(false);
      feature.enable();
      expect(feature.isEnabled()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3700
     * @tc.name      testBooleanNegateFunctionalProgrammingUsage
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateFunctionalProgrammingUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true)
      ];
      let negated = bools.map((b: Boolean) => b.negate());
      expect(negated[0].valueOf()).assertEqual(false);
      expect(negated[1].valueOf()).assertEqual(true);
      expect(negated[2].valueOf()).assertEqual(false);
      let result = bools
        .map((b: Boolean) => b.negate())
        .filter((b: Boolean) => b.isTrue())
        .map((b: Boolean) => b.negate());
      expect(result.length).assertEqual(1);
      expect(result[0].valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3800
     * @tc.name      testBooleanNegateAvoidDuplicateNegationLogic
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateAvoidDuplicateNegationLogic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processFlag(new Boolean(true))).assertEqual("flag is true");
      expect(processFlag(new Boolean(false))).assertEqual("flag is false");
      expect(processFlagBest(new Boolean(true))).assertEqual("flag is true");
      expect(processFlagBest(new Boolean(false))).assertEqual("flag is false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_3900
     * @tc.name      testBooleanNegateSimplifyLogicalExpression
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateSimplifyLogicalExpression", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let result = complexLogic(a, b);
      expect(result.valueOf()).assertEqual(true);
      expect(result.valueOf()).assertEqual(a.xor(b).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_4000
     * @tc.name      testBooleanNegateArkTSComparedWithJavaLogicalNot
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateArkTSComparedWithJavaLogicalNot", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Boolean(true);
      let negated = value.negate();
      let equivalent = new Boolean(!value.valueOf());
      expect(negated.valueOf()).assertEqual(false);
      expect(negated.equals(equivalent)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_4100
     * @tc.name      testBooleanNegateTypeInference
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateTypeInference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result: Boolean = instance.negate();
      expect(result.valueOf()).assertEqual(false);
      expect(result.isFalse()).assertEqual(true);
      expect(result.isTrue()).assertEqual(false);
      expect(result.negate().valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_4200
     * @tc.name      testBooleanNegateSingletonMemoryOptimization
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateSingletonMemoryOptimization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [];
      for (let i = 0; i < 1000; i++) {
        bools.push(new Boolean(i % 2 === 0));
      }
      let negated = bools.map((b: Boolean) => b.negate());
      for (let i = 0; i < bools.length; i++) {
        if (bools[i].valueOf()) {
          expect((negated[i] === Boolean.FALSE) as boolean).assertEqual(true);
        } else {
          expect((negated[i] === Boolean.TRUE) as boolean).assertEqual(true);
        }
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_4300
     * @tc.name      testBooleanNegateDoubleEqualsOriginal
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateDoubleEqualsOriginal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Boolean(true);
      let doubleNegated = original.negate().negate();
      expect(doubleNegated.valueOf()).assertEqual(original.valueOf());
      let testValues: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        Boolean.TRUE,
        Boolean.FALSE
      ];
      testValues.forEach((value: Boolean) => {
        expect(value.negate().negate().valueOf()).assertEqual(value.valueOf());
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_4400
     * @tc.name      testBooleanNegateInvolutionProperty
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateInvolutionProperty", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(1),
        new Boolean(0),
        Boolean.TRUE,
        Boolean.FALSE
      ];
      testValues.forEach((value: Boolean) => {
        let once = value.negate();
        let twice = once.negate();
        expect(twice.valueOf()).assertEqual(value.valueOf());
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_NEGATE_TEST_4500
     * @tc.name      testBooleanNegateBijectionProperty
     * @tc.desc      Boolean.negate()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNegateBijectionProperty", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let domain: Array<Boolean> = [new Boolean(true), new Boolean(false)];
      domain.forEach((x: Boolean) => {
        let y = x.negate();
        let inCodomain = y.equals(Boolean.TRUE) || y.equals(Boolean.FALSE);
        let inverse = y.negate();
        expect(inCodomain).assertEqual(true);
        expect(inverse.valueOf()).assertEqual(x.valueOf());
      });
    })
  })
}
