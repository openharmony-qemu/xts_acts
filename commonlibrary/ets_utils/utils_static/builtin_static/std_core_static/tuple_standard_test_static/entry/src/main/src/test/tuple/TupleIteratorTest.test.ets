'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function TupleIteratorTest(): void {
  describe('TupleIteratorTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0100
     * @tc.name testTupleIterator001
     * @tc.desc Verify Tuple0 iterator next returns done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Tuple0();
      const iterator = empty.$_iterator();
      const result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0200
     * @tc.name testTupleIterator002
     * @tc.desc Verify Tuple1 iterator yields single value then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<int>(42);
      const iterator = single.$_iterator();
      const first = iterator.next();
      expect(first.done).assertFalse();
      expect((first.value as int)).assertEqual(42);
      const second = iterator.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0300
     * @tc.name testTupleIterator003
     * @tc.desc Verify Tuple2 iterator yields both values in order then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Tuple2<int, string>(1, "one");
      const iterator = pair.$_iterator();
      const first = iterator.next();
      expect(first.done).assertFalse();
      expect((first.value as int)).assertEqual(1);
      const second = iterator.next();
      expect(second.done).assertFalse();
      expect((second.value as string)).assertEqual("one");
      const third = iterator.next();
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0400
     * @tc.name testTupleIterator004
     * @tc.desc Verify Tuple3 iterator yields three mixed-type values in order then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const triple = new Tuple3<int, string, boolean>(10, "hello", true);
      const iterator = triple.$_iterator();
      const r1 = iterator.next();
      expect((r1.value as int)).assertEqual(10);
      const r2 = iterator.next();
      expect((r2.value as string)).assertEqual("hello");
      const r3 = iterator.next();
      expect((r3.value as boolean)).assertTrue();
      const r4 = iterator.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0500
     * @tc.name testTupleIterator005
     * @tc.desc Verify Tuple10 iterator yields all ten int values 1 through 10 summing to 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      );
      const iterator = t10.$_iterator();
      let expected: int = 1;
      let count: int = 0;
      let sum: int = 0;
      let result = iterator.next();
      while (!result.done) {
        let val: int = result.value as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
        result = iterator.next();
      }
      expect(count).assertEqual(10);
      expect(sum).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0600
     * @tc.name testTupleIterator006
     * @tc.desc Verify Tuple0 for-of yields zero iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Tuple0();
      let count: int = 0;
      for (const item of empty) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0700
     * @tc.name testTupleIterator007
     * @tc.desc Verify Tuple4 iterator collects all four mixed-type values into array in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, string, boolean, double>(1, "a", false, 3.14);
      const iterator = tuple.$_iterator();
      const results: Array<Any> = [];
      let result = iterator.next();
      while (!result.done) {
        results.push(result.value);
        result = iterator.next();
      }
      expect((results[0] as int)).assertEqual(1);
      expect((results[1] as string)).assertEqual("a");
      expect((results[2] as boolean)).assertFalse();
      expect((results[3] as double)).assertEqual(3.14);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0800
     * @tc.name testTupleIterator008
     * @tc.desc Verify Tuple1 iterator yields char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<char>(c'A');
      const iterator = tuple.$_iterator();
      const result = iterator.next();
      expect((result.value as char)).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_0900
     * @tc.name testTupleIterator009
     * @tc.desc Verify Tuple3 iterator yields three double values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<double, double, double>(0.0, -1.5, 1e10);
      const iterator = tuple.$_iterator();
      const r1 = iterator.next();
      expect((r1.value as double)).assertEqual(0.0);
      const r2 = iterator.next();
      expect((r2.value as double)).assertEqual(-1.5);
      const r3 = iterator.next();
      expect((r3.value as double)).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1000
     * @tc.name testTupleIterator010
     * @tc.desc Verify Tuple3 iterator yields int zero min and max boundary values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(0, -2147483648, 2147483647);
      const iterator = tuple.$_iterator();
      const r1 = iterator.next();
      expect((r1.value as int)).assertEqual(0);
      const r2 = iterator.next();
      expect((r2.value as int)).assertEqual(-2147483648);
      const r3 = iterator.next();
      expect((r3.value as int)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1100
     * @tc.name testTupleIterator011
     * @tc.desc Verify Tuple2 iterator yields empty and non-empty string values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<string, string>("", "hello world!");
      const iterator = tuple.$_iterator();
      const r1 = iterator.next();
      expect((r1.value as string)).assertEqual("");
      const r2 = iterator.next();
      expect((r2.value as string)).assertEqual("hello world!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1200
     * @tc.name testTupleIterator012
     * @tc.desc Verify Tuple2 iterator yields true then false boolean values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<boolean, boolean>(true, false);
      const iterator = tuple.$_iterator();
      const r1 = iterator.next();
      expect((r1.value as boolean)).assertTrue();
      const r2 = iterator.next();
      expect((r2.value as boolean)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1300
     * @tc.name testTupleIterator013
     * @tc.desc Verify Tuple2 iterator works via IterableIterator typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(1, "one");
      const iterator: IterableIterator<Any> = tuple.$_iterator();
      const first = iterator.next();
      expect(first.done).assertFalse();
      expect((first.value as int)).assertEqual(1);
      const second: Any = iterator.next().value;
      const strValue: string = second as string;
      expect(strValue).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1400
     * @tc.name testTupleIterator014
     * @tc.desc Verify Tuple4 iterator yields four mixed-type values via chained next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, string, boolean, char>(1, "x", true, c'Z');
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as int)).assertEqual(1);
      expect((iterator.next().value as string)).assertEqual("x");
      expect((iterator.next().value as boolean)).assertTrue();
      expect((iterator.next().value as char)).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1500
     * @tc.name testTupleIterator015
     * @tc.desc Verify Tuple1 iterator yields single string then done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = new Tuple1<string>("only");
      const iterator = single.$_iterator();
      const first = iterator.next();
      expect(first.done).assertFalse();
      expect((first.value as string)).assertEqual("only");
      const afterDone = iterator.next();
      expect(afterDone.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1600
     * @tc.name testTupleIterator016
     * @tc.desc Verify Tuple1 iterator yields nested Tuple2 element preserving inner values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple2<int, string>(1, "inner");
      const outer = new Tuple1<Tuple2<int, string>>(inner);
      const iterator = outer.$_iterator();
      const result = iterator.next();
      expect(result.done).assertFalse();
      const nested: Tuple2<int, string> = result.value as Tuple2<int, string>;
      expect(nested).assertEqual(inner);
      expect(nested.$0).assertEqual(1);
      expect(nested.$1).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1700
     * @tc.name testTupleIterator017
     * @tc.desc Verify two independent iterators on same Tuple2 have independent state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(1, "one");
      const iter1 = tuple.$_iterator();
      const iter2 = tuple.$_iterator();
      const r1 = iter1.next();
      expect((r1.value as int)).assertEqual(1);
      const r2 = iter2.next();
      expect((r2.value as int)).assertEqual(1);
      iter1.next();
      const r1Done = iter1.next();
      expect(r1Done.done).assertTrue();
      const r2Second = iter2.next();
      expect((r2Second.value as string)).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1800
     * @tc.name testTupleIterator018
     * @tc.desc Verify two iterators on same Tuple3 advance independently at different paces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(10, 20, 30);
      const iter1 = tuple.$_iterator();
      const iter2 = tuple.$_iterator();
      iter1.next();
      iter1.next();
      const r2First = iter2.next();
      expect((r2First.value as int)).assertEqual(10);
      const r1Third = iter1.next();
      expect((r1Third.value as int)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_1900
     * @tc.name testTupleIterator019
     * @tc.desc Verify exhausted iterator done state and fresh iterator restart independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple1<int>(99);
      const iter1 = tuple.$_iterator();
      iter1.next();
      const done = iter1.next();
      expect(done.done).assertTrue();
      const iter2 = tuple.$_iterator();
      const fresh = iter2.next();
      expect(fresh.done).assertFalse();
      expect((fresh.value as int)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2000
     * @tc.name testTupleIterator020
     * @tc.desc Verify two independent iterators on Tuple2 yield identical values in parallel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<string, string>("A", "B");
      const iter1 = tuple.$_iterator();
      const iter2 = tuple.$_iterator();
      const i1r1 = iter1.next();
      expect((i1r1.value as string)).assertEqual("A");
      const i2r1 = iter2.next();
      expect((i2r1.value as string)).assertEqual("A");
      const i1r2 = iter1.next();
      expect((i1r2.value as string)).assertEqual("B");
      const i2r2 = iter2.next();
      expect((i2r2.value as string)).assertEqual("B");
      expect(iter1.next().done).assertTrue();
      expect(iter2.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2100
     * @tc.name testTupleIterator021
     * @tc.desc Verify Tuple3 iterator works through Iterable interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, string, boolean>(1, "a", true);
      const iterable: Iterable<Any> = tuple;
      const iterator = iterable.$_iterator();
      const first = iterator.next();
      expect((first.value as int)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2200
     * @tc.name testTupleIterator022
     * @tc.desc Verify iterator preserves multilingual string order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("涓枃", "袪褍褋褋泻懈泄", "丕賱毓乇亘賷丞");
      const iterator = tuple.$_iterator();
      const first = iterator.next();
      const second = iterator.next();
      const third = iterator.next();
      const done = iterator.next();
      expect(first.value as string).assertEqual("涓枃");
      expect(second.value as string).assertEqual("袪褍褋褋泻懈泄");
      expect(third.value as string).assertEqual("丕賱毓乇亘賷丞");
      expect(done.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2300
     * @tc.name testTupleIterator023
     * @tc.desc Verify iterator returns independent state after partial traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(0, -1, 42, 100);
      const firstIterator = tuple.$_iterator();
      const firstValue = firstIterator.next();
      const secondIterator = tuple.$_iterator();
      const restartValue = secondIterator.next();
      expect(firstValue.value as int).assertEqual(0);
      expect(restartValue.value as int).assertEqual(0);
      expect(secondIterator.next().value as int).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2400
     * @tc.name testTupleIterator024
     * @tc.desc Verify iterator yields null and undefined union values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string | null, string | undefined, int>(null, undefined, 42);
      const iterator = tuple.$_iterator();
      const first = iterator.next();
      const second = iterator.next();
      const third = iterator.next();
      const done = iterator.next();
      expect((first.value as string | null)).assertEqual(null);
      expect((second.value as string | undefined)).assertEqual(undefined);
      expect(third.value as int).assertEqual(42);
      expect(done.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2500
     * @tc.name testTupleIterator025
     * @tc.desc Verify iterator preserves object reference values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectValue = new Object();
      const tuple = new Tuple2<Object, Object>(objectValue, objectValue);
      const iterator = tuple.$_iterator();
      const first = iterator.next();
      const second = iterator.next();
      expect((first.value as Object) === objectValue).assertTrue();
      expect((second.value as Object) === objectValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2600
     * @tc.name testTupleIterator026
     * @tc.desc Verify iterator yields array values without changing array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<Array<int>, Array<string>>([0, -1, 42], ["", "English", "日本語"]);
      const iterator = tuple.$_iterator();
      const first = iterator.next();
      const second = iterator.next();
      const intValues = first.value as Array<int>;
      const stringValues = second.value as Array<string>;
      expect(intValues.length).assertEqual(3);
      expect(intValues[1]).assertEqual(-1);
      expect(stringValues[0]).assertEqual("");
      expect(stringValues[2]).assertEqual("日本語");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2700
     * @tc.name testTupleIterator027
     * @tc.desc Verify for-of traversal reads non-empty Tuple values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      let expected: int = 1;
      let sum: int = 0;
      let count: int = 0;
      for (const item of tuple) {
        let val: int = item as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
      }
      expect(count).assertEqual(3);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2800
     * @tc.name testTupleIterator028
     * @tc.desc Verify iterator handles Tuple10 mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple10<int, int, string, string, boolean, boolean, double, float, char, string>(
      0, -1, "涓枃", "<script>alert(1)</script>", true, false, 1.5, 2.5 as float, c'Z', "emoji馃檪"
      );
      const iterator = tuple.$_iterator();
      expect(iterator.next().value as int).assertEqual(0);
      expect(iterator.next().value as int).assertEqual(-1);
      expect(iterator.next().value as string).assertEqual("涓枃");
      expect(iterator.next().value as string).assertEqual("<script>alert(1)</script>");
      expect(iterator.next().value as boolean).assertTrue();
      expect(iterator.next().value as boolean).assertFalse();
      expect(iterator.next().value as double).assertEqual(1.5);
      expect(iterator.next().value as float).assertEqual(2.5 as float);
      expect(iterator.next().value as char).assertEqual(c'Z');
      expect(iterator.next().value as string).assertEqual("emoji馃檪");
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_2900
     * @tc.name testTupleIterator029
     * @tc.desc Verify exhausted iterator keeps returning done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<string, string>("first", "second");
      const iterator = tuple.$_iterator();
      iterator.next();
      iterator.next();
      const doneOnce = iterator.next();
      const doneTwice = iterator.next();
      const doneThird = iterator.next();
      expect(doneOnce.done).assertTrue();
      expect(doneTwice.done).assertTrue();
      expect(doneThird.done).assertTrue();
      expect(doneOnce.value === undefined).assertTrue();
      expect(doneTwice.value === undefined).assertTrue();
      expect(doneThird.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3000
     * @tc.name testTupleIterator030
     * @tc.desc Verify Tuple5 iterator complete traversal sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      const iterator = t5.$_iterator();
      let count: int = 0;
      let sum: int = 0;
      let expected: int = 1;
      let result = iterator.next();
      while (!result.done) {
        let val: int = result.value as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
        result = iterator.next();
      }
      expect(count).assertEqual(5);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3100
     * @tc.name testTupleIterator031
     * @tc.desc Verify Tuple6 iterator complete traversal sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t6 = new Tuple6<int, int, int, int, int, int>(1, 2, 3, 4, 5, 6);
      const iterator = t6.$_iterator();
      let count: int = 0;
      let sum: int = 0;
      let expected: int = 1;
      let result = iterator.next();
      while (!result.done) {
        let val: int = result.value as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
        result = iterator.next();
      }
      expect(count).assertEqual(6);
      expect(sum).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3200
     * @tc.name testTupleIterator032
     * @tc.desc Verify Tuple7 iterator complete traversal sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t7 = new Tuple7<int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7);
      const iterator = t7.$_iterator();
      let count: int = 0;
      let sum: int = 0;
      let expected: int = 1;
      let result = iterator.next();
      while (!result.done) {
        let val: int = result.value as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
        result = iterator.next();
      }
      expect(count).assertEqual(7);
      expect(sum).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3300
     * @tc.name testTupleIterator033
     * @tc.desc Verify Tuple8 iterator complete traversal sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t8 = new Tuple8<int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8);
      const iterator = t8.$_iterator();
      let count: int = 0;
      let sum: int = 0;
      let expected: int = 1;
      let result = iterator.next();
      while (!result.done) {
        let val: int = result.value as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
        result = iterator.next();
      }
      expect(count).assertEqual(8);
      expect(sum).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3400
     * @tc.name testTupleIterator034
     * @tc.desc Verify Tuple9 iterator complete traversal sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t9 = new Tuple9<int, int, int, int, int, int, int, int, int>(1, 2, 3, 4, 5, 6, 7, 8, 9);
      const iterator = t9.$_iterator();
      let count: int = 0;
      let sum: int = 0;
      let expected: int = 1;
      let result = iterator.next();
      while (!result.done) {
        let val: int = result.value as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected++;
        result = iterator.next();
      }
      expect(count).assertEqual(9);
      expect(sum).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3500
     * @tc.name testTupleIterator035
     * @tc.desc Verify for-of on Tuple10 collects ten values into array in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t10 = new Tuple10<int, int, int, int, int, int, int, int, int, int>(
        10, 20, 30, 40, 50, 60, 70, 80, 90, 100
      );
      let collected: Array<int> = [];
      for (const item of t10) {
        collected.push(item as int);
      }
      expect(collected.length as int).assertEqual(10);
      expect(collected[0]).assertEqual(10);
      expect(collected[9]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3600
     * @tc.name testTupleIterator036
     * @tc.desc Verify for-of break stops traversal early with matching counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t5 = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      let count: int = 0;
      for (const item of t5) {
        count++;
        if ((item as int) == 3) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3700
     * @tc.name testTupleIterator037
     * @tc.desc Verify iterator total non-done count equals tuple length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t6 = new Tuple6<int, int, int, int, int, int>(1, 2, 3, 4, 5, 6);
      const iterator = t6.$_iterator();
      let valueCount: int = 0;
      let result = iterator.next();
      while (!result.done) {
        valueCount++;
        result = iterator.next();
      }
      expect(valueCount).assertEqual(t6.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3800
     * @tc.name testTupleIterator038
     * @tc.desc Verify two iterators yield same reference for the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const tuple = new Tuple2<Object, string>(obj, "tail");
      const iter1 = tuple.$_iterator();
      const iter2 = tuple.$_iterator();
      const v1 = iter1.next().value as Object;
      const v2 = iter2.next().value as Object;
      expect(v1).assertEqual(v2);
      expect(v1).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_3900
     * @tc.name testTupleIterator039
     * @tc.desc Verify iterator returns float element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<float, float>(1.5 as float, 2.5 as float);
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as float)).assertEqual(1.5 as float);
      expect((iterator.next().value as float)).assertEqual(2.5 as float);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4000
     * @tc.name testTupleIterator040
     * @tc.desc Verify iterator returns byte and short mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<byte, short>(Int.toByte(1), Int.toShort(2));
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as byte)).assertEqual(Int.toByte(1));
      expect((iterator.next().value as short)).assertEqual(Int.toShort(2));
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4100
     * @tc.name testTupleIterator041
     * @tc.desc Verify iterator returns long boundary element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxLong: long = 9223372036854775807;
      const minLong: long = -9223372036854775807 - 1;
      const tuple = new Tuple2<long, long>(maxLong, minLong);
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as long)).assertEqual(maxLong);
      expect((iterator.next().value as long)).assertEqual(minLong);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4200
     * @tc.name testTupleIterator042
     * @tc.desc Verify iterator yields NaN positive and negative infinity double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<double, double, double>(Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
      const iterator = tuple.$_iterator();
      const r1: double = iterator.next().value as double;
      const r2: double = iterator.next().value as double;
      const r3: double = iterator.next().value as double;
      expect(isNaN(r1)).assertTrue();
      expect(r2).assertEqual(Double.POSITIVE_INFINITY);
      expect(r3).assertEqual(Double.NEGATIVE_INFINITY);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4300
     * @tc.name testTupleIterator043
     * @tc.desc Verify iterator returns char sequence in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<char, char, char, char>(c'A', c'B', c'C', c'D');
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as char)).assertEqual(c'A');
      expect((iterator.next().value as char)).assertEqual(c'B');
      expect((iterator.next().value as char)).assertEqual(c'C');
      expect((iterator.next().value as char)).assertEqual(c'D');
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4400
     * @tc.name testTupleIterator044
     * @tc.desc Verify iterator returns alternating boolean values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<boolean, boolean, boolean, boolean>(true, false, true, false);
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as boolean)).assertTrue();
      expect((iterator.next().value as boolean)).assertFalse();
      expect((iterator.next().value as boolean)).assertTrue();
      expect((iterator.next().value as boolean)).assertFalse();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4500
     * @tc.name testTupleIterator045
     * @tc.desc Verify iterator returns three nested Tuple2 element references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Tuple2<int, int>(1, 2);
      const b = new Tuple2<int, int>(3, 4);
      const c = new Tuple2<int, int>(5, 6);
      const outer = new Tuple3<Tuple2<int, int>, Tuple2<int, int>, Tuple2<int, int>>(a, b, c);
      const iterator = outer.$_iterator();
      const r1 = iterator.next().value as Tuple2<int, int>;
      const r2 = iterator.next().value as Tuple2<int, int>;
      const r3 = iterator.next().value as Tuple2<int, int>;
      expect(r1).assertEqual(a);
      expect(r2).assertEqual(b);
      expect(r3).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4600
     * @tc.name testTupleIterator046
     * @tc.desc Verify outer iterator then inner iterator yields nested values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Tuple2<int, int>(7, 8);
      const outer = new Tuple1<Tuple2<int, int>>(inner);
      const outerIter = outer.$_iterator();
      const fetched = outerIter.next().value as Tuple2<int, int>;
      const innerIter = fetched.$_iterator();
      expect((innerIter.next().value as int)).assertEqual(7);
      expect((innerIter.next().value as int)).assertEqual(8);
      expect(innerIter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4700
     * @tc.name testTupleIterator047
     * @tc.desc Verify iterator yields array elements and inner sum can be computed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<Array<int>, Array<int>>([1, 2, 3], [10, 20, 30]);
      const iterator = tuple.$_iterator();
      const arr1 = iterator.next().value as Array<int>;
      const arr2 = iterator.next().value as Array<int>;
      let sum1: int = 0;
      let sum2: int = 0;
      for (let i: int = 0; i < (arr1.length as int); i++) {
        sum1 += arr1[i];
      }
      for (let i: int = 0; i < (arr2.length as int); i++) {
        sum2 += arr2[i];
      }
      expect(sum1).assertEqual(6);
      expect(sum2).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4800
     * @tc.name testTupleIterator048
     * @tc.desc Verify iterator yields string elements that can be concatenated in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<string, string, string>("Hello", " ", "World");
      const iterator = tuple.$_iterator();
      let combined: string = "";
      let result = iterator.next();
      while (!result.done) {
        combined += result.value as string;
        result = iterator.next();
      }
      expect(combined).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_4900
     * @tc.name testTupleIterator049
     * @tc.desc Verify while loop using cached IteratorResult covers all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(11, 22, 33);
      const iterator = tuple.$_iterator();
      let total: int = 0;
      let expected: int = 11;
      let count: int = 0;
      let current = iterator.next();
      while (!current.done) {
        let val: int = current.value as int;
        expect(val).assertEqual(expected);
        total += val;
        count++;
        expected += 11;
        current = iterator.next();
      }
      expect(count).assertEqual(3);
      expect(total).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5000
     * @tc.name testTupleIterator050
     * @tc.desc Verify done is false until the last element is consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(1, 2, 3);
      const iterator = tuple.$_iterator();
      expect(iterator.next().done).assertFalse();
      expect(iterator.next().done).assertFalse();
      expect(iterator.next().done).assertFalse();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5100
     * @tc.name testTupleIterator051
     * @tc.desc Verify three iterators with different step counts have independent state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<int, int, int, int, int>(1, 2, 3, 4, 5);
      const iterA = tuple.$_iterator();
      const iterB = tuple.$_iterator();
      const iterC = tuple.$_iterator();
      iterA.next();
      iterB.next();
      iterB.next();
      iterC.next();
      iterC.next();
      iterC.next();
      expect((iterA.next().value as int)).assertEqual(2);
      expect((iterB.next().value as int)).assertEqual(3);
      expect((iterC.next().value as int)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5200
     * @tc.name testTupleIterator052
     * @tc.desc Verify iterator collected array preserves complete ordered values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(100, 200, 300, 400);
      const iterator = tuple.$_iterator();
      let collected: Array<int> = [];
      let result = iterator.next();
      while (!result.done) {
        collected.push(result.value as int);
        result = iterator.next();
      }
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(200);
      expect(collected[2]).assertEqual(300);
      expect(collected[3]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5300
     * @tc.name testTupleIterator053
     * @tc.desc Verify iterator over Tuple3 of zeros returns three zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(0, 0, 0);
      const iterator = tuple.$_iterator();
      let count: int = 0;
      let allZero: boolean = true;
      let result = iterator.next();
      while (!result.done) {
        if ((result.value as int) != 0) {
          allZero = false;
        }
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(3);
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5400
     * @tc.name testTupleIterator054
     * @tc.desc Verify iterator preserves order over negative int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(-1, -2, -3);
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as int)).assertEqual(-1);
      expect((iterator.next().value as int)).assertEqual(-2);
      expect((iterator.next().value as int)).assertEqual(-3);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5500
     * @tc.name testTupleIterator055
     * @tc.desc Verify iterator yields mixed nullable and non-nullable element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string | null, string, string, string>(null, "a", "b", "c");
      const iterator = tuple.$_iterator();
      let count: int = 0;
      let nullSeen: boolean = false;
      let result = iterator.next();
      while (!result.done) {
        if (result.value === null) {
          nullSeen = true;
        }
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(4);
      expect(nullSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5600
     * @tc.name testTupleIterator056
     * @tc.desc Verify iterator returns identical string values for tuple with same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<string, string, string, string>("x", "x", "x", "x");
      const iterator = tuple.$_iterator();
      let count: int = 0;
      let result = iterator.next();
      while (!result.done) {
        expect((result.value as string)).assertEqual("x");
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5700
     * @tc.name testTupleIterator057
     * @tc.desc Verify iterator preserves very long string element content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = "a".repeat(10000);
      const tuple = new Tuple2<string, string>(big, "tail");
      const iterator = tuple.$_iterator();
      const v1: string = iterator.next().value as string;
      const v2: string = iterator.next().value as string;
      expect(v1.length as int).assertEqual(10000);
      expect(v2).assertEqual("tail");
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5800
     * @tc.name testTupleIterator058
     * @tc.desc Verify iterator next dot value usable directly in expect expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(7, 8, 9);
      const iterator = tuple.$_iterator();
      let a: int = iterator.next().value as int;
      let b: int = iterator.next().value as int;
      expect(a + b).assertEqual(15);
      expect((iterator.next().value as int)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_5900
     * @tc.name testTupleIterator059
     * @tc.desc Verify rebuilding iterator after partial traversal restarts from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(10, 20, 30, 40);
      const iter1 = tuple.$_iterator();
      iter1.next();
      iter1.next();
      const iter2 = tuple.$_iterator();
      expect((iter2.next().value as int)).assertEqual(10);
      expect((iter2.next().value as int)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6000
     * @tc.name testTupleIterator060
     * @tc.desc Verify for-of accumulates Tuple5 int values to expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<int, int, int, int, int>(2, 4, 6, 8, 10);
      let sum: int = 0;
      let count: int = 0;
      let expected: int = 2;
      for (const item of tuple) {
        let val: int = item as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected += 2;
      }
      expect(count).assertEqual(5);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6100
     * @tc.name testTupleIterator061
     * @tc.desc Verify for-of counter equals Tuple4 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, string, boolean, char>(1, "x", true, c'A');
      let count: int = 0;
      for (const item of tuple) {
        count++;
      }
      expect(count).assertEqual(tuple.length);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6200
     * @tc.name testTupleIterator062
     * @tc.desc Verify for-of collected array index access matches original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple4<int, int, int, int>(11, 22, 33, 44);
      let collected: Array<int> = [];
      for (const item of tuple) {
        collected.push(item as int);
      }
      expect(collected[0]).assertEqual(11);
      expect(collected[1]).assertEqual(22);
      expect(collected[2]).assertEqual(33);
      expect(collected[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6300
     * @tc.name testTupleIterator063
     * @tc.desc Verify iterator unpacks five mixed element types via as cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple5<int, string, boolean, double, char>(5, "y", false, 2.5, c'K');
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as int)).assertEqual(5);
      expect((iterator.next().value as string)).assertEqual("y");
      expect((iterator.next().value as boolean)).assertFalse();
      expect((iterator.next().value as double)).assertEqual(2.5);
      expect((iterator.next().value as char)).assertEqual(c'K');
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6400
     * @tc.name testTupleIterator064
     * @tc.desc Verify iterator unpacks seven heterogeneous element types in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple7<int, string, boolean, double, char, byte, short>(
        1, "s", true, 3.14, c'M', Int.toByte(2), Int.toShort(3)
      );
      const iterator = tuple.$_iterator();
      expect((iterator.next().value as int)).assertEqual(1);
      expect((iterator.next().value as string)).assertEqual("s");
      expect((iterator.next().value as boolean)).assertTrue();
      expect((iterator.next().value as double)).assertEqual(3.14);
      expect((iterator.next().value as char)).assertEqual(c'M');
      expect((iterator.next().value as byte)).assertEqual(Int.toByte(2));
      expect((iterator.next().value as short)).assertEqual(Int.toShort(3));
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6500
     * @tc.name testTupleIterator065
     * @tc.desc Verify three consecutive iterators all start from the same first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, string>(77, "head");
      const iter1 = tuple.$_iterator();
      const iter2 = tuple.$_iterator();
      const iter3 = tuple.$_iterator();
      expect((iter1.next().value as int)).assertEqual(77);
      expect((iter2.next().value as int)).assertEqual(77);
      expect((iter3.next().value as int)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6600
     * @tc.name testTupleIterator066
     * @tc.desc Verify many freshly created iterators all yield the same first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple2<int, int>(42, 99);
      let matched: int = 0;
      for (let i: int = 0; i < 50; i++) {
        const iter = tuple.$_iterator();
        if ((iter.next().value as int) == 42) {
          matched++;
        }
      }
      expect(matched).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6700
     * @tc.name testTupleIterator067
     * @tc.desc Verify iteratorForEach calls fn for each element in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tuple = new Tuple3<int, int, int>(10, 20, 30);
      let sum: int = 0;
      let count: int = 0;
      let expected: int = 10;
      iteratorForEach(tuple.$_iterator(), (x: Any): void => {
        let val: int = x as int;
        expect(val).assertEqual(expected);
        sum += val;
        count++;
        expected += 10;
      });
      expect(count).assertEqual(3);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6800
     * @tc.name testTupleIterator068
     * @tc.desc Verify iteratorForEach on empty Tuple0 does not call fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Tuple0();
      let called: boolean = false;
      iteratorForEach(empty.$_iterator(), (_x: Any): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_6900
     * @tc.name testTupleIterator069
     * @tc.desc Verify IteratorResult no-arg constructor creates done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<int>();
      expect(result.done).assertTrue();
      expect(result.value === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_7000
     * @tc.name testTupleIterator070
     * @tc.desc Verify IteratorResult constructor with done and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<boolean>(false, true);
      expect(result.done).assertFalse();
      expect(result.value as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TUPLE_ITERATOR_7100
     * @tc.name testTupleIterator071
     * @tc.desc Verify IteratorResult constructor with value only creates non-done state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTupleIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new IteratorResult<string>("hello");
      expect(result.done).assertFalse();
      expect(result.value as string).assertEqual("hello");
    });
  });
}
