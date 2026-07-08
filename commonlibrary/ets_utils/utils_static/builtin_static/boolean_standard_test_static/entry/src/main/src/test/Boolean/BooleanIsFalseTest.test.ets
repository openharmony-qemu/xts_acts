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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

function filterFalseValues(values: Array<Boolean>): Array<Boolean> {
  return values.filter((value: Boolean) => value.isFalse());
}

function genericIsFalse<T extends Boolean>(value: T): boolean {
  return value.isFalse();
}

function processFlag(flag: Boolean): string {
  if (flag.isFalse()) {
    return "flag is false";
  }
  return "flag is true";
}

class BooleanSwitch {
  private on: Boolean = new Boolean(false);

  turnOn(): void {
    this.on = Boolean.TRUE;
  }

  turnOff(): void {
    this.on = Boolean.FALSE;
  }

  isOff(): boolean {
    return this.on.isFalse();
  }
}

interface BooleanConfig {
  debug: Boolean;
  verbose: Boolean;
  enabled: Boolean;
}

function validateDisabledConfig(config: BooleanConfig): Array<string> {
  let issues: Array<string> = [];
  if (config.enabled.isFalse()) {
    issues.push("Feature is disabled");
  }
  if (config.debug.isTrue() && config.verbose.isFalse()) {
    issues.push("Debug mode requires verbose mode");
  }
  return issues;
}

function describeBooleanValue(value: Boolean): string {
  if (value.isFalse()) {
    return "value is false";
  }
  if (value.isTrue()) {
    return "value is true";
  }
  return "unexpected";
}

function processIfFalse(value: Boolean): string | null {
  if (value.isFalse()) {
    return "processed false value";
  }
  return null;
}

function checkAndProcess(value: Boolean): string {
  if (value.isFalse()) {
    return "Processing false value";
  }
  return "Processing true value";
}

function validateNotDisabled(flag: Boolean): boolean {
  return !flag.isFalse();
}

class ReadableFeature {
  private disabled: Boolean;

  constructor(disabled: boolean) {
    this.disabled = new Boolean(disabled);
  }

  isEnabled(): boolean {
    return this.disabled.isFalse();
  }

  isDisabled(): boolean {
    return this.disabled.isFalse() === false;
  }
}

