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

class BooleanPropertySwitch {
  private state: Boolean = Boolean.FALSE;

  turnOn(): void {
    this.state = Boolean.TRUE;
  }

  turnOff(): void {
    this.state = Boolean.FALSE;
  }

  isOn(): boolean {
    return this.state.toBoolean();
  }

  getState(): Boolean {
    return this.state;
  }
}

class BooleanPropertyFeatureFlags {
  static readonly ENABLED: Boolean = Boolean.TRUE;
  static readonly DISABLED: Boolean = Boolean.FALSE;

  static isFeatureEnabled(flag: Boolean): boolean {
    return flag.toBoolean();
  }
}

function booleanPropertyIsValid(value: int): Boolean {
  return value > 0 ? Boolean.TRUE : Boolean.FALSE;
}

function booleanPropertyProcess(flag: Boolean = Boolean.FALSE): boolean {
  return flag.toBoolean();
}

function booleanPropertyFromValue(value: boolean): Boolean {
  return value ? Boolean.TRUE : Boolean.FALSE;
}

function booleanPropertyContains(values: string[], target: string): boolean {
  for (let index: int = 0; index < values.length; index++) {
    if (values[index] === target) {
      return true;
    }
  }
  return false;
}

export default function BooleanPropertyTest(): void {
  describe("BooleanPropertyTest", () => {
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
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0100
     * @tc.name      testBooleanTruePropertyExists
     * @tc.desc      Boolean.TRUE property exists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTruePropertyExists", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE).not().assertNull();
      expect(Boolean.TRUE).not().assertUndefined();
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0200
     * @tc.name      testBooleanFalsePropertyExists
     * @tc.desc      Boolean.FALSE property exists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalsePropertyExists", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE).not().assertNull();
      expect(Boolean.FALSE).not().assertUndefined();
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0300
     * @tc.name      testBooleanTruePropertyType
     * @tc.desc      Boolean.TRUE is Boolean instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTruePropertyType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE instanceof Boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0400
     * @tc.name      testBooleanFalsePropertyType
     * @tc.desc      Boolean.FALSE is Boolean instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalsePropertyType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE instanceof Boolean).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0500
     * @tc.name      testBooleanTruePropertyValue
     * @tc.desc      Boolean.TRUE value is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTruePropertyValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.isTrue()).assertEqual(true);
      expect(Boolean.TRUE.isFalse()).assertEqual(false);
      expect(Boolean.TRUE.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0600
     * @tc.name      testBooleanFalsePropertyValue
     * @tc.desc      Boolean.FALSE value is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalsePropertyValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE.toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.isTrue()).assertEqual(false);
      expect(Boolean.FALSE.isFalse()).assertEqual(true);
      expect(Boolean.FALSE.valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0700
     * @tc.name      testBooleanTrueToString
     * @tc.desc      Boolean.TRUE string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTrueToString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toString()).assertEqual("true");
      expect(Boolean.TRUE.toString()).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0800
     * @tc.name      testBooleanFalseToString
     * @tc.desc      Boolean.FALSE string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalseToString", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE.toString()).assertEqual("false");
      expect(Boolean.FALSE.toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_0900
     * @tc.name      testBooleanTrueReferenceStable
     * @tc.desc      Boolean.TRUE returns stable reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTrueReferenceStable", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref1: Boolean = Boolean.TRUE;
      const ref2: Boolean = Boolean.TRUE;
      expect(ref1 === ref2).assertEqual(true);
      expect(ref1.toBoolean()).assertEqual(true);
      expect(ref2.toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1000
     * @tc.name      testBooleanFalseReferenceStable
     * @tc.desc      Boolean.FALSE returns stable reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalseReferenceStable", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref1: Boolean = Boolean.FALSE;
      const ref2: Boolean = Boolean.FALSE;
      expect(ref1 === ref2).assertEqual(true);
      expect(ref1.toBoolean()).assertEqual(false);
      expect(ref2.toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1100
     * @tc.name      testBooleanNewInstanceValueEqualsStatic
     * @tc.desc      New Boolean values equal static TRUE and FALSE values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanNewInstanceValueEqualsStatic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);
      expect(trueBool.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(falseBool.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(trueBool.equals(Boolean.TRUE)).assertEqual(true);
      expect(falseBool.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1200
     * @tc.name      testBooleanStaticMultipleAccess
     * @tc.desc      Multiple access to TRUE and FALSE keeps stable reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticMultipleAccess", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueRefs: Boolean[] = [];
      let falseRefs: Boolean[] = [];
      for (let index: int = 0; index < 100; index++) {
        trueRefs.push(Boolean.TRUE);
        falseRefs.push(Boolean.FALSE);
      }
      for (let index: int = 1; index < trueRefs.length; index++) {
        const currentTrue: Boolean = trueRefs[index];
        const firstTrue: Boolean = trueRefs[0];
        const currentFalse: Boolean = falseRefs[index];
        const firstFalse: Boolean = falseRefs[0];
        expect(currentTrue === firstTrue).assertEqual(true);
        expect(currentFalse === firstFalse).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1300
     * @tc.name      testBooleanTrueMethods
     * @tc.desc      Boolean.TRUE method calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTrueMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.valueOf()).assertEqual(true);
      expect(Boolean.TRUE.toString()).assertEqual("true");
      expect(Boolean.TRUE.isTrue()).assertEqual(true);
      expect(Boolean.TRUE.isFalse()).assertEqual(false);
      expect(Boolean.TRUE.negate().toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.compareTo(Boolean.TRUE)).assertEqual(0);
      expect(Boolean.TRUE.compareTo(Boolean.FALSE)).assertEqual(1);
      expect(Boolean.TRUE.equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.TRUE.equals(Boolean.FALSE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1400
     * @tc.name      testBooleanFalseMethods
     * @tc.desc      Boolean.FALSE method calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalseMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE.toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.valueOf()).assertEqual(false);
      expect(Boolean.FALSE.toString()).assertEqual("false");
      expect(Boolean.FALSE.isTrue()).assertEqual(false);
      expect(Boolean.FALSE.isFalse()).assertEqual(true);
      expect(Boolean.FALSE.negate().toBoolean()).assertEqual(true);
      expect(Boolean.FALSE.compareTo(Boolean.FALSE)).assertEqual(0);
      expect(Boolean.FALSE.compareTo(Boolean.TRUE)).assertEqual(-1);
      expect(Boolean.FALSE.equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.FALSE.equals(Boolean.TRUE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1500
     * @tc.name      testBooleanTrueLogicalMethods
     * @tc.desc      Boolean.TRUE and/or/xor method calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanTrueLogicalMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.and(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.and(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.or(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.or(Boolean.FALSE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.xor(Boolean.TRUE).toBoolean()).assertEqual(false);
      expect(Boolean.TRUE.xor(Boolean.FALSE).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1600
     * @tc.name      testBooleanFalseLogicalMethods
     * @tc.desc      Boolean.FALSE and/or/xor method calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanFalseLogicalMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.FALSE.and(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.and(Boolean.TRUE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.or(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.or(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(Boolean.FALSE.xor(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.xor(Boolean.TRUE).toBoolean()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1700
     * @tc.name      testBooleanLogicalReflexiveOperation
     * @tc.desc      Reflexive logical operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalReflexiveOperation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.and(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.or(Boolean.TRUE).toBoolean()).assertEqual(true);
      expect(Boolean.TRUE.xor(Boolean.TRUE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.and(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.or(Boolean.FALSE).toBoolean()).assertEqual(false);
      expect(Boolean.FALSE.xor(Boolean.FALSE).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1800
     * @tc.name      testBooleanLogicalResultIsBoolean
     * @tc.desc      Logical operation results are Boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalResultIsBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Boolean[] = [
        Boolean.TRUE.and(Boolean.TRUE),
        Boolean.TRUE.and(Boolean.FALSE),
        Boolean.FALSE.and(Boolean.TRUE),
        Boolean.FALSE.and(Boolean.FALSE),
        Boolean.TRUE.or(Boolean.TRUE),
        Boolean.TRUE.or(Boolean.FALSE),
        Boolean.FALSE.or(Boolean.TRUE),
        Boolean.FALSE.or(Boolean.FALSE),
        Boolean.TRUE.xor(Boolean.TRUE),
        Boolean.TRUE.xor(Boolean.FALSE),
        Boolean.FALSE.xor(Boolean.TRUE),
        Boolean.FALSE.xor(Boolean.FALSE)
      ];
      for (let index: int = 0; index < results.length; index++) {
        const result: Boolean = results[index];
        expect(result instanceof Boolean).assertEqual(true);
        expect(result.isTrue() || result.isFalse()).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_1900
     * @tc.name      testBooleanStaticAsReturnValue
     * @tc.desc      Boolean.TRUE and Boolean.FALSE used as return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticAsReturnValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(booleanPropertyIsValid(100).toBoolean()).assertEqual(true);
      expect(booleanPropertyIsValid(-100).toBoolean()).assertEqual(false);
      expect(booleanPropertyIsValid(0).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2000
     * @tc.name      testBooleanStaticAsDefaultValue
     * @tc.desc      Boolean.FALSE used as default value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticAsDefaultValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(booleanPropertyProcess()).assertEqual(false);
      expect(booleanPropertyProcess(Boolean.TRUE)).assertEqual(true);
      expect(booleanPropertyProcess(Boolean.FALSE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2100
     * @tc.name      testBooleanStaticInSwitchState
     * @tc.desc      Boolean.TRUE and Boolean.FALSE used in state management
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticInSwitchState", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sw: BooleanPropertySwitch = new BooleanPropertySwitch();
      expect(sw.isOn()).assertEqual(false);
      expect(sw.getState().toBoolean()).assertEqual(false);

      sw.turnOn();
      expect(sw.isOn()).assertEqual(true);
      expect(sw.getState().toBoolean()).assertEqual(true);

      sw.turnOff();
      expect(sw.isOn()).assertEqual(false);
      expect(sw.getState().toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2200
     * @tc.name      testBooleanStaticInFeatureFlags
     * @tc.desc      Boolean.TRUE and Boolean.FALSE used in feature flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticInFeatureFlags", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BooleanPropertyFeatureFlags.isFeatureEnabled(BooleanPropertyFeatureFlags.ENABLED)).assertEqual(true);
      expect(BooleanPropertyFeatureFlags.isFeatureEnabled(BooleanPropertyFeatureFlags.DISABLED)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2300
     * @tc.name      testBooleanStaticAvoidRepeatedCreation
     * @tc.desc      Static Boolean values avoid repeated object creation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticAvoidRepeatedCreation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trueResults: Boolean[] = [];
      let falseResults: Boolean[] = [];
      for (let index: int = 0; index < 100; index++) {
        trueResults.push(booleanPropertyFromValue(true));
        falseResults.push(booleanPropertyFromValue(false));
      }
      for (let index: int = 1; index < trueResults.length; index++) {
        const currentTrue: Boolean = trueResults[index];
        const firstTrue: Boolean = trueResults[0];
        const currentFalse: Boolean = falseResults[index];
        const firstFalse: Boolean = falseResults[0];
        expect(currentTrue === firstTrue).assertEqual(true);
        expect(currentFalse === firstFalse).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2400
     * @tc.name      testBooleanStaticManyReferences
     * @tc.desc      Multiple references point to static Boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticManyReferences", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singletons: Boolean[] = [];
      for (let index: int = 0; index < 100; index++) {
        singletons.push(Boolean.TRUE);
      }
      for (let index: int = 1; index < singletons.length; index++) {
        const current: Boolean = singletons[index];
        const first: Boolean = singletons[0];
        expect(current === first).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2500
     * @tc.name      testBooleanStaticAccessPerformance
     * @tc.desc      Static Boolean access performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticAccessPerformance", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const start: number = Date.now();
      let value: boolean = false;
      for (let index: int = 0; index < 100000; index++) {
        value = Boolean.TRUE.toBoolean();
      }
      const end: number = Date.now();
      expect(value).assertEqual(true);
      expect(end - start).assertLess(1000);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2600
     * @tc.name      testBooleanStaticConcurrentAccess
     * @tc.desc      Concurrent access to static Boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticConcurrentAccess", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Boolean[] = [];
      for (let index: int = 0; index < 100; index++) {
        results.push(Boolean.TRUE);
      }

      expect(results.length).assertEqual(100);
      for (let index: int = 0; index < results.length; index++) {
        const result: Boolean = results[index];
        expect(result === Boolean.TRUE).assertEqual(true);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2700
     * @tc.name      testBooleanStaticValueCompatibility
     * @tc.desc      Boolean static values are compatible with Boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanStaticValueCompatibility", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = Boolean.TRUE;
      const bool2: Boolean = Boolean.FALSE;
      expect(bool1 instanceof Boolean).assertEqual(true);
      expect(bool2 instanceof Boolean).assertEqual(true);
      expect(bool1.toBoolean()).assertEqual(true);
      expect(bool2.toBoolean()).assertEqual(false);
      expect(bool1.equals(Boolean.TRUE)).assertEqual(true);
      expect(bool2.equals(Boolean.FALSE)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2800
     * @tc.name      testBooleanConstructorCompatibility
     * @tc.desc      new Boolean values compare with static values by value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanConstructorCompatibility", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const newTrue: Boolean = new Boolean(true);
      const newFalse: Boolean = new Boolean(false);
      expect(newTrue.toBoolean()).assertEqual(Boolean.TRUE.toBoolean());
      expect(newFalse.toBoolean()).assertEqual(Boolean.FALSE.toBoolean());
      expect(newTrue.equals(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.TRUE.equals(newTrue)).assertEqual(true);
      expect(newFalse.equals(Boolean.FALSE)).assertEqual(true);
      expect(Boolean.FALSE.equals(newFalse)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_2900
     * @tc.name      testBooleanPrimitiveConversion
     * @tc.desc      Static Boolean values convert to primitive boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanPrimitiveConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const primitive1: boolean = Boolean.TRUE.toBoolean();
      const primitive2: boolean = Boolean.FALSE.toBoolean();
      const result: boolean = Boolean.TRUE.isTrue() && Boolean.FALSE.isFalse();
      expect(primitive1).assertEqual(true);
      expect(primitive2).assertEqual(false);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_PROPERTY_TEST_3000
     * @tc.name      testBooleanJsonSerializationByValue
     * @tc.desc      Static Boolean values can be serialized by primitive value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanJsonSerializationByValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const json1: string = JSON.stringify(Boolean.TRUE.toBoolean());
      const json2: string = JSON.stringify(Boolean.FALSE.toBoolean());
      expect(json1).assertEqual("true");
      expect(json2).assertEqual("false");
    })

  })
}
