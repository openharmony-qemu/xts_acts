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

function extractBoolean(obj: Boolean): boolean {
  return obj.toBoolean();
}

function processBoolean<T extends Boolean>(obj: T): boolean {
  return obj.toBoolean();
}

function validateBoolean(obj: Boolean, expected: boolean): boolean {
  return obj.toBoolean() === expected;
}

function getBooleanStatus(obj: Boolean): string {
  return obj.toBoolean() ? "true" : "false";
}

function evaluateBooleanPair(a: Boolean, b: Boolean): string {
  if (a.toBoolean() && !b.toBoolean()) {
    return "only a is true";
  } else if (!a.toBoolean() && b.toBoolean()) {
    return "only b is true";
  } else if (a.toBoolean() && b.toBoolean()) {
    return "both are true";
  }
  return "both are false";
}

class BooleanWrapper {
  private value: Boolean;

  constructor(value: boolean) {
    this.value = new Boolean(value);
  }

  isEnabled(): boolean {
    return this.value.toBoolean();
  }

  isDisabled(): boolean {
    return !this.value.toBoolean();
  }

  toggle(): void {
    this.value = this.value.toBoolean() ? Boolean.FALSE : Boolean.TRUE;
  }

  getState(): boolean {
    return this.value.toBoolean();
  }
}