export default function BooleanIsFalseTest(): void {
  describe("BooleanIsFalseTest", () => {
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
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0100
     * @tc.name      testBooleanIsFalseRejectsArgumentsCompileConstraint
     * @tc.desc      Boolean.isFalse() takes no arguments; any argument is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseRejectsArgumentsCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0200
     * @tc.name      testBooleanIsFalseMaxParameterCountCompileConstraint
     * @tc.desc      Boolean.isFalse() has zero parameters; extra parameters are compile-time invalid, valid call works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseMaxParameterCountCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).isFalse()).assertEqual(true);
      expect(new Boolean(true).isFalse()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0300
     * @tc.name      testBooleanIsFalseRequiresInstanceCallCompileConstraint
     * @tc.desc      Boolean.isFalse() must be called on a Boolean instance; static call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseRequiresInstanceCallCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      expect(instance.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0400
     * @tc.name      testBooleanIsFalseReturnsPrimitiveBooleanType
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseReturnsPrimitiveBooleanType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(false).isFalse();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0500
     * @tc.name      testBooleanIsFalseReturnsTrueForFalsyBooleanObjects
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseReturnsTrueForFalsyBooleanObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).isFalse()).assertEqual(true);
      expect(new Boolean(0).isFalse()).assertEqual(true);
      expect(new Boolean(0 as int).isFalse()).assertEqual(true);
      expect(new Boolean(c'\u0000').isFalse()).assertEqual(true);
      expect(new Boolean(0.0).isFalse()).assertEqual(true);
      expect(new Boolean(NaN).isFalse()).assertEqual(true);
      expect(new Boolean("").isFalse()).assertEqual(true);
      expect(new Boolean(null as Any).isFalse()).assertEqual(true);
      expect(new Boolean(undefined as Any).isFalse()).assertEqual(true);
      expect(Boolean.FALSE.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0600
     * @tc.name      testBooleanIsFalseReturnsFalseForTruthyBooleanObjects
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseReturnsFalseForTruthyBooleanObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).isFalse()).assertEqual(false);
      expect(new Boolean(100).isFalse()).assertEqual(false);
      expect(new Boolean(1).isFalse()).assertEqual(false);
      expect(new Boolean(c'A').isFalse()).assertEqual(false);
      expect(new Boolean(3.14).isFalse()).assertEqual(false);
      expect(new Boolean("test").isFalse()).assertEqual(false);
      expect(new Boolean("false").isFalse()).assertEqual(false);
      expect(new Boolean(new Number(10)).isFalse()).assertEqual(false);
      expect(Boolean.TRUE.isFalse()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0700
     * @tc.name      testBooleanIsFalseComparedWithValueOf
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComparedWithValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseValue = new Boolean(false);
      let trueValue = new Boolean(true);
      expect(falseValue.isFalse()).assertEqual(falseValue.valueOf() === false);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isFalse()).assertEqual(trueValue.valueOf() === false);
      expect(trueValue.isFalse()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0800
     * @tc.name      testBooleanIsFalseMultipleCallsReturnSameResult
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseMultipleCallsReturnSameResult", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      let result1 = bool.isFalse();
      let result2 = bool.isFalse();
      let result3 = bool.isFalse();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_0900
     * @tc.name      testBooleanIsFalseResultUnchangedForImmutableBoolean
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseResultUnchangedForImmutableBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1000
     * @tc.name      testBooleanIsFalsePrimitiveBooleanReturnCharacteristics
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalsePrimitiveBooleanReturnCharacteristics", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(false).isFalse();
      expect(typeof result).assertEqual("boolean");
      expect(result && true).assertEqual(true);
      expect(result || false).assertEqual(true);
      expect(!result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1100
     * @tc.name      testBooleanIsFalseAllBooleanObjects
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseAllBooleanObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(1),
        new Boolean(0),
        new Boolean("test"),
        new Boolean(""),
        new Boolean(null as Any),
        new Boolean(undefined as Any),
        Boolean.TRUE,
        Boolean.FALSE
      ];
      bools.forEach((value: Boolean) => {
        expect(value.isFalse()).assertEqual(value.valueOf() === false);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1200
     * @tc.name      testBooleanIsFalseComparedWithIsTrue
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComparedWithIsTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseValue = new Boolean(false);
      let trueValue = new Boolean(true);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isFalse()).assertEqual(false);
      expect(falseValue.isTrue()).assertEqual(false);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isFalse() !== falseValue.isTrue()).assertEqual(true);
      expect(trueValue.isFalse() !== trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isFalse()).assertEqual(!falseValue.isTrue());
      expect(trueValue.isFalse()).assertEqual(!trueValue.isTrue());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1300
     * @tc.name      testBooleanIsFalseComparedWithValueOfStrictFalse
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComparedWithValueOfStrictFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseValue = new Boolean(false);
      let trueValue = new Boolean(true);
      expect(falseValue.isFalse()).assertEqual(falseValue.valueOf() === false);
      expect(trueValue.isFalse()).assertEqual(trueValue.valueOf() === false);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isFalse()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1400
     * @tc.name      testBooleanIsFalseComparedWithEqualsFalse
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComparedWithEqualsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseValue = new Boolean(false);
      let trueValue = new Boolean(true);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isFalse()).assertEqual(false);
      expect(falseValue.equals(Boolean.FALSE)).assertEqual(true);
      expect(trueValue.equals(Boolean.FALSE)).assertEqual(false);
      expect(falseValue.isFalse()).assertEqual(falseValue.equals(Boolean.FALSE));
      expect(trueValue.isFalse()).assertEqual(trueValue.equals(Boolean.FALSE));
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1500
     * @tc.name      testBooleanIsFalseComparedWithToBoolean
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComparedWithToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseValue = new Boolean(false);
      let trueValue = new Boolean(true);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isFalse()).assertEqual(false);
      expect(falseValue.toBoolean()).assertEqual(false);
      expect(trueValue.toBoolean()).assertEqual(true);
      expect(falseValue.isFalse()).assertEqual(falseValue.toBoolean() === false);
      expect(trueValue.isFalse()).assertEqual(trueValue.toBoolean() === false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1600
     * @tc.name      testBooleanIsFalseInstanceMethodOnlyCompileConstraint
     * @tc.desc      Boolean.isFalse() is an instance-only method; static access is not part of the ArkTS Boolean API.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseInstanceMethodOnlyCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      expect(instance.isFalse()).assertEqual(true);
      expect(typeof instance.isFalse).assertEqual("function");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1700
     * @tc.name      testBooleanIsFalseThisBindingWithBooleanReceiver
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseThisBindingWithBooleanReceiver", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      let result = instance.isFalse();
      expect(result).assertEqual(true);
      expect(result).assertEqual(instance.valueOf() === false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1800
     * @tc.name      testBooleanIsFalseExistsOnBooleanInstance
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseExistsOnBooleanInstance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      expect(typeof instance.isFalse).assertEqual("function");
      expect(instance.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_1900
     * @tc.name      testBooleanIsFalseUsedInCondition
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseUsedInCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processFlag(new Boolean(false))).assertEqual("flag is false");
      expect(processFlag(new Boolean(true))).assertEqual("flag is true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2000
     * @tc.name      testBooleanIsFalseFiltersBooleanArray
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseFiltersBooleanArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false),
        new Boolean(true)
      ];
      let falseValues = filterFalseValues(bools);
      expect(falseValues.length).assertEqual(2);
      falseValues.forEach((value: Boolean) => {
        expect(value.isFalse()).assertEqual(true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2100
     * @tc.name      testBooleanIsFalseChecksObjectState
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseChecksObjectState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sw = new BooleanSwitch();
      expect(sw.isOff()).assertEqual(true);
      sw.turnOn();
      expect(sw.isOff()).assertEqual(false);
      sw.turnOff();
      expect(sw.isOff()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2200
     * @tc.name      testBooleanIsFalseValidatesConfigOptions
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseValidatesConfigOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config1: BooleanConfig = { debug: new Boolean(true), verbose: new Boolean(true), enabled: new Boolean(true) };
      let config2: BooleanConfig = { debug: new Boolean(true), verbose: new Boolean(false), enabled: new Boolean(true) };
      let config3: BooleanConfig = { debug: new Boolean(false), verbose: new Boolean(false), enabled: new Boolean(false) };
      expect(validateDisabledConfig(config1).length).assertEqual(0);
      expect(validateDisabledConfig(config2).length).assertEqual(1);
      expect(validateDisabledConfig(config3).length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2300
     * @tc.name      testBooleanIsFalseCallPerformance
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      let result = false;
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        result = instance.isFalse();
      }
      let elapsed = Date.now() - start;
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2400
     * @tc.name      testBooleanIsFalsePerformanceComparedWithValueOf
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalsePerformanceComparedWithValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      let isFalseResult = false;
      let valueOfResult = false;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        isFalseResult = instance.isFalse();
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        valueOfResult = instance.valueOf() === false;
      }
      let elapsed2 = Date.now() - start2;
      expect(isFalseResult).assertEqual(true);
      expect(valueOfResult).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2500
     * @tc.name      testBooleanIsFalseContinuousCalls
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseContinuousCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      let result1 = instance.isFalse();
      let result2 = instance.isFalse();
      let result3 = instance.isFalse();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2600
     * @tc.name      testBooleanIsFalseDifferentInstancesReturnOwnResult
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseDifferentInstancesReturnOwnResult", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(false);
      let bool2 = new Boolean(true);
      expect(bool1.isFalse()).assertEqual(true);
      expect(bool2.isFalse()).assertEqual(false);
      expect(bool1.isFalse() !== bool2.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2700
     * @tc.name      testBooleanIsFalseStaticSingletons
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseStaticSingletons", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.isFalse()).assertEqual(false);
      expect(Boolean.FALSE.isFalse()).assertEqual(true);
      expect(Boolean.TRUE.isFalse()).assertEqual(new Boolean(true).isFalse());
      expect(Boolean.FALSE.isFalse()).assertEqual(new Boolean(false).isFalse());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2800
     * @tc.name      testBooleanIsFalseWrongCallModeCompileConstraint
     * @tc.desc      Boolean.isFalse() must be called via instance; class-level call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      expect(instance.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_2900
     * @tc.name      testBooleanIsFalseArgumentErrorCompileConstraint
     * @tc.desc      Boolean.isFalse() takes no arguments; extra arguments are rejected before runtime, valid call returns correct result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseArgumentErrorCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      expect(instance.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3000
     * @tc.name      testBooleanIsFalseWrongThisBindingCompileConstraint
     * @tc.desc      Boolean.isFalse() requires Boolean receiver; non-Boolean binding is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseWrongThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      expect(instance.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3100
     * @tc.name      testBooleanIsFalseResultUsedInCondition
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseResultUsedInCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(false);
      expect(boolObj.isFalse() && true).assertEqual(true);
      expect(boolObj.isFalse() || false).assertEqual(true);
      expect(boolObj.isFalse() ? "yes" : "no").assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3200
     * @tc.name      testBooleanIsFalseWorksWithIsTrue
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseWorksWithIsTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(describeBooleanValue(new Boolean(false))).assertEqual("value is false");
      expect(describeBooleanValue(new Boolean(true))).assertEqual("value is true");
      let bool = new Boolean(false);
      expect(bool.isFalse() && !bool.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3300
     * @tc.name      testBooleanIsFalseFunctionalProgrammingUsage
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseFunctionalProgrammingUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(false)];
      let allFalse = bools.every((value: Boolean) => value.isFalse());
      let someFalse = bools.some((value: Boolean) => value.isFalse());
      let falseCount = bools.filter((value: Boolean) => value.isFalse()).length;
      expect(allFalse).assertEqual(false);
      expect(someFalse).assertEqual(true);
      expect(falseCount).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3400
     * @tc.name      testBooleanIsFalseTypeNarrowingUsage
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseTypeNarrowingUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processIfFalse(new Boolean(false))).assertEqual("processed false value");
      expect(processIfFalse(new Boolean(true))).assertEqual(null);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3500
     * @tc.name      testBooleanIsFalseMakesCodeClearer
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseMakesCodeClearer", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(!bool.toBoolean()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(!bool.toBoolean());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3600
     * @tc.name      testBooleanIsFalseAvoidsRepeatedValueOfCalls
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseAvoidsRepeatedValueOfCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(checkAndProcess(new Boolean(false))).assertEqual("Processing false value");
      expect(checkAndProcess(new Boolean(true))).assertEqual("Processing true value");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3700
     * @tc.name      testBooleanIsFalseDoubleNegativeUsage
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseDoubleNegativeUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enabledFlag = new Boolean(true);
      let disabledFlag = new Boolean(false);
      expect(validateNotDisabled(enabledFlag)).assertEqual(true);
      expect(validateNotDisabled(disabledFlag)).assertEqual(false);
      expect(validateNotDisabled(enabledFlag)).assertEqual(enabledFlag.isTrue());
      expect(validateNotDisabled(disabledFlag)).assertEqual(disabledFlag.isTrue());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3800
     * @tc.name      testBooleanIsFalseImprovesReadability
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseImprovesReadability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let feature1 = new ReadableFeature(false);
      let feature2 = new ReadableFeature(true);
      expect(feature1.isEnabled()).assertEqual(true);
      expect(feature1.isDisabled()).assertEqual(false);
      expect(feature2.isEnabled()).assertEqual(false);
      expect(feature2.isDisabled()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_3900
     * @tc.name      testBooleanIsFalseArkTSComparedWithJavaStyle
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseArkTSComparedWithJavaStyle", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(bool.valueOf() === false).assertEqual(true);
      expect(bool.equals(Boolean.FALSE)).assertEqual(true);
      expect(bool.isFalse()).assertEqual(!bool.isTrue());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4000
     * @tc.name      testBooleanIsFalseTypeInference
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseTypeInference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      let result: boolean = instance.isFalse();
      let flag = genericIsFalse(new Boolean(false));
      expect(typeof flag).assertEqual("boolean");
      expect(result).assertEqual(true);
      expect(flag).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4100
     * @tc.name      testBooleanIsFalseComparedWithAutomaticConversion
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComparedWithAutomaticConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(false);
      let result1 = boolObj.isFalse();
      let result2 = boolObj.valueOf();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(boolObj.isFalse()).assertEqual(boolObj.valueOf() === false);
      expect(boolObj.isFalse()).assertEqual(!boolObj.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4200
     * @tc.name      testBooleanIsFalseSemanticClarity
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseSemanticClarity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag = new Boolean(false);
      expect(flag.isFalse()).assertEqual(true);
      expect(flag.valueOf() === false).assertEqual(true);
      expect(!flag.toBoolean()).assertEqual(true);
      expect(flag.isFalse()).assertEqual(!flag.toBoolean());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4300
     * @tc.name      testBooleanIsFalseSymmetricWithIsTrue
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseSymmetricWithIsTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseValue = new Boolean(false);
      let trueValue = new Boolean(true);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(falseValue.isTrue()).assertEqual(false);
      expect(trueValue.isFalse()).assertEqual(false);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isFalse() !== falseValue.isTrue()).assertEqual(true);
      expect(trueValue.isFalse() !== trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isFalse()).assertEqual(!falseValue.isTrue());
      expect(trueValue.isFalse()).assertEqual(!trueValue.isTrue());
      expect(falseValue.isFalse()).assertEqual(!!falseValue.isFalse());
      expect(trueValue.isFalse()).assertEqual(!!trueValue.isFalse());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4400
     * @tc.name      testBooleanIsFalseConsistentWithOtherTypeMethods
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseConsistentWithOtherTypeMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(typeof bool.isFalse).assertEqual("function");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4500
     * @tc.name      testBooleanIsFalseIsPrefixMethod
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseIsPrefixMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(bool.isTrue()).assertEqual(false);
      expect(typeof bool.isFalse()).assertEqual("boolean");
      expect(typeof bool.isTrue()).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4600
     * @tc.name      testBooleanIsFalseStaticSingletonShortcut
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseStaticSingletonShortcut", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE.isFalse()).assertEqual(true);
      expect(Boolean.FALSE.isTrue()).assertEqual(false);
      expect(Boolean.TRUE.isFalse()).assertEqual(false);
      expect(Boolean.TRUE.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4700
     * @tc.name      testBooleanIsFalsePerformanceAdvantage
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalsePerformanceAdvantage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      let isFalseResult = false;
      let valueOfResult = false;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        if (bool.isFalse()) {
          isFalseResult = true;
        }
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        if (bool.valueOf() === false) {
          valueOfResult = true;
        }
      }
      let elapsed2 = Date.now() - start2;
      expect(isFalseResult).assertEqual(true);
      expect(valueOfResult).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4800
     * @tc.name      testBooleanIsFalseCombinedWithLogicalNot
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseCombinedWithLogicalNot", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(!bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(!bool.isTrue());
      expect(!!bool.isFalse()).assertEqual(true);
      expect(!!bool.isFalse()).assertEqual(bool.isFalse());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_4900
     * @tc.name      testBooleanIsFalseAndIsTrueExclusivity
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseAndIsTrueExclusivity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allBooleans: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        Boolean.TRUE,
        Boolean.FALSE,
        new Boolean(1),
        new Boolean(0),
        new Boolean("test"),
        new Boolean("")
      ];
      allBooleans.forEach((value: Boolean) => {
        let isFalseValue = value.isFalse();
        let isTrueValue = value.isTrue();
        expect(isFalseValue && isTrueValue).assertEqual(false);
        expect(isFalseValue || isTrueValue).assertEqual(true);
        expect(isFalseValue).assertEqual(!isTrueValue);
        expect(isTrueValue).assertEqual(!isFalseValue);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_5000
     * @tc.name      testBooleanIsFalseCoversAllPossibleValues
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseCoversAllPossibleValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falseBooleans: Array<Boolean> = [
        new Boolean(false),
        Boolean.FALSE,
        new Boolean(0),
        new Boolean(c'\u0000'),
        new Boolean(0.0),
        new Boolean(NaN),
        new Boolean(""),
        new Boolean(null as Any),
        new Boolean(undefined as Any)
      ];
      falseBooleans.forEach((value: Boolean) => {
        expect(value.isFalse()).assertEqual(true);
        expect(value.isTrue()).assertEqual(false);
      });
      let trueBooleans: Array<Boolean> = [
        new Boolean(true),
        Boolean.TRUE,
        new Boolean(1),
        new Boolean(c'A'),
        new Boolean(3.14),
        new Boolean("test"),
        new Boolean(new Number(10))
      ];
      trueBooleans.forEach((value: Boolean) => {
        expect(value.isFalse()).assertEqual(false);
        expect(value.isTrue()).assertEqual(true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_5100
     * @tc.name      testBooleanIsFalsePrimitiveBooleanInterop
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalsePrimitiveBooleanInterop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(false);
      let primitive = false;
      expect(boolObj.isFalse()).assertEqual(true);
      expect(typeof boolObj.isFalse()).assertEqual("boolean");
      expect(boolObj.isFalse()).assertEqual(primitive === false);
      expect(boolObj.isFalse() && true).assertEqual(true);
      expect(boolObj.isFalse() || false).assertEqual(true);
      expect(!boolObj.isFalse()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_FALSE_TEST_5200
     * @tc.name      testBooleanIsFalseComplexExpressionUsage
     * @tc.desc      Boolean.isFalse()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsFalseComplexExpressionUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag1 = new Boolean(false);
      let flag2 = new Boolean(true);
      let flag3 = new Boolean(false);
      expect(flag1.isFalse() && flag2.isTrue()).assertEqual(true);
      expect(flag1.isFalse() && flag3.isFalse()).assertEqual(true);
      expect(flag1.isFalse() || flag2.isFalse()).assertEqual(true);
      expect(flag2.isFalse() && flag3.isFalse()).assertEqual(false);
      let result = flag1.isFalse() ? (flag2.isFalse() ? "A" : "B") : "C";
      expect(result).assertEqual("B");
    })
  })
}
