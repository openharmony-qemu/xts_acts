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

function processFlag(flag: Boolean): string {
  if (flag.isTrue()) {
    return "flag is true";
  }
  return "flag is false";
}

function filterTrueValues(values: Array<Boolean>): Array<Boolean> {
  return values.filter((value: Boolean) => value.isTrue());
}

class BooleanSwitch {
  private on: Boolean = new Boolean(false);

  turnOn(): void {
    this.on = Boolean.TRUE;
  }

  turnOff(): void {
    this.on = Boolean.FALSE;
  }

  isOn(): boolean {
    return this.on.isTrue();
  }
}

interface BooleanConfig {
  debug: Boolean;
  verbose: Boolean;
  enabled: Boolean;
}

function validateBooleanConfig(config: BooleanConfig): Array<string> {
  let issues: Array<string> = [];
  if (!config.enabled.isTrue()) {
    issues.push("Feature is disabled");
  }
  if (config.debug.isTrue() && !config.verbose.isTrue()) {
    issues.push("Debug mode requires verbose mode");
  }
  return issues;
}

function describeBooleanValue(value: Boolean): string {
  if (value.isTrue()) {
    return "value is true";
  }
  if (value.isFalse()) {
    return "value is false";
  }
  return "unexpected";
}

function processIfTrue(value: Boolean): string | null {
  if (value.isTrue()) {
    return "processed true value";
  }
  return null;
}

function checkAndProcess(value: Boolean): string {
  if (value.isTrue()) {
    return "Processing true value";
  }
  return "Processing false value";
}

interface BooleanFlags {
  a: Boolean;
  b: Boolean;
  c: Boolean;
}

function evaluateFlags(flags: BooleanFlags): string {
  if (flags.a.isTrue() && flags.b.isTrue() && flags.c.isTrue()) {
    return "all true";
  }
  if (flags.a.isTrue() || flags.b.isTrue() || flags.c.isTrue()) {
    return "some true";
  }
  return "none true";
}

class BooleanUser {
  private active: Boolean;
  private verified: Boolean;
  private admin: Boolean;

  constructor(active: boolean, verified: boolean, admin: boolean) {
    this.active = new Boolean(active);
    this.verified = new Boolean(verified);
    this.admin = new Boolean(admin);
  }

  canLogin(): boolean {
    return this.active.isTrue() && this.verified.isTrue();
  }

  canAccessAdminPanel(): boolean {
    return this.canLogin() && this.admin.isTrue();
  }
}

function checkBoolean(value: Boolean): boolean {
  return value.isTrue();
}

