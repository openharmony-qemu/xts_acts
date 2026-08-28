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
import { ArrayList } from '@kit.ArkTS';

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

export default function arrayListBigIntTest() {
  describe('ArrayListBigIntTest', () => {
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
     * @tc.name   testArrayListBigIntTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_BIGINT_0100
     * @tc.desc   Verify ArrayList bigint constructor and add with valid, mixed and boundary bigint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<bigint> = new ArrayList<bigint>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<bigint> = new ArrayList<bigint>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(100n);
      expect(list[6]).assertEqual(0n);

      const mixed: ArrayList<BigIntAllValue> = new ArrayList<BigIntAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[VALID_VALUES.length]).assertEqual(100);
    });

    /**
     * @tc.name   testArrayListBigIntTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_BIGINT_0200
     * @tc.desc   Verify ArrayList bigint has, getIndexOf, getLastIndexOf, insert and remove behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<bigint> = new ArrayList<bigint>();
      list.add(1n);
      list.add(2n);
      list.add(1n);

      expect(list.has(1n)).assertTrue();
      expect(list.has(999n)).assertFalse();
      expect(list.getIndexOf(1n)).assertEqual(0);
      expect(list.getLastIndexOf(1n)).assertEqual(2);
      expect(list.getIndexOf(2n)).assertEqual(1);
      expect(list.getIndexOf(999n)).assertEqual(-1);

      list.insert(0n, 0);
      expect(list[0]).assertEqual(0n);
      expect(list.length).assertEqual(4);

      expect(list.remove(1n)).assertTrue();
      expect(list.getIndexOf(1n)).assertEqual(2);
      expect(list.remove(777n)).assertFalse();
    });

    /**
     * @tc.name   testArrayListBigIntTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_BIGINT_0300
     * @tc.desc   Verify ArrayList bigint removeByIndex, removeByRange, subArrayList, clone and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<bigint> = new ArrayList<bigint>();
      list.add(10n);
      list.add(20n);
      list.add(30n);
      list.add(40n);

      const removed: bigint = list.removeByIndex(1);
      expect(removed).assertEqual(20n);
      expect(list.length).assertEqual(3);
      expect(list[1]).assertEqual(30n);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(40n);

      const src: ArrayList<bigint> = new ArrayList<bigint>();
      src.add(1n);
      src.add(2n);
      src.add(3n);
      const sub: ArrayList<bigint> = src.subArrayList(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(2n);
      expect(src.length).assertEqual(3);

      const cloned: ArrayList<bigint> = src.clone();
      cloned.add(4n);
      expect(src.length).assertEqual(3);
      expect(cloned[3]).assertEqual(4n);

      const arr: Array<bigint> = src.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.name   testArrayListBigIntTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_BIGINT_0400
     * @tc.desc   Verify ArrayList bigint replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<bigint> = new ArrayList<bigint>();
      list.add(1n);
      list.add(2n);
      list.add(3n);

      list.replaceAllElements((value: bigint): bigint => {
        return value * 10n;
      });
      expect(list[0]).assertEqual(10n);
      expect(list[2]).assertEqual(30n);

      const visited: Array<bigint> = [];
      list.forEach((value: bigint) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[1]).assertEqual(20n);

      const iterValues: Array<bigint> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(10n);
    });

    /**
     * @tc.name   testArrayListBigIntTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_BIGINT_0500
     * @tc.desc   Verify ArrayList bigint sort, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<bigint> = new ArrayList<bigint>();
      list.add(300n);
      list.add(100n);
      list.add(200n);

      list.sort((a: bigint, b: bigint): number => {
        return Number(a - b);
      });
      expect(list[0]).assertEqual(100n);
      expect(list[2]).assertEqual(300n);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(20);
      expect(list.getCapacity() >= 20).assertTrue();
      list.add(400n);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual(400n);
    });

    /**
     * @tc.name   testArrayListBigIntTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_BIGINT_0600
     * @tc.desc   Verify ArrayList bigint boundary access, out-of-range removeByIndex and insert, clear and empty iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<bigint> = new ArrayList<bigint>();
      list.add(1n);
      list.add(2n);
      let accessThrew: boolean = false;
      try {
        const beyond: bigint = list[2];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 2).assertTrue();
      expect(list.length).assertEqual(2);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(9);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(2);

      let insertThrew: boolean = false;
      try {
        list.insert(9n, 50);
      } catch (e) {
        insertThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(2);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();
    });
  });
}
