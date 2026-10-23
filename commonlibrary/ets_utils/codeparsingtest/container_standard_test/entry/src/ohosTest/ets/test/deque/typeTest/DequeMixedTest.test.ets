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

interface MixedInvalidObject {
  marker: string;
}

const MIXED_INVALID_OBJECT: MixedInvalidObject = { marker: 'invalid' };

class MixedClass {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

type MixedItem = number | string | boolean | bigint | null | undefined | MixedClass | MixedInvalidObject | Array<number>;

const MIXED_VALUES: Array<MixedItem> = [
  1, 'text', true, 100n, null, undefined, 'sym', new MixedClass(7), MIXED_INVALID_OBJECT, [1, 2],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeMixedTest() {
  describe('DequeMixedTest', () => {
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
     * @tc.name   testDequeMixedTest0100
     * @tc.number SUB_ARKTS_DEQUE_MIXED_0100
     * @tc.desc   Verify Deque mixed-type construction, insertEnd of heterogeneous values and per-index value checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMixedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<MixedItem> = new Deque<MixedItem>();
      expect(empty.length).assertEqual(0);

      const list: Deque<MixedItem> = new Deque<MixedItem>();
      for (let i = 0; i < MIXED_VALUES.length; i++) {
        list.insertEnd(MIXED_VALUES[i]);
      }
      expect(list.length).assertEqual(MIXED_VALUES.length);
      expect(list[0]).assertEqual(1);
      expect(list[1]).assertEqual('text');
      expect(list[2]).assertTrue();
      expect(list[3]).assertEqual(100n);
      expect(list[4]).assertNull();
      expect(list[5]).assertUndefined();
      expect(list[6]).assertEqual('sym');
      expect(list[9]).assertEqual(MIXED_VALUES[9]);
      expect(list.getFirst()).assertEqual(1);
      expect(list.getLast()).assertEqual(MIXED_VALUES[9]);
    });

    /**
     * @tc.name   testDequeMixedTest0200
     * @tc.number SUB_ARKTS_DEQUE_MIXED_0200
     * @tc.desc   Verify Deque mixed-type insertEnd/insertFront ordering and has lookup by reference for objects and by value for primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMixedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<MixedItem> = new Deque<MixedItem>();
      const obj: MixedClass = new MixedClass(1);
      list.insertEnd(obj);
      list.insertEnd('dup');
      list.insertFront(null);
      list.insertEnd(obj);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertNull();
      expect(list.getFirst()).assertNull();
      expect(list.getLast()).assertEqual(obj);
      expect(list.has(obj)).assertTrue();
      expect(list.has(new MixedClass(1))).assertFalse();
      expect(list.has('dup')).assertTrue();
      expect(list.has('missing')).assertFalse();

      list.insertFront(undefined);
      expect(list[0]).assertUndefined();
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testDequeMixedTest0300
     * @tc.number SUB_ARKTS_DEQUE_MIXED_0300
     * @tc.desc   Verify Deque mixed-type popFirst/popLast behavior including single-element deque
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMixedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<MixedItem> = new Deque<MixedItem>();
      list.insertEnd(1);
      list.insertEnd('b');
      list.insertEnd(true);
      list.insertEnd(null);

      const first: MixedItem = list.popFirst();
      expect(first).assertEqual(1);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual('b');

      const last: MixedItem = list.popLast();
      expect(last).assertNull();
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertTrue();

      const single: Deque<MixedItem> = new Deque<MixedItem>();
      single.insertEnd(undefined);
      expect(single.popFirst()).assertUndefined();
      expect(single.length).assertEqual(0);

      single.insertEnd(100n);
      expect(single.popLast()).assertEqual(100n);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeMixedTest0400
     * @tc.number SUB_ARKTS_DEQUE_MIXED_0400
     * @tc.desc   Verify Deque mixed-type forEach filtering by typeof, forEach index sum, iterator traversal and for-of counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMixedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<MixedItem> = new Deque<MixedItem>();
      list.insertEnd(1);
      list.insertEnd(2);
      list.insertEnd('skip');

      const numbers: Array<number> = [];
      list.forEach((value: MixedItem) => {
        if (typeof value === 'number') {
          numbers.push(value);
        }
      });
      expect(numbers.length).assertEqual(2);
      expect(numbers[0]).assertEqual(1);
      expect(numbers[1]).assertEqual(2);

      let indexSum: number = 0;
      list.forEach((value: MixedItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<MixedItem> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<MixedItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertEqual('skip');

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === 'skip') {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeMixedTest0500
     * @tc.number SUB_ARKTS_DEQUE_MIXED_0500
     * @tc.desc   Verify Deque mixed-type index access within bounds, undefined beyond length, and object element property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMixedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<MixedItem> = new Deque<MixedItem>();
      list.insertEnd(30);
      list.insertEnd('10');
      list.insertEnd(20);
      list.insertFront(true);

      expect(list[0]).assertTrue();
      expect(list[1]).assertEqual(30);
      expect(list[2]).assertEqual('10');
      expect(list[3]).assertEqual(20);
      expect(list[list.length - 1]).assertEqual(20);
      let oobThrew: boolean = false;
      try {
        const oob: MixedItem | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: MixedItem | undefined = list[31];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();

      const objDeque: Deque<MixedItem> = new Deque<MixedItem>();
      const obj: MixedClass = new MixedClass(7);
      objDeque.insertEnd(obj);
      expect(objDeque[0]).assertEqual(obj);
      expect(objDeque[0].value).assertEqual(7);
    });

    /**
     * @tc.name   testDequeMixedTest0600
     * @tc.number SUB_ARKTS_DEQUE_MIXED_0600
     * @tc.desc   Verify Deque mixed-type out-of-range index access, popFirst on empty deque throwing, and empty iteration behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMixedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<MixedItem> = new Deque<MixedItem>();
      list.insertEnd(1);
      let t1: boolean = false;
      try {
        const v1: MixedItem | undefined = list[1];
      } catch (e) {
        t1 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t1).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: MixedItem | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: Deque<MixedItem> = new Deque<MixedItem>();
      const popped: MixedItem | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: MixedItem | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: MixedItem) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