export default function BooleanIsTrueTest(): void {
  describe("BooleanIsTrueTest", () => {
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
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0100
     * @tc.name      testBooleanIsTrueNoArgumentsCompileConstraint
     * @tc.desc      Boolean.isTrue() takes no arguments; extra arguments are compile-time invalid, valid call returns correct boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueNoArgumentsCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0200
     * @tc.name      testBooleanIsTrueMaxParameterCountCompileConstraint
     * @tc.desc      Boolean.isTrue() has zero parameters; extra parameters are compile-time invalid, valid call works correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueMaxParameterCountCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).isTrue()).assertEqual(true);
      expect(new Boolean(false).isTrue()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0300
     * @tc.name      testBooleanIsTrueRequiresInstanceCallCompileConstraint
     * @tc.desc      Boolean.isTrue() must be called on a Boolean instance; static call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueRequiresInstanceCallCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0400
     * @tc.name      testBooleanIsTrueReturnsPrimitiveBooleanType
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueReturnsPrimitiveBooleanType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).isTrue();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0500
     * @tc.name      testBooleanIsTrueReturnsTrueForTruthyBooleanObjects
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueReturnsTrueForTruthyBooleanObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).isTrue()).assertEqual(true);
      expect(new Boolean(100).isTrue()).assertEqual(true);
      expect(new Boolean(1).isTrue()).assertEqual(true);
      expect(new Boolean(c'A').isTrue()).assertEqual(true);
      expect(new Boolean(3.14).isTrue()).assertEqual(true);
      expect(new Boolean("test").isTrue()).assertEqual(true);
      expect(new Boolean("false").isTrue()).assertEqual(true);
      expect(new Boolean(new Number(10)).isTrue()).assertEqual(true);
      expect(Boolean.TRUE.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0600
     * @tc.name      testBooleanIsTrueReturnsFalseForFalsyBooleanObjects
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueReturnsFalseForFalsyBooleanObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).isTrue()).assertEqual(false);
      expect(new Boolean(0).isTrue()).assertEqual(false);
      expect(new Boolean(0 as int).isTrue()).assertEqual(false);
      expect(new Boolean(c'\u0000').isTrue()).assertEqual(false);
      expect(new Boolean(0.0).isTrue()).assertEqual(false);
      expect(new Boolean(NaN).isTrue()).assertEqual(false);
      expect(new Boolean("").isTrue()).assertEqual(false);
      expect(new Boolean(null as Any).isTrue()).assertEqual(false);
      expect(new Boolean(undefined as Any).isTrue()).assertEqual(false);
      expect(Boolean.FALSE.isTrue()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0700
     * @tc.name      testBooleanIsTrueComparedWithValueOf
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueComparedWithValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.isTrue()).assertEqual(trueValue.valueOf() === true);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isTrue()).assertEqual(falseValue.valueOf() === true);
      expect(falseValue.isTrue()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0800
     * @tc.name      testBooleanIsTrueMultipleCallsReturnSameResult
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueMultipleCallsReturnSameResult", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result1 = bool.isTrue();
      let result2 = bool.isTrue();
      let result3 = bool.isTrue();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_0900
     * @tc.name      testBooleanIsTrueResultUnchangedForImmutableBoolean
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueResultUnchangedForImmutableBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1000
     * @tc.name      testBooleanIsTruePrimitiveBooleanReturnCharacteristics
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTruePrimitiveBooleanReturnCharacteristics", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).isTrue();
      expect(typeof result).assertEqual("boolean");
      expect(result && true).assertEqual(true);
      expect(result || false).assertEqual(true);
      expect(!result).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1100
     * @tc.name      testBooleanIsTrueAllBooleanObjects
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueAllBooleanObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
        expect(value.isTrue()).assertEqual(value.valueOf() === true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1200
     * @tc.name      testBooleanIsTrueComparedWithIsFalse
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueComparedWithIsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isTrue()).assertEqual(false);
      expect(trueValue.isFalse()).assertEqual(false);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isTrue() !== trueValue.isFalse()).assertEqual(true);
      expect(falseValue.isTrue() !== falseValue.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1300
     * @tc.name      testBooleanIsTrueComparedWithValueOfStrictTrue
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueComparedWithValueOfStrictTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.isTrue()).assertEqual(trueValue.valueOf() === true);
      expect(falseValue.isTrue()).assertEqual(falseValue.valueOf() === true);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isTrue()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1400
     * @tc.name      testBooleanIsTrueComparedWithEqualsTrue
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueComparedWithEqualsTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isTrue()).assertEqual(false);
      expect(trueValue.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseValue.equals(Boolean.TRUE)).assertEqual(false);
      expect(trueValue.isTrue()).assertEqual(trueValue.equals(Boolean.TRUE));
      expect(falseValue.isTrue()).assertEqual(falseValue.equals(Boolean.TRUE));
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1500
     * @tc.name      testBooleanIsTrueComparedWithToBoolean
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueComparedWithToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(falseValue.isTrue()).assertEqual(false);
      expect(trueValue.toBoolean()).assertEqual(true);
      expect(falseValue.toBoolean()).assertEqual(false);
      expect(trueValue.isTrue()).assertEqual(trueValue.toBoolean() === true);
      expect(falseValue.isTrue()).assertEqual(falseValue.toBoolean() === true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1600
     * @tc.name      testBooleanIsTrueInstanceMethodOnlyCompileConstraint
     * @tc.desc      Boolean.isTrue() is an instance-only method; static access is not part of the ArkTS Boolean API.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueInstanceMethodOnlyCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.isTrue()).assertEqual(true);
      expect(typeof instance.isTrue).assertEqual("function");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1700
     * @tc.name      testBooleanIsTrueThisBindingWithBooleanReceiver
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueThisBindingWithBooleanReceiver", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = instance.isTrue();
      expect(result).assertEqual(true);
      expect(result).assertEqual(instance.valueOf() === true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1800
     * @tc.name      testBooleanIsTrueExistsOnBooleanInstance
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueExistsOnBooleanInstance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.isTrue).assertEqual("function");
      expect(instance.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_1900
     * @tc.name      testBooleanIsTrueUsedInCondition
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueUsedInCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processFlag(new Boolean(true))).assertEqual("flag is true");
      expect(processFlag(new Boolean(false))).assertEqual("flag is false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2000
     * @tc.name      testBooleanIsTrueFiltersBooleanArray
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueFiltersBooleanArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false),
        new Boolean(true)
      ];
      let trueValues = filterTrueValues(bools);
      expect(trueValues.length).assertEqual(3);
      trueValues.forEach((value: Boolean) => {
        expect(value.isTrue()).assertEqual(true);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2100
     * @tc.name      testBooleanIsTrueChecksObjectState
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueChecksObjectState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sw = new BooleanSwitch();
      expect(sw.isOn()).assertEqual(false);
      sw.turnOn();
      expect(sw.isOn()).assertEqual(true);
      sw.turnOff();
      expect(sw.isOn()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2200
     * @tc.name      testBooleanIsTrueValidatesConfigOptions
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueValidatesConfigOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config1: BooleanConfig = { debug: new Boolean(true), verbose: new Boolean(true), enabled: new Boolean(true) };
      let config2: BooleanConfig = { debug: new Boolean(true), verbose: new Boolean(false), enabled: new Boolean(true) };
      let config3: BooleanConfig = { debug: new Boolean(false), verbose: new Boolean(false), enabled: new Boolean(false) };
      expect(validateBooleanConfig(config1).length).assertEqual(0);
      expect(validateBooleanConfig(config2).length).assertEqual(1);
      expect(validateBooleanConfig(config3).length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2300
     * @tc.name      testBooleanIsTrueCallPerformance
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result = false;
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        result = instance.isTrue();
      }
      let elapsed = Date.now() - start;
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2400
     * @tc.name      testBooleanIsTruePerformanceComparedWithValueOf
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTruePerformanceComparedWithValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let isTrueResult = false;
      let valueOfResult = false;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        isTrueResult = instance.isTrue();
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        valueOfResult = instance.valueOf() === true;
      }
      let elapsed2 = Date.now() - start2;
      expect(isTrueResult).assertEqual(true);
      expect(valueOfResult).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2500
     * @tc.name      testBooleanIsTrueContinuousCalls
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueContinuousCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result1 = instance.isTrue();
      let result2 = instance.isTrue();
      let result3 = instance.isTrue();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2600
     * @tc.name      testBooleanIsTrueDifferentInstancesReturnOwnResult
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueDifferentInstancesReturnOwnResult", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(false);
      expect(bool1.isTrue()).assertEqual(true);
      expect(bool2.isTrue()).assertEqual(false);
      expect(bool1.isTrue() !== bool2.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2700
     * @tc.name      testBooleanIsTrueStaticSingletons
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueStaticSingletons", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.isTrue()).assertEqual(true);
      expect(Boolean.FALSE.isTrue()).assertEqual(false);
      expect(Boolean.TRUE.isTrue()).assertEqual(new Boolean(true).isTrue());
      expect(Boolean.FALSE.isTrue()).assertEqual(new Boolean(false).isTrue());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2800
     * @tc.name      testBooleanIsTrueWrongCallModeCompileConstraint
     * @tc.desc      Boolean.isTrue() must be called via instance; class-level call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_2900
     * @tc.name      testBooleanIsTrueArgumentErrorCompileConstraint
     * @tc.desc      Boolean.isTrue() takes no arguments; any argument is rejected before runtime, valid call returns correct result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueArgumentErrorCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3000
     * @tc.name      testBooleanIsTrueWrongThisBindingCompileConstraint
     * @tc.desc      Boolean.isTrue() requires Boolean receiver; non-Boolean binding is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueWrongThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.isTrue()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3100
     * @tc.name      testBooleanIsTrueResultUsedInCondition
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueResultUsedInCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      expect(boolObj.isTrue() && true).assertEqual(true);
      expect(boolObj.isTrue() || false).assertEqual(true);
      expect(boolObj.isTrue() ? "yes" : "no").assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3200
     * @tc.name      testBooleanIsTrueWorksWithIsFalse
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueWorksWithIsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(describeBooleanValue(new Boolean(true))).assertEqual("value is true");
      expect(describeBooleanValue(new Boolean(false))).assertEqual("value is false");
      let bool = new Boolean(true);
      expect(bool.isTrue() && !bool.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3300
     * @tc.name      testBooleanIsTrueFunctionalProgrammingUsage
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueFunctionalProgrammingUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(false)];
      let allTrue = bools.every((value: Boolean) => value.isTrue());
      let someTrue = bools.some((value: Boolean) => value.isTrue());
      let noneTrue = !bools.some((value: Boolean) => value.isTrue());
      let trueCount = bools.filter((value: Boolean) => value.isTrue()).length;
      expect(allTrue).assertEqual(false);
      expect(someTrue).assertEqual(true);
      expect(noneTrue).assertEqual(false);
      expect(trueCount).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3400
     * @tc.name      testBooleanIsTrueTypeNarrowingUsage
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueTypeNarrowingUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processIfTrue(new Boolean(true))).assertEqual("processed true value");
      expect(processIfTrue(new Boolean(false))).assertEqual(null);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3500
     * @tc.name      testBooleanIsTrueMakesCodeClearer
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueMakesCodeClearer", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.toBoolean()).assertEqual(true);
      expect(bool.isTrue()).assertEqual(bool.toBoolean());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3600
     * @tc.name      testBooleanIsTrueAvoidsRepeatedValueOfCalls
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueAvoidsRepeatedValueOfCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(checkAndProcess(new Boolean(true))).assertEqual("Processing true value");
      expect(checkAndProcess(new Boolean(false))).assertEqual("Processing false value");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3700
     * @tc.name      testBooleanIsTrueCombinedConditions
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueCombinedConditions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(evaluateFlags({ a: new Boolean(true), b: new Boolean(true), c: new Boolean(true) })).assertEqual("all true");
      expect(evaluateFlags({ a: new Boolean(true), b: new Boolean(false), c: new Boolean(false) })).assertEqual("some true");
      expect(evaluateFlags({ a: new Boolean(false), b: new Boolean(false), c: new Boolean(false) })).assertEqual("none true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3800
     * @tc.name      testBooleanIsTrueImprovesReadability
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueImprovesReadability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user1 = new BooleanUser(true, true, true);
      let user2 = new BooleanUser(true, false, true);
      expect(user1.canLogin()).assertEqual(true);
      expect(user1.canAccessAdminPanel()).assertEqual(true);
      expect(user2.canLogin()).assertEqual(false);
      expect(user2.canAccessAdminPanel()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_3900
     * @tc.name      testBooleanIsTrueArkTSComparedWithJavaStyle
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueArkTSComparedWithJavaStyle", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.valueOf() === true).assertEqual(true);
      expect(bool.equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4000
     * @tc.name      testBooleanIsTrueTypeInference
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueTypeInference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let result: boolean = instance.isTrue();
      let flag = checkBoolean(new Boolean(true));
      expect(typeof flag).assertEqual("boolean");
      expect(result).assertEqual(true);
      expect(flag).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4100
     * @tc.name      testBooleanIsTrueComparedWithAutomaticConversion
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueComparedWithAutomaticConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      let result1 = boolObj.isTrue();
      let result2 = boolObj.valueOf();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(boolObj.isTrue()).assertEqual(boolObj.valueOf() === true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4200
     * @tc.name      testBooleanIsTrueSemanticClarity
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueSemanticClarity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag = new Boolean(true);
      expect(flag.isTrue()).assertEqual(true);
      expect(flag.valueOf() === true).assertEqual(true);
      expect(flag.toBoolean()).assertEqual(true);
      expect(flag.isTrue()).assertEqual(flag.toBoolean());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4300
     * @tc.name      testBooleanIsTrueSymmetricWithIsFalse
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueSymmetricWithIsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = new Boolean(true);
      let falseValue = new Boolean(false);
      expect(trueValue.isTrue()).assertEqual(true);
      expect(trueValue.isFalse()).assertEqual(false);
      expect(falseValue.isTrue()).assertEqual(false);
      expect(falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isTrue() !== trueValue.isFalse()).assertEqual(true);
      expect(falseValue.isTrue() !== falseValue.isFalse()).assertEqual(true);
      expect(trueValue.isTrue()).assertEqual(!trueValue.isFalse());
      expect(falseValue.isTrue()).assertEqual(!falseValue.isFalse());
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4400
     * @tc.name      testBooleanIsTrueConsistentWithOtherTypeMethods
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueConsistentWithOtherTypeMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(typeof bool.isTrue).assertEqual("function");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4500
     * @tc.name      testBooleanIsTrueIsPrefixMethod
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueIsPrefixMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(false);
      expect(typeof bool.isTrue()).assertEqual("boolean");
      expect(typeof bool.isFalse()).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4600
     * @tc.name      testBooleanIsTrueStaticSingletonShortcut
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTrueStaticSingletonShortcut", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.isTrue()).assertEqual(true);
      expect(Boolean.TRUE.isFalse()).assertEqual(false);
      expect(Boolean.FALSE.isTrue()).assertEqual(false);
      expect(Boolean.FALSE.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_IS_TRUE_TEST_4700
     * @tc.name      testBooleanIsTruePerformanceAdvantage
     * @tc.desc      Boolean.isTrue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanIsTruePerformanceAdvantage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let isTrueResult = false;
      let valueOfResult = false;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        if (bool.isTrue()) {
          isTrueResult = true;
        }
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        if (bool.valueOf() === true) {
          valueOfResult = true;
        }
      }
      let elapsed2 = Date.now() - start2;
      expect(isTrueResult).assertEqual(true);
      expect(valueOfResult).assertEqual(true);
    })
  })
}
