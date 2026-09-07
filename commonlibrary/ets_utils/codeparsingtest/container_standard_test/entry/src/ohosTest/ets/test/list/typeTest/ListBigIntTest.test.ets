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
import { List } from '@kit.ArkTS';

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

export default function listBigIntTest() {
  describe('ListBigIntTest', () => {
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
     * @tc.name   testListBigIntTest0100
     * @tc.number SUB_ARKTS_LIST_BIGINT_0100
     * @tc.desc   Verify List bigint constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<bigint> = new List<bigint>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<bigint> = new List<bigint>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(100n);
      expect(list.get(6)).assertEqual(0n);
      expect(list[6]).assertEqual(0n);
      expect(list.getFirst()).assertEqual(100n);
      expect(list.getLast()).assertEqual(-1n);

      const mixed: List<BigIntAllValue> = new List<BigIntAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(VALID_VALUES.length)).assertEqual(100);
    });

    /**
     * @tc.name   testListBigIntTest0200
     * @tc.number SUB_ARKTS_LIST_BIGINT_0200
     * @tc.desc   Verify List bigint has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<bigint> = new List<bigint>();
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
      expect(list.get(0)).assertEqual(0n);
      expect(list.length).assertEqual(4);

      expect(list.remove(1n)).assertTrue();
      expect(list.getIndexOf(1n)).assertEqual(2);
      expect(list.remove(777n)).assertFalse();

      const same: List<bigint> = new List<bigint>();
      same.add(0n);
      same.add(2n);
      same.add(1n);
      expect(list.equal(same)).assertTrue();
      same.add(1n);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListBigIntTest0300
     * @tc.number SUB_ARKTS_LIST_BIGINT_0300
     * @tc.desc   Verify List bigint removeByIndex, remove, getSubList and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<bigint> = new List<bigint>();
      list.add(10n);
      list.add(20n);
      list.add(30n);
      list.add(40n);

      const removed: bigint = list.removeByIndex(1);
      expect(removed).assertEqual(20n);
      expect(list.length).assertEqual(3);
      expect(list.get(1)).assertEqual(30n);

      expect(list.remove(10n)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<bigint> = new List<bigint>();
      src.add(1n);
      src.add(2n);
      src.add(3n);
      const sub: List<bigint> = src.getSubList(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.get(0)).assertEqual(2n);
      expect(src.length).assertEqual(3);
      sub.add(4n);
      expect(src.length).assertEqual(3);

      const arr: Array<bigint> = src.convertToArray();
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.name   testListBigIntTest0400
     * @tc.number SUB_ARKTS_LIST_BIGINT_0400
     * @tc.desc   Verify List bigint set, replaceAllElements, forEach and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<bigint> = new List<bigint>();
      list.add(1n);
      list.add(2n);
      list.add(3n);

      const old: bigint = list.set(1, 20n);
      expect(old).assertEqual(20n);
      expect(list.get(1)).assertEqual(20n);
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: bigint): bigint => {
        return value * 10n;
      });
      expect(list.get(0)).assertEqual(10n);
      expect(list.get(2)).assertEqual(30n);

      const visited: Array<bigint> = [];
      list.forEach((value: bigint) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[1]).assertEqual(200n);

      let indexSum: number = 0;
      list.forEach((value: bigint, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<bigint> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(10n);
    });

    /**
     * @tc.name   testListBigIntTest0500
     * @tc.number SUB_ARKTS_LIST_BIGINT_0500
     * @tc.desc   Verify List bigint sort with comparator plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<bigint> = new List<bigint>();
      list.add(300n);
      list.add(100n);
      list.add(200n);

      list.sort((a: bigint, b: bigint): number => {
        return Number(a - b);
      });
      expect(list.get(0)).assertEqual(100n);
      expect(list.get(2)).assertEqual(300n);

      expect(list.getFirst()).assertEqual(100n);
      expect(list.getLast()).assertEqual(300n);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListBigIntTest0600
     * @tc.number SUB_ARKTS_LIST_BIGINT_0600
     * @tc.desc   Verify List bigint out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<bigint> = new List<bigint>();
      list.add(1n);
      list.add(2n);
      expect(list.get(2)).assertUndefined();
      expect(list[2]).assertUndefined();

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
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: List<bigint> = new List<bigint>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();
    });
  });
}
