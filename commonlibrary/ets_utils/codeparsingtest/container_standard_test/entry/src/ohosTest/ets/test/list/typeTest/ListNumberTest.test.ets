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

export default function listNumberTest() {
  describe('ListNumberTest', () => {
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
     * @tc.name   testListNumberTest0100
     * @tc.number SUB_ARKTS_LIST_NUMBER_0100
     * @tc.desc   Verify List number constructor, add, length, get, getFirst and getLast with boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<number> = new List<number>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<number> = new List<number>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        const added: boolean = list.add(VALID_VALUES[i]);
        expect(added).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(1);
      expect(list[0]).assertEqual(1);
      expect(list.getFirst()).assertEqual(1);
      expect(list.getLast()).assertEqual(-100.5);
      expect(list.isEmpty()).assertFalse();

      const mixed: List<NumberAllValue> = new List<NumberAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(1);
      expect(mixed.get(1)).assertEqual(100.5);
      expect(mixed.get(ALL_VALUES.length - 1)).assertEqual(BigInt('9007199254740991'));
    });

    /**
     * @tc.name   testListNumberTest0200
     * @tc.number SUB_ARKTS_LIST_NUMBER_0200
     * @tc.desc   Verify List number has, getIndexOf, getLastIndexOf, insert, NaN lookup and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<number> = new List<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(2);
      list.add(1);
      list.add(2);
      list.add(4);

      expect(list.has(5)).assertTrue();
      expect(list.has(999)).assertFalse();
      expect(list.getIndexOf(2)).assertEqual(0);
      expect(list.getLastIndexOf(2)).assertEqual(5);
      expect(list.getIndexOf(999)).assertEqual(-1);
      expect(list.getLastIndexOf(999)).assertEqual(-1);
      expect(list.get(2)).assertEqual(5);
      expect(list[2]).assertEqual(5);

      list.insert(88, 0);
      expect(list.get(0)).assertEqual(88);
      expect(list.length).assertEqual(8);
      list.insert(99, list.length);
      expect(list.get(list.length - 1)).assertEqual(99);
      expect(list.length).assertEqual(9);

      const nanList: List<number> = new List<number>();
      nanList.add(NaN);
      expect(nanList.has(NaN)).assertTrue();
      expect(nanList.getIndexOf(NaN)).assertEqual(0);

      const same: List<number> = new List<number>();
      same.add(88);
      same.add(2);
      same.add(4);
      same.add(5);
      same.add(2);
      same.add(1);
      same.add(2);
      same.add(4);
      same.add(99);
      expect(list.equal(same)).assertTrue();
      same.add(1);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListNumberTest0300
     * @tc.number SUB_ARKTS_LIST_NUMBER_0300
     * @tc.desc   Verify List number removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<number> = new List<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(4);

      const removed: number = list.removeByIndex(2);
      expect(removed).assertEqual(5);
      expect(list.length).assertEqual(3);
      expect(list.get(2)).assertEqual(4);

      expect(list.remove(4)).assertTrue();
      expect(list.getIndexOf(4)).assertEqual(1);
      expect(list.remove(777)).assertFalse();

      const src: List<number> = new List<number>();
      src.add(1);
      src.add(2);
      src.add(3);
      src.add(4);
      src.add(5);
      const sub: List<number> = src.getSubList(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub.get(0)).assertEqual(2);
      expect(sub.get(2)).assertEqual(4);
      expect(src.length).assertEqual(5);
      sub.add(6);
      expect(src.length).assertEqual(5);
    });

    /**
     * @tc.name   testListNumberTest0400
     * @tc.number SUB_ARKTS_LIST_NUMBER_0400
     * @tc.desc   Verify List number set, replaceAllElements, forEach, Symbol.iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<number> = new List<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(4);

      const old: number = list.set(1, 40);
      expect(old).assertEqual(40);
      expect(list.get(1)).assertEqual(40);
      expect(list.length).assertEqual(4);

      list.replaceAllElements((value: number): number => {
        return value * 2;
      });
      expect(list.get(0)).assertEqual(4);
      expect(list.get(1)).assertEqual(80);
      expect(list.get(3)).assertEqual(8);

      const visited: Array<number> = [];
      list.forEach((value: number) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(4);
      expect(visited[3]).assertEqual(8);

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
      expect(iterValues[0]).assertEqual(4);

      let forOfCount: number = 0;
      for (const value of list) {
        forOfCount += value;
      }
      expect(forOfCount).assertEqual(102);

      const arr: Array<number> = list.convertToArray();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(4);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testListNumberTest0500
     * @tc.number SUB_ARKTS_LIST_NUMBER_0500
     * @tc.desc   Verify List number ascending and descending sort plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<number> = new List<number>();
      list.add(5);
      list.add(1);
      list.add(4);
      list.add(2);
      list.add(3);

      list.sort((a: number, b: number): number => {
        return a - b;
      });
      expect(list.get(0)).assertEqual(1);
      expect(list.get(4)).assertEqual(5);

      list.sort((a: number, b: number): number => {
        return b - a;
      });
      expect(list.get(0)).assertEqual(5);
      expect(list.get(4)).assertEqual(1);

      expect(list.getFirst()).assertEqual(5);
      expect(list.getLast()).assertEqual(1);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListNumberTest0600
     * @tc.number SUB_ARKTS_LIST_NUMBER_0600
     * @tc.desc   Verify List number out-of-bounds get/insert/set/getSubList, empty list access, clear and empty iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<number> = new List<number>();
      list.add(1);
      list.add(2);
      list.add(3);
      expect(list.get(3)).assertUndefined();
      expect(list[3]).assertUndefined();

      let insertThrew: boolean = false;
      try {
        list.insert(100, 99);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.has(100)).assertFalse();
      expect(list.length).assertEqual(3);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(3);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(3);

      let setThrew: boolean = false;
      try {
        list.set(3, 100);
      } catch (e) {
        setThrew = true;
      }
      expect(setThrew).assertTrue();

      let subThrew: boolean = false;
      try {
        list.getSubList(2, 1);
      } catch (e) {
        subThrew = true;
      }
      expect(subThrew).assertTrue();

      const empty: List<number> = new List<number>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);

      const emptyIter = list[Symbol.iterator]();
      const first: IteratorResult<number> = emptyIter.next();
      expect(first.done).assertTrue();
    });
  });
}
