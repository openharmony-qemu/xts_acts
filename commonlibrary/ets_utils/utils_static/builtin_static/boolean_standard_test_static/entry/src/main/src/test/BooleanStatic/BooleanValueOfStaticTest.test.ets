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

function getBooleanConstant(value: boolean): Boolean {
  return value ? Boolean.TRUE : Boolean.FALSE;
}

function getTrueBoolean(): Boolean {
  return Boolean.TRUE;
}

function getFalseBoolean(): Boolean {
  return Boolean.FALSE;
}

class BooleanValueOfStaticConstants {
  static readonly TRUE_VALUE: Boolean = Boolean.TRUE;
  static readonly FALSE_VALUE: Boolean = Boolean.FALSE;
}

class BooleanValueOfStaticFactory {
  static create(value: boolean): Boolean {
    return getBooleanConstant(value);
  }

  static trueValue(): Boolean {
    return Boolean.TRUE;
  }

  static falseValue(): Boolean {
    return Boolean.FALSE;
  }
}

interface BooleanValueOfStaticConfig {
  getEnabled(): Boolean;
  getDisabled(): Boolean;
}

class BooleanValueOfStaticAppConfig implements BooleanValueOfStaticConfig {
  getEnabled(): Boolean {
    return Boolean.TRUE;
  }

  getDisabled(): Boolean {
    return Boolean.FALSE;
  }
}

