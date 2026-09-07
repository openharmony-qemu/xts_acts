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

interface BigIntInvalidObject {
  marker: string;
}

const BIGINT_INVALID_OBJECT: BigIntInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<bigint> = [
  100n, -99n, BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), 9007199254740991n,
  -9007199254740991n, 0n, BigInt('0'), BigInt('123456789012345678901234567890'),
  BigInt('138001380001234567890'), BigInt('100000000000000000000000'), -1n,
];

type BigIntInvalidValue = number | string | null | undefined | BigIntInvalidObject;
type BigIntAllValue = bigint | BigIntInvalidValue;

const ALL_VALUES: Array<BigIntAllValue> = [
  ...VALID_VALUES,
  100, '100n', null, undefined, BIGINT_INVALID_OBJECT, NaN, Infinity,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeBigIntTest() {
  describe('DequeBigIntTest', () => {
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
     * @tc.name   testDequeBigIntTest0100
     * @tc.number SUB_ARKTS_DEQUE_BIGINT_0100
     * @tc.desc   Verify Deque bigint constructor, insertEnd, length, index access, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<bigint> = new Deque<bigint>();
      expect(empty.length).assertEqual(0);

      const list: Deque<bigint> = new Deque<bigint>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(100n);
      expect(list[6]).assertEqual(0n);
      expect(list.getFirst()).assertEqual(100n);
      expect(list.getLast()).assertEqual(-1n);

      const mixed: Deque<BigIntAllValue> = new Deque<BigIntAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[VALID_VALUES.length]).assertEqual(100);
    });

    /**
     * @tc.name   testDequeBigIntTest0200
     * @tc.number SUB_ARKTS_DEQUE_BIGINT_0200
     * @tc.desc   Verify Deque bigint insertFront, insertEnd ordering, getFirst, getLast and has method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<bigint> = new Deque<bigint>();
      list.insertEnd(1n);
      list.insertEnd(2n);
      list.insertFront(0n);
      list.insertEnd(3n);
      list.insertFront(-1n);

      expect(list.length).assertEqual(5);
      expect(list[0]).assertEqual(-1n);
      expect(list.getFirst()).assertEqual(-1n);
      expect(list.getLast()).assertEqual(3n);
      expect(list.has(2n)).assertTrue();
      expect(list.has(999n)).assertFalse();
      expect(list.has(0n)).assertTrue();

      const zero: Deque<bigint> = new Deque<bigint>();
      zero.insertFront(BigInt('0'));
      expect(zero.getFirst()).assertEqual(0n);
      expect(zero.getLast()).assertEqual(0n);
      expect(zero.has(BigInt('0'))).assertTrue();
    });

    /**
     * @tc.name   testDequeBigIntTest0300
     * @tc.number SUB_ARKTS_DEQUE_BIGINT_0300
     * @tc.desc   Verify Deque bigint popFirst and popLast remove elements from both ends and update length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<bigint> = new Deque<bigint>();
      list.insertEnd(10n);
      list.insertEnd(20n);
      list.insertEnd(30n);
      list.insertEnd(40n);

      const first: bigint = list.popFirst();
      expect(first).assertEqual(10n);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(20n);

      const last: bigint = list.popLast();
      expect(last).assertEqual(40n);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(30n);

      const single: Deque<bigint> = new Deque<bigint>();
      single.insertEnd(5n);
      expect(single.popFirst()).assertEqual(5n);
      expect(single.length).assertEqual(0);

      single.insertEnd(7n);
      expect(single.popLast()).assertEqual(7n);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeBigIntTest0400
     * @tc.number SUB_ARKTS_DEQUE_BIGINT_0400
     * @tc.desc   Verify Deque bigint forEach callback with value and index, Symbol.iterator and for-of traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<bigint> = new Deque<bigint>();
      list.insertEnd(1n);
      list.insertEnd(2n);
      list.insertEnd(3n);

      const visited: Array<bigint> = [];
      list.forEach((value: bigint) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1n);
      expect(visited[2]).assertEqual(3n);

      let indexSum: number = 0;
      list.forEach((value: bigint, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<bigint> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<bigint> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(2n);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === 2n) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeBigIntTest0500
     * @tc.number SUB_ARKTS_DEQUE_BIGINT_0500
     * @tc.desc   Verify Deque bigint index access including boundaries, out-of-range undefined and very large bigint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<bigint> = new Deque<bigint>();
      list.insertEnd(1n);
      list.insertEnd(2n);
      list.insertEnd(3n);
      list.insertFront(0n);

      expect(list[0]).assertEqual(0n);
      expect(list[1]).assertEqual(1n);
      expect(list[3]).assertEqual(3n);
      expect(list[list.length - 1]).assertEqual(3n);
      let oobThrew: boolean = false;
      try {
        const oob: bigint | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      expect(list.length).assertEqual(4);
      let farThrew: boolean = false;
      try {
        const far: bigint | undefined = list[50];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list.length).assertEqual(4);

      const big: Deque<bigint> = new Deque<bigint>();
      big.insertEnd(BigInt('123456789012345678901234567890'));
      expect(big[0]).assertEqual(BigInt('123456789012345678901234567890'));
      expect(big.getFirst()).assertEqual(BigInt('123456789012345678901234567890'));
    });

    /**
     * @tc.name   testDequeBigIntTest0600
     * @tc.number SUB_ARKTS_DEQUE_BIGINT_0600
     * @tc.desc   Verify Deque bigint out-of-range index access, popFirst on empty deque throwing, and empty iteration behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<bigint> = new Deque<bigint>();
      list.insertEnd(1n);
      list.insertEnd(2n);
      let endThrew: boolean = false;
      try {
        const end: bigint | undefined = list[2];
      } catch (e) {
        endThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(endThrew).assertTrue();
      expect(list.length).assertEqual(2);
      let negThrew: boolean = false;
      try {
        const neg: bigint | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<bigint> = new Deque<bigint>();
      const popped: bigint | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const idx: bigint | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: bigint) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
