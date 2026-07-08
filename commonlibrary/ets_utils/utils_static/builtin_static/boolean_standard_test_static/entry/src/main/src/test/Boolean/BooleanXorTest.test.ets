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

function xorAll(values: Array<Boolean>): Boolean {
  let result = Boolean.FALSE;
  values.forEach((value: Boolean) => {
    result = result.xor(value);
  });
  return result;
}

function hasStateChanged(oldState: Boolean, newState: Boolean): boolean {
  return oldState.xor(newState).isTrue();
}

function xorUsingAndOrNot1(a: Boolean, b: Boolean): Boolean {
  return a.and(b.negate()).or(a.negate().and(b));
}

function xorUsingAndOrNot2(a: Boolean, b: Boolean): Boolean {
  return a.or(b).and(a.negate().or(b.negate()));
}

function xorUsingAndOrNot3(a: Boolean, b: Boolean): Boolean {
  return a.or(b).and(a.and(b).negate());
}

function mod2Add(a: Boolean, b: Boolean): Boolean {
  let numA = a.valueOf() ? 1 : 0;
  let numB = b.valueOf() ? 1 : 0;
  return ((numA + numB) % 2) === 1 ? Boolean.TRUE : Boolean.FALSE;
}

function xnor(a: Boolean, b: Boolean): Boolean {
  return a.xor(b).negate();
}

function xnorAlt(a: Boolean, b: Boolean): Boolean {
  return a.and(b).or(a.negate().and(b.negate()));
}

class XorToggle {
  private state: Boolean;

  constructor(initialState: boolean) {
    this.state = new Boolean(initialState);
  }

  flipWith(other: Boolean): Boolean {
    this.state = this.state.xor(other);
    return this.state;
  }

  getState(): boolean {
    return this.state.valueOf();
  }
}

class XorState {
  private value: Boolean;

  constructor(value: boolean) {
    this.value = new Boolean(value);
  }

  hasChangedFrom(other: Boolean): boolean {
    return this.value.xor(other).isTrue();
  }
}

