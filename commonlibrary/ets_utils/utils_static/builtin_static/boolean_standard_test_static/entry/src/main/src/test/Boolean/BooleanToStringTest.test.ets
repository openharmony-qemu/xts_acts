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

export default function BooleanToStringTest(): void {
  describe("BooleanToStringTest", () => {
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
     * @tc.number    SUB_BOOLEAN_TO_STRING_0100
     * @tc.name      testBooleanToStringBasicValues
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringBasicValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toString()).assertEqual("true");
      expect(new Boolean(false).toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0200
     * @tc.name      testBooleanToStringRejectsArgumentsCompileConstraint
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringRejectsArgumentsCompileConstraint", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toString()).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0300
     * @tc.name      testBooleanToStringSingletonValues
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringSingletonValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.TRUE.toString()).assertEqual("true");
      expect(Boolean.FALSE.toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0400
     * @tc.name      testBooleanToStringNumberConstructors
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringNumberConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(100).toString()).assertEqual("true");
      expect(new Boolean(1).toString()).assertEqual("true");
      expect(new Boolean(0).toString()).assertEqual("false");
      expect(new Boolean(3.14).toString()).assertEqual("true");
      expect(new Boolean(0.0).toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0500
     * @tc.name      testBooleanToStringStringConstructors
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringStringConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean("test").toString()).assertEqual("true");
      expect(new Boolean("").toString()).assertEqual("false");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0600
     * @tc.name      testBooleanToStringSpecialConstructors
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringSpecialConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(c'A').toString()).assertEqual("true");
      expect(new Boolean(c'\u0000').toString()).assertEqual("false");
      expect(new Boolean(null as Any).toString()).assertEqual("false");
      expect(new Boolean(undefined as Any).toString()).assertEqual("false");
      expect(new Boolean(new Number(10)).toString()).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0700
     * @tc.name      testBooleanToStringComparedWithValueOf
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringComparedWithValueOf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toString()).assertEqual("true");
      expect(new Boolean(true).valueOf()).assertEqual(true);
      expect(new Boolean(false).toString()).assertEqual("false");
      expect(new Boolean(false).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0800
     * @tc.name      testBooleanToStringComparedWithToBoolean
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringComparedWithToBoolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).toString()).assertEqual("true");
      expect(new Boolean(true).toBoolean()).assertEqual(true);
      expect(new Boolean(false).toString()).assertEqual("false");
      expect(new Boolean(false).toBoolean()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_0900
     * @tc.name      testBooleanToStringRepeatedCalls
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringRepeatedCalls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolObj = new Boolean(true);
      expect(boolObj.toString()).assertEqual("true");
      expect(boolObj.toString()).assertEqual("true");
      expect(boolObj.toString()).assertEqual("true");
    })

    /**
     * @tc.number    SUB_BOOLEAN_TO_STRING_1000
     * @tc.name      testBooleanToStringDifferentInstances
     * @tc.desc      Boolean.toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanToStringDifferentInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bool1 = new Boolean(true);
      let bool2 = new Boolean(false);
      expect(bool1.toString()).assertEqual("true");
      expect(bool2.toString()).assertEqual("false");
    })
  })
}
