'use static';
﻿/*
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

class BooleanConstructorConfig {
  enabled: Boolean;
  visible: Boolean;

  constructor(enabled: boolean, visible: boolean) {
    this.enabled = new Boolean(enabled);
    this.visible = new Boolean(visible);
  }

  canShow(): boolean {
    return this.enabled.and(this.visible).isTrue();
  }
}

function createBooleanFlag(value: boolean): Boolean {
  return new Boolean(value);
}

function assertBooleanObjectValue(value: boolean): Boolean {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(value);
  expect(bool.valueOf()).assertEqual(value);
  return bool;
}

function BooleanConstructor01Test(): void {
  describe("BooleanConstructor01Test", (): void => {
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
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0100
     * @tc.name      testBooleanConstructorTrue
     * @tc.desc      Boolean constructor creates true Boolean object from true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorTrue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: Boolean = new Boolean(true);

      expect(bool instanceof Boolean).assertEqual(true);
      expect(bool.toBoolean()).assertEqual(true);
      expect(bool.valueOf()).assertEqual(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0200
     * @tc.name      testBooleanConstructorFalse
     * @tc.desc      Boolean constructor creates false Boolean object from false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFalse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: Boolean = new Boolean(false);

      expect(bool instanceof Boolean).assertEqual(true);
      expect(bool.toBoolean()).assertEqual(false);
      expect(bool.valueOf()).assertEqual(false);
      expect(bool.isTrue()).assertEqual(false);
      expect(bool.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0300
     * @tc.name      testBooleanConstructorNoParameterDefault
     * @tc.desc      Boolean constructor without parameters creates false by current SDK behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNoParameterDefault", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: Boolean = new Boolean();

      expect(bool instanceof Boolean).assertEqual(true);
      expect(bool.toBoolean()).assertEqual(false);
      expect(bool.valueOf()).assertEqual(false);
      expect(bool.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0400
     * @tc.name      testBooleanConstructorAllBooleanValues
     * @tc.desc      Boolean constructor supports all primitive boolean values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAllBooleanValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: boolean[] = [true, false];
      for (let index: int = 0; index < values.length; index++) {
        const bool: Boolean = new Boolean(values[index]);
        expect(bool.toBoolean()).assertEqual(values[index]);
        expect(bool.valueOf()).assertEqual(values[index]);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0500
     * @tc.name      testBooleanConstructorReturnType
     * @tc.desc      Boolean constructor returns Boolean values with valid Boolean instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);

      expect(bool1 instanceof Boolean).assertEqual(true);
      expect(bool2 instanceof Boolean).assertEqual(true);
      expect(bool1.toBoolean()).assertEqual(true);
      expect(bool2.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0600
     * @tc.name      testBooleanConstructorInstanceMethods
     * @tc.desc      Boolean constructor result supports Boolean instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorInstanceMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: Boolean = new Boolean(true);

      expect(bool.toBoolean()).assertEqual(true);
      expect(bool.valueOf()).assertEqual(true);
      expect(bool.toString()).assertEqual("true");
      expect(bool.equals(new Boolean(true))).assertEqual(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(false);
      expect(bool.negate().toBoolean()).assertEqual(false);
      expect(bool.and(new Boolean(true)).toBoolean()).assertEqual(true);
      expect(bool.or(new Boolean(false)).toBoolean()).assertEqual(true);
      expect(bool.xor(new Boolean(true)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0700
     * @tc.name      testBooleanConstructorToString
     * @tc.desc      Boolean constructor result converts to string correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorToString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toString()).assertEqual("true");
      expect(new Boolean(false).toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0800
     * @tc.name      testBooleanConstructorCompareWithStaticInstances
     * @tc.desc      Boolean constructor result has same value as Boolean.TRUE and Boolean.FALSE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCompareWithStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);

      expect(trueBool.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(falseBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_0900
     * @tc.name      testBooleanConstructorStaticToBoolean
     * @tc.desc      Boolean constructor result matches Boolean.toBoolean().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStaticToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueObj: Boolean = new Boolean(true);
      const falseObj: Boolean = new Boolean(false);

      expect(trueObj.toBoolean()).assertEqual(Boolean.toBoolean(true));
      expect(falseObj.toBoolean()).assertEqual(Boolean.toBoolean(false));
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1000
     * @tc.name      testBooleanConstructorFactoryHelper
     * @tc.desc      Boolean constructor can be wrapped in factory helpers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFactoryHelper", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueFlag: Boolean = createBooleanFlag(true);
      const falseFlag: Boolean = createBooleanFlag(false);

      expect(trueFlag.toBoolean()).assertEqual(true);
      expect(falseFlag.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1100
     * @tc.name      testBooleanConstructorConditionUsage
     * @tc.desc      Boolean constructor result can be used for condition checks through isTrue().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorConditionUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: Boolean = new Boolean(true);
      let result: string = "false";

      if (bool.isTrue()) {
        result = "true";
      }

      expect(result).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1200
     * @tc.name      testBooleanConstructorNegate
     * @tc.desc      Boolean constructor result supports negate().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNegate", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);

      expect(trueBool.negate().toBoolean()).assertEqual(false);
      expect(falseBool.negate().toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1300
     * @tc.name      testBooleanConstructorAndOperation
     * @tc.desc      Boolean constructor result supports and().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAndOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);
      const bool3: Boolean = new Boolean(true);

      expect(bool1.and(bool2).toBoolean()).assertEqual(false);
      expect(bool1.and(bool3).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1400
     * @tc.name      testBooleanConstructorOrOperation
     * @tc.desc      Boolean constructor result supports or().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorOrOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);

      expect(bool1.or(bool2).toBoolean()).assertEqual(true);
      expect(bool2.or(new Boolean(false)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1500
     * @tc.name      testBooleanConstructorXorOperation
     * @tc.desc      Boolean constructor result supports xor().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorXorOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);

      expect(trueBool.xor(trueBool).toBoolean()).assertEqual(false);
      expect(trueBool.xor(falseBool).toBoolean()).assertEqual(true);
      expect(falseBool.xor(falseBool).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1600
     * @tc.name      testBooleanConstructorEquals
     * @tc.desc      Boolean constructor result supports equals() by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorEquals", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool1: Boolean = new Boolean(true);
      const trueBool2: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);

      expect(trueBool1.equals(trueBool2)).assertEqual(true);
      expect(trueBool1.equals(falseBool)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1700
     * @tc.name      testBooleanConstructorCompareTo
     * @tc.desc      Boolean constructor result supports compareTo().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCompareTo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);

      expect(trueBool.compareTo(falseBool)).assertEqual(1);
      expect(falseBool.compareTo(trueBool)).assertEqual(-1);
      expect(trueBool.compareTo(new Boolean(true))).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1800
     * @tc.name      testBooleanConstructorConfigScenario
     * @tc.desc      Boolean constructor can initialize Boolean object fields in application config.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorConfigScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config1: BooleanConstructorConfig = new BooleanConstructorConfig(true, true);
      const config2: BooleanConstructorConfig = new BooleanConstructorConfig(true, false);

      expect(config1.canShow()).assertEqual(true);
      expect(config2.canShow()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_1900
     * @tc.name      testBooleanConstructorHelperAssertion
     * @tc.desc      Boolean constructor creates objects with stable primitive values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorHelperAssertion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = assertBooleanObjectValue(true);
      const falseBool: Boolean = assertBooleanObjectValue(false);

      expect(trueBool.isTrue()).assertEqual(true);
      expect(falseBool.isFalse()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_ONE_2000
     * @tc.name      testBooleanConstructorMultipleInstances
     * @tc.desc      Boolean constructor creates Boolean values that remain equal by wrapped value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorMultipleInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(true);
      const bool3: Boolean = new Boolean(false);
      const bool4: Boolean = new Boolean(false);

      expect(bool1.toBoolean()).assertEqual(bool2.toBoolean());
      expect(bool3.toBoolean()).assertEqual(bool4.toBoolean());
      expect(bool1.valueOf()).assertEqual(true);
      expect(bool3.valueOf()).assertEqual(false);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool3.equals(bool4)).assertEqual(true);
    })
  })
}

function isZeroByIntBoolean(value: int): boolean {
  return new Boolean(value).isFalse();
}

function isNonZeroByIntBoolean(value: int): boolean {
  return new Boolean(value).isTrue();
}

function assertIntBoolean(value: int, expected: boolean): void {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(expected);
  expect(bool.valueOf()).assertEqual(expected);
}

function BooleanConstructor02Test(): void {
  describe("BooleanConstructor02Test", (): void => {
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
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0100
     * @tc.name      testBooleanConstructorByteValues
     * @tc.desc      Boolean constructor converts byte values: non-zero to true and zero to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorByteValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(127 as byte).toBoolean()).assertEqual(true);
      expect(new Boolean(-1 as byte).toBoolean()).assertEqual(true);
      expect(new Boolean(Byte.MAX_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Byte.MIN_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(0 as byte).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0200
     * @tc.name      testBooleanConstructorShortValues
     * @tc.desc      Boolean constructor converts short values: non-zero to true and zero to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorShortValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(1000 as short).toBoolean()).assertEqual(true);
      expect(new Boolean(-1000 as short).toBoolean()).assertEqual(true);
      expect(new Boolean(Short.MAX_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Short.MIN_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(0 as short).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0300
     * @tc.name      testBooleanConstructorIntValues
     * @tc.desc      Boolean constructor converts int values: non-zero to true and zero to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorIntValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100000 as int).toBoolean()).assertEqual(true);
      expect(new Boolean(-100000 as int).toBoolean()).assertEqual(true);
      expect(new Boolean(Int.MAX_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Int.MIN_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(0 as int).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0400
     * @tc.name      testBooleanConstructorLongValues
     * @tc.desc      Boolean constructor converts long values: non-zero to true and zero to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorLongValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(10000000000 as long).toBoolean()).assertEqual(true);
      expect(new Boolean(-10000000000 as long).toBoolean()).assertEqual(true);
      expect(new Boolean(Long.MAX_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Long.MIN_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(0 as long).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0500
     * @tc.name      testBooleanConstructorBigIntValues
     * @tc.desc      Boolean constructor converts bigint values: non-zero to true and zero to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorBigIntValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100n).toBoolean()).assertEqual(true);
      expect(new Boolean(-100n).toBoolean()).assertEqual(true);
      expect(new Boolean(999999999999999999n).toBoolean()).assertEqual(true);
      expect(new Boolean(1n).toBoolean()).assertEqual(true);
      expect(new Boolean(0n).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0600
     * @tc.name      testBooleanConstructorIntegerRadixValues
     * @tc.desc      Boolean constructor converts hexadecimal, octal, and binary integer literals.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorIntegerRadixValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(0x1A as int).toBoolean()).assertEqual(true);
      expect(new Boolean(0x00 as int).toBoolean()).assertEqual(false);
      expect(new Boolean(0o17 as int).toBoolean()).assertEqual(true);
      expect(new Boolean(0o00 as int).toBoolean()).assertEqual(false);
      expect(new Boolean(0b1010 as int).toBoolean()).assertEqual(true);
      expect(new Boolean(0b0000 as int).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0700
     * @tc.name      testBooleanConstructorScientificIntegerValues
     * @tc.desc      Boolean constructor converts scientific notation integer values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorScientificIntegerValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nonZero: int = 100000;
      const zero: int = 0;
      expect(new Boolean(nonZero).toBoolean()).assertEqual(true);
      expect(new Boolean(zero).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0800
     * @tc.name      testBooleanConstructorReturnType
     * @tc.desc      Boolean constructor with integer values returns Boolean object instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intBool: Boolean = new Boolean(100 as int);
      const bigIntBool: Boolean = new Boolean(0n);

      expect(intBool instanceof Boolean).assertEqual(true);
      expect(bigIntBool instanceof Boolean).assertEqual(true);
      expect(intBool.toBoolean()).assertEqual(true);
      expect(bigIntBool.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_0900
     * @tc.name      testBooleanConstructorNonZeroRules
     * @tc.desc      Boolean constructor converts positive and negative non-zero integers to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNonZeroRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertIntBoolean(1 as int, true);
      assertIntBoolean(10 as int, true);
      assertIntBoolean(1000 as int, true);
      assertIntBoolean(Int.MAX_VALUE, true);
      assertIntBoolean(-1 as int, true);
      assertIntBoolean(-10 as int, true);
      assertIntBoolean(-1000 as int, true);
      assertIntBoolean(Int.MIN_VALUE, true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1000
     * @tc.name      testBooleanConstructorZeroRules
     * @tc.desc      Boolean constructor converts all integer zero forms to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorZeroRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(0 as byte).toBoolean()).assertEqual(false);
      expect(new Boolean(0 as short).toBoolean()).assertEqual(false);
      expect(new Boolean(0 as int).toBoolean()).assertEqual(false);
      expect(new Boolean(0 as long).toBoolean()).assertEqual(false);
      expect(new Boolean(0n).toBoolean()).assertEqual(false);
      expect(new Boolean(0x00 as int).toBoolean()).assertEqual(false);
      expect(new Boolean(0o00 as int).toBoolean()).assertEqual(false);
      expect(new Boolean(0b0000 as int).toBoolean()).assertEqual(false);
      const scientificZero: int = 0;
      expect(new Boolean(scientificZero).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1100
     * @tc.name      testBooleanConstructorMethods
     * @tc.desc      Boolean constructor with integer values supports Boolean instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(100 as int);
      const falseBool: Boolean = new Boolean(0 as int);

      expect(trueBool.toBoolean()).assertEqual(true);
      expect(trueBool.valueOf()).assertEqual(true);
      expect(trueBool.isTrue()).assertEqual(true);
      expect(falseBool.isFalse()).assertEqual(true);
      expect(trueBool.toString()).assertEqual("true");
      expect(falseBool.toString()).assertEqual("false");
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1200
     * @tc.name      testBooleanConstructorCompareWithStaticInstances
     * @tc.desc      Boolean constructor from integers matches Boolean.TRUE and Boolean.FALSE by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCompareWithStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(100 as int);
      const falseBool: Boolean = new Boolean(0 as int);

      expect(trueBool.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(falseBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1300
     * @tc.name      testBooleanConstructorIsZeroScenario
     * @tc.desc      Boolean constructor can check whether an int value is zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorIsZeroScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isZeroByIntBoolean(0 as int)).assertEqual(true);
      expect(isZeroByIntBoolean(100 as int)).assertEqual(false);
      expect(isZeroByIntBoolean(-100 as int)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1400
     * @tc.name      testBooleanConstructorIsNonZeroScenario
     * @tc.desc      Boolean constructor can check whether an int value is non-zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorIsNonZeroScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isNonZeroByIntBoolean(0 as int)).assertEqual(false);
      expect(isNonZeroByIntBoolean(100 as int)).assertEqual(true);
      expect(isNonZeroByIntBoolean(-100 as int)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1500
     * @tc.name      testBooleanConstructorNegateOperation
     * @tc.desc      Boolean constructor from integers supports negate operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNegateOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100 as int).negate().toBoolean()).assertEqual(false);
      expect(new Boolean(0 as int).negate().toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1600
     * @tc.name      testBooleanConstructorAndOperation
     * @tc.desc      Boolean constructor from integers supports and operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAndOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100 as int).and(new Boolean(200 as int)).toBoolean()).assertEqual(true);
      expect(new Boolean(100 as int).and(new Boolean(0 as int)).toBoolean()).assertEqual(false);
      expect(new Boolean(0 as int).and(new Boolean(0 as int)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1700
     * @tc.name      testBooleanConstructorOrOperation
     * @tc.desc      Boolean constructor from integers supports or operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorOrOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100 as int).or(new Boolean(0 as int)).toBoolean()).assertEqual(true);
      expect(new Boolean(0 as int).or(new Boolean(0 as int)).toBoolean()).assertEqual(false);
      expect(new Boolean(100 as int).or(new Boolean(200 as int)).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1800
     * @tc.name      testBooleanConstructorXorOperation
     * @tc.desc      Boolean constructor from integers supports xor operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorXorOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100 as int).xor(new Boolean(0 as int)).toBoolean()).assertEqual(true);
      expect(new Boolean(100 as int).xor(new Boolean(200 as int)).toBoolean()).assertEqual(false);
      expect(new Boolean(0 as int).xor(new Boolean(0 as int)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_1900
     * @tc.name      testBooleanConstructorConditionScenario
     * @tc.desc      Boolean constructor from integers can be used in condition checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorConditionScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: Boolean = new Boolean(100 as int);
      let result: string = "zero";

      if (bool.isTrue()) {
        result = "non-zero";
      }

      expect(result).assertEqual("non-zero");
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_TWO_2000
     * @tc.name      testBooleanConstructorCompareWithBooleanAndInvoke
     * @tc.desc      Integer constructor results match boolean constructor and $_invoke results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCompareWithBooleanAndInvoke", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100 as int).toBoolean()).assertEqual(new Boolean(true).toBoolean());
      expect(new Boolean(0 as int).toBoolean()).assertEqual(new Boolean(false).toBoolean());
      expect(new Boolean(100 as int).toBoolean()).assertEqual(Boolean.$_invoke<int>(100 as int));
      expect(new Boolean(0 as int).toBoolean()).assertEqual(Boolean.$_invoke<int>(0 as int));
    })
  })
}

function isNullChar(value: char): boolean {
  return new Boolean(value).isFalse();
}

function isNonNullChar(value: char): boolean {
  return new Boolean(value).isTrue();
}

function assertCharBoolean(value: char, expected: boolean): void {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(expected);
  expect(bool.valueOf()).assertEqual(expected);
}

function BooleanConstructor03Test(): void {
  describe("BooleanConstructor03Test", (): void => {
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
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0100
     * @tc.name      testBooleanConstructorCharBasicValues
     * @tc.desc      Boolean constructor converts basic char values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharBasicValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').toBoolean()).assertEqual(true);
      expect(new Boolean(c'z').toBoolean()).assertEqual(true);
      expect(new Boolean(c'0').toBoolean()).assertEqual(true);
      expect(new Boolean(c'@').toBoolean()).assertEqual(true);
      expect(new Boolean(c' ').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0200
     * @tc.name      testBooleanConstructorCharEscapeValues
     * @tc.desc      Boolean constructor converts escaped control chars except null char to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharEscapeValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\n').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\t').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\r').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\b').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\f').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0300
     * @tc.name      testBooleanConstructorCharHexEscapeValues
     * @tc.desc      Boolean constructor converts hexadecimal char escapes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharHexEscapeValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\x41').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\x7F').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\x01').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\xFF').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\x00').toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0400
     * @tc.name      testBooleanConstructorCharUnicodeEscapeValues
     * @tc.desc      Boolean constructor converts Unicode char escapes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharUnicodeEscapeValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\u0000').toBoolean()).assertEqual(false);
      expect(new Boolean(c'\u0001').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0041').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u4E2D').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\uFFFF').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0500
     * @tc.name      testBooleanConstructorCharBoundaryValues
     * @tc.desc      Boolean constructor handles char and printable ASCII boundaries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\u0000').toBoolean()).assertEqual(false);
      expect(new Boolean(c'\uFFFF').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0020').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u007E').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0600
     * @tc.name      testBooleanConstructorCharSymbolValues
     * @tc.desc      Boolean constructor converts symbol chars to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharSymbolValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\'').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\\').toBoolean()).assertEqual(true);
      expect(new Boolean(c'"').toBoolean()).assertEqual(true);
      expect(new Boolean(c'/').toBoolean()).assertEqual(true);
      expect(new Boolean(c'$').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0700
     * @tc.name      testBooleanConstructorCharReturnType
     * @tc.desc      Boolean constructor with char returns Boolean object instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(c'A');
      const falseBool: Boolean = new Boolean(c'\u0000');

      expect(trueBool instanceof Boolean).assertEqual(true);
      expect(falseBool instanceof Boolean).assertEqual(true);
      expect(trueBool.toBoolean()).assertEqual(true);
      expect(falseBool.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0800
     * @tc.name      testBooleanConstructorCharNonNullRules
     * @tc.desc      Boolean constructor converts non-null chars to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharNonNullRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertCharBoolean(c'A', true);
      assertCharBoolean(c'z', true);
      assertCharBoolean(c'0', true);
      assertCharBoolean(c'9', true);
      assertCharBoolean(c' ', true);
      assertCharBoolean(c'\n', true);
      assertCharBoolean(c'\t', true);
      assertCharBoolean(c'%', true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_0900
     * @tc.name      testBooleanConstructorCharNullRules
     * @tc.desc      Boolean constructor converts null char forms to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharNullRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertCharBoolean(c'\u0000', false);
      assertCharBoolean(c'\x00', false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1000
     * @tc.name      testBooleanConstructorCharControlValues
     * @tc.desc      Boolean constructor converts non-null ASCII control chars to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharControlValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\u0001').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0002').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0007').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0008').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u000B').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u001F').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1100
     * @tc.name      testBooleanConstructorCharMethods
     * @tc.desc      Boolean constructor with char supports Boolean instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(c'A');
      const falseBool: Boolean = new Boolean(c'\u0000');

      expect(trueBool.toBoolean()).assertEqual(true);
      expect(trueBool.valueOf()).assertEqual(true);
      expect(trueBool.isTrue()).assertEqual(true);
      expect(falseBool.isFalse()).assertEqual(true);
      expect(trueBool.toString()).assertEqual("true");
      expect(falseBool.toString()).assertEqual("false");
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1200
     * @tc.name      testBooleanConstructorCharCompareWithStaticInstances
     * @tc.desc      Boolean constructor from char matches Boolean.TRUE and Boolean.FALSE by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharCompareWithStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(c'A');
      const falseBool: Boolean = new Boolean(c'\u0000');

      expect(trueBool.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(falseBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1300
     * @tc.name      testBooleanConstructorCharNullScenario
     * @tc.desc      Boolean constructor can check whether a char is null char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharNullScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isNullChar(c'\u0000')).assertEqual(true);
      expect(isNullChar(c'A')).assertEqual(false);
      expect(isNullChar(c'\n')).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1400
     * @tc.name      testBooleanConstructorCharNonNullScenario
     * @tc.desc      Boolean constructor can check whether a char is non-null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharNonNullScenario", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isNonNullChar(c'\u0000')).assertEqual(false);
      expect(isNonNullChar(c'A')).assertEqual(true);
      expect(isNonNullChar(c'\n')).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1500
     * @tc.name      testBooleanConstructorCharNegateOperation
     * @tc.desc      Boolean constructor from char supports negate operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharNegateOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').negate().toBoolean()).assertEqual(false);
      expect(new Boolean(c'\u0000').negate().toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1600
     * @tc.name      testBooleanConstructorCharAndOperation
     * @tc.desc      Boolean constructor from char supports and operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharAndOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').and(new Boolean(c'B')).toBoolean()).assertEqual(true);
      expect(new Boolean(c'A').and(new Boolean(c'\u0000')).toBoolean()).assertEqual(false);
      expect(new Boolean(c'\u0000').and(new Boolean(c'\x00')).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1700
     * @tc.name      testBooleanConstructorCharOrOperation
     * @tc.desc      Boolean constructor from char supports or operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharOrOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').or(new Boolean(c'\u0000')).toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0000').or(new Boolean(c'\x00')).toBoolean()).assertEqual(false);
      expect(new Boolean(c'A').or(new Boolean(c'B')).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1800
     * @tc.name      testBooleanConstructorCharXorOperation
     * @tc.desc      Boolean constructor from char supports xor operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharXorOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').xor(new Boolean(c'\u0000')).toBoolean()).assertEqual(true);
      expect(new Boolean(c'A').xor(new Boolean(c'B')).toBoolean()).assertEqual(false);
      expect(new Boolean(c'\u0000').xor(new Boolean(c'\x00')).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_1900
     * @tc.name      testBooleanConstructorCharUnicodeGroups
     * @tc.desc      Boolean constructor converts Latin, BMP, CJK, and zero-width chars to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharUnicodeGroups", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'\u00C0').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u00E9').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u03B1').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0430').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u4E00').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u3042').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u30A2').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\uAC00').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u200B').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\uFEFF').toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_THREE_2000
     * @tc.name      testBooleanConstructorCharCompareWithOtherConversions
     * @tc.desc      Char constructor results match boolean constructor, string constructor, and $_invoke rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCharCompareWithOtherConversions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').toBoolean()).assertEqual(new Boolean(true).toBoolean());
      expect(new Boolean(c'\u0000').toBoolean()).assertEqual(new Boolean(false).toBoolean());
      expect(new Boolean(c'\u0000').toBoolean()).assertEqual(new Boolean("").toBoolean());
      expect(new Boolean(c' ').toBoolean()).assertEqual(new Boolean(" ").toBoolean());
      expect(new Boolean(c'A').toBoolean()).assertEqual(Boolean.$_invoke<char>(c'A'));
      expect(new Boolean(c'\u0000').toBoolean()).assertEqual(Boolean.$_invoke<char>(c'\u0000'));
    })
  })
}

function isZeroOrNaN(value: number): boolean {
  return new Boolean(value).isFalse();
}

function isNonZeroNumber(value: number): boolean {
  return new Boolean(value).isTrue();
}

function isNaNByBoolean(value: number): boolean {
  return new Boolean(value).isFalse() && isNaN(value);
}

function assertNumberBoolean(value: number, expected: boolean): void {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(expected);
  expect(bool.valueOf()).assertEqual(expected);
}

function assertFloatBoolean(value: float, expected: boolean): void {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(expected);
  expect(bool.valueOf()).assertEqual(expected);
}

function BooleanConstructor04Test(): void {
  describe("BooleanConstructor04Test", (): void => {
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
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0100
     * @tc.name      testBooleanConstructorFloatNormalValues
     * @tc.desc      Boolean constructor converts non-zero float values to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatNormalValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(3.14f).toBoolean()).assertEqual(true);
      expect(new Boolean(-2.5f).toBoolean()).assertEqual(true);
      expect(new Boolean(0.1f).toBoolean()).assertEqual(true);
      expect(new Boolean(1500.0f).toBoolean()).assertEqual(true);
      expect(new Boolean(-0.000025f).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0200
     * @tc.name      testBooleanConstructorFloatBoundaryValues
     * @tc.desc      Boolean constructor converts float boundary values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(1.0f).toBoolean()).assertEqual(true);
      expect(new Boolean(0.000001f).toBoolean()).assertEqual(true);
      expect(new Boolean(-1.0f).toBoolean()).assertEqual(true);
      expect(new Boolean(1024.0f).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0300
     * @tc.name      testBooleanConstructorFloatZeroValues
     * @tc.desc      Boolean constructor converts positive and negative float zero to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatZeroValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(0.0f).toBoolean()).assertEqual(false);
      expect(new Boolean(-0.0f).toBoolean()).assertEqual(false);
      expect(new Boolean(Double.toFloat(0e0)).toBoolean()).assertEqual(false);
      expect(new Boolean(Double.toFloat(-0e0)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0400
     * @tc.name      testBooleanConstructorFloatNaNValues
     * @tc.desc      Boolean constructor converts float NaN values to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatNaNValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanFromDivide: float = Float.NaN;

      expect(new Boolean(Float.NaN).toBoolean()).assertEqual(false);
      expect(new Boolean(nanFromDivide).toBoolean()).assertEqual(false);
      expect(Float.isNaN(Float.NaN)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0500
     * @tc.name      testBooleanConstructorFloatInfinityValues
     * @tc.desc      Boolean constructor converts float infinity values to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatInfinityValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(Float.POSITIVE_INFINITY).toBoolean()).assertEqual(true);
      expect(new Boolean(Float.NEGATIVE_INFINITY).toBoolean()).assertEqual(true);
      expect(new Boolean(1.0f / 0.0f).toBoolean()).assertEqual(true);
      expect(new Boolean(-1.0f / 0.0f).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0600
     * @tc.name      testBooleanConstructorNumberNormalValues
     * @tc.desc      Boolean constructor converts non-zero number values to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNumberNormalValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(3.14159).toBoolean()).assertEqual(true);
      expect(new Boolean(-2.71828).toBoolean()).assertEqual(true);
      expect(new Boolean(0.001).toBoolean()).assertEqual(true);
      expect(new Boolean(1e10).toBoolean()).assertEqual(true);
      expect(new Boolean(-1e-10).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0700
     * @tc.name      testBooleanConstructorNumberBoundaryValues
     * @tc.desc      Boolean constructor converts number boundary values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNumberBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(Number.MAX_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.MIN_VALUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.MAX_SAFE_INTEGER).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.MIN_SAFE_INTEGER).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.MAX_SAFE_INTEGER + 100).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.MIN_SAFE_INTEGER - 100).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0800
     * @tc.name      testBooleanConstructorNumberZeroValues
     * @tc.desc      Boolean constructor converts number zero forms to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNumberZeroValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(0).toBoolean()).assertEqual(false);
      expect(new Boolean(-0).toBoolean()).assertEqual(false);
      expect(new Boolean(0.0).toBoolean()).assertEqual(false);
      expect(new Boolean(-0.0).toBoolean()).assertEqual(false);
      expect(new Boolean(0e0).toBoolean()).assertEqual(false);
      expect(new Boolean(-0e0).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_0900
     * @tc.name      testBooleanConstructorNumberNaNValues
     * @tc.desc      Boolean constructor converts number NaN values to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNumberNaNValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanFromDivide: number = Number.NaN;
      const nanFromInfinity: number = Infinity - Infinity;

      expect(new Boolean(NaN).toBoolean()).assertEqual(false);
      expect(new Boolean(Number.NaN).toBoolean()).assertEqual(false);
      expect(new Boolean(nanFromDivide).toBoolean()).assertEqual(false);
      expect(new Boolean(nanFromInfinity).toBoolean()).assertEqual(false);
      expect(isNaN(NaN)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1000
     * @tc.name      testBooleanConstructorNumberInfinityValues
     * @tc.desc      Boolean constructor converts number infinity values to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorNumberInfinityValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(Infinity).toBoolean()).assertEqual(true);
      expect(new Boolean(-Infinity).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.POSITIVE_INFINITY).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.NEGATIVE_INFINITY).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.POSITIVE_INFINITY).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.NEGATIVE_INFINITY).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1100
     * @tc.name      testBooleanConstructorFloatingReturnType
     * @tc.desc      Boolean constructor with float and number values returns Boolean object instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatBool: Boolean = new Boolean(3.14f);
      const numberBool: Boolean = new Boolean(NaN);

      expect(floatBool instanceof Boolean).assertEqual(true);
      expect(numberBool instanceof Boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1200
     * @tc.name      testBooleanConstructorFloatingConversionRules
     * @tc.desc      Boolean constructor follows non-zero and non-NaN conversion rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingConversionRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertNumberBoolean(0.1, true);
      assertNumberBoolean(-0.1, true);
      assertNumberBoolean(Number.MAX_VALUE, true);
      assertNumberBoolean(Number.MIN_VALUE, true);
      assertNumberBoolean(Infinity, true);
      assertNumberBoolean(0.0, false);
      assertNumberBoolean(-0.0, false);
      assertNumberBoolean(NaN, false);
      assertFloatBoolean(0.000001f, true);
      assertFloatBoolean(0.0f / 0.0f, false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1300
     * @tc.name      testBooleanConstructorFloatingMethods
     * @tc.desc      Boolean constructor with float and number values supports Boolean instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(3.14f);
      const falseBool: Boolean = new Boolean(NaN);

      expect(trueBool.toBoolean()).assertEqual(true);
      expect(trueBool.valueOf()).assertEqual(true);
      expect(trueBool.isTrue()).assertEqual(true);
      expect(falseBool.isFalse()).assertEqual(true);
      expect(trueBool.toString()).assertEqual("true");
      expect(falseBool.toString()).assertEqual("false");
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1400
     * @tc.name      testBooleanConstructorFloatingCompareWithStaticInstances
     * @tc.desc      Floating constructor results match Boolean.TRUE and Boolean.FALSE by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingCompareWithStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(3.14f);
      const zeroBool: Boolean = new Boolean(0.0);
      const nanBool: Boolean = new Boolean(NaN);

      expect(trueBool.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(zeroBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(nanBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(zeroBool.equals(Boolean.FALSE)).assertEqual(true);
      expect(nanBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1500
     * @tc.name      testBooleanConstructorFloatingPrecisionScenarios
     * @tc.desc      Boolean constructor converts non-zero precision calculation results to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingPrecisionScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: number = 0.1 + 0.2;
      const diff: number = sum - 0.3;
      const floatPrecision: float = 0.1f + 0.2f;

      expect(sum !== 0.3).assertEqual(true);
      expect(new Boolean(sum).toBoolean()).assertEqual(true);
      expect(new Boolean(diff).toBoolean()).assertEqual(true);
      expect(new Boolean(floatPrecision).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1600
     * @tc.name      testBooleanConstructorFloatingNegateOperation
     * @tc.desc      Boolean constructor from floating values supports negate operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingNegateOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(3.14f).negate().toBoolean()).assertEqual(false);
      expect(new Boolean(0.0).negate().toBoolean()).assertEqual(true);
      expect(new Boolean(NaN).negate().toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1700
     * @tc.name      testBooleanConstructorFloatingAndOperation
     * @tc.desc      Boolean constructor from floating values supports and operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingAndOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(3.14f).and(new Boolean(2.718f)).toBoolean()).assertEqual(true);
      expect(new Boolean(3.14f).and(new Boolean(0.0)).toBoolean()).assertEqual(false);
      expect(new Boolean(3.14f).and(new Boolean(NaN)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1800
     * @tc.name      testBooleanConstructorFloatingOrXorOperation
     * @tc.desc      Boolean constructor from floating values supports or and xor operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingOrXorOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(3.14f).or(new Boolean(0.0)).toBoolean()).assertEqual(true);
      expect(new Boolean(0.0).or(new Boolean(NaN)).toBoolean()).assertEqual(false);
      expect(new Boolean(3.14f).xor(new Boolean(0.0)).toBoolean()).assertEqual(true);
      expect(new Boolean(3.14f).xor(new Boolean(2.718f)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_1900
     * @tc.name      testBooleanConstructorFloatingApplicationScenarios
     * @tc.desc      Boolean constructor can check zero, non-zero, and NaN number scenarios.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingApplicationScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isZeroOrNaN(0.0)).assertEqual(true);
      expect(isZeroOrNaN(-0.0)).assertEqual(true);
      expect(isZeroOrNaN(3.14)).assertEqual(false);
      expect(isZeroOrNaN(NaN)).assertEqual(true);
      expect(isNonZeroNumber(0.0)).assertEqual(false);
      expect(isNonZeroNumber(3.14)).assertEqual(true);
      expect(isNonZeroNumber(NaN)).assertEqual(false);
      expect(isNonZeroNumber(Infinity)).assertEqual(true);
      expect(isNaNByBoolean(NaN)).assertEqual(true);
      expect(isNaNByBoolean(0.0)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FOUR_2000
     * @tc.name      testBooleanConstructorFloatingCompareWithOtherConversions
     * @tc.desc      Floating constructor results match boolean, integer, operation, Math, and $_invoke rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorFloatingCompareWithOtherConversions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(3.14f).toBoolean()).assertEqual(new Boolean(true).toBoolean());
      expect(new Boolean(0.0).toBoolean()).assertEqual(new Boolean(false).toBoolean());
      expect(new Boolean(NaN).toBoolean()).assertEqual(new Boolean(0 as int).toBoolean());
      expect(new Boolean(1 as int).toBoolean()).assertEqual(true);
      expect(new Boolean(10 / 3).toBoolean()).assertEqual(true);
      expect(new Boolean(0 / 5).toBoolean()).assertEqual(false);
      expect(new Boolean(Number.POSITIVE_INFINITY).toBoolean()).assertEqual(true);
      expect(new Boolean(Number.NaN).toBoolean()).assertEqual(false);
      expect(new Boolean(Math.sqrt(16)).toBoolean()).assertEqual(true);
      expect(new Boolean(Math.log(1)).toBoolean()).assertEqual(false);
      expect(new Boolean(Math.sin(0)).toBoolean()).assertEqual(false);
      expect(new Boolean(Math.cos(0)).toBoolean()).assertEqual(true);
      expect(new Boolean(3.14).toBoolean()).assertEqual(Boolean.$_invoke<number>(3.14));
      expect(new Boolean(Float.NaN).toBoolean()).assertEqual(Boolean.$_invoke<float>(Float.NaN));
    })
  })
}

function isEmptyString(value: string): boolean {
  return new Boolean(value).isFalse();
}

function isNonEmptyString(value: string): boolean {
  return new Boolean(value).isTrue();
}

function assertStringBoolean(value: string, expected: boolean): void {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(expected);
  expect(bool.valueOf()).assertEqual(expected);
}

function BooleanConstructor05Test(): void {
  describe("BooleanConstructor05Test", (): void => {
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
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0100
     * @tc.name      testBooleanConstructorStringBasicValues
     * @tc.desc      Boolean constructor converts basic non-empty strings to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringBasicValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("arkts").toBoolean()).assertEqual(true);
      expect(new Boolean("a").toBoolean()).assertEqual(true);
      expect(new Boolean(" ").toBoolean()).assertEqual(true);
      expect(new Boolean("hello world").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0200
     * @tc.name      testBooleanConstructorStringNumericValues
     * @tc.desc      Boolean constructor treats numeric strings as non-empty strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringNumericValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("123").toBoolean()).assertEqual(true);
      expect(new Boolean("3.14").toBoolean()).assertEqual(true);
      expect(new Boolean("-100").toBoolean()).assertEqual(true);
      expect(new Boolean("0").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0300
     * @tc.name      testBooleanConstructorStringBooleanWords
     * @tc.desc      Boolean constructor does not parse boolean word strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringBooleanWords", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("true").toBoolean()).assertEqual(true);
      expect(new Boolean("false").toBoolean()).assertEqual(true);
      expect(new Boolean("TRUE").toBoolean()).assertEqual(true);
      expect(new Boolean("FALSE").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0400
     * @tc.name      testBooleanConstructorStringUnicodeValues
     * @tc.desc      Boolean constructor converts Unicode strings to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringUnicodeValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("\u4F60\u597D").toBoolean()).assertEqual(true);
      expect(new Boolean("\u3053\u3093\u306B\u3061\u306F").toBoolean()).assertEqual(true);
      expect(new Boolean("\uC548\uB155\uD558\uC138\uC694").toBoolean()).assertEqual(true);
      expect(new Boolean("\uD83D\uDE00\uD83C\uDF89").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0500
     * @tc.name      testBooleanConstructorStringEscapeValues
     * @tc.desc      Boolean constructor converts escaped strings to true when length is non-zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringEscapeValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("\n").toBoolean()).assertEqual(true);
      expect(new Boolean("\t").toBoolean()).assertEqual(true);
      expect(new Boolean("\r").toBoolean()).assertEqual(true);
      expect(new Boolean("\\n").toBoolean()).assertEqual(true);
      expect(new Boolean("\"").toBoolean()).assertEqual(true);
      expect(new Boolean("\'").toBoolean()).assertEqual(true);
      expect(new Boolean("\x41").toBoolean()).assertEqual(true);
      expect(new Boolean("\u0041").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0600
     * @tc.name      testBooleanConstructorStringEmptyValues
     * @tc.desc      Boolean constructor converts empty strings to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringEmptyValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("").toBoolean()).assertEqual(false);
      expect(new Boolean(``).toBoolean()).assertEqual(false);
      expect(new Boolean(String("")).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0700
     * @tc.name      testBooleanConstructorStringZeroWidthValues
     * @tc.desc      Boolean constructor converts zero-width strings to true because they are non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringZeroWidthValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("\u200B").toBoolean()).assertEqual(true);
      expect(new Boolean("\uFEFF").toBoolean()).assertEqual(true);
      expect(new Boolean("\u200D").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0800
     * @tc.name      testBooleanConstructorStringTemplateValues
     * @tc.desc      Boolean constructor converts template strings by length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringTemplateValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const name: string = "arkts";

      expect(new Boolean(`hello ${name}`).toBoolean()).assertEqual(true);
      expect(new Boolean(``).toBoolean()).assertEqual(false);
      expect(new Boolean(`   `).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_0900
     * @tc.name      testBooleanConstructorStringLongValue
     * @tc.desc      Boolean constructor converts long non-empty strings to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringLongValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 1000; i++) {
        longStr += "a";
      }

      expect(new Boolean(longStr).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1000
     * @tc.name      testBooleanConstructorStringSecurityLikeValues
     * @tc.desc      Boolean constructor treats HTML, XSS, and SQL-like strings as non-empty strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringSecurityLikeValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("<script>alert(1)</script>").toBoolean()).assertEqual(true);
      expect(new Boolean("<div>hello</div>").toBoolean()).assertEqual(true);
      expect(new Boolean("'; DROP TABLE users; --").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1100
     * @tc.name      testBooleanConstructorStringMultilingualValues
     * @tc.desc      Boolean constructor converts multilingual non-empty strings to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringMultilingualValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("\u0645\u0631\u062D\u0628\u0627").toBoolean()).assertEqual(true);
      expect(new Boolean("\u05E9\u05DC\u05D5\u05DD").toBoolean()).assertEqual(true);
      expect(new Boolean("\u0E2A\u0E27\u0E31\u0E2A\u0E14\u0E35").toBoolean()).assertEqual(true);
      expect(new Boolean("\u041F\u0440\u0438\u0432\u0435\u0442").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1200
     * @tc.name      testBooleanConstructorStringSpecialSymbolValues
     * @tc.desc      Boolean constructor converts symbol-only strings to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringSpecialSymbolValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("!@#$%^&*()").toBoolean()).assertEqual(true);
      expect(new Boolean("-_=+[]{}|;:,.<>?").toBoolean()).assertEqual(true);
      expect(new Boolean("~`").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1300
     * @tc.name      testBooleanConstructorStringInvalidUtfSequenceValues
     * @tc.desc      Boolean constructor converts non-empty escaped byte and surrogate strings to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringInvalidUtfSequenceValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("\uDC04").toBoolean()).assertEqual(true);
      expect(new Boolean("\xE4").toBoolean()).assertEqual(true);
      expect(new Boolean("\xE4\x3F\xAD").toBoolean()).assertEqual(true);
      expect(new Boolean("\xC0\x81").toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1400
     * @tc.name      testBooleanConstructorStringReturnType
     * @tc.desc      Boolean constructor with string values returns Boolean object instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean("arkts");
      const falseBool: Boolean = new Boolean("");

      expect(trueBool instanceof Boolean).assertEqual(true);
      expect(falseBool instanceof Boolean).assertEqual(true);
      expect(trueBool.toBoolean()).assertEqual(true);
      expect(falseBool.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1500
     * @tc.name      testBooleanConstructorStringConversionRules
     * @tc.desc      Boolean constructor converts non-empty strings to true and empty strings to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringConversionRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertStringBoolean("a", true);
      assertStringBoolean("abc", true);
      assertStringBoolean(" ", true);
      assertStringBoolean("\t", true);
      assertStringBoolean("\n", true);
      assertStringBoolean("\u200B", true);
      assertStringBoolean("0", true);
      assertStringBoolean("false", true);
      assertStringBoolean("null", true);
      assertStringBoolean("undefined", true);
      assertStringBoolean("", false);
      assertStringBoolean(``, false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1600
     * @tc.name      testBooleanConstructorStringMethods
     * @tc.desc      Boolean constructor with string values supports Boolean instance methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean("arkts");
      const falseBool: Boolean = new Boolean("");

      expect(trueBool.toBoolean()).assertEqual(true);
      expect(trueBool.valueOf()).assertEqual(true);
      expect(trueBool.isTrue()).assertEqual(true);
      expect(falseBool.isFalse()).assertEqual(true);
      expect(trueBool.toString()).assertEqual("true");
      expect(falseBool.toString()).assertEqual("false");
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1700
     * @tc.name      testBooleanConstructorStringCompareWithStaticInstances
     * @tc.desc      String constructor results match Boolean.TRUE and Boolean.FALSE by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringCompareWithStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean("arkts");
      const falseBool: Boolean = new Boolean("");

      expect(trueBool.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(falseBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1800
     * @tc.name      testBooleanConstructorStringApplicationScenarios
     * @tc.desc      Boolean constructor can check empty and non-empty string scenarios.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringApplicationScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isEmptyString("")).assertEqual(true);
      expect(isEmptyString("a")).assertEqual(false);
      expect(isEmptyString(" ")).assertEqual(false);
      expect(isNonEmptyString("")).assertEqual(false);
      expect(isNonEmptyString("a")).assertEqual(true);
      expect(isNonEmptyString(" ")).assertEqual(true);
      expect(isNonEmptyString("false")).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_1900
     * @tc.name      testBooleanConstructorStringLogicalOperations
     * @tc.desc      Boolean constructor from string values supports Boolean logic operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringLogicalOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("arkts").negate().toBoolean()).assertEqual(false);
      expect(new Boolean("").negate().toBoolean()).assertEqual(true);
      expect(new Boolean("hello").and(new Boolean("world")).toBoolean()).assertEqual(true);
      expect(new Boolean("hello").and(new Boolean("")).toBoolean()).assertEqual(false);
      expect(new Boolean("hello").or(new Boolean("")).toBoolean()).assertEqual(true);
      expect(new Boolean("").or(new Boolean("")).toBoolean()).assertEqual(false);
      expect(new Boolean("hello").xor(new Boolean("")).toBoolean()).assertEqual(true);
      expect(new Boolean("hello").xor(new Boolean("world")).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_FIVE_2000
     * @tc.name      testBooleanConstructorStringCompareAndBatchScenarios
     * @tc.desc      String constructor results match boolean, $_invoke, and batch conversion rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorStringCompareAndBatchScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("arkts").toBoolean()).assertEqual(new Boolean(true).toBoolean());
      expect(new Boolean("").toBoolean()).assertEqual(new Boolean(false).toBoolean());
      expect(new Boolean("arkts").toBoolean()).assertEqual(Boolean.$_invoke<string>("arkts"));
      expect(new Boolean("").toBoolean()).assertEqual(Boolean.$_invoke<string>(""));

      const strings: string[] = ["a", "b", "c", "", "e", "f", "", "h"];
      let trueCount: int = 0;
      let falseCount: int = 0;
      for (let i: int = 0; i < strings.length; i++) {
        const bool: Boolean = new Boolean(strings[i]);
        if (bool.toBoolean()) {
          trueCount++;
        } else {
          falseCount++;
        }
      }

      expect(trueCount).assertEqual(6);
      expect(falseCount).assertEqual(2);
    })
  })
}

class BooleanConstructor06Class {
  value: number = 100;
}

class BooleanConstructor06SubClass extends BooleanConstructor06Class {
}

class BooleanConstructor06CustomValue {
  valueOf(): number {
    return 100;
  }
}

function toBooleanSafe(value: Any): boolean {
  const bool: Boolean = new Boolean(value);
  return bool.toBoolean();
}

function hasValue(value: Any): boolean {
  const bool: Boolean = new Boolean(value);
  return bool.toBoolean();
}

function assertAnyBoolean(value: Any, expected: boolean): void {
  const bool: Boolean = new Boolean(value);
  expect(bool instanceof Boolean).assertEqual(true);
  expect(bool.toBoolean()).assertEqual(expected);
  expect(bool.valueOf()).assertEqual(expected);
}

function BooleanConstructor06Test(): void {
  describe("BooleanConstructor06Test", (): void => {
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
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0100
     * @tc.name      testBooleanConstructorAnyNullUndefinedValues
     * @tc.desc      Boolean constructor converts null, undefined, and missing parameter to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyNullUndefinedValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(null).toBoolean()).assertEqual(false);
      expect(new Boolean(undefined).toBoolean()).assertEqual(false);
      expect(new Boolean().toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0200
     * @tc.name      testBooleanConstructorAnyBooleanInstances
     * @tc.desc      Boolean constructor converts Boolean instances by their wrapped value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyBooleanInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Boolean(true)).toBoolean()).assertEqual(true);
      expect(new Boolean(new Boolean(false)).toBoolean()).assertEqual(false);
      expect(new Boolean(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(new Boolean(Boolean.FALSE).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0300
     * @tc.name      testBooleanConstructorAnyNumberInstances
     * @tc.desc      Boolean constructor converts Number instances by numeric conversion rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyNumberInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Number(10)).toBoolean()).assertEqual(true);
      expect(new Boolean(new Number(-10)).toBoolean()).assertEqual(true);
      expect(new Boolean(new Number(0)).toBoolean()).assertEqual(false);
      expect(new Boolean(new Number(Number.NaN)).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0400
     * @tc.name      testBooleanConstructorAnyStringInstances
     * @tc.desc      Boolean constructor converts String instances by string length rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyStringInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new String("arkts")).toBoolean()).assertEqual(true);
      expect(new Boolean(new String("")).toBoolean()).assertEqual(false);
      expect(new Boolean(new String(" ")).toBoolean()).assertEqual(true);
      expect(new Boolean(new String("0")).toBoolean()).assertEqual(true);
      expect(new Boolean(new String("false")).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0500
     * @tc.name      testBooleanConstructorAnyCharInstances
     * @tc.desc      Boolean constructor converts Char instances by char conversion rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyCharInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Char(c'A')).toBoolean()).assertEqual(true);
      expect(new Boolean(new Char(c'\n')).toBoolean()).assertEqual(true);
      expect(new Boolean(new Char(c'\u0000')).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0600
     * @tc.name      testBooleanConstructorAnyFloatInstances
     * @tc.desc      Boolean constructor converts Float instances by floating conversion rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyFloatInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Float(3.14)).toBoolean()).assertEqual(true);
      expect(new Boolean(new Float(-3.14)).toBoolean()).assertEqual(true);
      expect(new Boolean(new Float(0.0)).toBoolean()).assertEqual(false);
      expect(new Boolean(new Float(Float.NaN)).toBoolean()).assertEqual(false);
      expect(new Boolean(new Float(Float.POSITIVE_INFINITY)).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0700
     * @tc.name      testBooleanConstructorAnyPrimitiveValues
     * @tc.desc      Boolean constructor coordinates Any overload with primitive overloads.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyPrimitiveValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toBoolean()).assertEqual(true);
      expect(new Boolean(false).toBoolean()).assertEqual(false);
      expect(new Boolean(100 as int).toBoolean()).assertEqual(true);
      expect(new Boolean(0 as int).toBoolean()).assertEqual(false);
      expect(new Boolean("arkts").toBoolean()).assertEqual(true);
      expect(new Boolean("").toBoolean()).assertEqual(false);
      expect(new Boolean(c'A').toBoolean()).assertEqual(true);
      expect(new Boolean(c'\u0000').toBoolean()).assertEqual(false);
      expect(new Boolean(100n).toBoolean()).assertEqual(true);
      expect(new Boolean(0n).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0800
     * @tc.name      testBooleanConstructorAnyObjectInstances
     * @tc.desc      Boolean constructor converts general object instances to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyObjectInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Object()).toBoolean()).assertEqual(true);
      expect(new Boolean(new BooleanConstructor06Class()).toBoolean()).assertEqual(true);
      expect(new Boolean(new BooleanConstructor06SubClass()).toBoolean()).assertEqual(true);
      expect(new Boolean(new BooleanConstructor06CustomValue()).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_0900
     * @tc.name      testBooleanConstructorAnyDateRegExpErrorInstances
     * @tc.desc      Boolean constructor converts Date, RegExp, and Error instances to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyDateRegExpErrorInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Date()).toBoolean()).assertEqual(true);
      expect(new Boolean(new RegExp("pattern")).toBoolean()).assertEqual(true);
      expect(new Boolean(new Error("error message")).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1000
     * @tc.name      testBooleanConstructorAnyCollectionInstances
     * @tc.desc      Boolean constructor converts Array, Map, and Set object instances to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyCollectionInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: int[] = [];
      const numberArray: int[] = [1, 2, 3];
      const emptyMap: Map<string, string> = new Map<string, string>();
      const nonEmptyMap: Map<string, string> = new Map<string, string>();
      const emptySet: Set<int> = new Set<int>();
      const nonEmptySet: Set<int> = new Set<int>();
      nonEmptyMap.set("key", "value");
      nonEmptySet.add(1);

      expect(new Boolean(emptyArray).toBoolean()).assertEqual(true);
      expect(new Boolean(numberArray).toBoolean()).assertEqual(true);
      expect(new Boolean(emptyMap).toBoolean()).assertEqual(true);
      expect(new Boolean(nonEmptyMap).toBoolean()).assertEqual(true);
      expect(new Boolean(emptySet).toBoolean()).assertEqual(true);
      expect(new Boolean(nonEmptySet).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1100
     * @tc.name      testBooleanConstructorAnyReturnType
     * @tc.desc      Boolean constructor with Any values returns Boolean object instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultBool: Boolean = new Boolean();
      const nullBool: Boolean = new Boolean(null);
      const objectBool: Boolean = new Boolean(new Number(10));

      expect(defaultBool instanceof Boolean).assertEqual(true);
      expect(nullBool instanceof Boolean).assertEqual(true);
      expect(objectBool instanceof Boolean).assertEqual(true);
      expect(defaultBool.toBoolean()).assertEqual(false);
      expect(nullBool.toBoolean()).assertEqual(false);
      expect(objectBool.toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1200
     * @tc.name      testBooleanConstructorAnyNullUndefinedRules
     * @tc.desc      Boolean constructor consistently converts null and undefined to false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyNullUndefinedRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertAnyBoolean(null, false);
      assertAnyBoolean(undefined, false);
      expect(new Boolean().toBoolean()).assertEqual(false);
      expect(new Boolean().equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1300
     * @tc.name      testBooleanConstructorAnyWrapperConversionRules
     * @tc.desc      Boolean constructor converts wrapper instances by wrapped primitive rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyWrapperConversionRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertAnyBoolean(new Number(100), true);
      assertAnyBoolean(new Number(0), false);
      assertAnyBoolean(new String("hello"), true);
      assertAnyBoolean(new String(""), false);
      assertAnyBoolean(new Char(c'A'), true);
      assertAnyBoolean(new Char(c'\u0000'), false);
      assertAnyBoolean(new Float(3.14), true);
      assertAnyBoolean(new Float(0.0), false);
      assertAnyBoolean(new Float(Float.NaN), false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1400
     * @tc.name      testBooleanConstructorAnyObjectConversionRules
     * @tc.desc      Boolean constructor converts object instances not handled as wrappers to true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyObjectConversionRules", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      assertAnyBoolean(new Object(), true);
      assertAnyBoolean(new Date(), true);
      assertAnyBoolean(new Error("test"), true);
      assertAnyBoolean(new BooleanConstructor06Class(), true);
      assertAnyBoolean(new BooleanConstructor06SubClass(), true);
      assertAnyBoolean(new BooleanConstructor06CustomValue(), true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1500
     * @tc.name      testBooleanConstructorAnyChainedBooleanInstances
     * @tc.desc      Boolean constructor preserves values through repeated Boolean wrapping.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyChainedBooleanInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool1: Boolean = new Boolean(true);
      const trueBool2: Boolean = new Boolean(trueBool1);
      const trueBool3: Boolean = new Boolean(trueBool2);
      const falseBool1: Boolean = new Boolean(false);
      const falseBool2: Boolean = new Boolean(falseBool1);
      const falseBool3: Boolean = new Boolean(falseBool2);

      expect(trueBool3.toBoolean()).assertEqual(true);
      expect(falseBool3.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1600
     * @tc.name      testBooleanConstructorAnyCompareWithStaticInstances
     * @tc.desc      Any constructor true and false cases match Boolean.TRUE and Boolean.FALSE by value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyCompareWithStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Number(1)).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(new String("x")).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(new Char(c'A')).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(new Float(1.5)).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(new Object()).equals(Boolean.TRUE)).assertEqual(true);
      expect(new Boolean(null).equals(Boolean.FALSE)).assertEqual(true);
      expect(new Boolean(undefined).equals(Boolean.FALSE)).assertEqual(true);
      expect(new Boolean(new Boolean(false)).equals(Boolean.FALSE)).assertEqual(true);
      expect(new Boolean(new Number(0)).equals(Boolean.FALSE)).assertEqual(true);
      expect(new Boolean(new String("")).equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1700
     * @tc.name      testBooleanConstructorAnyDynamicTypeScenarios
     * @tc.desc      Boolean constructor can be used for safe dynamic type conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyDynamicTypeScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(toBooleanSafe(null)).assertEqual(false);
      expect(toBooleanSafe(undefined)).assertEqual(false);
      expect(toBooleanSafe(new Number(100))).assertEqual(true);
      expect(toBooleanSafe(new Number(0))).assertEqual(false);
      expect(toBooleanSafe(new String("test"))).assertEqual(true);
      expect(toBooleanSafe(new String(""))).assertEqual(false);
      expect(toBooleanSafe(new Object())).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1800
     * @tc.name      testBooleanConstructorAnyHasValueScenarios
     * @tc.desc      Boolean constructor can validate whether dynamic data has a truthy converted value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyHasValueScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: int[] = [];

      expect(hasValue(null)).assertEqual(false);
      expect(hasValue(undefined)).assertEqual(false);
      expect(hasValue(new Number(0))).assertEqual(false);
      expect(hasValue(new String(""))).assertEqual(false);
      expect(hasValue(new Number(100))).assertEqual(true);
      expect(hasValue(new String("test"))).assertEqual(true);
      expect(hasValue(new Object())).assertEqual(true);
      expect(hasValue(emptyArray)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_1900
     * @tc.name      testBooleanConstructorAnyLogicalOperations
     * @tc.desc      Boolean constructor from Any values supports Boolean logic operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyLogicalOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(new Number(100)).negate().toBoolean()).assertEqual(false);
      expect(new Boolean(new Number(0)).negate().toBoolean()).assertEqual(true);
      expect(new Boolean(new Number(100)).and(new Boolean(new String("test"))).toBoolean()).assertEqual(true);
      expect(new Boolean(new Number(0)).and(new Boolean(new String("test"))).toBoolean()).assertEqual(false);
      expect(new Boolean(new Number(0)).or(new Boolean(new String("test"))).toBoolean()).assertEqual(true);
      expect(new Boolean(new Number(100)).xor(new Boolean(new String("test"))).toBoolean()).assertEqual(false);
      expect(new Boolean(new Number(100)).xor(new Boolean(new String(""))).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_CONSTRUCTOR_SIX_2000
     * @tc.name      testBooleanConstructorAnyBatchConversionScenarios
     * @tc.desc      Boolean constructor converts a batch of Any values according to null, wrapper, and object rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorAnyBatchConversionScenarios", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Any[] = [
        null,
        undefined,
        new Number(0),
        new Number(100),
        new String(""),
        new String("test"),
        new Object(),
        new Date(),
        new Error("test")
      ];
      const expected: boolean[] = [false, false, false, true, false, true, true, true, true];

      for (let i: int = 0; i < values.length; i++) {
        expect(new Boolean(values[i]).toBoolean()).assertEqual(expected[i]);
      }
    })
  })
}
export default function BooleanConstructorTest(): void {
  BooleanConstructor01Test();
  BooleanConstructor02Test();
  BooleanConstructor03Test();
  BooleanConstructor04Test();
  BooleanConstructor05Test();
  BooleanConstructor06Test();
}