export default function BooleanXorTest(): void {
  describe("BooleanXorTest", () => {
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
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0100
     * @tc.name      testBooleanXorRequiresOtherParameterCompileConstraint
     * @tc.desc      Boolean.xor() requires a Boolean other parameter; calling without it is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRequiresOtherParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0200
     * @tc.name      testBooleanXorRejectsExtraParameterCompileConstraint
     * @tc.desc      Boolean.xor(Boolean) takes exactly one argument; extra arguments are compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsExtraParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(true)).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0300
     * @tc.name      testBooleanXorTrueFalse
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorTrueFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0400
     * @tc.name      testBooleanXorFalseTrue
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorFalseTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).xor(new Boolean(true)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0500
     * @tc.name      testBooleanXorTrueTrue
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorTrueTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(true)).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0600
     * @tc.name      testBooleanXorFalseFalse
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorFalseFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(false).xor(new Boolean(false)).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0700
     * @tc.name      testBooleanXorWithBooleanTrue
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorWithBooleanTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.TRUE).valueOf()).assertEqual(false);
      expect(Boolean.FALSE.xor(Boolean.TRUE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0800
     * @tc.name      testBooleanXorWithBooleanFalse
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorWithBooleanFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE).valueOf()).assertEqual(true);
      expect(Boolean.FALSE.xor(Boolean.FALSE).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_0900
     * @tc.name      testBooleanXorRejectsNullCompileConstraint
     * @tc.desc      Boolean.xor() rejects null as other parameter; null is compile-time invalid for Boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsNullCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1000
     * @tc.name      testBooleanXorRejectsUndefinedCompileConstraint
     * @tc.desc      Boolean.xor() rejects undefined as other parameter; undefined is compile-time invalid for Boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsUndefinedCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1100
     * @tc.name      testBooleanXorRejectsPrimitiveTrueCompileConstraint
     * @tc.desc      Boolean.xor() rejects primitive boolean as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsPrimitiveTrueCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(true)).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1200
     * @tc.name      testBooleanXorRejectsStringCompileConstraint
     * @tc.desc      Boolean.xor() rejects string as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsStringCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean("true")).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1300
     * @tc.name      testBooleanXorRejectsNumberCompileConstraint
     * @tc.desc      Boolean.xor() rejects number as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsNumberCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(1)).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1400
     * @tc.name      testBooleanXorRejectsObjectCompileConstraint
     * @tc.desc      Boolean.xor() rejects plain object as other parameter; only Boolean instance is accepted.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorRejectsObjectCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(new Number(1))).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1500
     * @tc.name      testBooleanXorReturnsBooleanObjectType
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorReturnsBooleanObjectType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).xor(new Boolean(false));
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1600
     * @tc.name      testBooleanXorReturnsTrueWhenValuesDiffer
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorReturnsTrueWhenValuesDiffer", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE).equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.FALSE.xor(Boolean.TRUE).equals(Boolean.TRUE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1700
     * @tc.name      testBooleanXorReturnsFalseWhenValuesSame
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorReturnsFalseWhenValuesSame", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.TRUE).equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.FALSE.xor(Boolean.FALSE).equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1800
     * @tc.name      testBooleanXorReturnsSingletons
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorReturnsSingletons", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE) === Boolean.TRUE).assertEqual(true);
      expect(Boolean.TRUE.xor(Boolean.TRUE) === Boolean.FALSE).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_1900
     * @tc.name      testBooleanXorDoesNotModifyOriginalObjects
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorDoesNotModifyOriginalObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original1 = new Boolean(true);
      let original2 = new Boolean(false);
      expect(original1.xor(original2).valueOf()).assertEqual(true);
      expect(original1.valueOf()).assertEqual(true);
      expect(original2.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2000
     * @tc.name      testBooleanXorCommutativeBasic
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorCommutativeBasic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.xor(b).valueOf()).assertEqual(b.xor(a).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2100
     * @tc.name      testBooleanXorAssociativeBasic
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorAssociativeBasic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(true);
      expect(a.xor(b).xor(c).valueOf()).assertEqual(a.xor(b.xor(c)).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2200
     * @tc.name      testBooleanXorFalseIdentity
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorFalseIdentity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE).valueOf()).assertEqual(Boolean.TRUE.valueOf());
      expect(Boolean.FALSE.xor(Boolean.FALSE).valueOf()).assertEqual(Boolean.FALSE.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2300
     * @tc.name      testBooleanXorSelfReturnsFalse
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorSelfReturnsFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.TRUE).valueOf()).assertEqual(false);
      expect(Boolean.FALSE.xor(Boolean.FALSE).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2400
     * @tc.name      testBooleanXorWithSameMaskTwiceReturnsOriginal
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorWithSameMaskTwiceReturnsOriginal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.xor(b).xor(b).valueOf()).assertEqual(a.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2500
     * @tc.name      testBooleanXorDifferentConstructors
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorDifferentConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let true1 = new Boolean(true);
      let true2 = new Boolean(100);
      let false1 = new Boolean(false);
      let false2 = new Boolean(0);
      expect(true1.xor(true2).valueOf()).assertEqual(false);
      expect(false1.xor(false2).valueOf()).assertEqual(false);
      expect(true1.xor(false1).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2600
     * @tc.name      testBooleanXorSameValueReturnsSameSingleton
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorSameValueReturnsSameSingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE) === Boolean.FALSE.xor(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.TRUE.xor(Boolean.TRUE) === Boolean.FALSE.xor(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2700
     * @tc.name      testBooleanXorComparedWithBitwiseOperator
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorComparedWithBitwiseOperator", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let bitwise = (a.valueOf() ? 1 : 0) ^ (b.valueOf() ? 1 : 0);
      expect(a.xor(b).valueOf()).assertEqual(bitwise === 1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2800
     * @tc.name      testBooleanXorComparedWithOrMethod
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorComparedWithOrMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.xor(b).valueOf()).assertEqual(a.or(b).and(a.negate().or(b.negate())).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_2900
     * @tc.name      testBooleanXorComparedWithAndMethod
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorComparedWithAndMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(a.xor(b).valueOf()).assertEqual(a.or(b).and(a.and(b).negate()).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3000
     * @tc.name      testBooleanXorUsingAndOrNegate
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorUsingAndOrNegate", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      expect(xorUsingAndOrNot1(a, b).valueOf()).assertEqual(a.xor(b).valueOf());
      expect(xorUsingAndOrNot2(a, b).valueOf()).assertEqual(a.xor(b).valueOf());
      expect(xorUsingAndOrNot3(a, b).valueOf()).assertEqual(a.xor(b).valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3100
     * @tc.name      testBooleanXorMustCallThroughInstanceCompileConstraint
     * @tc.desc      Boolean.xor() must be called on a Boolean instance; static class call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorMustCallThroughInstanceCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3200
     * @tc.name      testBooleanXorThisBindingByNormalCall
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorThisBindingByNormalCall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3300
     * @tc.name      testBooleanXorIsBooleanInstanceMethod
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorIsBooleanInstanceMethod", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.xor).assertEqual("function");
      expect(instance.xor(Boolean.FALSE).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3400
     * @tc.name      testBooleanXorSwitchState
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorSwitchState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toggle = new XorToggle(false);
      expect(toggle.getState()).assertEqual(false);
      expect(toggle.flipWith(Boolean.TRUE).valueOf()).assertEqual(true);
      expect(toggle.flipWith(Boolean.TRUE).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3500
     * @tc.name      testBooleanXorParityCheck
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorParityCheck", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(xorAll([new Boolean(true), new Boolean(true), new Boolean(true)]).valueOf()).assertEqual(true);
      expect(xorAll([new Boolean(true), new Boolean(true), new Boolean(true), new Boolean(true)]).valueOf()).assertEqual(false);
      expect(xorAll([new Boolean(false), new Boolean(false), new Boolean(false)]).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3600
     * @tc.name      testBooleanXorDetectsStateDifference
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorDetectsStateDifference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(hasStateChanged(new Boolean(true), new Boolean(true))).assertEqual(false);
      expect(hasStateChanged(new Boolean(true), new Boolean(false))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3700
     * @tc.name      testBooleanXorSimpleEncryption
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorSimpleEncryption", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(false)];
      let encrypted = original.map((bit: Boolean) => bit.xor(Boolean.TRUE));
      let decrypted = encrypted.map((bit: Boolean) => bit.xor(Boolean.TRUE));
      expect(encrypted[0].valueOf()).assertEqual(false);
      expect(encrypted[1].valueOf()).assertEqual(true);
      expect(decrypted[0].valueOf()).assertEqual(original[0].valueOf());
      expect(decrypted[1].valueOf()).assertEqual(original[1].valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3800
     * @tc.name      testBooleanXorCallPerformance
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        expect(a.xor(b).valueOf()).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_3900
     * @tc.name      testBooleanXorPerformanceComparedWithBitwise
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorPerformanceComparedWithBitwise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let start1 = Date.now();
      for (let i = 0; i < 1000; i++) {
        expect(a.xor(b).valueOf()).assertEqual(true);
      }
      let start2 = Date.now();
      for (let i = 0; i < 1000; i++) {
        expect(((a.valueOf() ? 1 : 0) ^ (b.valueOf() ? 1 : 0)) === 1).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4000
     * @tc.name      testBooleanXorChainedOperation
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorChainedOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(true);
      let d = new Boolean(false);
      expect(a.xor(b).xor(c).xor(d).valueOf()).assertEqual(false);
      expect(a.xor(b).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4100
     * @tc.name      testBooleanXorManyObjects
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorManyObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [];
      for (let i = 0; i < 100; i++) {
        bools.push(new Boolean(i % 2 === 0));
      }
      expect(xorAll(bools).valueOf()).assertEqual(false);
      bools.push(new Boolean(true));
      expect(xorAll(bools).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4200
     * @tc.name      testBooleanXorEmptyArray
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorEmptyArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(xorAll([]).valueOf()).assertEqual(false);
      expect(xorAll([new Boolean(true)]).valueOf()).assertEqual(true);
      expect(xorAll([new Boolean(false)]).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4300
     * @tc.name      testBooleanXorMultipleValueReversibility
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorMultipleValueReversibility", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(true);
      expect(a.xor(b).xor(c).xor(b).xor(c).valueOf()).assertEqual(a.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4400
     * @tc.name      testBooleanXorWrongCallModeCompileConstraint
     * @tc.desc      Boolean.xor() must be called via instance; class-level call is compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorWrongCallModeCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4500
     * @tc.name      testBooleanXorNonBooleanArgumentCompileConstraint
     * @tc.desc      Boolean.xor() only accepts Boolean argument; non-Boolean types are compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorNonBooleanArgumentCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4600
     * @tc.name      testBooleanXorWrongThisBindingCompileConstraint
     * @tc.desc      Boolean.xor() requires Boolean receiver; non-Boolean binding is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorWrongThisBindingCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4700
     * @tc.name      testBooleanXorCombinedWithAndOrNegate
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorCombinedWithAndOrNegate", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let c = new Boolean(true);
      expect(a.xor(b).and(c).valueOf()).assertEqual(true);
      expect(a.xor(b).or(c).valueOf()).assertEqual(true);
      expect(a.xor(b).negate().valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4800
     * @tc.name      testBooleanXorSwapValues
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorSwapValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Boolean(true);
      let b = new Boolean(false);
      let tempA = a;
      let tempB = b;
      a = tempA.xor(tempB);
      b = a.xor(tempB);
      a = a.xor(b);
      expect(a.valueOf()).assertEqual(tempB.valueOf());
      expect(b.valueOf()).assertEqual(tempA.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_4900
     * @tc.name      testBooleanXorFunctionalProgramming
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorFunctionalProgramming", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bools: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(false)];
      let result = bools.reduce((acc: Boolean, val: Boolean) => acc.xor(val), Boolean.FALSE);
      let different = bools.filter((value: Boolean) => value.xor(Boolean.TRUE).isTrue());
      expect(result.valueOf()).assertEqual(false);
      expect(different.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5000
     * @tc.name      testBooleanXorChecksum
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorChecksum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data = [new Boolean(true), new Boolean(false), new Boolean(true)];
      let checksum = xorAll(data);
      expect(checksum.valueOf()).assertEqual(false);
      expect(xorAll(data).xor(checksum).isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5100
     * @tc.name      testBooleanXorStateChangeBestPractice
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorStateChangeBestPractice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state = new XorState(true);
      expect(state.hasChangedFrom(new Boolean(true))).assertEqual(false);
      expect(state.hasChangedFrom(new Boolean(false))).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5200
     * @tc.name      testBooleanXorMutuallyExclusiveConditions
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorMutuallyExclusiveConditions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).xor(new Boolean(false)).isTrue()).assertEqual(true);
      expect(new Boolean(true).xor(new Boolean(true)).isTrue()).assertEqual(false);
      expect(new Boolean(false).xor(new Boolean(false)).isTrue()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5300
     * @tc.name      testBooleanXorDataConversion
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorDataConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bit = new Boolean(true);
      expect(bit.xor(Boolean.TRUE).valueOf()).assertEqual(false);
      expect(bit.xor(Boolean.FALSE).valueOf()).assertEqual(true);
      expect(bit.xor(Boolean.TRUE).xor(Boolean.TRUE).valueOf()).assertEqual(bit.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5400
     * @tc.name      testBooleanXorGrayCodeConversion
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorGrayCodeConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binary: Array<Boolean> = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(true)];
      let gray: Array<Boolean> = [binary[0], binary[1].xor(binary[0]), binary[2].xor(binary[1]), binary[3].xor(binary[2])];
      expect(gray[0].valueOf()).assertEqual(true);
      expect(gray[1].valueOf()).assertEqual(true);
      expect(gray[2].valueOf()).assertEqual(true);
      expect(gray[3].valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5500
     * @tc.name      testBooleanXorComparedWithMathXor
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorComparedWithMathXor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.xor(Boolean.FALSE).valueOf()).assertEqual(true);
      expect(Boolean.FALSE.xor(Boolean.TRUE).valueOf()).assertEqual(true);
      expect(Boolean.TRUE.xor(Boolean.TRUE).valueOf()).assertEqual(false);
      expect(Boolean.FALSE.xor(Boolean.FALSE).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5600
     * @tc.name      testBooleanXorTypeInferenceCorrectness
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorTypeInferenceCorrectness", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Boolean = Boolean.TRUE.xor(Boolean.FALSE);
      expect(result.valueOf()).assertEqual(true);
      expect(result.xor(Boolean.TRUE).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5700
     * @tc.name      testBooleanXorSingletonMemoryOptimization
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorSingletonMemoryOptimization", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = Boolean.TRUE.xor(Boolean.FALSE);
      let result2 = Boolean.TRUE.xor(Boolean.FALSE);
      expect(result1 === result2).assertEqual(true);
      expect(result1 === Boolean.TRUE).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5800
     * @tc.name      testBooleanXorCommutativeAllValues
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorCommutativeAllValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = [Boolean.TRUE, Boolean.FALSE];
      values.forEach((a: Boolean) => values.forEach((b: Boolean) => {
        expect(a.xor(b).valueOf()).assertEqual(b.xor(a).valueOf());
      }));
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_5900
     * @tc.name      testBooleanXorAssociativeAllValues
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorAssociativeAllValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = [Boolean.TRUE, Boolean.FALSE];
      values.forEach((a: Boolean) => values.forEach((b: Boolean) => values.forEach((c: Boolean) => {
        expect(a.xor(b).xor(c).valueOf()).assertEqual(a.xor(b.xor(c)).valueOf());
      })));
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_6000
     * @tc.name      testBooleanXorIdentityAllValues
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorIdentityAllValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      [Boolean.TRUE, Boolean.FALSE].forEach((a: Boolean) => {
        expect(a.xor(Boolean.FALSE).valueOf()).assertEqual(a.valueOf());
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_6100
     * @tc.name      testBooleanXorInverseAllValues
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorInverseAllValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      [Boolean.TRUE, Boolean.FALSE].forEach((a: Boolean) => {
        expect(a.xor(a).valueOf()).assertEqual(false);
      });
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_6200
     * @tc.name      testBooleanXorDistributiveLawWithAnd
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorDistributiveLawWithAnd", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = [Boolean.TRUE, Boolean.FALSE];
      values.forEach((a: Boolean) => values.forEach((b: Boolean) => values.forEach((c: Boolean) => {
        expect(a.and(b.xor(c)).valueOf()).assertEqual(a.and(b).xor(a.and(c)).valueOf());
      })));
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_6300
     * @tc.name      testBooleanXorImplementedByAndOrNot
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorImplementedByAndOrNot", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      [Boolean.TRUE, Boolean.FALSE].forEach((a: Boolean) => [Boolean.TRUE, Boolean.FALSE].forEach((b: Boolean) => {
        expect(xorUsingAndOrNot1(a, b).valueOf()).assertEqual(a.xor(b).valueOf());
        expect(xorUsingAndOrNot2(a, b).valueOf()).assertEqual(a.xor(b).valueOf());
        expect(xorUsingAndOrNot3(a, b).valueOf()).assertEqual(a.xor(b).valueOf());
      }));
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_6400
     * @tc.name      testBooleanXorMod2Addition
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorMod2Addition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      [Boolean.TRUE, Boolean.FALSE].forEach((a: Boolean) => [Boolean.TRUE, Boolean.FALSE].forEach((b: Boolean) => {
        expect(a.xor(b).valueOf()).assertEqual(mod2Add(a, b).valueOf());
      }));
    })

    /**
     * @tc.number    SUB_BOOLEAN_XOR_TEST_6500
     * @tc.name      testBooleanXorXnorIsNegatedXor
     * @tc.desc      Boolean.xor()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanXorXnorIsNegatedXor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      [Boolean.TRUE, Boolean.FALSE].forEach((a: Boolean) => [Boolean.TRUE, Boolean.FALSE].forEach((b: Boolean) => {
        expect(xnor(a, b).valueOf()).assertEqual(a.xor(b).negate().valueOf());
        expect(xnor(a, b).valueOf()).assertEqual(xnorAlt(a, b).valueOf());
      }));
    })
  })
}
