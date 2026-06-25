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

interface BooleanInvokeValue {
  value: int;
}

interface BooleanFormData {
  name?: string;
  age?: int;
  email?: string;
}

interface BooleanConfig {
  debugMode?: boolean;
  enableCache?: boolean;
  logLevel?: string;
}

interface BooleanUser {
  id?: int;
  name?: string;
  email?: string;
}

enum BooleanInvokeEnum {
  A = 1,
  B = 2
}

class BooleanInvokeClass {
  value: int = 0;
}

class BooleanInvokeSubClass extends BooleanInvokeClass {
}

function invokeToBoolean<T>(value: T): boolean {
  return Boolean.$_invoke<T>(value);
}

function hasValue<T>(value: T): boolean {
  return Boolean.$_invoke<T>(value);
}

function getFlag<T>(value: T | null | undefined): boolean {
  return Boolean.$_invoke<T | null | undefined>(value);
}

function validateBooleanForm(data: BooleanFormData): boolean {
  return Boolean.$_invoke<string | undefined>(data.name) &&
    Boolean.$_invoke<int | undefined>(data.age) &&
    Boolean.$_invoke<string | undefined>(data.email);
}

function isConfigEnabled<T>(value: T | null | undefined): boolean {
  return Boolean.$_invoke<T | null | undefined>(value);
}

function processBooleanValue<T>(value: T): boolean {
  return Boolean.$_invoke<T>(value);
}

