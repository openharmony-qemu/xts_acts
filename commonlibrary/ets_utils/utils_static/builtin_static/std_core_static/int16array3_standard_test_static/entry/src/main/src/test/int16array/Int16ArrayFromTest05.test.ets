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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ObjWithVal001 {
  val: number;
}
interface ObjWithId002 {
  id: number;
}
interface ObjWithX003 {
  x: number;
}
class Item004 {
  value: number = 0;
  constructor(v: number) {
    this.value = v;
  }
  getValue(): number {
    return this.value;
  }
}
interface Point005 {
  x: number;
  y: number;
}
interface Tag006 {
  name: string;
}

export default function Int16ArrayFromTest05(): void {
  describe('Int16ArrayFromTest05', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0100
     * @tc.name testInt16ArrayFromTestFive001
     * @tc.desc Verify Int16Array.from extended ArrayLike interface, ArrayLike length=2, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(7);
      source.push(8);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 8;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0200
     * @tc.name testInt16ArrayFromTestFive002
     * @tc.desc Verify Int16Array.from ArrayLike length=1, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 5;
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.byteLength;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0300
     * @tc.name testInt16ArrayFromTestFive003
     * @tc.desc Verify Int16Array.from ArrayLike length=4, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      source.push(3);
      source.push(4);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.byteLength;
      let e1: int = 8;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0400
     * @tc.name testInt16ArrayFromTestFive004
     * @tc.desc Verify Int16Array.from with two string args length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['10', '20'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0500
     * @tc.name testInt16ArrayFromTestFive005
     * @tc.desc Verify Int16Array.from ArrayLike<string> length=0 Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = [];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 0;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0600
     * @tc.name testInt16ArrayFromTestFive006
     * @tc.desc Verify Int16Array.from ArrayLike<string> mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['42'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0700
     * @tc.name testInt16ArrayFromTestFive007
     * @tc.desc Verify Int16Array.from ArrayLike<string> mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['abc'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0800
     * @tc.name testInt16ArrayFromTestFive008
     * @tc.desc Verify Int16Array.from ArrayLike<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['10', '20', '30'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_0900
     * @tc.name testInt16ArrayFromTestFive009
     * @tc.desc Verify Int16Array.from ArrayLike<string> int16 "-32768"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['-32768'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1000
     * @tc.name testInt16ArrayFromTestFive010
     * @tc.desc Verify Int16Array.from ArrayLike<string> int16 "32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['32767'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1100
     * @tc.name testInt16ArrayFromTestFive011
     * @tc.desc Verify Int16Array.from ArrayLike<string> "32768" mapfn -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['32768'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1200
     * @tc.name testInt16ArrayFromTestFive012
     * @tc.desc Verify Int16Array.from ArrayLike<string> "-32769" mapfn 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['-32769'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return parseFloat(v);
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1300
     * @tc.name testInt16ArrayFromTestFive013
     * @tc.desc Verify Int16Array.from ArrayLike<string> length=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const count: int = 100;
      let source: Array<string> = [];
      for (let __i = 0; __i < count; __i++) {
        source.push('');
      }
      const result = Int16Array.from(source, (v: string, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k;
      });
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(99);
      let e3: int = 99;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1400
     * @tc.name testInt16ArrayFromTestFive014
     * @tc.desc Verify Int16Array.from ArrayLike<boolean> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<boolean> = [];
      const result = Int16Array.from(source, (v: boolean, k: number): number => {
        return v ? 1 : 0;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1500
     * @tc.name testInt16ArrayFromTestFive015
     * @tc.desc Verify Int16Array.from ArrayLike<boolean> true mapfn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<boolean> = [true];
      const result = Int16Array.from(source, (v: boolean, k: number): number => {
        return v ? 1 : 0;
      });
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1600
     * @tc.name testInt16ArrayFromTestFive016
     * @tc.desc Verify Int16Array.from ArrayLike<boolean> false mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<boolean> = [false];
      const result = Int16Array.from(source, (v: boolean, k: number): number => {
        return v ? 1 : 0;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1700
     * @tc.name testInt16ArrayFromTestFive017
     * @tc.desc Verify Int16Array.from ArrayLike<boolean> true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<boolean> = [true, false, true];
      const result = Int16Array.from(source, (v: boolean, k: number): number => {
        return v ? 1 : 0;
      });
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1800
     * @tc.name testInt16ArrayFromTestFive018
     * @tc.desc Verify Int16Array.from ArrayLike<Date> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<Date> = [];
      const result = Int16Array.from(source, (v: Date, k: number): number => {
        return v.getTime();
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_1900
     * @tc.name testInt16ArrayFromTestFive019
     * @tc.desc Verify Int16Array.from ArrayLike<Date> mapfn getTime() int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(100);
      let source: Array<Date> = [d];
      const result = Int16Array.from(source, (v: Date, k: number): number => {
        return v.getTime();
      });
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2000
     * @tc.name testInt16ArrayFromTestFive020
     * @tc.desc Verify Int16Array.from Date mapfn getTime multi values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(10);
      const d2: Date = new Date(20);
      let source: Array<Date> = [d1, d2];
      const result = Int16Array.from(source, (v: Date, k: number): number => {
        return v.getTime();
      });
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2100
     * @tc.name testInt16ArrayFromTestFive021
     * @tc.desc Verify Int16Array.from ArrayLike<object> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<object> = [];
      const result = Int16Array.from(source, (v: object, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 0;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2200
     * @tc.name testInt16ArrayFromTestFive022
     * @tc.desc Verify Int16Array.from ArrayLike<object> mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjWithVal001 = { val: 42 };
      let source: Array<object> = [obj as object];
      const result = Int16Array.from(source, (v: object, k: number): number => {
        return (v as ObjWithVal001).val;
      });
      let r1: number = result.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2300
     * @tc.name testInt16ArrayFromTestFive023
     * @tc.desc Verify Int16Array.from ArrayLike<object>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ObjWithId002 = { id: 100 };
      const o2: ObjWithId002 = { id: 200 };
      let source: Array<object> = [o1 as object, o2 as object];
      const result = Int16Array.from(source, (v: object, k: number): number => {
        return (v as ObjWithId002).id;
      });
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2400
     * @tc.name testInt16ArrayFromTestFive024
     * @tc.desc Verify Int16Array.from ArrayLike<object>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ObjWithX003 = { x: 7 };
      const o2: ObjWithX003 = { x: 7 };
      let source: Array<object> = [o1 as object, o2 as object];
      const result = Int16Array.from(source, (v: object, k: number): number => {
        return (v as ObjWithX003).x;
      });
      let r1: number = result.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2500
     * @tc.name testInt16ArrayFromTestFive025
     * @tc.desc Verify Int16Array.from ArrayLike<number> int16.MAX 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 32767;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2600
     * @tc.name testInt16ArrayFromTestFive026
     * @tc.desc Verify Int16Array.from ArrayLike<number> int16.MIN -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = -32768;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2700
     * @tc.name testInt16ArrayFromTestFive027
     * @tc.desc Verify Int16Array.from ArrayLike<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(32767);
      source.push(-32768);
      source.push(0);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2800
     * @tc.name testInt16ArrayFromTestFive028
     * @tc.desc Verify Int16Array.from ArrayLike<int> mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 99;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_2900
     * @tc.name testInt16ArrayFromTestFive029
     * @tc.desc Verify Int16Array.from three-element mapfn $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(-1);
      source.push(0);
      source.push(1);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3000
     * @tc.name testInt16ArrayFromTestFive030
     * @tc.desc Verify Int16Array.from ArrayLike<long> mapfn number int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 50000;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = -15536;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3100
     * @tc.name testInt16ArrayFromTestFive031
     * @tc.desc Verify Int16Array.from ArrayLike<long> long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(32767);
      source.push(-32768);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3200
     * @tc.name testInt16ArrayFromTestFive032
     * @tc.desc Verify Int16Array.from ArrayLike<double> mapfn int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 3.7;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3300
     * @tc.name testInt16ArrayFromTestFive033
     * @tc.desc Verify Int16Array.from ArrayLike<double> mapfn int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = -3.7;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3400
     * @tc.name testInt16ArrayFromTestFive034
     * @tc.desc Verify Int16Array.from ArrayLike<short> mapfn number Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = -100;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = -100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3500
     * @tc.name testInt16ArrayFromTestFive035
     * @tc.desc Verify Int16Array.from ArrayLike<float> mapfn int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 5.9;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3600
     * @tc.name testInt16ArrayFromTestFive036
     * @tc.desc Verify Int16Array.from ArrayLike<char> mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['A'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        return v.charCodeAt(0);
      });
      let r1: number = result.$_get(0);
      let e1: int = 65;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3700
     * @tc.name testInt16ArrayFromTestFive037
     * @tc.desc Verify Int16Array.from ArrayLike<bigint> BigInt mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<bigint> = [BigInt(100)];
      const result = Int16Array.from(source, (v: bigint, k: number): number => {
        return parseFloat(v.toString());
      });
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3800
     * @tc.name testInt16ArrayFromTestFive038
     * @tc.desc Verify Int16Array.from ArrayLike<RegExp> pattern number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc', '');
      let source: Array<RegExp> = [re];
      const result = Int16Array.from(source, (v: RegExp, k: number): number => {
        return v.source.length;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_3900
     * @tc.name testInt16ArrayFromTestFive039
     * @tc.desc Verify Int16Array.from ArrayLike<Error> Error message number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err: Error = new Error('test');
      let source: Array<Error> = [err];
      const result = Int16Array.from(source, (v: Error, k: number): number => {
        return v.message.length;
      });
      let r1: number = result.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4000
     * @tc.name testInt16ArrayFromTestFive040
     * @tc.desc Verify Int16Array.from ArrayLike<class > mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: Item004 = new Item004(77);
      let source: Array<Item004> = [item];
      const result = Int16Array.from(source, (v: Item004, k: number): number => {
        return v.getValue();
      });
      let r1: number = result.$_get(0);
      let e1: int = 77;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4100
     * @tc.name testInt16ArrayFromTestFive041
     * @tc.desc Verify Int16Array.from ArrayLike<Array<number>> mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      let source: Array<Array<number>> = [arr];
      const result = Int16Array.from(source, (v: Array<number>, k: number): number => {
        return v.length;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4200
     * @tc.name testInt16ArrayFromTestFive042
     * @tc.desc Verify Int16Array.from ArrayLike<Map<string,int>> mapfn size number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let source: Array<Map<string, int>> = [m];
      const result = Int16Array.from(source, (v: Map<string, int>, k: number): number => {
        return v.size;
      });
      let r1: number = result.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4300
     * @tc.name testInt16ArrayFromTestFive043
     * @tc.desc Verify Int16Array.from ArrayLike<Set<number>> mapfn size number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let source: Array<Set<number>> = [s];
      const result = Int16Array.from(source, (v: Set<number>, k: number): number => {
        return v.size;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4400
     * @tc.name testInt16ArrayFromTestFive044
     * @tc.desc Verify Int16Array.from ArrayLike<Int16Array> mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Int16Array = new Int16Array([5, 10, 15] as FixedArray<int>);
      let source: Array<Int16Array> = [inner];
      const result = Int16Array.from(source, (v: Int16Array, k: number): number => {
        return v.length;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4500
     * @tc.name testInt16ArrayFromTestFive045
     * @tc.desc Verify Int16Array.from ArrayLike<Promise<number>> mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      const p: Promise<number> = new Promise<number>((resolve: (v: number) => void, reject: (e: Error) => void) => {
        resolve(0);
      });
      let source: Array<Promise<number>> = [p];
      const result = Int16Array.from(source, (v: Promise<number>, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 99;
      });
      let r1: number = result.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4600
     * @tc.name testInt16ArrayFromTestFive046
     * @tc.desc Verify Int16Array.from ArrayLike<Record<string,number>> mapfn Record number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Point005 = { x: 50, y: 60 };
      let source: Array<Point005> = [rec];
      const result = Int16Array.from(source, (v: Point005, k: number): number => {
        return v.x;
      });
      let r1: number = result.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4700
     * @tc.name testInt16ArrayFromTestFive047
     * @tc.desc Verify Int16Array.from ArrayLike length mapfn defined value passed through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(3);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v === undefined ? -1 : v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4800
     * @tc.name testInt16ArrayFromTestFive048
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(10);
      source.push(20);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_4900
     * @tc.name testInt16ArrayFromTestFive049
     * @tc.desc Verify Int16Array.from three-element mapfn $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(1);
      source.push(1);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5000
     * @tc.name testInt16ArrayFromTestFive050
     * @tc.desc Verify Int16Array.from mapfn value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['hello'];
      let captured: string = '';
      const result = Int16Array.from(source, (v: string, k: number): number => {
        captured = v;
        return 0;
      });
      expect(captured).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5100
     * @tc.name testInt16ArrayFromTestFive051
     * @tc.desc Verify Int16Array.from mapfn value boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<boolean> = [true];
      let captured: boolean = false;
      const result = Int16Array.from(source, (v: boolean, k: number): number => {
        captured = v;
        return 0;
      });
      expect(captured).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5200
     * @tc.name testInt16ArrayFromTestFive052
     * @tc.desc Verify Int16Array.from mapfn value Date v Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(200);
      let source: Array<Date> = [d];
      let captured: Date = new Date(0);
      const result = Int16Array.from(source, (v: Date, k: number): number => {
        captured = v;
        return 0;
      });
      let r1: number = captured.getTime();
      let e1: int = 200;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5300
     * @tc.name testInt16ArrayFromTestFive053
     * @tc.desc Verify Int16Array.from mapfn value object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tag: Tag006 = { name: 'test' };
      let source: Array<Tag006> = [tag];
      let captured: string = '';
      const result = Int16Array.from(source, (v: Tag006, k: number): number => {
        captured = v.name;
        return 0;
      });
      expect(captured).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5400
     * @tc.name testInt16ArrayFromTestFive054
     * @tc.desc Verify Int16Array.from mapfn int16.MAX 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 32767;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5500
     * @tc.name testInt16ArrayFromTestFive055
     * @tc.desc Verify Int16Array.from mapfn int16.MIN -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -32768;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5600
     * @tc.name testInt16ArrayFromTestFive056
     * @tc.desc Verify Int16Array.from mapfn 32768 -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 32768;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5700
     * @tc.name testInt16ArrayFromTestFive057
     * @tc.desc Verify Int16Array.from mapfn -32769 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -32769;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5800
     * @tc.name testInt16ArrayFromTestFive058
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 0;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_5900
     * @tc.name testInt16ArrayFromTestFive059
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -1;
      });
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6000
     * @tc.name testInt16ArrayFromTestFive060
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return Number.NaN;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6100
     * @tc.name testInt16ArrayFromTestFive061
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return Number.POSITIVE_INFINITY;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6200
     * @tc.name testInt16ArrayFromTestFive062
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -Number.POSITIVE_INFINITY;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6300
     * @tc.name testInt16ArrayFromTestFive063
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 3.7;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6400
     * @tc.name testInt16ArrayFromTestFive064
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -3.7;
      });
      let r1: number = result.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6500
     * @tc.name testInt16ArrayFromTestFive065
     * @tc.desc Verify Int16Array.from mapfn large integer wraps to int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 9007199254740991;
      });
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6600
     * @tc.name testInt16ArrayFromTestFive066
     * @tc.desc Verify Int16Array.from multi-element mapfn $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      let external: number = 10;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v + external;
      });
      let r1: number = result.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 12;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6700
     * @tc.name testInt16ArrayFromTestFive067
     * @tc.desc Verify Int16Array.from three-element mapfn $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(0);
      source.push(0);
      source.push(0);
      let acc: number = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        acc = acc + 1;
        return acc;
      });
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6800
     * @tc.name testInt16ArrayFromTestFive068
     * @tc.desc Verify Int16Array.from three-element mapfn $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(0);
      source.push(0);
      source.push(0);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k * 10;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_6900
     * @tc.name testInt16ArrayFromTestFive069
     * @tc.desc Verify Int16Array.from four-element source mapfn called 4 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(0);
      source.push(0);
      source.push(0);
      source.push(0);
      let callCount: number = 0;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        callCount = callCount + 1;
        return k;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7000
     * @tc.name testInt16ArrayFromTestFive070
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 5;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v * 2;
      });
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7100
     * @tc.name testInt16ArrayFromTestFive071
     * @tc.desc Verify Int16Array.from (assertTrue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 1;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7200
     * @tc.name testInt16ArrayFromTestFive072
     * @tc.desc Verify Int16Array.from length arrayLike.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<string> = ['a', 'b', 'c'];
      const result = Int16Array.from(source, (v: string, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7300
     * @tc.name testInt16ArrayFromTestFive073
     * @tc.desc Verify Int16Array.from byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      const expectedBytes: number = 2 * Int16Array.BYTES_PER_ELEMENT;
      let r1: int = result.byteLength;
      let e1: number = expectedBytes;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7400
     * @tc.name testInt16ArrayFromTestFive074
     * @tc.desc Verify Int16Array.from multi-element mapfn $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<boolean> = [true, false];
      const result = Int16Array.from(source, (v: boolean, k: number): number => {
        return v ? 32768 : -32769;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7500
     * @tc.name testInt16ArrayFromTestFive075
     * @tc.desc Verify Int16Array.from ArrayLike Int16Array length=0, byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = result.byteLength;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7600
     * @tc.name testInt16ArrayFromTestFive076
     * @tc.desc Verify Int16Array.from $_set/$_get/$_get (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 42;
      const r1 = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      const r2 = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      r1.$_set(0, 99);
      let v1: number = r1.$_get(0);
      let e1: int = 99;
      expect(v1).assertEqual(e1);
      let v2: number = r2.$_get(0);
      let e2: int = 42;
      expect(v2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7700
     * @tc.name testInt16ArrayFromTestFive077
     * @tc.desc Verify Int16Array.from mapfn result stored via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = new Array<number>(1);
      source[0] = 10;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let source2: Array<number> = new Array<number>(1);
      source2[0] = 99;
      const result2 = Int16Array.from(source2, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result2.$_get(0);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7800
     * @tc.name testInt16ArrayFromTestFive078
     * @tc.desc Verify Int16Array.from mapfn throw Error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      try {
        Int16Array.from(source, (v: number, k: number): number => {
          if (v === undefined || v === null) {
            return 0;
          }
          throw new Error('mapfn-error');
        });
        expect().assertFail();
      } catch (e) {
        let rErrE: boolean = e !== null;
        expect(rErrE).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_7900
     * @tc.name testInt16ArrayFromTestFive079
     * @tc.desc Verify Int16Array.from mapfn throw Error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      source.push(3);
      try {
        Int16Array.from(source, (v: number, k: number): number => {
          if (k === 1) {
            throw new Error('mid-error');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        let rErrE: boolean = e !== null;
        expect(rErrE).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8000
     * @tc.name testInt16ArrayFromTestFive080
     * @tc.desc Verify Int16Array.from mapfn throw after first element processed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(10);
      source.push(20);
      let firstProcessed: boolean = false;
      try {
        Int16Array.from(source, (v: number, k: number): number => {
          if (k === 0) {
            firstProcessed = true;
            return v;
          }
          throw new Error('throw-at-1');
        });
        expect().assertFail();
      } catch (e) {
        expect(firstProcessed).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8100
     * @tc.name testInt16ArrayFromTestFive081
     * @tc.desc Verify Int16Array.from ArrayLike length mapfn defined value passed through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      for (let _i: int = 0; _i < 3; _i++) {
        source.push(0);
      }
      source[0] = 10;
      source[2] = 30;
      const result = Int16Array.from(source, (v: number, k: number): number => {
        return v === undefined ? -1 : v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8200
     * @tc.name testInt16ArrayFromTestFive082
     * @tc.desc Verify Int16Array.from Iterable Set arity=1 length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8300
     * @tc.name testInt16ArrayFromTestFive083
     * @tc.desc Verify Int16Array.from Iterable with mapfn length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v + 1;
      });
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8400
     * @tc.name testInt16ArrayFromTestFive084
     * @tc.desc Verify Int16Array.from multi-element Set length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      source.add(30);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(2);
      let e4: int = 30;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8500
     * @tc.name testInt16ArrayFromTestFive085
     * @tc.desc Verify Int16Array.from empty Set returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: boolean = result instanceof Int16Array;
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FIVE_8600
     * @tc.name testInt16ArrayFromTestFive086
     * @tc.desc Verify Int16Array.from single-element Set length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(42);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });
  });
}
