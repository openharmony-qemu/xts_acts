/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../../../../hypium/index";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Color { Red, Green, Blue }
enum Status { NONE = 0, ACTIVE = 1, INACTIVE = 2 }
enum TestSize { S, M, L }

class FallbackValue {
  value: number = 1;
  constructor(val: number) {
    this.value = val;
  }
}

class ValueObj {
  value: number | null = null;
  constructor(val: number | null) {
    this.value = val;
  }
}

class NestedValue {
  nested: NestedInner = new NestedInner(0);
  constructor(nested: NestedInner) {
    this.nested = nested;
  }
}

class NestedInner {
  value: number = 0;
  constructor(val: number) {
    this.value = val;
  }
}

class ConfigObj {
  darkMode: boolean | null = null;
  notifications: boolean | null = null;
  autoSave: boolean = false;
  constructor(dark: boolean | null, notif: boolean | null, auto: boolean) {
    this.darkMode = dark;
    this.notifications = notif;
    this.autoSave = auto;
  }
}

class UserObj {
  role: string | null = null;
  department: string | null = null;
  constructor(r: string | null, d: string | null) {
    this.role = r;
    this.department = d;
  }
}

class TimeoutObj {
  timeout: number | null = null;
  retries: number = 0;
  constructor(t: number | null, r: number) {
    this.timeout = t;
    this.retries = r;
  }
}

