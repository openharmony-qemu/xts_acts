'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

class AL1S implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 77;
  }
}

class AL2E implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 5;
  }
}

class AL2M implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n * 100;
  }
}

class AL4S implements ArrayLike<number> {
  length: int = 4;

  $_get(n: int): number {
    return n + 1;
  }
}

class AL4T implements ArrayLike<number> {
  length: int = 4;

  $_get(n: int): number {
    return n + 10;
  }
}

class AL6B implements ArrayLike<number> {
  length: int = 6;

  $_get(n: int): number {
    return n * 11;
  }
}

class AL6O implements ArrayLike<number> {
  length: int = 6;

  $_get(n: int): number {
    return n;
  }
}

class ALBig implements ArrayLike<number> {
  length: int = 4;

  $_get(n: int): number {
    return n;
  }
}

class ALBL implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 7;
  }
}

class ALBO implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 7;
  }
}

class ALDef implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 1;
  }
}

class ALEmp implements ArrayLike<number> {
  length: int = 0;

  $_get(n: int): number {
    return 0;
  }
}

class ALEmp2 implements ArrayLike<number> {
  length: int = 0;

  $_get(n: int): number {
    return 999;
  }
}

class ALEmpN implements ArrayLike<number> {
  length: int = 0;

  $_get(n: int): number {
    return 0;
  }
}

class ALEmpOk implements ArrayLike<number> {
  length: int = 0;

  $_get(n: int): number {
    return 0;
  }
}

class ALF37 implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 3.7;
  }
}

class ALFLen implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 5;
  }
}

class ALFm09 implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return -0.9;
  }
}

class ALFMax implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 2147483647.9;
  }
}

class ALInvar implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n;
  }
}

class ALMix implements ArrayLike<number> {
  length: int = 4;

  $_get(n: int): number {
    if (n == 0) {
      return 1.5;
    }
    if (n == 1) {
      return Number.NaN;
    }
    if (n == 2) {
      return 2147483648.0;
    }
    return -2.8;
  }
}

class ALN implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n;
  }
}

class ALNeg implements ArrayLike<number> {
  length: int = 3;

  $_get(n: int): number {
    if (n == 0) {
      return -1;
    }
    if (n == 1) {
      return -100;
    }
    return -2147483648;
  }
}

class ALNegLen implements ArrayLike<number> {
  length: int = -1;

  $_get(n: int): number {
    return 999;
  }
}

class ALNEmpty implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 1;
  }
}

class ALNN implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 0;
  }
}

class ALO0 implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 7;
  }
}

class ALO1 implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n;
  }
}

class ALOEnd implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 100;
  }
}

class ALOffEnd implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 7;
  }
}

class ALOver1 implements ArrayLike<number> {
  length: int = 3;

  $_get(n: int): number {
    return n;
  }
}

class ALPres implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return 9;
  }
}

class ALS3 implements ArrayLike<number> {
  length: int = 3;

  $_get(n: int): number {
    return n * 10 + 1;
  }
}

class ALSame implements ArrayLike<number> {
  length: int = 3;

  $_get(n: int): number {
    return 42;
  }
}

class ALSelf implements ArrayLike<number> {
  ref: Int32Array;

  constructor(r: Int32Array) {
    this.ref = r;
  }

  length: int = 4;

  $_get(n: int): number {
    return this.ref.$_get(n);
  }
}

class ALSelf2 implements ArrayLike<number> {
  ref: Int32Array;

  constructor(r: Int32Array) {
    this.ref = r;
  }

  length: int = 3;

  $_get(n: int): number {
    return this.ref.$_get(n);
  }
}

class ALSh implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n == 0 ? 1 : 2;
  }
}

class ALSh2 implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 50;
  }
}

class ALState implements ArrayLike<number> {
  length: int = 3;
  c: number = 1;

  $_get(n: int): number {
    let r: number = this.c;
    this.c = this.c * 2;
    return r;
  }
}

class ALThrow implements ArrayLike<number> {
  length: int = 3;

  $_get(n: int): number {
    if (n == 1) {
      throw new Error('get throws');
    }
    return n;
  }
}

class ALTr implements ArrayLike<number> {
  length: int = 3;
  seen: Array<number> = [];

  $_get(n: int): number {
    this.seen.push(n);
    return n;
  }
}

class ALTw1 implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 10;
  }
}

class ALTw2 implements ArrayLike<number> {
  length: int = 2;

  $_get(n: int): number {
    return n + 30;
  }
}

class ALV implements ArrayLike<number> {
  length: int = 1;

  $_get(n: int): number {
    return 42;
  }
}

class ALZ implements ArrayLike<number> {
  length: int = 3;

