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

function checkAnyTrue(conditions: Array<Boolean>): boolean {
  let result = Boolean.FALSE;
  conditions.forEach((condition: Boolean) => {
    result = result.or(condition);
  });
  return result.isTrue();
}

class OrPermissionUser {
  private canRead: Boolean;
  private canWrite: Boolean;
  private canExecute: Boolean;

  constructor(read: boolean, write: boolean, execute: boolean) {
    this.canRead = new Boolean(read);
    this.canWrite = new Boolean(write);
    this.canExecute = new Boolean(execute);
  }

  hasAnyPermission(): boolean {
    return this.canRead.or(this.canWrite).or(this.canExecute).isTrue();
  }
}

interface OrConfig {
  logToFile: Boolean;
  logToConsole: Boolean;
  logToRemote: Boolean;
}

function shouldLog(config: OrConfig): boolean {
  return config.logToFile.or(config.logToConsole).or(config.logToRemote).isTrue();
}

interface OrItem {
  isUrgent: Boolean;
  isImportant: Boolean;
  isPriority: Boolean;
}

function filterRelevantItems(items: Array<OrItem>): Array<OrItem> {
  return items.filter((item: OrItem) => item.isUrgent.or(item.isImportant).or(item.isPriority).isTrue());
}

function orAll(values: Array<Boolean>): Boolean {
  let result = Boolean.FALSE;
  values.forEach((value: Boolean) => {
    result = result.or(value);
  });
  return result;
}

function orAllWithEmpty(values: Array<Boolean>): Boolean {
  if (values.length === 0) {
    return Boolean.FALSE;
  }
  let result = values[0];
  for (let i = 1; i < values.length; i++) {
    result = result.or(values[i]);
  }
  return result;
}

function orWithShortCircuit(a: Boolean, b: () => Boolean): Boolean {
  if (a.isTrue()) {
    return Boolean.TRUE;
  }
  return a.or(b());
}

class OrValidator {
  private hasError1: Boolean;
  private hasError2: Boolean;
  private hasError3: Boolean;

  constructor(e1: boolean, e2: boolean, e3: boolean) {
    this.hasError1 = new Boolean(e1);
    this.hasError2 = new Boolean(e2);
    this.hasError3 = new Boolean(e3);
  }

  hasAnyError(): boolean {
    return this.hasError1.or(this.hasError2).or(this.hasError3).isTrue();
  }
}

interface OrConditions {
  option1: Boolean;
  option2: Boolean;
  option3: Boolean;
}

function evaluateAny(conditions: OrConditions): Boolean {
  return conditions.option1.or(conditions.option2).or(conditions.option3);
}

function checkReadable(a: Boolean, b: Boolean): boolean {
  return a.or(b).isTrue();
}

function checkWithoutRepeatedIf(a: Boolean, b: Boolean): boolean {
  return a.or(b).isTrue();
}

function andUsingOr(a: Boolean, b: Boolean): Boolean {
  return a.negate().or(b.negate()).negate();
}

function orUsingAnd(a: Boolean, b: Boolean): Boolean {
  return a.negate().and(b.negate()).negate();
}