export default function BooleanInvokeTTest(): void {
  describe("BooleanInvokeTTest", (): void => {
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
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0100
     * @tc.name      testBooleanInvokeRequiredParameter
     * @tc.desc      Boolean.$_invoke<T>() converts required value parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeRequiredParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<string>("test")).assertEqual(true);
      expect(Boolean.$_invoke<int>(1)).assertEqual(true);
      expect(Boolean.$_invoke<undefined>(undefined)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0200
     * @tc.name      testBooleanInvokeNoParameter
     * @tc.desc      Boolean.$_invoke() returns false by default.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeNoParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0300
     * @tc.name      testBooleanInvokeBooleanValues
     * @tc.desc      Boolean.$_invoke<T>() converts boolean values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeBooleanValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<boolean>(true)).assertEqual(true);
      expect(Boolean.$_invoke<boolean>(false)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0500
     * @tc.name      testBooleanInvokeCharValues
     * @tc.desc      Boolean.$_invoke<T>() converts char values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeCharValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<char>(c'A')).assertEqual(true);
      expect(Boolean.$_invoke<char>(c'\n')).assertEqual(true);
      expect(Boolean.$_invoke<char>(c' ')).assertEqual(true);
      expect(Boolean.$_invoke<char>(c'\uFFFF')).assertEqual(true);
      expect(Boolean.$_invoke<char>(c'\u0000')).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0600
     * @tc.name      testBooleanInvokeFloatingValues
     * @tc.desc      Boolean.$_invoke<T>() converts float and number values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeFloatingValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<float>(3.14f)).assertEqual(true);
      expect(Boolean.$_invoke<float>(-2.5f)).assertEqual(true);
      expect(Boolean.$_invoke<number>(0.001)).assertEqual(true);
      expect(Boolean.$_invoke<number>(1e10)).assertEqual(true);
      expect(Boolean.$_invoke<float>(0.0f)).assertEqual(false);
      expect(Boolean.$_invoke<number>(-0.0)).assertEqual(false);
      expect(Boolean.$_invoke<number>(NaN)).assertEqual(false);
      expect(Boolean.$_invoke<number>(Number.NaN)).assertEqual(false);
      expect(Boolean.$_invoke<float>(Float.NaN as float)).assertEqual(false);
      expect(Boolean.$_invoke<number>(Infinity)).assertEqual(true);
      expect(Boolean.$_invoke<number>(-Infinity)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0700
     * @tc.name      testBooleanInvokeStringValues
     * @tc.desc      Boolean.$_invoke<T>() converts string values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeStringValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<string>("test")).assertEqual(true);
      expect(Boolean.$_invoke<string>(" ")).assertEqual(true);
      expect(Boolean.$_invoke<string>("0")).assertEqual(true);
      expect(Boolean.$_invoke<string>("false")).assertEqual(true);
      expect(Boolean.$_invoke<string>("null")).assertEqual(true);
      expect(Boolean.$_invoke<string>("")).assertEqual(false);
      expect(Boolean.$_invoke<string>("你好")).assertEqual(true);
      expect(Boolean.$_invoke<string>("😀")).assertEqual(true);
      expect(Boolean.$_invoke<string>("\u200B")).assertEqual(true);
      expect(Boolean.$_invoke<string>("<script>alert(1)</script>")).assertEqual(true);
      expect(Boolean.$_invoke<string>("\udc04")).assertEqual(true);
      expect(Boolean.$_invoke<string>("\xe4")).assertEqual(true);
      expect(Boolean.$_invoke<string>("\xe4\x3f\xad")).assertEqual(true);
      expect(Boolean.$_invoke<string>("\xc0\x81")).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0800
     * @tc.name      testBooleanInvokeNullAndUndefined
     * @tc.desc      Boolean.$_invoke<T>() converts null and undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeNullAndUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<null>(null)).assertEqual(false);
      expect(Boolean.$_invoke<undefined>(undefined)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_0900
     * @tc.name      testBooleanInvokeObjectValues
     * @tc.desc      Boolean.$_invoke<T>() converts object-like values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeObjectValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let date: Date = new Date();
      let error: Error = new Error("test");
      let regexp: RegExp = new RegExp("pattern");
      let map: Map<string, int> = new Map<string, int>();
      let set: Set<int> = new Set<int>();
      let array: int[] = [1, 2, 3];
      let emptyArray: int[] = [];
      let fn: () => int = (): int => {
        return 1;
      };

      expect(Boolean.$_invoke<Object>(obj)).assertEqual(true);
      expect(Boolean.$_invoke<Date>(date)).assertEqual(true);
      expect(Boolean.$_invoke<Error>(error)).assertEqual(true);
      expect(Boolean.$_invoke<RegExp>(regexp)).assertEqual(true);
      expect(Boolean.$_invoke<Map<string, int>>(map)).assertEqual(true);
      expect(Boolean.$_invoke<Set<int>>(set)).assertEqual(true);
      expect(Boolean.$_invoke<int[]>(array)).assertEqual(true);
      expect(Boolean.$_invoke<int[]>(emptyArray)).assertEqual(true);
      expect(Boolean.$_invoke<() => int>(fn)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1000
     * @tc.name      testBooleanInvokeWrapperValues
     * @tc.desc      Boolean.$_invoke<T>() converts wrapper class instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeWrapperValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<Number>(new Number(100))).assertEqual(true);
      expect(Boolean.$_invoke<Number>(new Number(0))).assertEqual(false);
      expect(Boolean.$_invoke<String>(new String("test"))).assertEqual(true);
      expect(Boolean.$_invoke<String>(new String(""))).assertEqual(false);
      expect(Boolean.$_invoke<Boolean>(new Boolean(true))).assertEqual(true);
      expect(Boolean.$_invoke<Boolean>(new Boolean(false))).assertEqual(false);
      expect(Boolean.$_invoke<Boolean>(Boolean.TRUE)).assertEqual(true);
      expect(Boolean.$_invoke<Boolean>(Boolean.FALSE)).assertEqual(false);
      expect(Boolean.$_invoke<Char>(new Char(c'A'))).assertEqual(true);
      expect(Boolean.$_invoke<Char>(new Char(c'\u0000'))).assertEqual(false);
      expect(Boolean.$_invoke<Float>(new Float(3.14f))).assertEqual(true);
      expect(Boolean.$_invoke<Float>(new Float(0.0f))).assertEqual(false);
      expect(Boolean.$_invoke<Float>(new Float(Float.NaN))).assertEqual(false);
      expect(Boolean.$_invoke<Int>(new Int(100))).assertEqual(true);
      expect(Boolean.$_invoke<Int>(new Int(0))).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1100
     * @tc.name      testBooleanInvokeReturnType
     * @tc.desc      Boolean.$_invoke<T>() returns primitive boolean values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeReturnType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Boolean.$_invoke<string>("test");
      expect(typeof result).assertEqual("boolean");
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1200
     * @tc.name      testBooleanInvokeTruthyAndFalsyValues
     * @tc.desc      Boolean.$_invoke<T>() follows boolean conversion rules.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeTruthyAndFalsyValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<boolean>(true)).assertEqual(true);
      expect(Boolean.$_invoke<int>(1)).assertEqual(true);
      expect(Boolean.$_invoke<int>(-1)).assertEqual(true);
      expect(Boolean.$_invoke<number>(3.14)).assertEqual(true);
      expect(Boolean.$_invoke<char>(c'A')).assertEqual(true);
      expect(Boolean.$_invoke<string>("test")).assertEqual(true);
      expect(Boolean.$_invoke<Object>(new Object())).assertEqual(true);
      expect(Boolean.$_invoke<int[]>([])).assertEqual(true);
      expect(Boolean.$_invoke<Date>(new Date())).assertEqual(true);
      expect(Boolean.$_invoke<Error>(new Error())).assertEqual(true);
      expect(Boolean.$_invoke<Map<string, int>>(new Map<string, int>())).assertEqual(true);
      expect(Boolean.$_invoke<Set<int>>(new Set<int>())).assertEqual(true);

      expect(Boolean.$_invoke<boolean>(false)).assertEqual(false);
      expect(Boolean.$_invoke<int>(0)).assertEqual(false);
      expect(Boolean.$_invoke<number>(-0.0)).assertEqual(false);
      expect(Boolean.$_invoke<float>(0.0f)).assertEqual(false);
      expect(Boolean.$_invoke<number>(NaN)).assertEqual(false);
      expect(Boolean.$_invoke<string>("")).assertEqual(false);
      expect(Boolean.$_invoke<char>(c'\u0000')).assertEqual(false);
      expect(Boolean.$_invoke<null>(null)).assertEqual(false);
      expect(Boolean.$_invoke<undefined>(undefined)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1300
     * @tc.name      testBooleanInvokeBoundaryValues
     * @tc.desc      Boolean.$_invoke<T>() converts boundary values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeBoundaryValues", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean.$_invoke<number>(Number.MAX_VALUE)).assertEqual(true);
      expect(Boolean.$_invoke<number>(Number.MIN_VALUE)).assertEqual(true);
      expect(Boolean.$_invoke<number>(Number.MAX_SAFE_INTEGER)).assertEqual(true);
      expect(Boolean.$_invoke<number>(Number.MIN_SAFE_INTEGER)).assertEqual(true);
      expect(Boolean.$_invoke<number>(Infinity)).assertEqual(true);
      expect(Boolean.$_invoke<number>(-Infinity)).assertEqual(true);
      expect(Boolean.$_invoke<int>(0)).assertEqual(false);
      expect(Boolean.$_invoke<string>("x")).assertEqual(true);
      expect(Boolean.$_invoke<string>("")).assertEqual(false);
      expect(Boolean.$_invoke<char>(c'\u0000')).assertEqual(false);
      expect(Boolean.$_invoke<char>(c'\uFFFF')).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1400
     * @tc.name      testBooleanInvokeGenericInference
     * @tc.desc      Boolean.$_invoke<T>() supports generic inference and explicit generic parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeGenericInference", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1 = Boolean.$_invoke("test");
      const bool2 = Boolean.$_invoke(100);
      const bool3 = Boolean.$_invoke(true);
      const obj: BooleanInvokeValue = { value: 100 };
      const bool4 = Boolean.$_invoke<BooleanInvokeValue>(obj);
      const bool5 = Boolean.$_invoke<int[]>([1, 2, 3]);
      const bool6 = Boolean.$_invoke<BooleanInvokeEnum>(BooleanInvokeEnum.A);

      expect(bool1).assertEqual(true);
      expect(bool2).assertEqual(true);
      expect(bool3).assertEqual(true);
      expect(bool4).assertEqual(true);
      expect(bool5).assertEqual(true);
      expect(bool6).assertEqual(true);
      expect(Boolean.$_invoke<number>(100)).assertEqual(true);
      expect(Boolean.$_invoke<string>("test")).assertEqual(true);
      expect(Boolean.$_invoke<boolean>(true)).assertEqual(true);
      expect(Boolean.$_invoke<null>(null)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1500
     * @tc.name      testBooleanInvokeCompareWithConstructorAndNotNot
     * @tc.desc      Boolean.$_invoke<T>() matches Boolean wrapper value and double negation results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeCompareWithConstructorAndNotNot", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: boolean = Boolean.$_invoke<string>("test");
      const bool2: Boolean = new Boolean("test");

      expect(typeof bool1).assertEqual("boolean");
      expect(bool2 instanceof Boolean).assertEqual(true);
      expect(bool1).assertEqual(bool2.toBoolean());
      expect(Boolean.$_invoke<string>("test")).assertEqual(!!("test" as string));
      expect(Boolean.$_invoke<null>(null)).assertEqual(!!(null as Object | null));
      expect(Boolean.$_invoke<undefined>(undefined)).assertEqual(!!(undefined as Object | undefined));
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1600
     * @tc.name      testBooleanInvokeApplicationHelpers
     * @tc.desc      Boolean.$_invoke<T>() can be used by conversion and value-check helpers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeApplicationHelpers", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(invokeToBoolean<string>("test")).assertEqual(true);
      expect(invokeToBoolean<string>("")).assertEqual(false);
      expect(invokeToBoolean<int>(100)).assertEqual(true);
      expect(invokeToBoolean<int>(0)).assertEqual(false);
      expect(getFlag<string>("test")).assertEqual(true);
      expect(getFlag<string>("")).assertEqual(false);
      expect(getFlag<string>(null)).assertEqual(false);
      expect(getFlag<string>(undefined)).assertEqual(false);
      expect(hasValue<string>("test")).assertEqual(true);
      expect(hasValue<string>("")).assertEqual(false);
      expect(hasValue<int>(0)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1700
     * @tc.name      testBooleanInvokeFiltering
     * @tc.desc      Boolean.$_invoke<T>() filters falsy values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeFiltering", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthyCount: int = 0;

      if (Boolean.$_invoke<int>(1)) {
        truthyCount++;
      }
      if (Boolean.$_invoke<int>(0)) {
        truthyCount++;
      }
      if (Boolean.$_invoke<string>("test")) {
        truthyCount++;
      }
      if (Boolean.$_invoke<string>("")) {
        truthyCount++;
      }
      if (Boolean.$_invoke<null>(null)) {
        truthyCount++;
      }
      if (Boolean.$_invoke<undefined>(undefined)) {
        truthyCount++;
      }
      if (Boolean.$_invoke<boolean>(true)) {
        truthyCount++;
      }
      if (Boolean.$_invoke<boolean>(false)) {
        truthyCount++;
      }
      if (Boolean.$_invoke<Object>(new Object())) {
        truthyCount++;
      }
      if (Boolean.$_invoke<int[]>([])) {
        truthyCount++;
      }

      expect(truthyCount).assertEqual(5);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1800
     * @tc.name      testBooleanInvokeChainedUsage
     * @tc.desc      Boolean.$_invoke<T>() result can be used by conditional expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeChainedUsage", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flag: boolean = Boolean.$_invoke<string>("test");
      let conditionResult: string = "no";
      if (flag) {
        conditionResult = "truthy";
      }
      const value: string = flag ? "yes" : "no";
      const result: boolean = flag && true;

      expect(conditionResult).assertEqual("truthy");
      expect(value).assertEqual("yes");
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_1900
     * @tc.name      testBooleanInvokeBatchConversion
     * @tc.desc      Boolean.$_invoke<T>() supports repeated batch conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeBatchConversion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: boolean[] = [
        Boolean.$_invoke<int>(1),
        Boolean.$_invoke<int>(0),
        Boolean.$_invoke<string>("test"),
        Boolean.$_invoke<string>(""),
        Boolean.$_invoke<null>(null),
        Boolean.$_invoke<undefined>(undefined),
        Boolean.$_invoke<boolean>(true),
        Boolean.$_invoke<boolean>(false),
        Boolean.$_invoke<Object>(new Object()),
        Boolean.$_invoke<int[]>([]),
        Boolean.$_invoke<number>(3.14),
        Boolean.$_invoke<number>(NaN),
        Boolean.$_invoke<number>(Infinity),
        Boolean.$_invoke<char>(c'A'),
        Boolean.$_invoke<char>(c'\u0000')
      ];
      let expected: boolean[] = [
        true, false, true, false, false, false, true, false,
        true, true, true, false, true, true, false
      ];

      expect(results.length).assertEqual(expected.length);
      for (let index: int = 0; index < results.length; index++) {
        expect(results[index]).assertEqual(expected[index]);
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_2000
     * @tc.name      testBooleanInvokeSpecialObjects
     * @tc.desc      Boolean.$_invoke<T>() converts circular objects and class instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeSpecialObjects", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let classObj: BooleanInvokeClass = new BooleanInvokeClass();
      let subClassObj: BooleanInvokeSubClass = new BooleanInvokeSubClass();

      expect(Boolean.$_invoke<Object>(obj)).assertEqual(true);
      expect(Boolean.$_invoke<BooleanInvokeClass>(classObj)).assertEqual(true);
      expect(Boolean.$_invoke<BooleanInvokeSubClass>(subClassObj)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_2100
     * @tc.name      testBooleanInvokeFormValidation
     * @tc.desc      Boolean.$_invoke<T>() supports form validation checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeFormValidation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validForm: BooleanFormData = { name: "John", age: 30, email: "john@example.com" };
      const invalidForm1: BooleanFormData = { name: "", age: 30, email: "john@example.com" };
      const invalidForm2: BooleanFormData = { age: 30, email: "john@example.com" };

      expect(validateBooleanForm(validForm)).assertEqual(true);
      expect(validateBooleanForm(invalidForm1)).assertEqual(false);
      expect(validateBooleanForm(invalidForm2)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_2200
     * @tc.name      testBooleanInvokeConfigManagement
     * @tc.desc      Boolean.$_invoke<T>() supports configuration checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeConfigManagement", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: BooleanConfig = {
        debugMode: true,
        enableCache: false
      };

      expect(isConfigEnabled<boolean>(config.debugMode)).assertEqual(true);
      expect(isConfigEnabled<boolean>(config.enableCache)).assertEqual(false);
      expect(isConfigEnabled<string>(config.logLevel)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_2300
     * @tc.name      testBooleanInvokeDataFiltering
     * @tc.desc      Boolean.$_invoke<T>() supports filtering invalid data.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeDataFiltering", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const users: BooleanUser[] = [
        { id: 1, name: "Alice", email: "alice@example.com" },
        { id: 2, name: "", email: "" },
        { id: 0, name: "Bob", email: "bob@example.com" },
        { name: "Charlie", email: "charlie@example.com" }
      ];
      const validUsers: BooleanUser[] = users.filter((user: BooleanUser): boolean => {
        return Boolean.$_invoke<int | undefined>(user.id) && user.id! > 0 && Boolean.$_invoke<string | undefined>(user.name);
      });

      expect(validUsers.length).assertEqual(1);
      expect(validUsers[0].name).assertEqual("Alice");
    })

    /**
     * @tc.number    SUB_BOOLEAN_INVOKE_T_2400
     * @tc.name      testBooleanInvokeTypeSafety
     * @tc.desc      Boolean.$_invoke<T>() keeps generic process helpers type-safe.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanInvokeTypeSafety", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: boolean = processBooleanValue<int>(100);
      const result2: boolean = processBooleanValue<string>("test");
      const result3: boolean = processBooleanValue<boolean>(true);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
    })
  })
}