export default function BooleanValueOfStaticTest(): void {
  describe("BooleanValueOfStaticTest", () => {
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
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0100
     * @tc.name      testBooleanValueOfStaticFormCompileConstraint
     * @tc.desc      Static Boolean.valueOf(b: boolean) is accessed via Boolean.TRUE/FALSE singletons.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfStaticFormCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toBoolean()).assertEqual(true);
      expect(Boolean.FALSE.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0200
     * @tc.name      testBooleanValueOfRequiredParameterCompileConstraint
     * @tc.desc      Missing, extra, and non-boolean arguments for the static form are compile-time invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfRequiredParameterCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getBooleanConstant(true).toBoolean()).assertEqual(true);
      expect(getBooleanConstant(false).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0300
     * @tc.name      testBooleanValueOfRejectsNonBooleanCompileConstraint
     * @tc.desc      number, string, null, undefined, object inputs are not compiled as boolean arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfRejectsNonBooleanCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue: boolean = true;
      let falseValue: boolean = false;
      expect(getBooleanConstant(trueValue).toBoolean()).assertEqual(true);
      expect(getBooleanConstant(falseValue).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0400
     * @tc.name      testBooleanValueOfTrueSingletonConstant
     * @tc.desc      Boolean.TRUE singleton properties and methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfTrueSingletonConstant", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = Boolean.TRUE;
      expect(bool === Boolean.TRUE).assertEqual(true);
      expect(bool.toBoolean()).assertEqual(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(false);
      expect(bool.toString()).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0500
     * @tc.name      testBooleanValueOfFalseSingletonConstant
     * @tc.desc      Boolean.FALSE singleton properties and methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfFalseSingletonConstant", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = Boolean.FALSE;
      expect(bool === Boolean.FALSE).assertEqual(true);
      expect(bool.toBoolean()).assertEqual(false);
      expect(bool.isTrue()).assertEqual(false);
      expect(bool.isFalse()).assertEqual(true);
      expect(bool.toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0600
     * @tc.name      testBooleanValueOfSingletonIdentity
     * @tc.desc      Boolean.TRUE and Boolean.FALSE maintain singleton identity.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfSingletonIdentity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let true1 = Boolean.TRUE;
      let true2 = getTrueBoolean();
      let false1 = Boolean.FALSE;
      let false2 = getFalseBoolean();
      expect(true1 === true2).assertEqual(true);
      expect(false1 === false2).assertEqual(true);
      expect(true1 === false1).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0700
     * @tc.name      testBooleanValueOfComparedWithConstructor
     * @tc.desc      Boolean.TRUE/FALSE singletons compared with new Boolean() instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithConstructor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueObj = new Boolean(true);
      let falseObj = new Boolean(false);
      expect(Boolean.TRUE.toBoolean()).assertEqual(trueObj.toBoolean());
      expect(Boolean.FALSE.toBoolean()).assertEqual(falseObj.toBoolean());
      expect(Boolean.TRUE.equals(trueObj)).assertEqual(true);
      expect(Boolean.FALSE.equals(falseObj)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0800
     * @tc.name      testBooleanValueOfComparedWithStaticToBoolean
     * @tc.desc      Boolean.TRUE/FALSE singletons compared with Boolean.toBoolean() results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithStaticToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toBoolean()).assertEqual(Boolean.toBoolean(true));
      expect(Boolean.FALSE.toBoolean()).assertEqual(Boolean.toBoolean(false));
      expect(typeof Boolean.toBoolean(true)).assertEqual("boolean");
      expect(typeof Boolean.toBoolean(false)).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_0900
     * @tc.name      testBooleanValueOfComparedWithInvoke
     * @tc.desc      Boolean.TRUE/FALSE singletons compared with Boolean.$_invoke<boolean>() results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithInvoke", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invokeTrue = Boolean.$_invoke<boolean>(true);
      let invokeFalse = Boolean.$_invoke<boolean>(false);
      expect(Boolean.TRUE.toBoolean()).assertEqual(invokeTrue);
      expect(Boolean.FALSE.toBoolean()).assertEqual(invokeFalse);
      expect(typeof invokeTrue).assertEqual("boolean");
      expect(typeof invokeFalse).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1000
     * @tc.name      testBooleanValueOfComparedWithInstanceValueOf
     * @tc.desc      Boolean.TRUE/FALSE singletons compared with instance.valueOf() results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfComparedWithInstanceValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truePrimitive = new Boolean(true).valueOf();
      let falsePrimitive = new Boolean(false).valueOf();
      expect(typeof truePrimitive).assertEqual("boolean");
      expect(typeof falsePrimitive).assertEqual("boolean");
      expect(Boolean.TRUE.toBoolean()).assertEqual(truePrimitive);
      expect(Boolean.FALSE.toBoolean()).assertEqual(falsePrimitive);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1100
     * @tc.name      testBooleanValueOfMethodsAvailable
     * @tc.desc      All Boolean methods are available on Boolean.TRUE singleton.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfMethodsAvailable", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = Boolean.TRUE;
      expect(bool.toBoolean()).assertEqual(true);
      expect(bool.valueOf()).assertEqual(true);
      expect(bool.toString()).assertEqual("true");
      expect(bool.equals(Boolean.TRUE)).assertEqual(true);
      expect(bool.isTrue()).assertEqual(true);
      expect(bool.isFalse()).assertEqual(false);
      expect(bool.negate().toBoolean()).assertEqual(false);
      expect(bool.and(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(bool.or(Boolean.FALSE).toBoolean()).assertEqual(true);
      expect(bool.xor(Boolean.FALSE).toBoolean()).assertEqual(true);
      expect(bool.compareTo(Boolean.FALSE)).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1200
     * @tc.name      testBooleanValueOfNegateDoesNotModifySingleton
     * @tc.desc      negate() returns a new Boolean without modifying the singleton.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfNegateDoesNotModifySingleton", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueValue = Boolean.TRUE;
      let negated = trueValue.negate();
      expect(negated.toBoolean()).assertEqual(false);
      expect(negated.equals(Boolean.FALSE)).assertEqual(true);
      expect(trueValue.toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1300
     * @tc.name      testBooleanValueOfLogicalMethods
     * @tc.desc      Boolean.TRUE/FALSE singleton logical methods (and/or/xor/compareTo).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfLogicalMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.and(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.or(Boolean.FALSE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.xor(Boolean.TRUE).toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.xor(Boolean.FALSE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.compareTo(Boolean.FALSE)).assertEqual(1);
      expect(Boolean.FALSE.compareTo(Boolean.TRUE)).assertEqual(-1);
      expect(Boolean.TRUE.compareTo(Boolean.TRUE)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1400
     * @tc.name      testBooleanValueOfSingletonStabilityLoop
     * @tc.desc      Boolean.TRUE/FALSE singletons maintain identity in a loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfSingletonStabilityLoop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        expect(getBooleanConstant(true) === Boolean.TRUE).assertEqual(true);
        expect(getBooleanConstant(false) === Boolean.FALSE).assertEqual(true);
        expect(getBooleanConstant(i % 2 === 0).toBoolean()).assertEqual(i % 2 === 0);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1500
     * @tc.name      testBooleanValueOfConstantsUse
     * @tc.desc      Boolean.TRUE/FALSE used as static class constants.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfConstantsUse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BooleanValueOfStaticConstants.TRUE_VALUE === Boolean.TRUE).assertEqual(true);
      expect(BooleanValueOfStaticConstants.FALSE_VALUE === Boolean.FALSE).assertEqual(true);
      expect(BooleanValueOfStaticConstants.TRUE_VALUE.toBoolean()).assertEqual(true);
      expect(BooleanValueOfStaticConstants.FALSE_VALUE.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1600
     * @tc.name      testBooleanValueOfFactoryUse
     * @tc.desc      Boolean.TRUE/FALSE via factory class methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfFactoryUse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BooleanValueOfStaticFactory.create(true) === Boolean.TRUE).assertEqual(true);
      expect(BooleanValueOfStaticFactory.create(false) === Boolean.FALSE).assertEqual(true);
      expect(BooleanValueOfStaticFactory.trueValue().toBoolean()).assertEqual(true);
      expect(BooleanValueOfStaticFactory.falseValue().toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1700
     * @tc.name      testBooleanValueOfConfigUse
     * @tc.desc      Boolean.TRUE/FALSE via config interface implementation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfConfigUse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config = new BooleanValueOfStaticAppConfig();
      expect(config.getEnabled() === Boolean.TRUE).assertEqual(true);
      expect(config.getDisabled() === Boolean.FALSE).assertEqual(true);
      expect(config.getEnabled().toString()).assertEqual("true");
      expect(config.getDisabled().toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_VALUE_OF_STATIC_1800
     * @tc.name      testBooleanValueOfPrimitiveBoundaryValues
     * @tc.desc      Boolean.TRUE/FALSE cover all primitive boolean boundary values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanValueOfPrimitiveBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Array<boolean> = [true, false];
      values.forEach((value: boolean) => {
        let bool = getBooleanConstant(value);
        expect(bool.toBoolean()).assertEqual(value);
        expect(bool.equals(value ? Boolean.TRUE : Boolean.FALSE)).assertEqual(true);
      });
    })
  })
}
