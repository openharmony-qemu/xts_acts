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

interface UnionInvalidObject {
  marker: string;
}

const UNION_INVALID_OBJECT: UnionInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [100, -99, 0x12, 1.2e3, 0, NaN, Number.MAX_SAFE_INTEGER, 100];

type UnionAllValue = number | boolean | UnionInvalidObject | null | undefined | bigint;

const ALL_VALUES: Array<UnionAllValue> = [
  ...VALID_VALUES,
  true, UNION_INVALID_OBJECT, null, undefined, 100n,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeUnionTest() {
  describe('DequeUnionTest', () => {
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
     * @tc.name   testDequeUnionTest0100
     * @tc.number SUB_ARKTS_DEQUE_UNION_0100
     * @tc.desc   Verify Deque union-type construction, insertEnd of mixed-type values, length, indexed access, getFirst and getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      expect(empty.length).assertEqual(0);

      const list: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        list.insertEnd(ALL_VALUES[i]);
      }
      expect(list.length).assertEqual(ALL_VALUES.length);
      expect(list[0]).assertEqual(100);
      expect(list[4]).assertEqual(0);
      expect(list[8]).assertTrue();
      expect(list[12]).assertEqual(100n);
      expect(list.getFirst()).assertEqual(100);
      expect(list.getLast()).assertEqual(100n);
    });

    /**
     * @tc.name   testDequeUnionTest0200
     * @tc.number SUB_ARKTS_DEQUE_UNION_0200
     * @tc.desc   Verify insertFront/insertEnd with mixed union types including null, boundary elements, has() lookups, and NaN handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      list.insertEnd(100);
      list.insertEnd(true);
      list.insertFront(null);
      list.insertEnd(100);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertNull();
      expect(list.getFirst()).assertNull();
      expect(list.getLast()).assertEqual(100);
      expect(list.has(100)).assertTrue();
      expect(list.has(true)).assertTrue();
      expect(list.has(-999)).assertFalse();
      expect(list.has(undefined)).assertFalse();

      const nanDeque: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      nanDeque.insertFront(NaN);
      expect(Number.isNaN(nanDeque.getFirst() as number)).assertTrue();
      expect(nanDeque.has(NaN)).assertTrue();
    });

    /**
     * @tc.name   testDequeUnionTest0300
     * @tc.number SUB_ARKTS_DEQUE_UNION_0300
     * @tc.desc   Verify popFirst and popLast return correct end elements with length updates, including null/undefined single-element deques.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      list.insertEnd(3);
      list.insertEnd(1);
      list.insertEnd(2);
      list.insertEnd(4);

      const first: UnionAllValue = list.popFirst();
      expect(first).assertEqual(3);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(1);

      const last: UnionAllValue = list.popLast();
      expect(last).assertEqual(4);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(2);

      const single: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      single.insertEnd(null);
      expect(single.popFirst()).assertNull();
      expect(single.length).assertEqual(0);

      single.insertEnd(undefined);
      expect(single.popLast()).assertUndefined();
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeUnionTest0400
     * @tc.number SUB_ARKTS_DEQUE_UNION_0400
     * @tc.desc   Verify forEach traversal with values and indexes, Symbol.iterator traversal, and for-of counting over mixed-type union elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      list.insertEnd(1);
      list.insertEnd(true);
      list.insertEnd(3);

      const collected: Array<UnionAllValue> = [];
      list.forEach((value: UnionAllValue) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertTrue();
      expect(collected[2]).assertEqual(3);

      let indexSum: number = 0;
      list.forEach((value: UnionAllValue, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<UnionAllValue> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<UnionAllValue> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertTrue();

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === 3) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeUnionTest0500
     * @tc.number SUB_ARKTS_DEQUE_UNION_0500
     * @tc.desc   Verify indexed access at valid, last, and out-of-range positions, and that bigint elements are stored and returned correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      list.insertEnd(5);
      list.insertEnd(1);
      list.insertEnd(3);
      list.insertFront(true);

      expect(list[0]).assertTrue();
      expect(list[1]).assertEqual(5);
      expect(list[3]).assertEqual(3);
      expect(list[list.length - 1]).assertEqual(3);
      let oobThrew: boolean = false;
      try {
        const oob: UnionAllValue | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: UnionAllValue | undefined = list[70];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();

      const big: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      big.insertEnd(100n);
      expect(big[0]).assertEqual(100n);
      expect(big.getFirst()).assertEqual(100n);
    });

    /**
     * @tc.name   testDequeUnionTest0600
     * @tc.number SUB_ARKTS_DEQUE_UNION_0600
     * @tc.desc   Verify out-of-bounds index access returns undefined, popFirst on empty deque throws, and emptied deque yields empty iteration and forEach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      list.insertEnd(1);
      let t1: boolean = false;
      try {
        const v1: UnionAllValue | undefined = list[1];
      } catch (e) {
        t1 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t1).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: UnionAllValue | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: Deque<UnionAllValue> = new Deque<UnionAllValue>();
      const popped: UnionAllValue | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: UnionAllValue | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: UnionAllValue) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