export default function ExtendedConditionalExpressionsTest17():void {
  describe('ExtendedConditionalExpressionsTest17', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    // ===== Nested logical operations with truthy base (Long.MAX_VALUE) =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0656
     * @tc.desc      Nested logical operations with truthy base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0656', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = Long.MAX_VALUE;  // truthy

      // Nested: (a && b) || c
      let b: long = 0;  // falsy
      let c: long = 1;  // truthy
      expect(((a && b) || c) ? true : false).assertTrue();

      // Nested: (a || b) && c
      expect(((a || b) && c) ? true : false).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0657
     * @tc.desc      Triple logical operations with truthy base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0657', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = Long.MAX_VALUE;  // truthy
      let b: long = 1;  // truthy
      let c: long = 0;  // falsy

      // a && b && c -> falsy
      expect(((a && b) && c) ? false : true).assertTrue();
      // a || b || c -> truthy
      expect(((a || b) || c) ? true : false).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0658
     * @tc.desc      Mixed logical operations with truthy base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0658', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = Long.MAX_VALUE;
      let b: long = 0;
      let c: long = 1;

      // (a || b) && (a || c) -> truthy && truthy
      expect((((a || b) && (a || c)) ? true : false)).assertTrue();
    });

    // ===== Nested logical operations with falsy base (0) =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0659
     * @tc.desc      Nested logical operations with falsy base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0659', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 0;  // falsy

      // (a && b) || c -> falsy || truthy = truthy
      let b: long = 0;  // falsy
      let c: long = 1;  // truthy
      expect(((a && b) || c) ? true : false).assertTrue();

      // (a || b) && c -> falsy && truthy = falsy
      expect(((a || b) && c) ? false : true).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0660
     * @tc.desc      Triple logical operations with falsy base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 0;  // falsy
      let b: long = 0;  // falsy
      let c: long = 0;  // falsy

      // a && b && c -> falsy
      expect(((a && b) && c) ? false : true).assertTrue();
      // a || b || c -> falsy
      expect(((a || b) || c) ? false : true).assertTrue();
    });

    // ===== Operator precedence with && and || =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0661
     * @tc.desc      Operator precedence with AND and OR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0661', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // && has higher precedence than ||
      let a = true && false;  // false
      let result = a || true;  // true
      expect(result).assertEqual(true);

      // But in complex expression: a || b && c is parsed as a || (b && c)
      let res = false || (true && true);  // true
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0662
     * @tc.desc      Operator precedence with numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0662', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1 && 0 || 1 = (1 && 0) || 1 = 0 || 1 = 1
      let result = (1 && 0) || 1;
      expect(result).assertEqual(1);

      // 1 || 0 && 1 = 1 || (0 && 1) = 1 || 0 = 1
      result = 1 || (0 && 1);
      expect(result).assertEqual(1);
    });

    // ===== Short-circuit evaluation with function calls =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0663
     * @tc.desc      Short-circuit evaluation with AND and function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0663', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      let falsy: boolean = false;

      let result = falsy && ((): boolean => { called = true; return true; })();
      expect(result).assertEqual(false);
      expect(called).assertEqual(false);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0664
     * @tc.desc      Short-circuit evaluation with OR and function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0664', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      let truthy: boolean = true;

      let result = truthy || ((): boolean => { called = true; return false; })();
      expect(result).assertEqual(true);
      expect(called).assertEqual(false);
    });

    // ===== Logical operators with enum values =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0665
     * @tc.desc      Logical operators with enum Color.Red (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let color: Color = Color.Red;  // 0, falsy

      expect((!color) ? true : false).assertTrue();
      expect(((color && 1) ? false : true)).assertTrue();
      expect(((color || 1) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0666
     * @tc.desc      Logical operators with enum Color.Green (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0666', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let color: Color = Color.Green;  // 1, truthy

      expect((!color) ? false : true).assertTrue();
      expect(((color && 1) ? true : false)).assertTrue();
      expect(((color || 1) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0667
     * @tc.desc      Logical operators with enum TestSize.L (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0667', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: TestSize = TestSize.L;  // 2, truthy

      expect((!size) ? false : true).assertTrue();
      expect(((size && 1) ? true : false)).assertTrue();
      expect(((size || 1) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0668
     * @tc.desc      Logical operators with enum Status.NONE (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0668', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let status: Status = Status.NONE;  // 0, falsy

      expect((!status) ? true : false).assertTrue();
      expect(((status && 1) ? false : true)).assertTrue();
      expect(((status || 1) ? true : false)).assertTrue();
    });

    // ===== Logical operators with wrapper types =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0669
     * @tc.desc      Logical operators with Number wrapper (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0669', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Number = new Number(1);  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && 1) ? true : false)).assertTrue();
      expect(((a || 0) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0670
     * @tc.desc      Logical operators with Number wrapper zero (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Number = new Number(0);  // falsy

      expect((!a) ? true : false).assertTrue();
      expect(((a && 1) ? false : true)).assertTrue();
      expect(((a || 1) ? true : false)).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0671
     * @tc.desc      Logical operators with Boolean wrapper true (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0671', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Boolean = new Boolean(true);  // truthy

      expect((!a) ? false : true).assertTrue();
      expect(((a && true) ? true : false)).assertTrue();
      expect(((a || false) ? true : false)).assertTrue();
    });

    // ===== While loop with complex conditions =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0672
     * @tc.desc      While loop with AND condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0672', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: long = 1;  // truthy
      let b: long = 0;  // falsy

      while (a && b) {  // truthy && falsy = falsy - won't enter
        retcode = 1;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0673
     * @tc.desc      While loop with OR condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0673', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: long = 0;  // falsy
      let b: long = 1;  // truthy

      while (a || b) {  // falsy || truthy = truthy - will enter
        retcode = 0;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0674
     * @tc.desc      While loop with nested condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0674', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: long = 1;
      let b: long = 0;
      let count = 0;

      while ((a && b) || (count < 1)) {  // (falsy) || (truthy) = truthy
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    // ===== For loop with complex conditions =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0675
     * @tc.desc      For loop with AND condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0675', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: number[] = [1, 2, 3, 4, 5];

      for (let i = 0; i < arr.length && arr[i] < 3; i++) {
        sum += arr[i];
      }
      expect(sum).assertEqual(3);  // 1 + 2
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0676
     * @tc.desc      For loop with OR condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0676', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: number[] = [0, 0, 0, 3, 4];

      for (let i = 0; i < arr.length || i < 3; i++) {  // i < 5 || i < 3 means i < 5
        if (i < 3) {
          sum += arr[i];
        }
        if (i >= 5) break;
      }
      expect(sum).assertEqual(0);
    });

    // ===== Ternary with logical operators =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0677
     * @tc.desc      Ternary expression with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0677', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 && 2;  // Returns 2
      let result = a ? "truthy" : "falsy";
      expect(result).assertEqual("truthy");
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0678
     * @tc.desc      Ternary expression with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0678', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0 || 2;  // Returns 2
      let result = a ? "truthy" : "falsy";
      expect(result).assertEqual("truthy");
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0679
     * @tc.desc      Ternary expression with falsy AND result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0679', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 && 0;  // Returns 0
      let result = a ? "truthy" : "falsy";
      expect(result).assertEqual("falsy");
    });

    // ===== Null/undefined checks with logical operators =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0680
     * @tc.desc      Null and undefined with logical operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object | null = null;
      let b: Object | undefined = undefined;

      expect(((a && b) ? false : true)).assertTrue();  // null && undefined = null (falsy)
      expect(((a || b) ? false : true)).assertTrue();  // null || undefined = undefined (falsy)
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0681
     * @tc.desc      Null or fallback value with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0681', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FallbackValue | null = null;
      let fallback: FallbackValue = new FallbackValue(1);

      let result: FallbackValue | null = a || fallback;  // Returns fallback
      expect(result!.value).assertEqual(1);
    });

    // ===== Array operations with logical operators =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0682
     * @tc.desc      Array filter with OR condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0682', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [0, 1, 2, 0, 3];
      let filtered = arr.filter(x => x === 0 || x === 2);
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0683
     * @tc.desc      Array find with AND condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0683', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let found = arr.find(x => x > 2 && x < 5);
      expect(found).assertEqual(3);
    });

    // ===== String operations with logical operators =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0684
     * @tc.desc      String empty check with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0684', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "";
      let result = str || "default";
      expect(result).assertEqual("default");
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0685
     * @tc.desc      String with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0685', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello";
      let result = str && str.length > 0;
      expect(result).assertEqual(true);
    });

    // ===== Object property access with logical operators =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0686
     * @tc.desc      Object property chain with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0686', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObj = new ValueObj(null);
      let result = obj.value || 100;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0687
     * @tc.desc      Object property chain with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0687', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: NestedInner = new NestedInner(0);
      let obj: NestedValue = new NestedValue(nested);
      let result = obj.nested && obj.nested.value;
      expect(result).assertEqual(0);
    });

    // ===== Negation operator behavior =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0688
     * @tc.desc      Double negation with truthy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0688', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!1).assertEqual(true);
      expect(!!-1).assertEqual(true);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0689
     * @tc.desc      Double negation with falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0689', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!0).assertEqual(false);
      expect(!!null).assertEqual(false);
      expect(!!undefined).assertEqual(false);
      expect(!!Number.NaN).assertEqual(false);
      expect(!!"").assertEqual(false);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3500
     * @tc.name    testConditionalExpression0690
     * @tc.desc      Negation of objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      let obj: ConfigObj = new ConfigObj(true, null, false);

      expect(!arr).assertEqual(false);  // Object is truthy
      expect(!obj).assertEqual(false);  // Object is truthy
    });

    // ===== Real-world scenarios =====
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3600
     * @tc.name    testConditionalExpression0691
     * @tc.desc      Feature flag check scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0691', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config: ConfigObj = new ConfigObj(true, null, false);

      let enabled = config.darkMode || config.notifications;
      expect(enabled).assertEqual(true);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3700
     * @tc.name    testConditionalExpression0692
     * @tc.desc      User permission check scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0692', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: UserObj = new UserObj("admin", null);

      let hasRole = user.role === "admin" || user.role === "moderator";
      let hasDept = user.department || "unknown";

      expect(hasRole).assertEqual(true);
      expect(hasDept).assertEqual("unknown");
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3800
     * @tc.name    testConditionalExpression0693
     * @tc.desc      Input validation chain scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0693', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: string | null = "hello";
      let input2: string | null = "";
      let input3: string | null = null;

      let result1: string = input1 ? (input1.trim() || "invalid") : "invalid";
      let result2: string = input2 ? (input2.trim() || "invalid") : "invalid";
      let result3: string = input3 ? (input3.trim() || "invalid") : "invalid";

      expect(result1).assertEqual("hello");
      expect(result2).assertEqual("invalid");
      expect(result3).assertEqual("invalid");
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_SEVENTEEN_EXPRESSIONS_3900
     * @tc.name    testConditionalExpression0694
     * @tc.desc      Config with default values using nullish coalescing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0694', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config: TimeoutObj = new TimeoutObj(null, 0);

      let timeout = config.timeout ?? 5000;
      let retries = config.retries ?? 3;

      expect(timeout).assertEqual(5000);
      expect(retries).assertEqual(0);  // 0 is not nullish
    });
  });
}