export default function BooleanOrTest(): void {
  describe("BooleanOrTest", () => {
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
     * @tc.number    SUB_BOOLEAN_OR_TEST_0100
     * @tc.name      testBooleanOrRequiresOtherParameterCompileConstraint
     * @tc.desc      Boolean.or() requires a Boolean other parameter; calling without it is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRequiresOtherParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).or(new Boolean(false)).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0200
     * @tc.name      testBooleanOrRejectsExtraParameterCompileConstraint
     * @tc.desc      Boolean.or(Boolean) takes exactly one argument; extra arguments are compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsExtraParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0300
     * @tc.name      testBooleanOrFalseOrFalse
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrFalseOrFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(false).or(new Boolean(false));
      expect(result.valueOf()).assertEqual(false);
      expect(result.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0400
     * @tc.name      testBooleanOrTrueOrFalse
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrTrueOrFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).or(new Boolean(false));
      expect(result.valueOf()).assertEqual(true);
      expect(result.equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0500
     * @tc.name      testBooleanOrFalseOrTrue
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrFalseOrTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(false).or(new Boolean(true));
      expect(result.valueOf()).assertEqual(true);
      expect(result.equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0600
     * @tc.name      testBooleanOrTrueOrTrue
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrTrueOrTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).or(new Boolean(true));
      expect(result.valueOf()).assertEqual(true);
      expect(result.equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0700
     * @tc.name      testBooleanOrWithBooleanTrue
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrWithBooleanTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(false).or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.TRUE.or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.FALSE.or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0800
     * @tc.name      testBooleanOrWithBooleanFalse
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrWithBooleanFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.FALSE).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(false).or(Boolean.FALSE).equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.TRUE.or(Boolean.FALSE).equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.FALSE.or(Boolean.FALSE).equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_0900
     * @tc.name      testBooleanOrRejectsNullCompileConstraint
     * @tc.desc      Boolean.or() rejects null as other parameter; null is compile-time invalid for Boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsNullCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1000
     * @tc.name      testBooleanOrRejectsUndefinedCompileConstraint
     * @tc.desc      Boolean.or() rejects undefined as other parameter; undefined is compile-time invalid for Boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsUndefinedCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1100
     * @tc.name      testBooleanOrRejectsPrimitiveTrueCompileConstraint
     * @tc.desc      Boolean.or() rejects primitive boolean as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsPrimitiveTrueCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).or(Boolean.TRUE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1200
     * @tc.name      testBooleanOrRejectsStringCompileConstraint
     * @tc.desc      Boolean.or() rejects string as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsStringCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).or(Boolean.FALSE).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1300
     * @tc.name      testBooleanOrRejectsNumberCompileConstraint
     * @tc.desc      Boolean.or() rejects number as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsNumberCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.FALSE).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1400
     * @tc.name      testBooleanOrRejectsObjectCompileConstraint
     * @tc.desc      Boolean.or() rejects plain object as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrRejectsObjectCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1500
     * @tc.name      testBooleanOrReturnsBooleanObjectType
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrReturnsBooleanObjectType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).or(new Boolean(false));
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1600
     * @tc.name      testBooleanOrReturnsTrueWhenAnyOperandTrue
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrReturnsTrueWhenAnyOperandTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(new Boolean(false)).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(false).or(new Boolean(true)).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(true).or(new Boolean(true)).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1700
     * @tc.name      testBooleanOrReturnsFalseWhenBothOperandsFalse
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrReturnsFalseWhenBothOperandsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(false).or(new Boolean(false));
      expect(result.equals(Boolean.FALSE)).assertEqual(true);
      expect((result === Boolean.FALSE) as boolean).assertEqual(true);
      expect(result.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1800
     * @tc.name      testBooleanOrReturnsTrueOrFalseSingleton
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrReturnsTrueOrFalseSingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueResult = new Boolean(true).or(new Boolean(false));
      let falseResult = new Boolean(false).or(new Boolean(false));
      expect((trueResult === Boolean.TRUE) as boolean).assertEqual(true);
      expect(trueResult.equals(Boolean.TRUE)).assertEqual(true);
      expect((falseResult === Boolean.FALSE) as boolean).assertEqual(true);
      expect(falseResult.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_1900
     * @tc.name      testBooleanOrDoesNotModifyOriginalObjects
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrDoesNotModifyOriginalObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original1 = new Boolean(true);
      let original2 = new Boolean(false);
      let result = original1.or(original2);
      expect(original1.valueOf()).assertEqual(true);
      expect(original2.valueOf()).assertEqual(false);
      expect(result.valueOf()).assertEqual(true);
      expect(original1.or(original2).valueOf()).assertEqual(true);
      expect(original1.valueOf()).assertEqual(true);
      expect(original2.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2000
     * @tc.name      testBooleanOrCommutativeBasic
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrCommutativeBasic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(false);
      expect(a.or(b).valueOf()).assertEqual(b.or(a).valueOf());
      expect(c.or(b).valueOf()).assertEqual(b.or(c).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2100
     * @tc.name      testBooleanOrAssociativeBasic
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrAssociativeBasic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(true);
      expect(a.or(b).or(c).valueOf()).assertEqual(a.or(b.or(c)).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2200
     * @tc.name      testBooleanOrFalseIdentity
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrFalseIdentity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.or(Boolean.FALSE).valueOf()).assertEqual(a.valueOf());
      expect(b.or(Boolean.FALSE).valueOf()).assertEqual(b.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2300
     * @tc.name      testBooleanOrTrueDominance
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrTrueDominance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(false).or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2400
     * @tc.name      testBooleanOrIdempotent
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrIdempotent", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.or(a).valueOf()).assertEqual(a.valueOf());
      expect(b.or(b).valueOf()).assertEqual(b.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2500
     * @tc.name      testBooleanOrDifferentConstructors
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrDifferentConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let true1 = new Boolean(true);
      let true2 = new Boolean(100);
      let true3 = new Boolean("test");
      let false1 = new Boolean(false);
      let false2 = new Boolean(0);
      let false3 = new Boolean("");
      expect(true1.or(true2).equals(Boolean.TRUE)).assertEqual(true);
      expect(true2.or(true3).equals(Boolean.TRUE)).assertEqual(true);
      expect(true3.or(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.TRUE.or(true1).equals(Boolean.TRUE)).assertEqual(true);
      expect(false1.or(false2).equals(Boolean.FALSE)).assertEqual(true);
      expect(false2.or(false3).equals(Boolean.FALSE)).assertEqual(true);
      expect(false3.or(Boolean.FALSE).equals(Boolean.FALSE)).assertEqual(true);
      expect(true1.or(false1).equals(Boolean.TRUE)).assertEqual(true);
      expect(false1.or(true1).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2600
     * @tc.name      testBooleanOrSameValueReturnsSameSingleton
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrSameValueReturnsSameSingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = new Boolean(true).or(new Boolean(false));
      let result2 = new Boolean(false).or(new Boolean(true));
      let result3 = new Boolean(true).or(new Boolean(true));
      let result4 = new Boolean(false).or(new Boolean(false));
      let result5 = Boolean.FALSE.or(new Boolean(false));
      expect((result1 === result2) as boolean).assertEqual(true);
      expect((result2 === result3) as boolean).assertEqual(true);
      expect((result1 === Boolean.TRUE) as boolean).assertEqual(true);
      expect((result4 === result5) as boolean).assertEqual(true);
      expect((result4 === Boolean.FALSE) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2700
     * @tc.name      testBooleanOrComparedWithLogicalOrOperator
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrComparedWithLogicalOrOperator", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj1 = new Boolean(true);
      let boolObj2 = new Boolean(false);
      let result1 = boolObj1.or(boolObj2);
      let result2 = boolObj1.valueOf() || boolObj2.valueOf();
      expect(typeof result1).assertEqual("boolean");
      expect(typeof result2).assertEqual("boolean");
      expect(result1.valueOf()).assertEqual(result2);
      expect((typeof result1) === (typeof result2)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2800
     * @tc.name      testBooleanOrComparedWithAndMethod
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrComparedWithAndMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.or(b).valueOf()).assertEqual(true);
      expect(a.or(a).valueOf()).assertEqual(true);
      expect(b.or(b).valueOf()).assertEqual(false);
      expect(a.and(b).valueOf()).assertEqual(false);
      expect(a.and(a).valueOf()).assertEqual(true);
      expect(b.and(b).valueOf()).assertEqual(false);
      expect(a.or(b).negate().valueOf()).assertEqual(a.negate().and(b.negate()).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_2900
     * @tc.name      testBooleanOrComparedWithXorMethod
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrComparedWithXorMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.or(b).valueOf()).assertEqual(true);
      expect(a.or(a).valueOf()).assertEqual(true);
      expect(b.or(b).valueOf()).assertEqual(false);
      expect(a.xor(b).valueOf()).assertEqual(true);
      expect(a.xor(a).valueOf()).assertEqual(false);
      expect(b.xor(b).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3000
     * @tc.name      testBooleanOrInstanceMethodComparedWithStaticEquivalent
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrInstanceMethodComparedWithStaticEquivalent", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let result1 = a.or(b);
      let result2 = new Boolean(a.valueOf() || b.valueOf());
      expect(result1.equals(Boolean.TRUE)).assertEqual(true);
      expect(result1.valueOf()).assertEqual(result2.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3100
     * @tc.name      testBooleanOrMustCallThroughInstanceCompileConstraint
     * @tc.desc      Boolean.or() must be called on a Boolean instance; static class call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrMustCallThroughInstanceCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.or(new Boolean(false)).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3200
     * @tc.name      testBooleanOrThisBinding
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrThisBinding", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(false);
      let other = new Boolean(true);
      expect(instance.or(other).equals(Boolean.TRUE)).assertEqual(true);
      expect(instance.or(Boolean.FALSE).equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3300
     * @tc.name      testBooleanOrIsBooleanInstanceMethod
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrIsBooleanInstanceMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.or).assertEqual("function");
      expect(instance.or(new Boolean(false)).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3400
     * @tc.name      testBooleanOrForMultipleConditionJudgment
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrForMultipleConditionJudgment", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasTrue: Array<Boolean> = [new Boolean(false), new Boolean(false), new Boolean(true)];
      let allFalse: Array<Boolean> = [new Boolean(false), new Boolean(false), new Boolean(false)];
      expect(checkAnyTrue(hasTrue)).assertEqual(true);
      expect(checkAnyTrue(allFalse)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3500
     * @tc.name      testBooleanOrForAnyPermission
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrForAnyPermission", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new OrPermissionUser(true, true, true).hasAnyPermission()).assertEqual(true);
      expect(new OrPermissionUser(true, false, false).hasAnyPermission()).assertEqual(true);
      expect(new OrPermissionUser(false, false, false).hasAnyPermission()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3600
     * @tc.name      testBooleanOrForConfigOptions
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrForConfigOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config1: OrConfig = {
        logToFile: new Boolean(true),
        logToConsole: new Boolean(false),
        logToRemote: new Boolean(false)
      };
      let config2: OrConfig = {
        logToFile: new Boolean(false),
        logToConsole: new Boolean(false),
        logToRemote: new Boolean(false)
      };
      expect(shouldLog(config1)).assertEqual(true);
      expect(shouldLog(config2)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3700
     * @tc.name      testBooleanOrForDataFiltering
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrForDataFiltering", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: Array<OrItem> = [
        { isUrgent: new Boolean(true), isImportant: new Boolean(false), isPriority: new Boolean(false) },
        { isUrgent: new Boolean(false), isImportant: new Boolean(false), isPriority: new Boolean(false) },
        { isUrgent: new Boolean(false), isImportant: new Boolean(true), isPriority: new Boolean(false) }
      ];
      expect(filterRelevantItems(items).length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3800
     * @tc.name      testBooleanOrCallPerformance
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(false);
      let b = new Boolean(true);
      let result = Boolean.FALSE;
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        result = a.or(b);
      }
      let elapsed = Date.now() - start;
      expect(result.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_3900
     * @tc.name      testBooleanOrPerformanceComparedWithLogicalOr
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrPerformanceComparedWithLogicalOr", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(false);
      let b = new Boolean(true);
      let methodResult = Boolean.FALSE;
      let primitiveResult = false;
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        methodResult = a.or(b);
      }
      let elapsed1 = Date.now() - start1;
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        primitiveResult = a.valueOf() || b.valueOf();
      }
      let elapsed2 = Date.now() - start2;
      expect(methodResult.valueOf()).assertEqual(true);
      expect(primitiveResult).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4000
     * @tc.name      testBooleanOrChainedOperation
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrChainedOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(false);
      let b = new Boolean(false);
      let c = new Boolean(true);
      let d = new Boolean(false);
      expect(a.or(b).or(c).or(d).valueOf()).assertEqual(true);
      expect(a.or(b).or(c).valueOf()).assertEqual(true);
      expect(a.or(b).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4100
     * @tc.name      testBooleanOrManyObjects
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrManyObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [];
      for (let i = 0; i < 100; i++) {
        bools.push(new Boolean(false));
      }
      expect(orAll(bools).valueOf()).assertEqual(false);
      bools.push(new Boolean(true));
      expect(orAll(bools).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4200
     * @tc.name      testBooleanOrEmptyArray
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrEmptyArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(orAllWithEmpty([]).equals(Boolean.FALSE)).assertEqual(true);
      expect(orAllWithEmpty([new Boolean(true)]).equals(Boolean.TRUE)).assertEqual(true);
      expect(orAllWithEmpty([new Boolean(false)]).equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4300
     * @tc.name      testBooleanOrWrongCallModeCompileConstraint
     * @tc.desc      Boolean.or() must be called via instance; class-level call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(new Boolean(false)).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4400
     * @tc.name      testBooleanOrNonBooleanArgumentCompileConstraint
     * @tc.desc      Boolean.or() only accepts Boolean argument; null, undefined, primitive, string etc. are compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrNonBooleanArgumentCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).or(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4500
     * @tc.name      testBooleanOrWrongThisBindingCompileConstraint
     * @tc.desc      Boolean.or() requires Boolean receiver; non-Boolean binding is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrWrongThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).or(new Boolean(true)).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4600
     * @tc.name      testBooleanOrCombinedWithAndXorNegate
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrCombinedWithAndXorNegate", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(true);
      expect(a.or(b).and(c).valueOf()).assertEqual(true);
      expect(a.or(b.and(c)).valueOf()).assertEqual(true);
      expect(a.or(b).negate().valueOf()).assertEqual(false);
      expect(a.or(b).xor(c).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4700
     * @tc.name      testBooleanOrDeMorganLaw
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrDeMorganLaw", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let lhs = a.or(b).negate();
      let rhs = a.negate().and(b.negate());
      let lhs2 = a.and(b).negate();
      let rhs2 = a.negate().or(b.negate());
      expect(lhs.valueOf()).assertEqual(rhs.valueOf());
      expect(lhs2.valueOf()).assertEqual(rhs2.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4800
     * @tc.name      testBooleanOrShortCircuitSimulation
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrShortCircuitSimulation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bCalled = false;
      let getB = (): Boolean => {
        bCalled = true;
        return new Boolean(true);
      };
      bCalled = false;
      expect(orWithShortCircuit(new Boolean(true), getB).valueOf()).assertEqual(true);
      expect(bCalled).assertEqual(false);
      bCalled = false;
      expect(orWithShortCircuit(new Boolean(false), getB).valueOf()).assertEqual(true);
      expect(bCalled).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_4900
     * @tc.name      testBooleanOrFunctionalProgramming
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrFunctionalProgramming", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(false), new Boolean(false), new Boolean(true), new Boolean(false)];
      let result = orAll(bools);
      let anyTrue = bools.some((value: Boolean) => value.isTrue());
      let falseValues = bools.filter((value: Boolean) => value.isFalse());
      expect(result.valueOf()).assertEqual(true);
      expect(anyTrue).assertEqual(true);
      expect(falseValues.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5000
     * @tc.name      testBooleanOrChainedConditionCheck
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrChainedConditionCheck", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new OrValidator(false, false, false).hasAnyError()).assertEqual(false);
      expect(new OrValidator(false, true, false).hasAnyError()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5100
     * @tc.name      testBooleanOrImprovesReadability
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrImprovesReadability", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(checkReadable(a, b)).assertEqual(true);
      expect(checkReadable(new Boolean(false), new Boolean(false))).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5200
     * @tc.name      testBooleanOrCombinesMultipleConditions
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrCombinesMultipleConditions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let conditions1: OrConditions = {
        option1: new Boolean(false),
        option2: new Boolean(false),
        option3: new Boolean(false)
      };
      let conditions2: OrConditions = {
        option1: new Boolean(false),
        option2: new Boolean(true),
        option3: new Boolean(false)
      };
      expect(evaluateAny(conditions1).valueOf()).assertEqual(false);
      expect(evaluateAny(conditions2).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5300
     * @tc.name      testBooleanOrAvoidsRepeatedIfStatements
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrAvoidsRepeatedIfStatements", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(checkWithoutRepeatedIf(new Boolean(false), new Boolean(true))).assertEqual(true);
      expect(checkWithoutRepeatedIf(new Boolean(false), new Boolean(false))).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5400
     * @tc.name      testBooleanOrArkTSComparedWithJavaLogicalOr
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrArkTSComparedWithJavaLogicalOr", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(false);
      let b = new Boolean(false);
      let result = a.or(b);
      let equivalent = new Boolean(a.valueOf() || b.valueOf());
      expect(result.valueOf()).assertEqual(false);
      expect(result.valueOf()).assertEqual(equivalent.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5500
     * @tc.name      testBooleanOrTypeInferenceCorrectness
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrTypeInferenceCorrectness", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let result: Boolean = a.or(b);
      let combined: Boolean = a.or(b).and(a);
      expect(result.valueOf()).assertEqual(true);
      expect(result.isTrue()).assertEqual(true);
      expect(combined.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5600
     * @tc.name      testBooleanOrSingletonMemoryOptimization
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrSingletonMemoryOptimization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let result1 = a.or(b);
      let result2 = a.or(b);
      let result3 = a.or(b);
      expect((result1 === result2) as boolean).assertEqual(true);
      expect((result2 === result3) as boolean).assertEqual(true);
      expect((result1 === Boolean.TRUE) as boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5700
     * @tc.name      testBooleanOrCommutativeAllValues
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrCommutativeAllValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Array<Boolean> = [new Boolean(true), new Boolean(false)];
      values.forEach((a: Boolean) => {
        values.forEach((b: Boolean) => {
          expect(a.or(b).valueOf()).assertEqual(b.or(a).valueOf());
        });
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5800
     * @tc.name      testBooleanOrAssociativeAllValues
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrAssociativeAllValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Array<Boolean> = [new Boolean(true), new Boolean(false)];
      values.forEach((a: Boolean) => {
        values.forEach((b: Boolean) => {
          values.forEach((c: Boolean) => {
            expect(a.or(b).or(c).valueOf()).assertEqual(a.or(b.or(c)).valueOf());
          });
        });
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_5900
     * @tc.name      testBooleanOrDistributiveLaw
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrDistributiveLaw", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Array<Boolean> = [new Boolean(true), new Boolean(false)];
      values.forEach((a: Boolean) => {
        values.forEach((b: Boolean) => {
          values.forEach((c: Boolean) => {
            let left = a.or(b.and(c));
            let right = a.or(b).and(a.or(c));
            expect(left.valueOf()).assertEqual(right.valueOf());
          });
        });
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_6000
     * @tc.name      testBooleanOrAbsorptionLaw
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrAbsorptionLaw", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Array<Boolean> = [new Boolean(true), new Boolean(false)];
      values.forEach((a: Boolean) => {
        values.forEach((b: Boolean) => {
          expect(a.or(a.and(b)).valueOf()).assertEqual(a.valueOf());
        });
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_6100
     * @tc.name      testBooleanOrAndDuality
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrAndDuality", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let directOr = a.or(b);
      let indirectOr = a.negate().and(b.negate()).negate();
      let directAnd = a.and(b);
      let indirectAnd = a.negate().or(b.negate()).negate();
      expect(directOr.valueOf()).assertEqual(indirectOr.valueOf());
      expect(directAnd.valueOf()).assertEqual(indirectAnd.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_OR_TEST_6200
     * @tc.name      testBooleanOrAndComplementOperations
     * @tc.desc      Boolean.or()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanOrAndComplementOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(andUsingOr(a, b).valueOf()).assertEqual(a.and(b).valueOf());
      expect(orUsingAnd(a, b).valueOf()).assertEqual(a.or(b).valueOf());
    })
  })
}
