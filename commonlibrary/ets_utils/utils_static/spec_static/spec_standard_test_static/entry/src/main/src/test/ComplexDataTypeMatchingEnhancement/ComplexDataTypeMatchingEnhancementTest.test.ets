'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "@ohos/hypium-binary/src/main/indexStatic";

type foo1_o = (x?: int) => int

function foo(n: FixedArray<number> | FixedArray<string>) { return n }

type Matrix = number[][];

type NullableNumber = number | null;

type MyTuple = [string, number];

type T = () => [int, string];

function func() { return [1, "a"] }

type int_nullish = int | null | undefined;

function foo_7(): int_nullish { return 1; }

export default function ComplexDataTypeMatchingEnhancement(): void {
  describe('ComplexDataTypeMatchingEnhancement', () => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0100
     * @tc.name ComplexDataTypeMatchingEnhancementTest001
     * @tc.desc Bigint comparison with Number.MIN_VALUE, Number.MAX_VALUE, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bi1 = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368n;
      let bi3 = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858367n;
      expect(0n < Number.MIN_VALUE).assertTrue();
      expect(0n > -Number.MIN_VALUE).assertTrue();
      expect(0n < 0.000000000001).assertTrue();
      expect(bi1 == Number.MAX_VALUE).assertFalse();
      expect(bi3 < Number.MAX_VALUE).assertFalse();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0200
     * @tc.name ComplexDataTypeMatchingEnhancementTest002
     * @tc.desc Function type with optional parameter assigned to Function and called via unsafeCall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func1: foo1_o = (x?: int) => {
        return 1;
      }
      const f: Function = func1
      let res = f.unsafeCall();
      expect(res as int).assertEqual(1);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0300
     * @tc.name ComplexDataTypeMatchingEnhancementTest003
     * @tc.desc Union type matching for FixedArray with different element types throwing ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const f: Function = foo
        let res = f.unsafeCall(['abc']);
        let bol = res instanceof (FixedArray<number> | FixedArray<string>)
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0400
     * @tc.name ComplexDataTypeMatchingEnhancementTest004
     * @tc.desc instanceof type matching for type aliases including arrays, nullable types, and tuples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: Matrix = [[1, 2, 3], [1, 2, 3]];
      expect(a instanceof Matrix).assertTrue();

      let c: NullableNumber = null;
      expect(c instanceof NullableNumber).assertTrue();

      let b: MyTuple = ["Hello", 42];
      expect(b instanceof MyTuple).assertTrue();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0500
     * @tc.name ComplexDataTypeMatchingEnhancementTest005
     * @tc.desc Nested empty array literal length verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let e: [][] = [];
      let f: [][] = [[]];
      let g: [][] = [[], []];
      expect(e.length).assertEqual(0);
      expect(f.length).assertEqual(1);
      expect(g.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0600
     * @tc.name ComplexDataTypeMatchingEnhancementTest006
     * @tc.desc instanceof type matching for function type alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let v1: boolean = func instanceof T;
      expect(v1).assertTrue();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_COMPLEXDATATYPEMATCHINGENHANCEMENT_0700
     * @tc.name ComplexDataTypeMatchingEnhancementTest007
     * @tc.desc Nullish coalescing operator with function type and nullable return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ComplexDataTypeMatchingEnhancementTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lhs: int = 1;
      let rhs: () => int_nullish = foo_7
      let x = lhs ?? rhs
      let y: Int | ((() => Int | null | undefined)) = x;
      expect(y).assertEqual(1);
    })
  })
}