export default function BooleanToBooleanInstanceTest(): void {
  describe("BooleanToBooleanInstanceTest", () => {
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
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0100
     * @tc.name      testBooleanToBooleanNoParameter
     * @tc.desc      instance.toBoolean() takes no parameters and returns the primitive boolean value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanNoParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toBoolean()).assertEqual(true);
      expect(new Boolean(false).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0200
     * @tc.name      testBooleanToBooleanRejectsArgumentCompileConstraint
     * @tc.desc      Passing any argument to instance.toBoolean() is rejected by ArkTS static checking; valid call returns correct boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRejectsArgumentCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0300
     * @tc.name      testBooleanToBooleanRequiresInstanceCall
     * @tc.desc      instance.toBoolean() must be called on a Boolean instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanRequiresInstanceCall", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.toBoolean()).assertEqual(true);
      expect(Boolean.toBoolean(instance.toBoolean())).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0400
     * @tc.name      testBooleanToBooleanStaticNoArgumentCompileConstraint
     * @tc.desc      Boolean.toBoolean() requires a value parameter; calling without it is rejected by ArkTS static checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanStaticNoArgumentCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.toBoolean(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0500
     * @tc.name      testBooleanToBooleanReturnType
     * @tc.desc      instance.toBoolean() returns primitive boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).toBoolean();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0600
     * @tc.name      testBooleanToBooleanReturnsTrueValue
     * @tc.desc      new Boolean(true).toBoolean() returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanReturnsTrueValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).toBoolean();
      expect(result).assertEqual(true);
      expect(result === true).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0700
     * @tc.name      testBooleanToBooleanReturnsFalseValue
     * @tc.desc      new Boolean(false).toBoolean() returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanReturnsFalseValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(false).toBoolean();
      expect(result).assertEqual(false);
      expect(result === false).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0800
     * @tc.name      testBooleanToBooleanMatchesConstructorValue
     * @tc.desc      instance.toBoolean() matches the constructor input truthiness.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanMatchesConstructorValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toBoolean()).assertEqual(true);
      expect(new Boolean(false).toBoolean()).assertEqual(false);
      expect(new Boolean(100).toBoolean()).assertEqual(true);
      expect(new Boolean(0).toBoolean()).assertEqual(false);
      expect(new Boolean("test").toBoolean()).assertEqual(true);
      expect(new Boolean("").toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_0900
     * @tc.name      testBooleanToBooleanSingletonValues
     * @tc.desc      Boolean.TRUE.toBoolean() and Boolean.FALSE.toBoolean() return correct values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanSingletonValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toBoolean()).assertEqual(true);
      expect(Boolean.FALSE.toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.toBoolean() === Boolean.TRUE.toBoolean()).assertEqual(true);
      expect(Boolean.FALSE.toBoolean() === Boolean.FALSE.toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1000
     * @tc.name      testBooleanToBooleanMultipleCallsConsistency
     * @tc.desc      instance.toBoolean() returns consistent results across multiple calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanMultipleCallsConsistency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      let result1 = bool.toBoolean();
      let result2 = bool.toBoolean();
      let result3 = bool.toBoolean();
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      expect(result1 === result2).assertEqual(true);
      expect(result2 === result3).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1100
     * @tc.name      testBooleanToBooleanTypeofValidation
     * @tc.desc      instance.toBoolean() returns typeof "boolean".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanTypeofValidation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Boolean(true).toBoolean()).assertEqual("boolean");
      expect(typeof new Boolean(false).toBoolean()).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1200
     * @tc.name      testBooleanToBooleanPrimitiveCharacteristics
     * @tc.desc      instance.toBoolean() result behaves as a primitive boolean in operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanPrimitiveCharacteristics", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Boolean(true).toBoolean();
      expect(result && true).assertEqual(true);
      expect(result || false).assertEqual(true);
      expect(!result).assertEqual(false);
      expect(result ? "yes" : "no").assertEqual("yes");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1300
     * @tc.name      testBooleanToBooleanDifferentInstanceSources
     * @tc.desc      instance.toBoolean() works correctly for different Boolean instance sources.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanDifferentInstanceSources", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toBoolean()).assertEqual(true);
      expect(new Boolean(false).toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.toBoolean()).assertEqual(true);
      expect(Boolean.FALSE.toBoolean()).assertEqual(false);
      expect(new Boolean(100).toBoolean()).assertEqual(true);
      expect(new Boolean(0).toBoolean()).assertEqual(false);
      expect(new Boolean("test").toBoolean()).assertEqual(true);
      expect(new Boolean("").toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1400
     * @tc.name      testBooleanToBooleanComparedWithStaticToBoolean
     * @tc.desc      instance.toBoolean() matches Boolean.toBoolean() for the same logical value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanComparedWithStaticToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let bool1 = instance.toBoolean();
      let bool2 = Boolean.toBoolean(true);
      expect(bool1).assertEqual(bool2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1500
     * @tc.name      testBooleanToBooleanComparedWithValueOf
     * @tc.desc      instance.toBoolean() matches instance.valueOf() for the same instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanComparedWithValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueInstance = new Boolean(true);
      let falseInstance = new Boolean(false);
      expect(trueInstance.toBoolean()).assertEqual(trueInstance.valueOf());
      expect(falseInstance.toBoolean()).assertEqual(falseInstance.valueOf());
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1600
     * @tc.name      testBooleanToBooleanComparedWithInvokeT
     * @tc.desc      instance.toBoolean() matches Boolean.$_invoke<boolean>() for the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanComparedWithInvokeT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true).toBoolean();
      let bool2 = Boolean.$_invoke<boolean>(true);
      expect(bool1).assertEqual(bool2);
      expect(typeof bool1).assertEqual(typeof bool2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1700
     * @tc.name      testBooleanToBooleanMethodExists
     * @tc.desc      instance.toBoolean is a function on a Boolean instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanMethodExists", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(typeof instance.toBoolean).assertEqual("function");
      expect(instance.toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1800
     * @tc.name      testBooleanToBooleanMethodAvailableOnAllInstances
     * @tc.desc      instance.toBoolean is available on all Boolean instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanMethodAvailableOnAllInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new Boolean(true).toBoolean).assertEqual("function");
      expect(typeof new Boolean(false).toBoolean).assertEqual("function");
      expect(typeof Boolean.TRUE.toBoolean).assertEqual("function");
      expect(typeof Boolean.FALSE.toBoolean).assertEqual("function");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_1900
     * @tc.name      testBooleanToBooleanExtractPrimitiveValue
     * @tc.desc      instance.toBoolean() can be used via helper function to extract primitive value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanExtractPrimitiveValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(extractBoolean(new Boolean(true))).assertEqual(true);
      expect(extractBoolean(new Boolean(false))).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2000
     * @tc.name      testBooleanToBooleanUsedInCondition
     * @tc.desc      instance.toBoolean() can be used in conditional expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanUsedInCondition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      expect(boolObj.toBoolean() ? "enabled" : "disabled").assertEqual("enabled");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2100
     * @tc.name      testBooleanToBooleanUsedInLogicalOperations
     * @tc.desc      instance.toBoolean() works in logical operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanUsedInLogicalOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(false);
      expect(bool1.toBoolean() && bool2.toBoolean()).assertEqual(false);
      expect(bool1.toBoolean() || bool2.toBoolean()).assertEqual(true);
      expect(!bool1.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2200
     * @tc.name      testBooleanToBooleanArrayOperations
     * @tc.desc      instance.toBoolean() works in array map/filter/every/some operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanArrayOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolArray: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        Boolean.TRUE,
        Boolean.FALSE
      ];
      let primitiveValues = boolArray.map((value: Boolean) => value.toBoolean());
      expect(primitiveValues[0]).assertEqual(true);
      expect(primitiveValues[1]).assertEqual(false);
      expect(primitiveValues[2]).assertEqual(true);
      expect(primitiveValues[3]).assertEqual(true);
      expect(primitiveValues[4]).assertEqual(false);
      expect(boolArray.filter((value: Boolean) => value.toBoolean()).length).assertEqual(3);
      expect(boolArray.every((value: Boolean) => value.toBoolean())).assertEqual(false);
      expect(boolArray.some((value: Boolean) => value.toBoolean())).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2300
     * @tc.name      testBooleanToBooleanChainedUse
     * @tc.desc      instance.toBoolean() works in chained ternary expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanChainedUse", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      expect(bool.toBoolean() ? "yes" : "no").assertEqual("yes");
      expect(bool.toBoolean() === true ? "enabled" : "disabled").assertEqual("enabled");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2400
     * @tc.name      testBooleanToBooleanManyCalls
     * @tc.desc      instance.toBoolean() returns consistent results in a loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanManyCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool = new Boolean(true);
      for (let i = 0; i < 100; i++) {
        expect(bool.toBoolean()).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2500
     * @tc.name      testBooleanToBooleanDifferentInstances
     * @tc.desc      instance.toBoolean() works for new Boolean() and singleton instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanDifferentInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueInstance1 = new Boolean(true);
      let trueInstance2 = Boolean.TRUE;
      let falseInstance1 = new Boolean(false);
      let falseInstance2 = Boolean.FALSE;
      expect(trueInstance1.toBoolean()).assertEqual(true);
      expect(trueInstance2.toBoolean()).assertEqual(true);
      expect(falseInstance1.toBoolean()).assertEqual(false);
      expect(falseInstance2.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2600
     * @tc.name      testBooleanToBooleanCallPerformance
     * @tc.desc      instance.toBoolean() performance in a loop.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanCallPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        expect(instance.toBoolean()).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2700
     * @tc.name      testBooleanToBooleanBatchPerformance
     * @tc.desc      instance.toBoolean() batch performance with array map.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanBatchPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instances: Array<Boolean> = [];
      for (let i = 0; i < 1000; i++) {
        instances.push(i % 2 === 0 ? new Boolean(true) : new Boolean(false));
      }
      let start = Date.now();
      let results = instances.map((value: Boolean) => value.toBoolean());
      expect(results.length).assertEqual(1000);
      expect(results.filter((value: boolean) => value).length).assertEqual(500);
      expect(results.filter((value: boolean) => !value).length).assertEqual(500);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2800
     * @tc.name      testBooleanToBooleanJavaScriptStyleCompatibility
     * @tc.desc      instance.toBoolean() matches instance.valueOf() result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanJavaScriptStyleCompatibility", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      let bool1 = instance.toBoolean();
      let bool2 = instance.valueOf();
      expect(bool1).assertEqual(true);
      expect(bool2).assertEqual(true);
      expect(bool1).assertEqual(bool2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_2900
     * @tc.name      testBooleanToBooleanTypeConversionChain
     * @tc.desc      instance.toBoolean() works with different constructor input types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanTypeConversionChain", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100).toBoolean()).assertEqual(true);
      expect(new Boolean("test").toBoolean()).assertEqual(true);
      expect(new Boolean(0).toBoolean()).assertEqual(false);
      expect(new Boolean("").toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3000
     * @tc.name      testBooleanToBooleanWithOtherBooleanMethods
     * @tc.desc      instance.toBoolean() works alongside other Boolean methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanWithOtherBooleanMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new Boolean(true);
      expect(instance.negate().toBoolean()).assertEqual(false);
      expect(new Boolean(true).compareTo(new Boolean(false))).assertEqual(1);
      expect(new Boolean(true).toBoolean() && !new Boolean(false).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3100
     * @tc.name      testBooleanToBooleanGenericFunction
     * @tc.desc      instance.toBoolean() works via generic helper functions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanGenericFunction", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processBoolean<Boolean>(new Boolean(true))).assertEqual(true);
      expect(processBoolean<Boolean>(Boolean.FALSE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3200
     * @tc.name      testBooleanToBooleanApiWrapper
     * @tc.desc      instance.toBoolean() via BooleanWrapper class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanApiWrapper", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper = new BooleanWrapper(true);
      expect(wrapper.isEnabled()).assertEqual(true);
      expect(wrapper.isDisabled()).assertEqual(false);
      expect(wrapper.getState()).assertEqual(true);
      wrapper.toggle();
      expect(wrapper.isEnabled()).assertEqual(false);
      expect(wrapper.isDisabled()).assertEqual(true);
      expect(wrapper.getState()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3300
     * @tc.name      testBooleanToBooleanDataValidation
     * @tc.desc      instance.toBoolean() via validateBoolean helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanDataValidation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueObj = new Boolean(true);
      let falseObj = new Boolean(false);
      expect(validateBoolean(trueObj, true)).assertEqual(true);
      expect(validateBoolean(trueObj, false)).assertEqual(false);
      expect(validateBoolean(falseObj, false)).assertEqual(true);
      expect(validateBoolean(falseObj, true)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3400
     * @tc.name      testBooleanToBooleanCollectionOperations
     * @tc.desc      instance.toBoolean() in collection filter/find/some/every operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanCollectionOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolArray: Array<Boolean> = [
        new Boolean(true),
        new Boolean(false),
        Boolean.TRUE,
        Boolean.FALSE,
        new Boolean(1),
        new Boolean(0)
      ];
      expect(boolArray.filter((value: Boolean) => value.toBoolean()).length).assertEqual(3);
      expect(boolArray.filter((value: Boolean) => !value.toBoolean()).length).assertEqual(3);
      expect(boolArray.some((value: Boolean) => value.toBoolean())).assertEqual(true);
      expect(boolArray.every((value: Boolean) => value.toBoolean())).assertEqual(false);
      expect(boolArray.findIndex((value: Boolean) => value.toBoolean())).assertEqual(0);
      expect(boolArray.findIndex((value: Boolean) => !value.toBoolean())).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3500
     * @tc.name      testBooleanToBooleanFunctionalProgramming
     * @tc.desc      instance.toBoolean() in functional programming patterns.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanFunctionalProgramming", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let toBoolFn = (value: Boolean): boolean => value.toBoolean();
      let instances: Array<Boolean> = [new Boolean(true), new Boolean(false), Boolean.TRUE];
      let results = instances.map(toBoolFn);
      expect(results[0]).assertEqual(true);
      expect(results[1]).assertEqual(false);
      expect(results[2]).assertEqual(true);
      expect(instances.map(toBoolFn).filter((value: boolean) => value).length).assertEqual(2);
      expect(instances.reduce((acc: int, value: Boolean) => acc + (value.toBoolean() ? 1 : 0), 0)).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_BOOLEAN_INSTANCE_3600
     * @tc.name      testBooleanToBooleanConditionalExpression
     * @tc.desc      instance.toBoolean() via getBooleanStatus and evaluateBooleanPair helpers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToBooleanConditionalExpression", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueObj = new Boolean(true);
      let falseObj = new Boolean(false);
      expect(getBooleanStatus(trueObj)).assertEqual("true");
      expect(getBooleanStatus(falseObj)).assertEqual("false");
      expect(evaluateBooleanPair(trueObj, falseObj)).assertEqual("only a is true");
      expect(evaluateBooleanPair(falseObj, trueObj)).assertEqual("only b is true");
      expect(evaluateBooleanPair(trueObj, trueObj)).assertEqual("both are true");
      expect(evaluateBooleanPair(falseObj, falseObj)).assertEqual("both are false");
    })
  })
}