  $_get(n: int): number {
    return 0;
  }
}

export default function int32ArraySetPart02Test(): void {
  describe('Int32ArraySetPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0100
     * @tc.name int32ArraySetPart02Test001
     * @tc.desc Verify set(1, number) number ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0]);
      let v: number = 7.9;
      a.set(1, v);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0200
     * @tc.name int32ArraySetPart02Test002
     * @tc.desc Verify set(insertPos,number) void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let r: void = a.set(0, 3.14);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0300
     * @tc.name int32ArraySetPart02Test003
     * @tc.desc Verify 0 4294967297.0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.set(0, 4294967297.0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0400
     * @tc.name int32ArraySetPart02Test004
     * @tc.desc Verify 1 Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([11, 22, 33]);
      a.set(1, Number.NaN);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0500
     * @tc.name int32ArraySetPart02Test005
     * @tc.desc Verify -1.5 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set(1, -1.5);
      expect(a.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0600
     * @tc.name int32ArraySetPart02Test006
     * @tc.desc Verify 1e-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 1e-10);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0700
     * @tc.name int32ArraySetPart02Test007
     * @tc.desc Verify -0.0 int32 0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, -0.0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0800
     * @tc.name int32ArraySetPart02Test008
     * @tc.desc Verify number insertPos=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it('int32ArraySetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.set(-1, 999.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_0900
     * @tc.name int32ArraySetPart02Test009
     * @tc.desc Verify number insertPos=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it('int32ArraySetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      try {
        a.set(2, 77.7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1000
     * @tc.name int32ArraySetPart02Test010
     * @tc.desc Verify number insertPos=-length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it('int32ArraySetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6]);
      try {
        a.set(-5, 123.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1100
     * @tc.name int32ArraySetPart02Test011
     * @tc.desc Verify number insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it('int32ArraySetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a.set(1000000, 42.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1200
     * @tc.name int32ArraySetPart02Test012
     * @tc.desc Verify set(number) 1.0 ArrayBuffer Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(ab);
      i32.set(0, 1.0);
      let u8: Uint8Array = new Uint8Array(ab);
      expect(u8[0]).assertEqual(1);
      expect(u8[1]).assertEqual(0);
      expect(u8[2]).assertEqual(0);
      expect(u8[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1300
     * @tc.name int32ArraySetPart02Test013
     * @tc.desc Verify set(number) INT_MAX DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(ab);
      i32.set(0, 2147483647.0);
      let dv: DataView = new DataView(ab);
      expect(dv.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1400
     * @tc.name int32ArraySetPart02Test014
     * @tc.desc Verify set(number) buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(ab, 0, 2);
      let b: Int32Array = new Int32Array(ab, 0, 2);
      a.set(1, 2147483648.0);
      expect(b.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1500
     * @tc.name int32ArraySetPart02Test015
     * @tc.desc Verify set(pos, Number.NaN) $_set(pos,Number.NaN) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(4);
      let a2: Int32Array = new Int32Array(4);
      a1.set(3, Number.NaN);
      a2.$_set(3, Number.NaN);
      expect(a1.$_get(3)).assertEqual(a2.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1600
     * @tc.name int32ArraySetPart02Test016
     * @tc.desc Verify set(pos,number) $_set(pos,number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it('int32ArraySetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a1.set(5, 99.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a1.length).assertEqual(3);
      expect(a1.$_get(0)).assertEqual(1);
      expect(a1.$_get(1)).assertEqual(2);
      expect(a1.$_get(2)).assertEqual(3);
      let a2: Int32Array = new Int32Array([1, 2, 3]);
      try {
        a2.$_set(5, 99.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a2.length).assertEqual(3);
      expect(a2.$_get(0)).assertEqual(1);
      expect(a2.$_get(1)).assertEqual(2);
      expect(a2.$_get(2)).assertEqual(3);
      expect(a1.length).assertEqual(a2.length);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1700
     * @tc.name int32ArraySetPart02Test017
     * @tc.desc Verify Number.MAX_SAFE_INTEGER ToInt32 32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 9007199254740991.0);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1800
     * @tc.name int32ArraySetPart02Test018
     * @tc.desc Verify Number.MIN_SAFE_INTEGER ToInt32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, -9007199254740991.0);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_1900
     * @tc.name int32ArraySetPart02Test019
     * @tc.desc Verify -2147483648.9 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, -2147483648.9);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2000
     * @tc.name int32ArraySetPart02Test020
     * @tc.desc Verify ArrayLike offset offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.set(new ALS3());
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(11);
      expect(a.$_get(2)).assertEqual(21);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2100
     * @tc.name int32ArraySetPart02Test021
     * @tc.desc Verify offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(4);
      let a2: Int32Array = new Int32Array(4);
      a1.set(new AL2E());
      a2.set(new AL2E(), 0);
      expect(a1.$_get(0)).assertEqual(5);
      expect(a1.$_get(1)).assertEqual(6);
      expect(a1.$_get(2)).assertEqual(0);
      expect(a1.$_get(3)).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(5);
      expect(a2.$_get(1)).assertEqual(6);
      expect(a2.$_get(2)).assertEqual(0);
      expect(a2.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2200
     * @tc.name int32ArraySetPart02Test022
     * @tc.desc Verify offset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9, 9, 9]);
      a.set(new AL2M(), 2);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(100);
      expect(a.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2300
     * @tc.name int32ArraySetPart02Test023
     * @tc.desc Verify set(ArrayLike,offset) void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let r: void = a.set(new ALV(), 0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2400
     * @tc.name int32ArraySetPart02Test024
     * @tc.desc Verify ArrayLike length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.set(new ALEmp(), 0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2500
     * @tc.name int32ArraySetPart02Test025
     * @tc.desc Verify ArrayLike length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set(new AL1S());
      expect(a.$_get(0)).assertEqual(77);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2600
     * @tc.name int32ArraySetPart02Test026
     * @tc.desc Verify ArrayLike get(0)..get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(new AL4S());
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2700
     * @tc.name int32ArraySetPart02Test027
     * @tc.desc Verify ArrayLike get 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ALTr = new ALTr();
      let a: Int32Array = new Int32Array(3);
      a.set(src, 0);
      expect(src.seen.length).assertEqual(3);
      expect(src.seen.$_get(0)).assertEqual(0);
      expect(src.seen.$_get(1)).assertEqual(1);
      expect(src.seen.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2800
     * @tc.name int32ArraySetPart02Test028
     * @tc.desc Verify ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set(new ALNeg());
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(-100);
      expect(a.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_2900
     * @tc.name int32ArraySetPart02Test029
     * @tc.desc Verify ArrayLike length=4 offset=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.set(new AL4T(), 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(11);
      expect(a.$_get(3)).assertEqual(12);
      expect(a.$_get(4)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3000
     * @tc.name int32ArraySetPart02Test030
     * @tc.desc Verify ArrayLike get 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set(new ALState());
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3100
     * @tc.name int32ArraySetPart02Test031
     * @tc.desc Verify ArrayLike length=0 offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      a.set(new ALEmp2(), 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3200
     * @tc.name int32ArraySetPart02Test032
     * @tc.desc Verify offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 5, 5]);
      a.set(new ALO0(), 0);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3300
     * @tc.name int32ArraySetPart02Test033
     * @tc.desc Verify offset=length-srcLen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.set(new ALOEnd(), 3);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(100);
      expect(a.$_get(4)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3400
     * @tc.name int32ArraySetPart02Test034
     * @tc.desc Verify offset=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([88, 88, 88]);
      a.set(new ALO1(), 1);
      expect(a.$_get(0)).assertEqual(88);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3500
     * @tc.name int32ArraySetPart02Test035
     * @tc.desc Verify offset offset 0 offset>0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 7, 7]);
      a.set(new ALDef());
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(7);
      expect(a.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3600
     * @tc.name int32ArraySetPart02Test036
     * @tc.desc Verify source.length + offset > this.length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      try {
        a.set(new ALBig(), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3700
     * @tc.name int32ArraySetPart02Test037
     * @tc.desc Verify offset+source.length (length-srcLen+1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      try {
        a.set(new ALOver1(), 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3800
     * @tc.name int32ArraySetPart02Test038
     * @tc.desc Verify offset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      try {
        a.set(new ALN(), -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_3900
     * @tc.name int32ArraySetPart02Test039
     * @tc.desc Verify offset=-length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      try {
        a.set(new ALNN(), -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4000
     * @tc.name int32ArraySetPart02Test040
     * @tc.desc Verify source offset RangeError offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      try {
        a.set(new ALEmpN(), -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4100
     * @tc.name int32ArraySetPart02Test041
     * @tc.desc Verify source.length=0 offset offset 0 0+0<=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a.set(new ALEmpOk());
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4200
     * @tc.name int32ArraySetPart02Test042
     * @tc.desc Verify offset length source RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      try {
        a.set(new ALOffEnd(), 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4300
     * @tc.name int32ArraySetPart02Test043
     * @tc.desc Verify length=0 source RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      try {
        a.set(new ALNEmpty());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4400
     * @tc.name int32ArraySetPart02Test044
     * @tc.desc Verify ArrayLike.get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9, 9, 9]);
      try {
        a.set(new ALThrow());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4500
     * @tc.name int32ArraySetPart02Test045
     * @tc.desc Verify ArrayLike 3.7 ToInt32 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(new ALF37());
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4600
     * @tc.name int32ArraySetPart02Test046
     * @tc.desc Verify ArrayLike -0.9 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(new ALFm09());
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4700
     * @tc.name int32ArraySetPart02Test047
     * @tc.desc Verify ArrayLike 2147483647.9 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(new ALFMax());
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4800
     * @tc.name int32ArraySetPart02Test048
     * @tc.desc Verify ArrayLike / /Number.NaN/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(new ALMix());
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(-2147483648);
      expect(a.$_get(3)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_4900
     * @tc.name int32ArraySetPart02Test049
     * @tc.desc Verify set(ArrayLike) ArrayBuffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(ab);
      i32.set(new ALSh());
      let dv: DataView = new DataView(ab);
      expect(dv.getInt32(0, true)).assertEqual(1);
      expect(dv.getInt32(4, true)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5000
     * @tc.name int32ArraySetPart02Test050
     * @tc.desc Verify set(ArrayLike, offset) buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(ab, 0, 4);
      let b: Int32Array = new Int32Array(ab, 0, 4);
      a.set(new ALSh2(), 2);
      expect(b.$_get(0)).assertEqual(0);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(50);
      expect(b.$_get(3)).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5100
     * @tc.name int32ArraySetPart02Test051
     * @tc.desc Verify ArrayLike.get Int32Array =
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.set(new ALSelf(a), 0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5200
     * @tc.name int32ArraySetPart02Test052
     * @tc.desc Verify ArrayLike.get offset>0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      a.set(new ALSelf2(a), 2);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(10);
      expect(a.$_get(3)).assertEqual(20);
      expect(a.$_get(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5300
     * @tc.name int32ArraySetPart02Test053
     * @tc.desc Verify set(ArrayLike,offset) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.set(new ALInvar(), 1);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5400
     * @tc.name int32ArraySetPart02Test054
     * @tc.desc Verify set(ArrayLike,offset) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let bl: number = a.byteLength;
      a.set(new ALBL());
      expect(a.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5500
     * @tc.name int32ArraySetPart02Test055
     * @tc.desc Verify set(ArrayLike,offset) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(ab, 4, 2);
      let bo: number = a.byteOffset;
      a.set(new ALBO());
      expect(a.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5600
     * @tc.name int32ArraySetPart02Test056
     * @tc.desc Verify set offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      a.set(new ALPres(), 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(9);
      expect(a.$_get(3)).assertEqual(9);
      expect(a.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5700
     * @tc.name int32ArraySetPart02Test057
     * @tc.desc Verify ArrayLike length=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(6);
      a.set(new AL6B());
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(11);
      expect(a.$_get(2)).assertEqual(22);
      expect(a.$_get(3)).assertEqual(33);
      expect(a.$_get(4)).assertEqual(44);
      expect(a.$_get(5)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5800
     * @tc.name int32ArraySetPart02Test058
     * @tc.desc Verify ArrayLike length=6 offset=2 length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(8);
      a.set(new AL6O(), 2);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(1);
      expect(a.$_get(4)).assertEqual(2);
      expect(a.$_get(5)).assertEqual(3);
      expect(a.$_get(6)).assertEqual(4);
      expect(a.$_get(7)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_5900
     * @tc.name int32ArraySetPart02Test059
     * @tc.desc Verify ArrayLike set offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(new ALTw1(), 0);
      a.set(new ALTw2(), 2);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(11);
      expect(a.$_get(2)).assertEqual(30);
      expect(a.$_get(3)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_6000
     * @tc.name int32ArraySetPart02Test060
     * @tc.desc Verify ArrayLike length 2 copies two elements with set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.set(new ALFLen());
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(6);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_6100
     * @tc.name int32ArraySetPart02Test061
     * @tc.desc Verify ArrayLike.length -1 ToLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      a.set(new ALNegLen());
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_6200
     * @tc.name int32ArraySetPart02Test062
     * @tc.desc Verify ArrayLike 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 5, 5]);
      a.set(new ALZ());
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_6300
     * @tc.name int32ArraySetPart02Test063
     * @tc.desc Verify ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set(new ALSame());
      expect(a.$_get(0)).assertEqual(42);
      expect(a.$_get(1)).assertEqual(42);
      expect(a.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_6400
     * @tc.name int32ArraySetPart02Test064
     * @tc.desc Verify set(pos,number) preserves INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.set(0, 2147483646);
      expect(a.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART02_6500
     * @tc.name int32ArraySetPart02Test065
     * @tc.desc Verify set(pos,number) converts 2^53 and 2^53+1 to Int32 zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.set(0, 9007199254740992.0);
      a.set(1, 9007199254740993.0);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
    });
  });
}
