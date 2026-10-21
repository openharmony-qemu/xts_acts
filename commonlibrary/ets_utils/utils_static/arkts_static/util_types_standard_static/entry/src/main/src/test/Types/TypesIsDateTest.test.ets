'use static';

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

import {
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

class SubDate extends Date {
  constructor() {
    super(0);
  }
}

class StampHolder {
  stamp: Date = new Date(86400000);
}

class PlainBox {
  id: int = 1;

  probe(): int {
    return this.id;
  }
}

class WeakKey {
  tag: string = 'k';
}

class DateLookalike {
  stamp: int = 2023;

  getTime(): long {
    return this.stamp;
  }
}

interface StampPair {
  when: Date;
}

interface TaggedPair {
  tag: string;
}

function plainNumberFn(): int {
  return 2;
}

async function asyncNumberTask(): Promise<int> {
  return 1;
}

function probeDateArgument(value: Object): boolean {
  return new util.types().isDate(value);
}

class LoggedDate extends Date {
  label: string;

  constructor(millis: long, label: string) {
    super(millis);
    this.label = label;
  }
}

class DateInspector {
  engine: util.types = new util.types();
  lastResult: boolean = false;

  inspect(value: Object): boolean {
    return this.engine.isDate(value);
  }
}

class DateFactory {
  build(millis: long): Date {
    return new Date(millis);
  }
}

class SlotBox {
  slot: Object = new PlainBox();
}

class AsyncHolder {
  async asyncMethod(): Promise<void> {
  }
}

class SubError extends Error {
  constructor(message: string) {
    super(message);
  }
}

function identityObject(value: Object): Object {
  return value;
}

function classifyAsDate(value: Object): int {
  if (new util.types().isDate(value)) {
    return 1;
  }
  return 0;
}

function pickDateAt(list: Date[], index: int): Date {
  return list[index];
}

function copyDate(value: Date): Date {
  return new Date(value);
}

function objectFromUnparseableText(): Object {
  try {
    new Date('not-a-date');
  } catch (err) {
    return err as Object;
  }
  return new Date(0);
}

export default function typesIsDateTest(): void {
  describe('TypesIsDateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0100
     * @tc.name testTypesIsDate001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Date created from the current system time; isDate accepts a Date one millisecond after the epoch and one parsed from an ISO 8601 UTC string; one millisecond before the epoch; built from the 32 bit millisecond value 2147483647 and one full day of milliseconds 86400000; accepts a second Date built from the timestamp of a first Date.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns true for a Date created from the current system time ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date();
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime() > 0.0).assertTrue();
      }

      // --- [2] Verify isDate accepts a Date one millisecond after the epoch and one parsed from an ISO 8601 UTC string ---
      {
        let dateProbe: util.types = new util.types();
        let early: Date = new Date(1);
        let parsed: Date = new Date('2024-01-01T00:00:00.000Z');
        expect(early.getTime()).assertEqual(1);
        expect(dateProbe.isDate(early)).assertTrue();
        expect(dateProbe.isDate(parsed)).assertTrue();
        expect(parsed.getTime()).assertEqual(1704067200000);
      }

      // --- [3] Verify isDate returns true for a Date one millisecond before the epoch ---
      {
        let dateProbe: util.types = new util.types();
        let epoch: Date = new Date(0);
        let before: Date = new Date(-1);
        expect(dateProbe.isDate(before)).assertTrue();
        expect(before.getTime()).assertEqual(-1);
        expect(before.getTime()).assertLess(epoch.getTime());
      }

      // --- [4] Verify isDate returns true for a Date built from the 32 bit millisecond value 2147483647 and one full day of milliseconds 86400000 ---
      {
        let span: long = 2147483647;
        let d: Date = new Date(span);
        expect(probeDateArgument(d)).assertTrue();
        expect(d.getTime()).assertEqual(span);
        let dateProbe: util.types = new util.types();
        let d_2: Date = new Date(86400000);
        expect(dateProbe.isDate(d_2)).assertTrue();
        expect(d_2.getTime()).assertEqual(86400000);
        expect(d_2.getUTCFullYear()).assertEqual(1970);
      }

      // --- [5] Verify isDate returns true for a second Date built from the timestamp of a first Date ---
      {
        let dateProbe: util.types = new util.types();
        let source: Date = new Date(86400000);
        let copy: Date = new Date(source.getTime());
        expect(dateProbe.isDate(source)).assertTrue();
        expect(dateProbe.isDate(copy)).assertTrue();
        expect(copy.getTime()).assertEqual(source.getTime());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0200
     * @tc.name testTypesIsDate002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Date built from year, month and day components and all seven date and time components; local components for the first day of 1970; the negative millisecond value minus 86400000; accepts a Date whose argument is an arithmetic millisecond expression; accepts every element yielded while iterating a Date array and Set of Dates.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns true for a Date built from year, month and day components and all seven date and time components ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(2024, 0, 1);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getFullYear()).assertEqual(2024);
        expect(d.getMonth()).assertEqual(0);
        expect(d.getDate()).assertEqual(1);
        let dateProbe_2: util.types = new util.types();
        let d_2: Date = new Date(2024, 0, 1, 12, 30, 45, 500);
        expect(dateProbe_2.isDate(d_2)).assertTrue();
        expect(d_2.getHours()).assertEqual(12);
        expect(d_2.getMinutes()).assertEqual(30);
        expect(d_2.getSeconds()).assertEqual(45);
        expect(d_2.getMilliseconds()).assertEqual(500);
      }

      // --- [2] Verify isDate returns true for a Date built from local components for the first day of 1970 ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(1970, 0, 1);
        let flags: boolean[] = [dateProbe.isDate(d)];
        expect(flags[0]).assertTrue();
        expect(d.getFullYear()).assertEqual(1970);
      }

      // --- [3] Verify isDate returns true for a Date built from the negative millisecond value minus 86400000 ---
      {
        let dateProbe: util.types = new util.types();
        let back: long = -86400000;
        let d: Date = new Date(back);
        let stamp: long = d.getTime();
        expect(stamp).assertEqual(back);
        expect(dateProbe.isDate(d)).assertTrue();
      }

      // --- [4] Verify isDate returns true for a Date whose argument is an arithmetic millisecond expression ---
      {
        let dateProbe: util.types = new util.types();
        let hours: long = 3;
        let millis: long = hours * 3600000;
        let d: Date = new Date(millis);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime()).assertEqual(millis);
      }

      // --- [5] Verify isDate returns true for every element yielded while iterating a Date array and Set of Dates ---
      {
        let dateProbe: util.types = new util.types();
        let list: Date[] = [new Date(0), new Date(1), new Date(2)];
        let seen: int = 0;
        for (const item of list) {
          expect(dateProbe.isDate(item)).assertTrue();
          seen = seen + 1;
        }
        expect(seen).assertEqual(3);
        expect(list.length).assertEqual(3);
        let dateProbe_2: util.types = new util.types();
        let marks: Set<Date> = new Set<Date>();
        marks.add(new Date(0));
        marks.add(new Date(1));
        let seen_2: int = 0;
        for (const item_2 of marks) {
          expect(dateProbe_2.isDate(item_2)).assertTrue();
          seen_2 = seen_2 + 1;
        }
        expect(seen_2).assertEqual(2);
        expect(marks.size).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0300
     * @tc.name testTypesIsDate003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts every value yielded while iterating a Map that stores Dates; a copy produced by the Date overload of the constructor is itself a Date with the same timestamp; accepts a Date that a Set reports as one of its members; accepts a Date selected by index from a Date array; a Map that stores Dates on both sides yields two positive isDate results when iterated.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns true for every value yielded while iterating a Map that stores Dates ---
      {
        let dateProbe: util.types = new util.types();
        let bag: Map<string, Date> = new Map<string, Date>();
        bag.set('a', new Date(0));
        bag.set('b', new Date(1));
        for (const item of bag.values()) {
          expect(dateProbe.isDate(item)).assertTrue();
        }
        expect(bag.size).assertEqual(2);
      }

      // --- [2] Verify a copy produced by the Date overload of the constructor is itself a Date with the same timestamp ---
      {
        let dateProbe: util.types = new util.types();
        let source: Date = new Date(86400000);
        let copy: Date = copyDate(source);
        expect(dateProbe.isDate(copy)).assertTrue();
        expect(copy.getTime()).assertEqual(source.getTime());
        expect(copy !== source).assertTrue();
      }

      // --- [3] Verify isDate returns true for a Date that a Set reports as one of its members ---
      {
        let dateProbe: util.types = new util.types();
        let member: Date = new Date(1);
        let marks: Set<Date> = new Set<Date>();
        marks.add(member);
        expect(marks.has(member)).assertTrue();
        expect(dateProbe.isDate(member)).assertTrue();
        expect(marks.size).assertEqual(1);
      }

      // --- [4] Verify isDate returns true for a Date selected by index from a Date array ---
      {
        let dateProbe: util.types = new util.types();
        let list: Date[] = [new Date(0), new Date(1)];
        let chosen: Date = pickDateAt(list, 0);
        expect(dateProbe.isDate(chosen)).assertTrue();
        expect(chosen.getTime()).assertEqual(0);
      }

      // --- [5] Verify a Map that stores Dates on both sides yields two positive isDate results when iterated ---
      {
        let dateProbe: util.types = new util.types();
        let key: Date = new Date(0);
        let value: Date = new Date(1);
        let bag: Map<Date, Date> = new Map<Date, Date>();
        bag.set(key, value);
        let hits: int = 0;
        for (const k of bag.keys()) {
          if (dateProbe.isDate(k)) {
            hits = hits + 1;
          }
        }
        for (const v of bag.values()) {
          if (dateProbe.isDate(v)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0400
     * @tc.name testTypesIsDate004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: two distinct Date objects carrying the same timestamp are both Dates; a Date built from a UTC stamp and the timestamp it reports land on opposite isDate verdicts; a boolean variable assigned from isDate carries the expected value; an if else if chain prefers the isDate branch for a Date value; accepts a Date round tripped through an Object typed identity function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two distinct Date objects carrying the same timestamp are both Dates ---
      {
        let dateProbe: util.types = new util.types();
        let first: Date = new Date(0);
        let second: Date = new Date(0);
        expect(dateProbe.isDate(first)).assertTrue();
        expect(dateProbe.isDate(second)).assertTrue();
        expect(first === second).assertFalse();
      }

      // --- [2] Verify a Date built from a UTC stamp and the timestamp it reports land on opposite isDate verdicts ---
      {
        let dateProbe: util.types = new util.types();
        let stamp: Date = new Date(Date.UTC(2000, 0, 1));
        let verdicts: Record<string, boolean> = {
          'instance': dateProbe.isDate(stamp),
          'stamp': dateProbe.isDate(stamp.getTime())
        };
        expect(verdicts['instance']!).assertTrue();
        expect(verdicts['stamp']!).assertFalse();
      }

      // --- [3] Verify a boolean variable assigned from isDate carries the expected value ---
      {
        let dateChecker: util.types = new util.types();
        let isStamp: boolean = dateChecker.isDate(new Date(0));
        let isText: boolean = dateChecker.isDate('2024-01-01');
        expect(isStamp).assertTrue();
        expect(isText).assertFalse();
      }

      // --- [4] Verify an if else if chain prefers the isDate branch for a Date value ---
      {
        let dateProbe: util.types = new util.types();
        let value: Object = new Date(0);
        let label: string = 'none';
        if (dateProbe.isDate(value)) {
          label = 'stamp';
        } else if (value instanceof PlainBox) {
          label = 'box';
        }
        expect(label).assertEqual('stamp');
      }

      // --- [5] Verify isDate returns true for a Date round tripped through an Object typed identity function ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        let widened: Object = identityObject(d);
        expect(dateProbe.isDate(widened)).assertTrue();
        expect(widened instanceof Date).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0500
     * @tc.name testTypesIsDate005
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: accepts a subclass of Date built with a timestamp and an extra label field; accepts two same-time subclass instances that differ only by their label value; isDate accepts both a plain Date and a subclass instance; a subclass of Date stays a Date and keeps its own field after setTime rewrites its timestamp; accepts a Date subclass used as a Map key.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns true for a subclass of Date built with a timestamp and an extra label field ---
      {
        let dateProbe: util.types = new util.types();
        let d: LoggedDate = new LoggedDate(86400000, 'day');
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime()).assertEqual(86400000);
        expect(d.label).assertEqual('day');
      }

      // --- [2] Verify isDate returns true for two same-time subclass instances that differ only by their label value ---
      {
        let dateProbe: util.types = new util.types();
        let first: LoggedDate = new LoggedDate(0, 'alpha');
        let second: LoggedDate = new LoggedDate(0, 'beta');
        expect(dateProbe.isDate(first)).assertTrue();
        expect(dateProbe.isDate(second)).assertTrue();
        expect(first.label).assertEqual('alpha');
        expect(second.label).assertEqual('beta');
      }

      // --- [3] Verify isDate accepts both a plain Date and a subclass instance ---
      {
        let dateProbe: util.types = new util.types();
        let plain: Date = new Date(0);
        let derived: LoggedDate = new LoggedDate(0, 'tag');
        expect(dateProbe.isDate(plain)).assertTrue();
        expect(dateProbe.isDate(derived)).assertTrue();
      }

      // --- [4] Verify a subclass of Date stays a Date and keeps its own field after setTime rewrites its timestamp ---
      {
        let dateProbe: util.types = new util.types();
        let d: LoggedDate = new LoggedDate(0, 'editable');
        d.setTime(5000);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime()).assertEqual(5000);
        expect(d.label).assertEqual('editable');
      }

      // --- [5] Verify isDate returns true for a Date subclass used as a Map key ---
      {
        let dateProbe: util.types = new util.types();
        let key: SubDate = new SubDate();
        let bag: Map<SubDate, int> = new Map<SubDate, int>();
        bag.set(key, 7);
        for (const item of bag.keys()) {
          expect(dateProbe.isDate(item)).assertTrue();
          expect(item instanceof SubDate).assertTrue();
        }
        expect(bag.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0600
     * @tc.name testTypesIsDate006
     * @tc.desc Merged batch (5 tests): Type conversion and subclassing: accepts a Date subclass carried through a Set without losing its own field; subclass instance stored as an element of a Date array; subclass instance stored in an Object typed class field; a Date built from epoch milliseconds and one parsed from ISO text of the same instant agree on the timestamp; Date subclass returned by an indexing helper.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns true for a Date subclass carried through a Set without losing its own field ---
      {
        let dateProbe: util.types = new util.types();
        let mark: LoggedDate = new LoggedDate(0, 'checked');
        let marks: Set<Date> = new Set<Date>();
        marks.add(mark);
        for (const item of marks) {
          expect(dateProbe.isDate(item)).assertTrue();
        }
        expect(mark.label).assertEqual('checked');
        expect(marks.size).assertEqual(1);
      }

      // --- [2] Verify isDate returns true for a subclass instance stored as an element of a Date array ---
      {
        let dateProbe: util.types = new util.types();
        let list: Date[] = [new Date(0), new LoggedDate(1, 'one')];
        expect(dateProbe.isDate(list[1])).assertTrue();
        expect(list[1] instanceof LoggedDate).assertTrue();
        expect(list.length).assertEqual(2);
      }

      // --- [3] Verify isDate returns true for a subclass instance stored in an Object typed class field ---
      {
        let dateProbe: util.types = new util.types();
        let box: SlotBox = new SlotBox();
        box.slot = new SubDate();
        expect(dateProbe.isDate(box.slot)).assertTrue();
        expect(box.slot instanceof Date).assertTrue();
      }

      // --- [4] Verify a Date built from epoch milliseconds and one parsed from ISO text of the same instant agree on the timestamp ---
      {
        let dateProbe: util.types = new util.types();
        let numeric: Date = new Date(0);
        let parsed: Date = new Date('1970-01-01T00:00:00.000Z');
        expect(dateProbe.isDate(numeric)).assertTrue();
        expect(dateProbe.isDate(parsed)).assertTrue();
        expect(parsed.getTime()).assertEqual(numeric.getTime());
      }

      // --- [5] Verify isDate returns true for a Date subclass returned by an indexing helper ---
      {
        let dateProbe: util.types = new util.types();
        let box: Date[] = [new SubDate()];
        let fetched: Date = pickDateAt(box, 0);
        expect(dateProbe.isDate(fetched)).assertTrue();
        expect(fetched instanceof SubDate).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0700
     * @tc.name testTypesIsDate007
     * @tc.desc Merged batch (2 tests): Type conversion and subclassing: a Date widened to Object is still recognised by the instanceof Date operator; subclass instance keeps the timestamp fixed by its constructor.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Date widened to Object is still recognised by the instanceof Date operator ---
      {
        let dateProbe: util.types = new util.types();
        let widened: Object = new SubDate();
        expect(widened instanceof Date).assertTrue();
        expect(dateProbe.isDate(widened)).assertTrue();
      }

      // --- [2] Verify a Date subclass instance keeps the timestamp fixed by its constructor ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new SubDate();
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime()).assertEqual(0);
        expect(d instanceof SubDate).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0800
     * @tc.name testTypesIsDate008
     * @tc.desc Merged batch (5 tests): Boundary values: isDate rejects the empty string, the date shaped text 2024-01-01 and the sentinel text Invalid Date in one pass; rejects an empty array; rejects an empty ArrayBuffer, a zero length Uint8Array and a Uint8ClampedArray; rejects a non empty ArrayBuffer reached through an Object typed reference; rejects a zero length DataView, a BigInt64Array and a BigUint64Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate rejects the empty string, the date shaped text 2024-01-01 and the sentinel text Invalid Date in one pass ---
      {
        let dateProbe: util.types = new util.types();
        let candidates: string[] = ['', '2024-01-01', 'Invalid Date'];
        let accepted: int = 0;
        for (let i: int = 0; i < candidates.length; i++) {
          if (dateProbe.isDate(candidates[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [2] Verify isDate returns false for an empty array ---
      {
        let dateProbe: util.types = new util.types();
        let empty: int[] = [];
        expect(dateProbe.isDate(empty)).assertFalse();
        expect(empty.length).assertEqual(0);
      }

      // --- [3] Verify isDate returns false for an empty ArrayBuffer, a zero length Uint8Array and a Uint8ClampedArray ---
      {
        let dateProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Uint8Array = new Uint8Array(0);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(8);
        expect(dateProbe.isDate(buf)).assertFalse();
        expect(buf.byteLength).assertEqual(0);
        expect(dateProbe.isDate(arr)).assertFalse();
        expect(arr.byteLength).assertEqual(0);
        expect(dateProbe.isDate(clamped)).assertFalse();
        expect(clamped.byteLength).assertEqual(8);
      }

      // --- [4] Verify isDate returns false for a non empty ArrayBuffer reached through an Object typed reference ---
      {
        let dateProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let held: Object = buf;
        expect(dateProbe.isDate(held)).assertFalse();
        expect(buf.byteLength).assertEqual(8);
      }

      // --- [5] Verify isDate returns false for a zero length DataView, a BigInt64Array and a BigUint64Array ---
      {
        let dateProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(0));
        let big: BigInt64Array = new BigInt64Array(new ArrayBuffer(16));
        let bigUnsigned: BigUint64Array = new BigUint64Array(new ArrayBuffer(16));
        expect(dateProbe.isDate(dv)).assertFalse();
        expect(dv.byteLength).assertEqual(0);
        expect(dateProbe.isDate(big)).assertFalse();
        expect(big.byteLength).assertEqual(16);
        expect(dateProbe.isDate(bigUnsigned)).assertFalse();
        expect(bigUnsigned.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_0900
     * @tc.name testTypesIsDate009
     * @tc.desc Merged batch (4 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering day-length spans and related extreme values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate rejects the doubles 0.0, -0.0, 1.5, NaN, both infinities and 2.220446049250313e-16 in a single pass ---
      {
        let dateProbe: util.types = new util.types();
        let notANumber: double = Double.NaN;
        let values: double[] = [0.0, -0.0, 1.5, notANumber, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, 2.220446049250313e-16];
        let hits: int = 0;
        for (const value of values) {
          if (dateProbe.isDate(value)) {
            hits = hits + 1;
          }
        }
        expect(isNaN(notANumber)).assertTrue();
        expect(hits).assertEqual(0);
      }

      // --- [2] Verify isDate rejects the longs 1684566000000, 8640000000000000, -8640000000000000, 9007199254740991 and -9007199254740991 in a single pass ---
      {
        let dateProbe: util.types = new util.types();
        let values: long[] = [1684566000000, 8640000000000000, -8640000000000000, 9007199254740991, -9007199254740991];
        let hits: int = 0;
        for (const value of values) {
          if (dateProbe.isDate(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify isDate returns false for Number.MAX_VALUE and Number.MIN_VALUE in a single pass ---
      {
        let dateProbe: util.types = new util.types();
        let extremes: double[] = [Number.MAX_VALUE, Number.MIN_VALUE];
        let hits: int = 0;
        for (const value of extremes) {
          if (dateProbe.isDate(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [4] Verify isDate returns false for the double value 1e21 which exceeds every Date range ---
      {
        let dateChecker: util.types = new util.types();
        let value: double = 1e21;
        expect(dateChecker.isDate(value)).assertFalse();
        expect(dateChecker.isDate(-1e21)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1000
     * @tc.name testTypesIsDate010
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the millisecond timestamp number returned by Date.now(); accepts the int 0, the long 86400000 and the integral double 1.0 are rejected while matching Dates; rejects the int values -1 and the year shaped 2023 in a single pass; rejects a float typed value; rejects both boolean primitives true and false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for the millisecond timestamp number returned by Date.now() ---
      {
        let dateChecker: util.types = new util.types();
        let b: boolean = dateChecker.isDate(Date.now());
        expect(b).assertFalse();
      }

      // --- [2] Verify the int 0, the long 86400000 and the integral double 1.0 are rejected while matching Dates are accepted ---
      {
        let dateChecker: util.types = new util.types();
        let zero: int = 0;
        let day: long = 86400000;
        let integral: double = 1.0;
        expect(dateChecker.isDate(zero)).assertFalse();
        expect(dateChecker.isDate(day)).assertFalse();
        expect(dateChecker.isDate(integral)).assertFalse();
        expect(dateChecker.isDate(new Date(0))).assertTrue();
        expect(dateChecker.isDate(new Date(86400000))).assertTrue();
        expect(dateChecker.isDate(new Date(1))).assertTrue();
      }

      // --- [3] Verify isDate returns false for the int values -1 and the year shaped 2023 in a single pass ---
      {
        let dateProbe: util.types = new util.types();
        let integers: int[] = [-1, 2023];
        let hits: int = 0;
        for (const value of integers) {
          if (dateProbe.isDate(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [4] Verify isDate returns false for a float typed value ---
      {
        let dateProbe: util.types = new util.types();
        let value: float = 1.5f;
        expect(dateProbe.isDate(value)).assertFalse();
      }

      // --- [5] Verify isDate returns false for both boolean primitives true and false ---
      {
        let dateProbe: util.types = new util.types();
        let flags: boolean[] = [true, false];
        let accepted: int = 0;
        for (let i: int = 0; i < flags.length; i++) {
          if (dateProbe.isDate(flags[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1100
     * @tc.name testTypesIsDate011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a long repeated text value; isDate rejects a Date shaped object whose getTime returns a plain number; rejects an int array; the ISO text produced by a Date is rejected by isDate even though it came from a Date; rejects the UTC, date, time and locale string forms produced by a date object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for a long repeated text value ---
      {
        let dateProbe: util.types = new util.types();
        let text: string = 'x'.repeat(10000);
        expect(dateProbe.isDate(text)).assertFalse();
        expect(text.length).assertEqual(10000);
      }

      // --- [2] Verify isDate rejects a Date shaped object whose getTime returns a plain number ---
      {
        let dateProbe: util.types = new util.types();
        let lookalike: DateLookalike = new DateLookalike();
        expect(dateProbe.isDate(lookalike)).assertFalse();
        expect(dateProbe.isDate(lookalike.getTime())).assertFalse();
      }

      // --- [3] Verify isDate returns false for an int array ---
      {
        let dateProbe: util.types = new util.types();
        let nums: int[] = [1, 2, 3];
        expect(dateProbe.isDate(nums)).assertFalse();
        expect(nums.length).assertEqual(3);
      }

      // --- [4] Verify the ISO text produced by a Date is rejected by isDate even though it came from a Date ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        let text: string = d.toISOString();
        expect(dateProbe.isDate(text)).assertFalse();
        expect(text.startsWith('1970')).assertTrue();
      }

      // --- [5] Verify isDate returns false for the UTC, date, time and locale string forms produced by a date object ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        expect(dateProbe.isDate(d.toUTCString())).assertFalse();
        expect(dateProbe.isDate(d.toDateString())).assertFalse();
        expect(dateProbe.isDate(d.toTimeString())).assertFalse();
        expect(dateProbe.isDate(d.toLocaleString())).assertFalse();
        expect(dateProbe.isDate(d.toLocaleDateString())).assertFalse();
        expect(dateProbe.isDate(d.toLocaleTimeString())).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1200
     * @tc.name testTypesIsDate012
     * @tc.desc Merged batch (3 tests): Primitive value rejection: rejects the JSON text produced by toJSON of a valid Date while the text is not null; the error thrown for an unparseable string is not a Date under the instanceof operator nor under isDate; field getters and the isDateValid boolean of a valid Date.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for the JSON text produced by toJSON of a valid Date while the text is not null ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        let json: string | null = d.toJSON();
        let flagged: boolean = false;
        let iso: boolean = false;
        if (json !== null) {
          flagged = dateProbe.isDate(json);
          iso = json.startsWith('1970');
        }
        expect(json !== null).assertTrue();
        expect(flagged).assertFalse();
        expect(iso).assertTrue();
      }

      // --- [2] Verify the error thrown for an unparseable string is not a Date under the instanceof operator nor under isDate ---
      {
        let dateProbe: util.types = new util.types();
        let rejected: Object = objectFromUnparseableText();
        expect(rejected instanceof Date).assertFalse();
        expect(dateProbe.isDate(rejected)).assertFalse();
      }

      // --- [3] Verify isDate returns false for the field getters and the isDateValid boolean of a valid Date ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(86400000);
        let flags: boolean[] = [
          dateProbe.isDate(d.getFullYear()),
          dateProbe.isDate(d.getMonth()),
          dateProbe.isDate(d.getSeconds()),
          dateProbe.isDate(d.getMilliseconds()),
          dateProbe.isDate(d.isDateValid())
        ];
        expect(d.isDateValid()).assertTrue();
        expect(flags[0]).assertFalse();
        expect(flags[1]).assertFalse();
        expect(flags[2]).assertFalse();
        expect(flags[3]).assertFalse();
        expect(flags[4]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1300
     * @tc.name testTypesIsDate013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a RegExp instance and plain Error instance; rejects TypeError and RangeError instances; resolved Promise; plain named function reference; synchronous arrow function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for a RegExp instance and plain Error instance ---
      {
        let dateChecker: util.types = new util.types();
        let re: RegExp = new RegExp('probe');
        expect(dateChecker.isDate(re)).assertFalse();
        expect(dateChecker.isRegExp(re)).assertTrue();
        let dateProbe: util.types = new util.types();
        let err: Error = new Error('probe');
        expect(dateProbe.isDate(err)).assertFalse();
        expect(err.message).assertEqual('probe');
      }

      // --- [2] Verify isDate returns false for TypeError and RangeError instances ---
      {
        let dateChecker: util.types = new util.types();
        let typeErr: Error = new TypeError('probe');
        let rangeErr: Error = new RangeError('probe');
        expect(dateChecker.isDate(typeErr)).assertFalse();
        expect(dateChecker.isDate(rangeErr)).assertFalse();
      }

      // --- [3] Verify isDate returns false for a resolved Promise ---
      {
        let dateChecker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(dateChecker.isDate(p)).assertFalse();
        expect(dateChecker.isDate(new Date(0))).assertTrue();
      }

      // --- [4] Verify isDate returns false for a plain named function reference ---
      {
        let dateProbe: util.types = new util.types();
        expect(dateProbe.isDate(plainNumberFn)).assertFalse();
        expect(plainNumberFn()).assertEqual(2);
      }

      // --- [5] Verify isDate returns false for a synchronous arrow function ---
      {
        let dateProbe: util.types = new util.types();
        let fn: Function = (): int => 5;
        expect(dateProbe.isDate(fn)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1400
     * @tc.name testTypesIsDate014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an async function reference and arrow function; unbound method reference taken from a class instance; rejects a nested array; Object array whose elements are not Dates; rejects a Map instance even when it stores a Date.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for an async function reference and arrow function ---
      {
        let dateProbe: util.types = new util.types();
        expect(dateProbe.isDate(asyncNumberTask)).assertFalse();
        let dateProbe_2: util.types = new util.types();
        let fn: Function = async (): Promise<void> => { };
        expect(dateProbe_2.isDate(fn)).assertFalse();
      }

      // --- [2] Verify isDate returns false for an unbound method reference taken from a class instance ---
      {
        let dateProbe: util.types = new util.types();
        expect(dateProbe.isDate(new PlainBox().probe)).assertFalse();
        expect(new PlainBox().probe()).assertEqual(1);
      }

      // --- [3] Verify isDate returns false for a nested array ---
      {
        let dateProbe: util.types = new util.types();
        let nested: int[][] = [[1], [2, 3]];
        expect(dateProbe.isDate(nested)).assertFalse();
        expect(nested[1].length).assertEqual(2);
      }

      // --- [4] Verify isDate returns false for an Object array whose elements are not Dates ---
      {
        let dateProbe: util.types = new util.types();
        let mixed: Object[] = [1, 'x', true];
        expect(dateProbe.isDate(mixed)).assertFalse();
        expect(dateProbe.isDate(mixed[0])).assertFalse();
        expect(mixed.length).assertEqual(3);
      }

      // --- [5] Verify isDate returns false for a Map instance even when it stores a Date ---
      {
        let dateProbe: util.types = new util.types();
        let bag: Map<string, Date> = new Map<string, Date>();
        bag.set('when', new Date(0));
        expect(dateProbe.isDate(bag)).assertFalse();
        expect(bag.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1500
     * @tc.name testTypesIsDate015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Set instance even when it stores Dates; WeakMap instance and WeakSet instance; Map keys iterator; Set values iterator; windowed DataView taken from the middle of a buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for a Set instance even when it stores Dates ---
      {
        let dateProbe: util.types = new util.types();
        let marks: Set<Date> = new Set<Date>();
        marks.add(new Date(0));
        expect(dateProbe.isDate(marks)).assertFalse();
        expect(marks.size).assertEqual(1);
      }

      // --- [2] Verify isDate returns false for a WeakMap instance and WeakSet instance ---
      {
        let dateChecker: util.types = new util.types();
        let key: WeakKey = new WeakKey();
        let wm: WeakMap<WeakKey, WeakKey> = new WeakMap<WeakKey, WeakKey>();
        wm.set(key, key);
        expect(dateChecker.isDate(wm)).assertFalse();
        expect(dateChecker.isDate(key)).assertFalse();
        let dateChecker_2: util.types = new util.types();
        let ws: WeakSet<WeakKey> = new WeakSet<WeakKey>();
        ws.add(new WeakKey());
        expect(dateChecker_2.isDate(ws)).assertFalse();
        expect(dateChecker_2.isDate(new WeakKey())).assertFalse();
      }

      // --- [3] Verify isDate returns false for a Map keys iterator ---
      {
        let dateProbe: util.types = new util.types();
        let m: Map<string, string> = new Map<string, string>();
        m.set('k', 'v');
        let it1: IterableIterator<string> = m.keys();
        expect(dateProbe.isDate(it1)).assertFalse();
        expect(m.size).assertEqual(1);
      }

      // --- [4] Verify isDate returns false for a Set values iterator ---
      {
        let dateProbe: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        s.add('v');
        let it1: IterableIterator<string> = s.values();
        expect(dateProbe.isDate(it1)).assertFalse();
        expect(s.size).assertEqual(1);
      }

      // --- [5] Verify isDate returns false for a windowed DataView taken from the middle of a buffer ---
      {
        let dateProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(buf, 2, 4);
        expect(dateProbe.isDate(dv)).assertFalse();
        expect(dv.byteOffset).assertEqual(2);
        expect(dv.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1600
     * @tc.name testTypesIsDate016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Uint8Array view taken over a named buffer; rejects Int8Array, Int16Array, Uint16Array, Int32Array and Uint32Array views that each hold eight bytes; rejects an interface shaped object literal and two views that share one ArrayBuffer; rejects a subarray view smaller than its backing store; isDate rejects an arrow function while accepting the Date it produces.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for a Uint8Array view taken over a named buffer ---
      {
        let dateProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(buf);
        expect(dateProbe.isDate(uint8View)).assertFalse();
        expect(uint8View.length).assertEqual(8);
        expect(uint8View.byteOffset).assertEqual(0);
      }

      // --- [2] Verify isDate returns false for Int8Array, Int16Array, Uint16Array, Int32Array and Uint32Array views that each hold eight bytes ---
      {
        let dateProbe: util.types = new util.types();
        let arrInt8: Int8Array = new Int8Array(8);
        expect(dateProbe.isDate(arrInt8)).assertFalse();
        expect(arrInt8.byteLength).assertEqual(8);
        let arrInt16: Int16Array = new Int16Array(4);
        expect(dateProbe.isDate(arrInt16)).assertFalse();
        expect(arrInt16.byteLength).assertEqual(8);
        let arrUint16: Uint16Array = new Uint16Array(4);
        expect(dateProbe.isDate(arrUint16)).assertFalse();
        expect(arrUint16.byteLength).assertEqual(8);
        let arrInt32: Int32Array = new Int32Array(2);
        expect(dateProbe.isDate(arrInt32)).assertFalse();
        expect(arrInt32.byteLength).assertEqual(8);
        let arrUint32: Uint32Array = new Uint32Array(2);
        expect(dateProbe.isDate(arrUint32)).assertFalse();
        expect(arrUint32.byteLength).assertEqual(8);
      }

      // --- [3] Verify isDate returns false for an interface shaped object literal and two views that share one ArrayBuffer ---
      {
        let dateProbe: util.types = new util.types();
        let pair: TaggedPair = { tag: 'x' };
        expect(dateProbe.isDate(pair)).assertFalse();
        expect(pair.tag).assertEqual('x');
        let dateChecker: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let uint8View: Uint8Array = new Uint8Array(buf);
        let dv: DataView = new DataView(buf);
        expect(dateChecker.isDate(uint8View)).assertFalse();
        expect(dateChecker.isDate(dv)).assertFalse();
        expect(dateChecker.isArrayBufferView(uint8View)).assertTrue();
        expect(dateChecker.isArrayBufferView(dv)).assertTrue();
      }

      // --- [4] Verify isDate returns false for a subarray view smaller than its backing store ---
      {
        let dateProbe: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(8);
        let sub: Uint8Array = base.subarray(1, 3);
        expect(dateProbe.isDate(sub)).assertFalse();
        expect(sub.byteLength).assertEqual(2);
        expect(sub.byteOffset).assertEqual(1);
      }

      // --- [5] Verify isDate rejects an arrow function while accepting the Date it produces ---
      {
        let dateChecker: util.types = new util.types();
        let makeStamp: () => Date = (): Date => new Date(0);
        expect(dateChecker.isDate(makeStamp)).assertFalse();
        expect(dateChecker.isDate(makeStamp())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1700
     * @tc.name testTypesIsDate017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects the getTime method reference taken from a Date instance; a two element Float64Array collects a false date verdict and a true float64 verdict; numbers from parse, UTC and timezone accessors and from valueOf, getTimezoneOffset and setTime are rejected while setTime advances the Date; isDate rejects a Map key iterator while accepting the Date keys it yields; the element of a Uint8Array is readable after isDate returns false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for the getTime method reference taken from a Date instance ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        expect(dateProbe.isDate(d.getTime)).assertFalse();
        expect(d.getTime()).assertEqual(0);
      }

      // --- [2] Verify a two element Float64Array collects a false date verdict and a true float64 verdict ---
      {
        let dateChecker: util.types = new util.types();
        let arr: Float64Array = new Float64Array([1.5, 2.5]);
        let verdicts: boolean[] = [dateChecker.isDate(arr), dateChecker.isFloat64Array(arr)];
        expect(verdicts).assertDeepEquals([false, true]);
        expect(arr.length).assertEqual(2);
      }

      // --- [3] Verify numbers from parse, UTC and timezone accessors and from valueOf, getTimezoneOffset and setTime are rejected while setTime advances the Date ---
      {
        let dateProbe: util.types = new util.types();
        let iso: string = '2024-01-01T00:00:00Z';
        let parsed: long = Date.parse(iso);
        let utc: long = Date.UTC(2024, 0, 1);
        let zoneName: string = Date.getTimezoneName(parsed);
        let zoneOffset: long = Date.getLocalTimezoneOffset(parsed);
        expect(dateProbe.isDate(parsed)).assertFalse();
        expect(dateProbe.isDate(utc)).assertFalse();
        expect(dateProbe.isDate(zoneName)).assertFalse();
        expect(dateProbe.isDate(zoneOffset)).assertFalse();
        expect(zoneName.length).assertLarger(0);
        let dateProbe_2: util.types = new util.types();
        let d: Date = new Date(86400000);
        let before: long = d.valueOf();
        let zone: long = d.getTimezoneOffset();
        let moved: long = d.setTime(before + 60000);
        expect(dateProbe_2.isDate(before)).assertFalse();
        expect(dateProbe_2.isDate(zone)).assertFalse();
        expect(dateProbe_2.isDate(moved)).assertFalse();
        expect(moved).assertEqual(before + 60000);
        expect(d.valueOf()).assertEqual(moved);
      }

      // --- [4] Verify isDate rejects a Map key iterator while accepting the Date keys it yields ---
      {
        let dateChecker: util.types = new util.types();
        let bag: Map<Date, string> = new Map<Date, string>();
        bag.set(new Date(0), 'epoch');
        let iter: IterableIterator<Date> = bag.keys();
        expect(dateChecker.isDate(iter)).assertFalse();
        for (const key of iter) {
          expect(dateChecker.isDate(key)).assertTrue();
        }
      }

      // --- [5] Verify the element of a Uint8Array is readable after isDate returns false ---
      {
        let dateProbe: util.types = new util.types();
        let arr: Uint8Array = new Uint8Array(4);
        arr.$_set(0, 255);
        expect(dateProbe.isDate(arr)).assertFalse();
        expect(arr.$_get(0)).assertEqual(255);
        expect(arr.byteLength).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1800
     * @tc.name testTypesIsDate018
     * @tc.desc Merged batch (4 tests): Non-target object rejection: checks rejection of unrelated objects, covering buffer capacity and other unrelated kinds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an ArrayBuffer keeps its byte length and a Map keeps its entry after isDate returns false ---
      {
        let dateProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let before: int = buf.byteLength;
        expect(dateProbe.isDate(buf)).assertFalse();
        expect(buf.byteLength).assertEqual(before);
        expect(buf.byteLength).assertEqual(16);
        let dateProbe_2: util.types = new util.types();
        let bag: Map<string, string> = new Map<string, string>();
        bag.set('k', 'v');
        expect(dateProbe_2.isDate(bag)).assertFalse();
        expect(bag.size).assertEqual(1);
        expect(bag.has('k')).assertTrue();
      }

      // --- [2] Verify isDate returns false for a Set values iterator while the source Set is unchanged after draining ---
      {
        let dateProbe: util.types = new util.types();
        let marks: Set<string> = new Set<string>();
        marks.add('a');
        marks.add('b');
        let iter: IterableIterator<string> = marks.values();
        expect(dateProbe.isDate(iter)).assertFalse();
        let emitted: int = 0;
        for (const item of iter) {
          emitted = emitted + 1;
        }
        expect(emitted).assertEqual(2);
        expect(marks.size).assertEqual(2);
      }

      // --- [3] Verify isDate does not alter the year component of the Date it inspects ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(2024, 0, 1);
        let before: double = d.getFullYear();
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getFullYear()).assertEqual(before);
      }

      // --- [4] Verify a Date passes isDate while the same instance fails isMap ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(dateProbe.isMap(d)).assertFalse();
        expect(d.getTime()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_1900
     * @tc.name testTypesIsDate019
     * @tc.desc Merged batch (3 tests): Non-date rejection: verifies isDate returns false for float and bigint views, another checker instance and a plain class object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns false for Float32Array and Float64Array views ---
      {
        let dateProbe: util.types = new util.types();
        let arrFloat32: Float32Array = new Float32Array(2);
        expect(dateProbe.isDate(arrFloat32)).assertFalse();
        expect(arrFloat32.byteLength).assertEqual(8);
        let arrFloat64: Float64Array = new Float64Array(1);
        expect(dateProbe.isDate(arrFloat64)).assertFalse();
        expect(arrFloat64.byteLength).assertEqual(8);
      }

      // --- [2] Verify isDate returns false for another util.types instance ---
      {
        let dateProbe: util.types = new util.types();
        let other: util.types = new util.types();
        expect(dateProbe.isDate(other)).assertFalse();
        expect(other.isDate(new Date(0))).assertTrue();
      }

      // --- [3] Verify isDate returns false for a plain class instance ---
      {
        let dateProbe: util.types = new util.types();
        let box: PlainBox = new PlainBox();
        expect(dateProbe.isDate(box)).assertFalse();
        expect(box.id).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_DATE_2000
     * @tc.name testTypesIsDate020
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: accepts a Date whose timestamp was swapped by setTime with one day of milliseconds; the last setTime call wins and the rewritten Date is still reported as a Date; whose year was rewritten by setFullYear and component built Date whose hours were rewritten by setHours; rebuilt from the Date.UTC timestamp and keeps both the calendar year and the millisecond part; moved before the epoch by setTime.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsDate020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isDate returns true for a Date whose timestamp was swapped by setTime with one day of milliseconds ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        d.setTime(86400000);
        let judged: boolean = dateProbe.isDate(d);
        expect(judged).assertTrue();
        expect(d.getTime()).assertEqual(86400000);
      }

      // --- [2] Verify the last setTime call wins and the rewritten Date is still reported as a Date ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        d.setTime(1000);
        d.setTime(2000);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime()).assertEqual(2000);
      }

      // --- [3] Verify isDate returns true for a Date whose year was rewritten by setFullYear and component built Date whose hours were rewritten by setHours ---
      {
        let d: Date = new Date(0);
        d.setFullYear(2000);
        let kind: int = classifyAsDate(d);
        expect(kind).assertEqual(1);
        expect(d.getFullYear()).assertEqual(2000);
        let dateProbe: util.types = new util.types();
        let d_2: Date = new Date(2024, 0, 1);
        d_2.setHours(6);
        expect(dateProbe.isDate(d_2)).assertTrue();
        expect(d_2.getHours()).assertEqual(6);
      }

      // --- [4] Verify isDate returns true for a Date rebuilt from the Date.UTC timestamp and keeps both the calendar year and the millisecond part ---
      {
        let dateProbe: util.types = new util.types();
        let stamp: long = Date.UTC(2024, 5, 15, 12, 30, 45, 321);
        let d: Date = new Date(stamp);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getUTCFullYear()).assertEqual(2024);
        expect(d.getUTCMilliseconds()).assertEqual(321);
      }

      // --- [5] Verify isDate returns true for a Date moved before the epoch by setTime ---
      {
        let dateProbe: util.types = new util.types();
        let d: Date = new Date(0);
        d.setTime(-1000);
        expect(dateProbe.isDate(d)).assertTrue();
        expect(d.getTime()).assertEqual(-1000);
      }
    });

  });
}
