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

interface NumberInvalidObject {
  marker: string;
}

const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

type NumberInvalidValue = string | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;

const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES,
  '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true,
  BigInt('16045690984833335006'), BigInt('9007199254740991'),
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeNumberTest() {
  describe('DequeNumberTest', () => {
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
     * @tc.name   testDequeNumberTest0100
     * @tc.number SUB_ARKTS_DEQUE_NUMBER_0100
     * @tc.desc   Test Deque constructor and insertEnd with valid numbers, edge-case numeric values, and mixed invalid values, verifying length and element access.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<number> = new Deque<number>();
      expect(empty.length).assertEqual(0);

      const list: Deque<number> = new Deque<number>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(1);
      expect(list.getFirst()).assertEqual(1);
      expect(list.getLast()).assertEqual(-100.5);

      const mixed: Deque<NumberAllValue> = new Deque<NumberAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(1);
      expect(mixed[1]).assertEqual(100.5);
      expect(mixed[ALL_VALUES.length - 1]).assertEqual(BigInt('9007199254740991'));
    });

    /**
     * @tc.name   testDequeNumberTest0200
     * @tc.number SUB_ARKTS_DEQUE_NUMBER_0200
     * @tc.desc   Test insertFront/insertEnd ordering, getFirst/getLast, has() lookup, and single-element and NaN deque behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<number> = new Deque<number>();
      list.insertEnd(2);
      list.insertEnd(4);
      list.insertFront(1);
      list.insertEnd(5);
      list.insertFront(0);

      expect(list.length).assertEqual(5);
      expect(list[0]).assertEqual(0);
      expect(list.getFirst()).assertEqual(0);
      expect(list.getLast()).assertEqual(5);
      expect(list[4]).assertEqual(5);
      expect(list.has(2)).assertTrue();
      expect(list.has(999)).assertFalse();
      expect(list.has(5)).assertTrue();

      const nanDeque: Deque<number> = new Deque<number>();
      nanDeque.insertFront(NaN);
      expect(nanDeque.length).assertEqual(1);
      expect(nanDeque.has(NaN)).assertTrue();
      expect(Number.isNaN(nanDeque.getFirst() as number)).assertTrue();

      const single: Deque<number> = new Deque<number>();
      single.insertFront(7);
      expect(single.getFirst()).assertEqual(7);
      expect(single.getLast()).assertEqual(7);
    });

    /**
     * @tc.name   testDequeNumberTest0300
     * @tc.number SUB_ARKTS_DEQUE_NUMBER_0300
     * @tc.desc   Test popFirst/popLast removal from both ends including single-element deques, verifying returned values and length updates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<number> = new Deque<number>();
      list.insertEnd(1);
      list.insertEnd(2);
      list.insertEnd(3);
      list.insertEnd(4);
      list.insertEnd(5);

      const first: number = list.popFirst();
      expect(first).assertEqual(1);
      expect(list.length).assertEqual(4);
      expect(list.getFirst()).assertEqual(2);

      const last: number = list.popLast();
      expect(last).assertEqual(5);
      expect(list.length).assertEqual(3);
      expect(list.getLast()).assertEqual(4);

      const single: Deque<number> = new Deque<number>();
      single.insertEnd(9);
      expect(single.popFirst()).assertEqual(9);
      expect(single.length).assertEqual(0);

      single.insertEnd(8);
      expect(single.popLast()).assertEqual(8);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeNumberTest0400
     * @tc.number SUB_ARKTS_DEQUE_NUMBER_0400
     * @tc.desc   Test forEach callback with value and index, Symbol.iterator traversal, and for-of iteration over a number deque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<number> = new Deque<number>();
      list.insertEnd(1);
      list.insertEnd(2);
      list.insertEnd(3);
      list.insertEnd(4);

      const visited: Array<number> = [];
      list.forEach((value: number) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(1);
      expect(visited[3]).assertEqual(4);

      let indexSum: number = 0;
      list.forEach((value: number, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(6);

      const iterValues: Array<number> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(4);
      expect(iterValues[0]).assertEqual(1);
      expect(iterValues[3]).assertEqual(4);

      let forOfSum: number = 0;
      for (const value of list) {
        forOfSum += value;
      }
      expect(forOfSum).assertEqual(10);
    });

    /**
     * @tc.name   testDequeNumberTest0500
     * @tc.number SUB_ARKTS_DEQUE_NUMBER_0500
     * @tc.desc   Test indexed element access including boundary, out-of-range, and undefined results, plus a 100-element deque's endpoints.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<number> = new Deque<number>();
      list.insertEnd(10);
      list.insertEnd(20);
      list.insertEnd(30);
      list.insertFront(5);

      expect(list[0]).assertEqual(5);
      expect(list[1]).assertEqual(10);
      expect(list[2]).assertEqual(20);
      expect(list[3]).assertEqual(30);
      expect(list[list.length - 1]).assertEqual(30);
      let oobThrew: boolean = false;
      try {
        const oob: number | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: number | undefined = list[100];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();

      const big: Deque<number> = new Deque<number>();
      for (let i = 0; i < 100; i++) {
        big.insertEnd(i);
      }
      expect(big.length).assertEqual(100);
      expect(big[0]).assertEqual(0);
      expect(big[99]).assertEqual(99);
      expect(big.getFirst()).assertEqual(0);
      expect(big.getLast()).assertEqual(99);
    });

    /**
     * @tc.name   testDequeNumberTest0600
     * @tc.number SUB_ARKTS_DEQUE_NUMBER_0600
     * @tc.desc   Test out-of-bounds index access, popFirst throwing on an empty deque, and empty deque iteration/forEach behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<number> = new Deque<number>();
      list.insertEnd(1);
      list.insertEnd(2);
      let t2: boolean = false;
      try {
        const v2: number | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: number | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<number> = new Deque<number>();
      const popped: number | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: number | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: number) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
