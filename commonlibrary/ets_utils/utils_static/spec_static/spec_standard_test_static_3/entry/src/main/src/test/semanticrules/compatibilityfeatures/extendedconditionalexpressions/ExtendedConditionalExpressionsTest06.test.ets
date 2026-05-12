/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

// File-level enum declarations for tests
enum Color { Red, Green, Blue }
enum TestSize { S, M, L }
enum Status { None, Active, Inactive }
enum Priority { Low = 0, Medium = 1, High = 2 }

export default function ExtendedConditionalExpressionsTest06():void {
  describe('ExtendedConditionalExpressionsTest06', () => {
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


    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24600
     * @tc.name      testOpsF10246
     * @tc.desc      Extended semantics with Long.MIN_VALUE (truthy) and various falsy/truthy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsF10246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Long.MIN_VALUE;  // truthy

      // !a should be false
      expect(!a).assertEqual(false);

      // a && 0 (falsy)
      expect((a && 0)).assertEqual(0);

      // a || 0 should return a
      expect((a || 0)).assertEqual(Long.MIN_VALUE);

      // a && Long.MAX_VALUE (truthy)
      expect((a && Long.MAX_VALUE)).assertEqual(Long.MAX_VALUE);

      // a && new Long() (falsy)
      expect((a && new Long()) == 0).assertTrue();

      // a || new Long() should return a
      expect((a || new Long())).assertEqual(Long.MIN_VALUE);

      // a && Number.POSITIVE_INFINITY (truthy)
      expect((a && Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);

      // a && Number.NaN (falsy)
      expect(Number.isNaN((a && Number.NaN) as number)).assertTrue();

      // a && '' (falsy)
      expect((a && '')).assertEqual('');

      // a && c'\u0000' (falsy)
      expect((a && c'\u0000') == c'\u0000').assertTrue();

      // a && null (falsy)
      expect((a && null) == null).assertTrue();

      // a && undefined (falsy)
      expect((a && undefined) == undefined).assertTrue();

      // a && 0n (falsy)
      expect((a && 0n)).assertEqual(0n);

      // a && Color.Red (falsy)
      expect((a && Color.Red) == Color.Red).assertTrue();

      // a && TestSize.L (truthy)
      expect((a && TestSize.L)).assertEqual(TestSize.L);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24700
     * @tc.name      testOpsF10247
     * @tc.desc      Extended semantics with Long.MAX_VALUE (truthy) and various falsy/truthy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsF10247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Long.MAX_VALUE;  // truthy

      // !a should be false
      expect(!a).assertEqual(false);

      // a && 0 (falsy)
      expect((a && 0)).assertEqual(0);

      // a || 0 should return a
      expect((a || 0)).assertEqual(Long.MAX_VALUE);

      // a && Long.MIN_VALUE (truthy)
      expect((a && Long.MIN_VALUE)).assertEqual(Long.MIN_VALUE);

      // a && new Long() (falsy)
      expect((a && new Long()) == 0).assertTrue();

      // a && Number.NEGATIVE_INFINITY (truthy)
      expect((a && Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);

      // a && Number.NaN (falsy)
      expect(Number.isNaN((a && Number.NaN) as number)).assertTrue();

      // a && new String("") (truthy - object is truthy)
      let emptyStrObj = new String("");
      expect((a && emptyStrObj) == emptyStrObj).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24800
     * @tc.name      testOpsT10248
     * @tc.desc      Extended semantics with 0 (falsy) and various falsy/truthy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsT10248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0;  // falsy

      // !a should be true
      expect(!a).assertEqual(true);

      // a && 1 (truthy) should return a (falsy short-circuit)
      expect((a && 1)).assertEqual(0);

      // a || 1 should return 1
      expect((a || 1)).assertEqual(1);

    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_24900
     * @tc.name      testOps2F10249
     * @tc.desc      Extended semantics truth tables with Long.MIN_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOps2F10249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Long.MIN_VALUE;  // truthy

      // !a == false
      expect(!a == false).assertTrue();

      // (a && 0) == 0
      expect((a && 0) == 0).assertTrue();

      // (a || 0) == a
      expect((a || 0) == a).assertTrue();

      // (a && Long.MAX_VALUE) == Long.MAX_VALUE
      expect((a && Long.MAX_VALUE) == Long.MAX_VALUE).assertTrue();

      // (a || Long.MAX_VALUE) == a
      expect((a || Long.MAX_VALUE) == a).assertTrue();

      // (a && new Long()) == 0
      expect((a && new Long()) == 0).assertTrue();

      // (a && Number.NaN) is NaN
      expect(Number.isNaN((a && Number.NaN) as number)).assertTrue();

      // (a && '') == ''
      expect((a && '') == '').assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25000
     * @tc.name      testOps2T10250
     * @tc.desc      Extended semantics truth tables with 0 (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOps2T10250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0;  // falsy

      // !a == true
      expect(!a == true).assertTrue();

      // (a && 1) == a
      expect((a && 1) == a).assertTrue();

      // (a || 1) == 1
      expect((a || 1) == 1).assertTrue();

      // (a && Long.MAX_VALUE) == a
      expect((a && Long.MAX_VALUE) == a).assertTrue();

      // (a || Long.MAX_VALUE) == Long.MAX_VALUE
      expect((a || Long.MAX_VALUE) == Long.MAX_VALUE).assertTrue();

      // (a && new Long()) == a
      expect((a && new Long()) == a).assertTrue();

      // (a || new Long()) == new Long()
      expect((a || new Long()) == 0).assertTrue();

      // (a && Number.POSITIVE_INFINITY) == a
      expect((a && Number.POSITIVE_INFINITY) == a).assertTrue();

      // (a || Number.POSITIVE_INFINITY) == Number.POSITIVE_INFINITY
      expect((a || Number.POSITIVE_INFINITY) == Number.POSITIVE_INFINITY).assertTrue();

      // (a && Number.NaN) == a
      expect((a && Number.NaN) == a).assertTrue();

      // (a || Number.NaN) is NaN
      expect(Number.isNaN((a || Number.NaN) as number)).assertTrue();

      // (a && '') == a
      expect((a && '') == a).assertTrue();

      // (a || '') == ''
      expect((a || '') == '').assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25100
     * @tc.name      testOpsAndOrTypePreservation
     * @tc.desc      Test && and || operator type preservation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsAndOrTypePreservation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Number type
      let numTruthy: number = 1;
      let numFalsy: number = 0;
      expect((numTruthy && numFalsy)).assertEqual(0);
      expect((numTruthy || numFalsy)).assertEqual(1);

      // String type
      let strTruthy: string = 'hello';
      let strFalsy: string = '';
      expect((strTruthy && strFalsy)).assertEqual('');
      expect((strTruthy || strFalsy)).assertEqual('hello');

      // Boolean type
      let boolTrue: boolean = true;
      let boolFalse: boolean = false;
      expect((boolTrue && boolFalse)).assertEqual(false);
      expect((boolTrue || boolFalse)).assertEqual(true);

      // Object type
      let objTruthy: Object = new Object();
      let objFalsy: Object|null = null;
      expect((objTruthy && objFalsy) == null).assertTrue();
      expect((objTruthy || objFalsy) == objTruthy).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25200
     * @tc.name      testOpsShortCircuit
     * @tc.desc      Test short-circuit evaluation in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsShortCircuit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: number = 0;

      // (falsy && increment) should not increment
      let result1 = (0 && (counter = 1));
      expect(result1).assertEqual(0);
      expect(counter).assertEqual(0);

      // (truthy || increment) should not increment
      counter = 0;
      let result2 = (1 || (counter = 1));
      expect(result2).assertEqual(1);
      expect(counter).assertEqual(0);

      // (truthy && increment) should increment
      counter = 0;
      let result3 = (1 && (counter = 1));
      expect(result3).assertEqual(1);
      expect(counter).assertEqual(1);

      // (falsy || increment) should increment
      counter = 0;
      let result4 = (0 || (counter = 1));
      expect(result4).assertEqual(1);
      expect(counter).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25300
     * @tc.name      testOpsComplexExpressions
     * @tc.desc      Test complex expressions with && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsComplexExpressions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ((a && b) || c)
      let a: number = 1;
      let b: number = 0;
      let c: number = 2;
      // (1 && 0) || 2 = 0 || 2 = 2
      expect(((a && b) || c)).assertEqual(2);

      // ((a || b) && c)
      // (1 || 0) && 2 = 1 && 2 = 2
      expect(((a || b) && c)).assertEqual(2);

      // (a && (b || c))
      // 1 && (0 || 2) = 1 && 2 = 2
      expect((a && (b || c))).assertEqual(2);

      // ((a && b) || (c && d))
      let d: number = 3;
      // (1 && 0) || (2 && 3) = 0 || 3 = 3
      expect(((a && b) || (c && d))).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25400
     * @tc.name      testOpsNegationTruthiness
     * @tc.desc      Test negation and truthiness
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNegationTruthiness', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Truthy values
      expect(!!1).assertEqual(true);
      expect(!!-1).assertEqual(true);
      expect(!!'hello').assertEqual(true);
      expect(!!new Object()).assertEqual(true);
      expect(!!Long.MAX_VALUE).assertEqual(true);

      // Falsy values
      expect(!!0).assertEqual(false);
      expect(!!null).assertEqual(false);  // null is falsy
      expect(!!undefined).assertEqual(false);  // undefined is falsy
      expect(!!'').assertEqual(false);
      expect(!!Number.NaN).assertEqual(false);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25500
     * @tc.name      testOpsNullishBehavior
     * @tc.desc      Test null and undefined behavior in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNullishBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthy: Object = new Object();

      // null && truthy = null
      expect((null && truthy) == null).assertTrue();

      // null || truthy = truthy
      expect((null || truthy) == truthy).assertTrue();

      // truthy && null = null
      expect((truthy && null) == null).assertTrue();

      // truthy || null = truthy
      expect((truthy || null) == truthy).assertTrue();

      // undefined && truthy = undefined
      expect((undefined && truthy) == undefined).assertTrue();

      // undefined || truthy = truthy
      expect((undefined || truthy) == truthy).assertTrue();

      // truthy && undefined = undefined
      expect((truthy && undefined) == undefined).assertTrue();

      // truthy || undefined = truthy
      expect((truthy || undefined) == truthy).assertTrue();

      // null || undefined = undefined
      expect((null || undefined) == undefined).assertTrue();

      // null && undefined = null
      expect((null && undefined) == null).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25600
     * @tc.name      testOpsNumberSpecialValues
     * @tc.desc      Test special number values in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNumberSpecialValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthy: number = 1;

      // Infinity values are truthy
      expect((Number.POSITIVE_INFINITY && truthy)).assertEqual(1);
      expect((truthy && Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
      expect((Number.NEGATIVE_INFINITY || truthy)).assertEqual(Number.NEGATIVE_INFINITY);

      // NaN is falsy - short-circuit returns NaN
      let nanResult = (Number.NaN && truthy);
      expect(Number.isNaN(nanResult)).assertTrue();
      expect((truthy || Number.NaN)).assertEqual(1);

      // -0 is falsy
      expect((-0.0 && truthy)).assertEqual(-0.0);
      expect((truthy || -0.0)).assertEqual(1);

      // MIN_VALUE is truthy (it's a positive number close to zero)
      expect((Number.MIN_VALUE && truthy)).assertEqual(1);
      expect((truthy || Number.MIN_VALUE)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25700
     * @tc.name      testOpsBigIntBehavior
     * @tc.desc      Test bigint values in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsBigIntBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthyBigInt: bigint = 1n;
      let falsyBigInt: bigint = 0n;

      // bigint && truthy = falsy value
      expect((falsyBigInt && truthyBigInt)).assertEqual(0n);

      // bigint || truthy = truthy value
      expect((truthyBigInt || falsyBigInt)).assertEqual(1n);

      // 1 && 1n = 1n
      expect((1 && 1n)).assertEqual(1n);

      // 1n || 0 = 1n
      expect((1n || 0)).assertEqual(1n);

      // 0 && 1n = 0
      expect((0 && 1n)).assertEqual(0);

      // 0n && 1 = 0n
      expect((0n && 1)).assertEqual(0n);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25800
     * @tc.name      testOpsCharBehavior
     * @tc.desc      Test char values in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsCharBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falsyChar: char = c'\u0000';
      let truthyChar: char = c'A';

      // c'\u0000' && 'x' = c'\u0000'
      expect((falsyChar && 'x') == c'\u0000').assertTrue();

      // c'\u0000' || 'x' = 'x'
      expect((falsyChar || 'x')).assertEqual('x');

      // 'x' && c'\u0000' = c'\u0000'
      expect(('x' && falsyChar) == c'\u0000').assertTrue();

      // 'x' || c'\u0000' = 'x'
      expect(('x' || falsyChar)).assertEqual('x');

      // c'A' && c'B' = c'B'
      expect((truthyChar && c'B') == c'B').assertTrue();

      // c'A' || c'B' = c'A'
      expect((truthyChar || c'B') == c'A').assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_25900
     * @tc.name      testOpsEnumBehavior
     * @tc.desc      Test enum values in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEnumBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Color.Red = 0 (falsy value but truthy in conditional)
      // 0 && 'x' returns 0 (falsy short-circuit)
      expect((Color.Red && 'x')).assertEqual(0);
      // 0 || 'x' returns 'x'
      expect((Color.Red || 'x')).assertEqual('x');

      // Color.Green = 1 (truthy)
      expect((Color.Green && 'x')).assertEqual('x');
      expect((Color.Green || 'x')).assertEqual(Color.Green);

      // TestSize.L = 2 (truthy)
      expect((TestSize.L && 1)).assertEqual(1);
      expect((TestSize.L || 0)).assertEqual(TestSize.L);

      // Priority.Low = 0 (falsy value but truthy in conditional)
      // 0 && 1 returns 0 (falsy short-circuit)
      expect((Priority.Low && 1)).assertEqual(0);
      // 0 || 1 returns 1
      expect((Priority.Low || 1)).assertEqual(1);

      // Priority.High = 2 (truthy)
      expect((Priority.High && 0)).assertEqual(0);
      expect((Priority.High || 0)).assertEqual(Priority.High);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_26000
     * @tc.name      testOpsArrayBehavior
     * @tc.desc      Test array behavior in && and ||
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsArrayBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArr: number[] = [];
      let nonEmptyArr: number[] = [1];
      let falsy: number = 0;

      // Arrays are always truthy
      expect(!!emptyArr).assertEqual(true);
      expect(!!nonEmptyArr).assertEqual(true);

      // emptyArr && falsy = falsy
      expect((emptyArr && falsy)).assertEqual(0);

      // emptyArr || falsy = emptyArr (short-circuit)
      expect((emptyArr || falsy) == emptyArr).assertTrue();

      // falsy && nonEmptyArr = falsy
      expect((falsy && nonEmptyArr)).assertEqual(0);

      // falsy || nonEmptyArr = nonEmptyArr
      expect((falsy || nonEmptyArr) == nonEmptyArr).assertTrue();

      // nonEmptyArr && emptyArr = emptyArr
      expect((nonEmptyArr && emptyArr) == emptyArr).assertTrue();

      // nonEmptyArr || emptyArr = nonEmptyArr
      expect((nonEmptyArr || emptyArr) == nonEmptyArr).assertTrue();
    });

  })
}
