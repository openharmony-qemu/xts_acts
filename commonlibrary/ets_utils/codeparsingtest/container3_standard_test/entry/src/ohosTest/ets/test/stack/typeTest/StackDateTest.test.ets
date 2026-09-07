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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Stack } from '@kit.ArkTS';

interface DateInvalidObject {
  marker: string;
}

const DATE_INVALID_OBJECT: DateInvalidObject = { marker: 'invalid' };

const DATE_A: Date = new Date('2026-03-05');
const DATE_B: Date = new Date(0);
const DATE_C: Date = new Date(86400000);
const DATE_D: Date = new Date(-8640000000000000);
const DATE_E: Date = new Date(8640000000000000);
const DATE_F: Date = new Date(NaN);

const VALID_VALUES: Array<Date> = [DATE_A, DATE_B, DATE_C, DATE_D, DATE_E, DATE_F, DATE_A];

type DateInvalidValue = string | number | null | undefined | DateInvalidObject | Array<number>;
type DateAllValue = Date | DateInvalidValue;

const ALL_VALUES: Array<DateAllValue> = [
  ...VALID_VALUES,
  '2026-03-05', 0, null, undefined, DATE_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function stackDateTest() {
  describe('StackDateTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name   testStackDateTest0100
     * @tc.number SUB_ARKTS_STACK_DATE_0100
     * @tc.desc   Verify Stack date push returns the pushed Date and updates length and peek for valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackDateTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Stack<Date> = new Stack<Date>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const stack: Stack<Date> = new Stack<Date>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(stack.push(VALID_VALUES[i])).assertEqual(VALID_VALUES[i]);
      }
      expect(stack.length).assertEqual(VALID_VALUES.length);
      expect(stack.peek()).assertEqual(DATE_A);

      const mixed: Stack<DateAllValue> = new Stack<DateAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.push(ALL_VALUES[i])).assertEqual(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.peek() === ALL_VALUES[ALL_VALUES.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testStackDateTest0200
     * @tc.number SUB_ARKTS_STACK_DATE_0200
     * @tc.desc   Verify Stack date peek does not change length and push updates the top element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackDateTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Date> = new Stack<Date>();
      stack.push(DATE_A);
      stack.push(DATE_B);
      stack.push(DATE_A);

      expect(stack.peek()).assertEqual(DATE_A);
      expect(stack.length).assertEqual(3);
      expect(stack.peek()).assertEqual(DATE_A);
      expect(stack.length).assertEqual(3);

      const pushed: Date = stack.push(DATE_C);
      expect(pushed).assertEqual(DATE_C);
      expect(stack.length).assertEqual(4);
      expect(stack.peek()).assertEqual(DATE_C);
    });

    /**
     * @tc.name   testStackDateTest0300
     * @tc.number SUB_ARKTS_STACK_DATE_0300
     * @tc.desc   Verify Stack date pop removes Date elements in LIFO order until empty and can push again after emptying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackDateTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Date> = new Stack<Date>();
      stack.push(DATE_A);
      stack.push(DATE_B);
      stack.push(DATE_C);
      stack.push(DATE_D);

      expect(stack.pop()).assertEqual(DATE_D);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(DATE_C);
      expect(stack.pop()).assertEqual(DATE_B);
      expect(stack.pop()).assertEqual(DATE_A);
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();

      stack.push(DATE_E);
      expect(stack.peek()).assertEqual(DATE_E);
      expect(stack.length).assertEqual(1);
    });

    /**
     * @tc.name   testStackDateTest0400
     * @tc.number SUB_ARKTS_STACK_DATE_0400
     * @tc.desc   Verify Stack date locate returns index by reference and does not match equal-content or absent Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackDateTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Date> = new Stack<Date>();
      stack.push(DATE_A);
      stack.push(DATE_B);
      stack.push(DATE_A);

      expect(stack.locate(DATE_A)).assertEqual(0);
      expect(stack.locate(DATE_B)).assertEqual(1);
      expect(stack.locate(DATE_C)).assertEqual(-1);
      expect(stack.locate(new Date('2026-03-05'))).assertEqual(-1);
    });

    /**
     * @tc.name   testStackDateTest0500
     * @tc.number SUB_ARKTS_STACK_DATE_0500
     * @tc.desc   Verify Stack date forEach traverses Date values with index and the iterator visits elements in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackDateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Date> = new Stack<Date>();
      stack.push(DATE_B);
      stack.push(DATE_A);
      stack.push(DATE_C);

      const times: Array<number> = [];
      stack.forEach((value: Date) => {
        times.push(value.getTime());
      });
      expect(times.length).assertEqual(3);
      expect(times[0]).assertEqual(0);
      expect(times[2]).assertEqual(86400000);

      let indexSum: number = 0;
      stack.forEach((value: Date, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Date> = [];
      for (const value of stack) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(DATE_A);
    });

    /**
     * @tc.name   testStackDateTest0600
     * @tc.number SUB_ARKTS_STACK_DATE_0600
     * @tc.desc   Verify Stack date empty-state behaviors and that an invalid Date with NaN time can be pushed and popped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStackDateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stack: Stack<Date> = new Stack<Date>();
      expect(stack.isEmpty()).assertTrue();
      expect(stack.pop()).assertUndefined();
      expect(stack.peek()).assertUndefined();
      expect(stack.length).assertEqual(0);
      expect(stack.isEmpty()).assertTrue();
      expect(stack.locate(DATE_A)).assertEqual(-1);

      stack.push(DATE_F);
      expect(stack.isEmpty()).assertFalse();
      expect(stack.peek()).assertEqual(DATE_F);
      expect(Number.isNaN(stack.peek().getTime())).assertTrue();
      expect(stack.pop()).assertEqual(DATE_F);
      expect(stack.isEmpty()).assertTrue();
    });
  });
}
