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
import { Deque } from '@kit.ArkTS';

interface FunctionInvalidObject {
  marker: string;
}

const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };

type DequeFunctionItem = (value: number) => number;

const FUNCTION_A: DequeFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: DequeFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: DequeFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: DequeFunctionItem = (value: number): number => value * value;
const FUNCTION_E: DequeFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: DequeFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<DequeFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = DequeFunctionItem | FunctionInvalidValue;

const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeFunctionTest() {
  describe('DequeFunctionTest', () => {
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
     * @tc.name   testDequeFunctionTest0100
     * @tc.number SUB_ARKTS_DEQUE_FUNCTION_0100
     * @tc.desc   Verify Deque function insertEnd of valid and mixed values, length, element access, stored function invocation and getFirst/getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      expect(empty.length).assertEqual(0);

      const list: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(FUNCTION_A);
      expect(list[6]).assertEqual(FUNCTION_A);
      expect(list[0](1)).assertEqual(2);
      expect(list[3](3)).assertEqual(9);
      expect(list.getFirst()).assertEqual(FUNCTION_A);
      expect(list.getLast()).assertEqual(FUNCTION_A);

      const mixed: Deque<FunctionAllValue> = new Deque<FunctionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(FUNCTION_A);
    });

    /**
     * @tc.name   testDequeFunctionTest0200
     * @tc.number SUB_ARKTS_DEQUE_FUNCTION_0200
     * @tc.desc   Verify Deque function insertFront/insertEnd ordering, getFirst/getLast and has reference lookup including a non-identical equivalent function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      list.insertEnd(FUNCTION_A);
      list.insertEnd(FUNCTION_B);
      list.insertFront(FUNCTION_C);
      list.insertEnd(FUNCTION_A);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(FUNCTION_C);
      expect(list.getFirst()).assertEqual(FUNCTION_C);
      expect(list.getLast()).assertEqual(FUNCTION_A);
      expect(list.has(FUNCTION_A)).assertTrue();
      expect(list.has(FUNCTION_D)).assertFalse();
      expect(list.has((value: number): number => value + 1)).assertFalse();

      const single: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      single.insertFront(FUNCTION_D);
      expect(single.getFirst()).assertEqual(FUNCTION_D);
      expect(single.getLast()).assertEqual(FUNCTION_D);
    });

    /**
     * @tc.name   testDequeFunctionTest0300
     * @tc.number SUB_ARKTS_DEQUE_FUNCTION_0300
     * @tc.desc   Verify Deque function popFirst and popLast return the correct function references and update length on multi and single element deques.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      list.insertEnd(FUNCTION_A);
      list.insertEnd(FUNCTION_B);
      list.insertEnd(FUNCTION_C);
      list.insertEnd(FUNCTION_D);

      const first: DequeFunctionItem = list.popFirst();
      expect(first).assertEqual(FUNCTION_A);
      expect(first(1)).assertEqual(2);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(FUNCTION_B);

      const last: DequeFunctionItem = list.popLast();
      expect(last).assertEqual(FUNCTION_D);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(FUNCTION_C);

      const single: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      single.insertEnd(FUNCTION_E);
      expect(single.popFirst()).assertEqual(FUNCTION_E);
      expect(single.length).assertEqual(0);

      single.insertEnd(FUNCTION_F);
      expect(single.popLast()).assertEqual(FUNCTION_F);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeFunctionTest0400
     * @tc.number SUB_ARKTS_DEQUE_FUNCTION_0400
     * @tc.desc   Verify Deque function forEach callback with index, Symbol.iterator traversal and for-of iteration visit all elements in order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      list.insertEnd(FUNCTION_A);
      list.insertEnd(FUNCTION_B);
      list.insertEnd(FUNCTION_C);

      const visited: Array<DequeFunctionItem> = [];
      list.forEach((value: DequeFunctionItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(FUNCTION_A);
      expect(visited[2]).assertEqual(FUNCTION_C);

      let resultSum: number = 0;
      list.forEach((value: DequeFunctionItem, index?: number) => {
        resultSum += value(index ?? 0);
      });
      expect(resultSum).assertEqual(9);

      const iterValues: Array<DequeFunctionItem> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<DequeFunctionItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(FUNCTION_B);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === FUNCTION_B) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeFunctionTest0500
     * @tc.number SUB_ARKTS_DEQUE_FUNCTION_0500
     * @tc.desc   Verify Deque function index element access including boundary, out-of-range undefined results and stored function invocation by index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      list.insertEnd(FUNCTION_A);
      list.insertEnd(FUNCTION_B);
      list.insertEnd(FUNCTION_C);
      list.insertFront(FUNCTION_D);

      expect(list[0]).assertEqual(FUNCTION_D);
      expect(list[1]).assertEqual(FUNCTION_A);
      expect(list[3]).assertEqual(FUNCTION_C);
      expect(list[list.length - 1]).assertEqual(FUNCTION_C);
      let oobThrew: boolean = false;
      try {
        const oob: DequeFunctionItem | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: DequeFunctionItem | undefined = list[60];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[0](2)).assertEqual(4);
    });

    /**
     * @tc.name   testDequeFunctionTest0600
     * @tc.number SUB_ARKTS_DEQUE_FUNCTION_0600
     * @tc.desc   Verify Deque function out-of-range access is undefined, popFirst on empty deque throws, and empty deque iteration/forEach visit nothing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      list.insertEnd(FUNCTION_A);
      list.insertEnd(FUNCTION_B);
      let t2: boolean = false;
      try {
        const v2: DequeFunctionItem | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: DequeFunctionItem | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<DequeFunctionItem> = new Deque<DequeFunctionItem>();
      const popped: DequeFunctionItem | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: DequeFunctionItem | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: DequeFunctionItem) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
