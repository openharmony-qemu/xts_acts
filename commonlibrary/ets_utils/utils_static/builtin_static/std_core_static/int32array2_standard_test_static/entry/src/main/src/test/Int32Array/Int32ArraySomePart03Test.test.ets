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

export default function int32ArraySomePart03Test(): void {
  describe('Int32ArraySomePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0100
     * @tc.name int32ArraySomePart03Test001
     * @tc.desc Verify predicate i=0 Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let reached: boolean = false;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
            throw new Error('first-element');
          }
          reached = true;
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(reached).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0200
     * @tc.name int32ArraySomePart03Test002
     * @tc.desc Verify predicate i=2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let calls: int = 0;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          calls++;
          if (i === 2) {
            throw new Error('mid-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0300
     * @tc.name int32ArraySomePart03Test003
     * @tc.desc Verify predicate i=length-1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let calls: int = 0;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          calls++;
          if (i === a.length - 1) {
            throw new Error('last-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0400
     * @tc.name int32ArraySomePart03Test004
     * @tc.desc Verify predicate RangeError name RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new RangeError('range!');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0500
     * @tc.name int32ArraySomePart03Test005
     * @tc.desc Verify predicate TypeError name TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new TypeError('type!');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0600
     * @tc.name int32ArraySomePart03Test006
     * @tc.desc Verify predicate ReferenceError name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new ReferenceError('ref!');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0700
     * @tc.name int32ArraySomePart03Test007
     * @tc.desc Verify predicate message Error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      const MARK: string = 'marker-zeta-8932';
      let msg: string = '';
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error(MARK);
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
        msg = e.message;
      }
      expect(msg).assertEqual(MARK);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0800
     * @tc.name int32ArraySomePart03Test008
     * @tc.desc Verify predicate length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      const origLen: int = arr.length;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_0900
     * @tc.name int32ArraySomePart03Test009
     * @tc.desc Verify predicate byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      const origBL: int = arr.byteLength;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(origBL);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1000
     * @tc.name int32ArraySomePart03Test010
     * @tc.desc Verify predicate buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let buf: ArrayBuffer = arr.buffer;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1100
     * @tc.name int32ArraySomePart03Test011
     * @tc.desc Verify some() propagates a predicate Error after writing 999 to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(0, 999);
          throw new Error('after-write');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(999);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1200
     * @tc.name int32ArraySomePart03Test012
     * @tc.desc Verify a predicate error propagates after mutating element 3 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          if (i === 1) {
            a.$_set(3, 9999);
            throw new Error('mid-write');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(9999);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1300
     * @tc.name int32ArraySomePart03Test013
     * @tc.desc Verify a predicate error does not prevent a later some call from matching 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let b: Int32Array = new Int32Array(buf);
      try {
        a.some((e: number, i: int, ar: Int32Array): boolean => {
          if (i === 2) {
            throw new Error('sibling-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
      expect(b.$_get(2)).assertEqual(3);
      expect(b.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1400
     * @tc.name int32ArraySomePart03Test014
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error('first-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1500
     * @tc.name int32ArraySomePart03Test015
     * @tc.desc Verify predicate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let sameRef: boolean = false;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          sameRef = (a === arr);
          throw new Error('ref-check');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1600
     * @tc.name int32ArraySomePart03Test016
     * @tc.desc Verify predicate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let thrownIdx: int = -1;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          thrownIdx = i;
          if (i === 2) {
            throw new Error('idx-capture');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(thrownIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1700
     * @tc.name int32ArraySomePart03Test017
     * @tc.desc Verify a predicate error leaves a one-element INT32_MAX array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let thrownE: number = 0;
      let viaGet: number = 0;
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          if (i === 1) {
            thrownE = e;
            viaGet = a.$_get(i);
            throw new Error('val-capture');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(thrownE).assertEqual(6);
      expect(viaGet).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1800
     * @tc.name int32ArraySomePart03Test018
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error('single-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_1900
     * @tc.name int32ArraySomePart03Test019
     * @tc.desc Verify new Int32Array(0) predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        called = true;
        return true;
      });
      expect(r).assertFalse();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2000
     * @tc.name int32ArraySomePart03Test020
     * @tc.desc Verify new Int32Array([]) some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return false;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2100
     * @tc.name int32ArraySomePart03Test021
     * @tc.desc Verify ArrayBuffer(0) some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => true);
      expect(r).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2200
     * @tc.name int32ArraySomePart03Test022
     * @tc.desc Verify subarray(begin,begin) some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let empty: Int32Array = parent.subarray(2, 2);
      expect(empty.length).assertEqual(0);
      let r: boolean = empty.some((e: number, i: int, a: Int32Array): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2300
     * @tc.name int32ArraySomePart03Test023
     * @tc.desc Verify subarray(begin > end) some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = parent.subarray(3, 0);
      expect(empty.length).assertEqual(0);
      let cnt: int = 0;
      let r: boolean = empty.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return true;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2400
     * @tc.name int32ArraySomePart03Test024
     * @tc.desc Verify buffer some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 12, 0);
      expect(arr.length).assertEqual(0);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2500
     * @tc.name int32ArraySomePart03Test025
     * @tc.desc Verify empty some returns false without invoking a throwing predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.some((e: number, i: int, a: Int32Array): boolean => true);
      expect(arr.buffer.byteLength).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2600
     * @tc.name int32ArraySomePart03Test026
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let reached: boolean = false;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        reached = true;
        throw new Error('never');
      });
      expect(r).assertFalse();
      expect(reached).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2700
     * @tc.name int32ArraySomePart03Test027
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r1: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => true);
      let r2: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => false);
      expect(r1).assertFalse();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2800
     * @tc.name int32ArraySomePart03Test028
     * @tc.desc Verify INT_MAX predicate > INT_MAX false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > 2147483647);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_2900
     * @tc.name int32ArraySomePart03Test029
     * @tc.desc Verify INT_MIN predicate < INT_MIN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e < -2147483648);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3000
     * @tc.name int32ArraySomePart03Test030
     * @tc.desc Verify INT_MAX predicate >= INT_MAX true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e >= 2147483647;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3100
     * @tc.name int32ArraySomePart03Test031
     * @tc.desc Verify INT_MIN predicate <= INT_MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e <= -2147483648);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3200
     * @tc.name int32ArraySomePart03Test032
     * @tc.desc Verify 0 predicate !==0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e !== 0;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3300
     * @tc.name int32ArraySomePart03Test033
     * @tc.desc Verify -1 predicate >-1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > -1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3400
     * @tc.name int32ArraySomePart03Test034
     * @tc.desc Verify 1 predicate ===1 true 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e === 1;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3500
     * @tc.name int32ArraySomePart03Test035
     * @tc.desc Verify ArrayBuffer 4 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 4, 1);
      view.$_set(0, -2147483648);
      let r: boolean = view.some((e: number, i: int, a: Int32Array): boolean => e === -2147483648);
      expect(r).assertTrue();
      expect(view.length).assertEqual(1);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3600
     * @tc.name int32ArraySomePart03Test036
     * @tc.desc Verify predicate index i===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => i === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3700
     * @tc.name int32ArraySomePart03Test037
     * @tc.desc Verify predicate index i===length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return i === a.length - 1;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3800
     * @tc.name int32ArraySomePart03Test038
     * @tc.desc Verify INT_MAX some INT_MAX cnt=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647, 2147483647]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e === 2147483647;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_3900
     * @tc.name int32ArraySomePart03Test039
     * @tc.desc Verify INT_MAX some INT_MIN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e === -2147483648;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4000
     * @tc.name int32ArraySomePart03Test040
     * @tc.desc Verify INT_MIN some INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648, -2147483648]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e === -2147483648;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4100
     * @tc.name int32ArraySomePart03Test041
     * @tc.desc Verify INT_MIN some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4200
     * @tc.name int32ArraySomePart03Test042
     * @tc.desc Verify -1 some -1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1, -1, -1]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e === -1;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4300
     * @tc.name int32ArraySomePart03Test043
     * @tc.desc Verify -1 some !==-1 false cnt length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e !== -1;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4400
     * @tc.name int32ArraySomePart03Test044
     * @tc.desc Verify 0 some !==0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e !== 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4500
     * @tc.name int32ArraySomePart03Test045
     * @tc.desc Verify 0 some ===0 cnt=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return e === 0;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4600
     * @tc.name int32ArraySomePart03Test046
     * @tc.desc Verify (7) !==7 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let allMatch: boolean = true;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (e !== 7) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4700
     * @tc.name int32ArraySomePart03Test047
     * @tc.desc Verify (1) >1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > 1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4800
     * @tc.name int32ArraySomePart03Test048
     * @tc.desc Verify index >=0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sawNeg: boolean = false;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (i < 0) {
          sawNeg = true;
        }
        return false;
      });
      expect(sawNeg).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_4900
     * @tc.name int32ArraySomePart03Test049
     * @tc.desc Verify index < length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sawOOB: boolean = false;
      let maxSeen: int = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (i >= a.length) {
          sawOOB = true;
        }
        if (i > maxSeen) {
          maxSeen = i;
        }
        return false;
      });
      expect(sawOOB).assertFalse();
      expect(maxSeen).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5000
     * @tc.name int32ArraySomePart03Test050
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let cnt: int = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return false;
      });
      expect(cnt).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5100
     * @tc.name int32ArraySomePart03Test051
     * @tc.desc Verify $_get(i) element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 0, 5, 10]);
      let allMatch: boolean = true;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        let v: number = a.$_get(i);
        if (v !== e) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5200
     * @tc.name int32ArraySomePart03Test052
     * @tc.desc Verify predicate i===-1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return i === -1;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5300
     * @tc.name int32ArraySomePart03Test053
     * @tc.desc Verify predicate i===length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return i === a.length;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5400
     * @tc.name int32ArraySomePart03Test054
     * @tc.desc Verify predicate i===length+1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => i === a.length + 1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5500
     * @tc.name int32ArraySomePart03Test055
     * @tc.desc Verify predicate (99999) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => i === 99999);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5600
     * @tc.name int32ArraySomePart03Test056
     * @tc.desc Verify predicate i===0 cnt=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return i === 0;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5700
     * @tc.name int32ArraySomePart03Test057
     * @tc.desc Verify predicate i===length-1 cnt=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return i === a.length - 1;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5800
     * @tc.name int32ArraySomePart03Test058
     * @tc.desc Verify predicate Int32Array some true true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let other: Int32Array = new Int32Array([-1, -2]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        return other.some((x: number, j: int, b: Int32Array): boolean => x === -1);
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_5900
     * @tc.name int32ArraySomePart03Test059
     * @tc.desc Verify predicate some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let other: Int32Array = new Int32Array([10, 20]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        return other.some((x: number, j: int, b: Int32Array): boolean => x < 0);
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_6000
     * @tc.name int32ArraySomePart03Test060
     * @tc.desc Verify predicate some 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let outerCnt: int = 0;
      let innerCnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        outerCnt++;
        a.some((x: number, j: int, ar: Int32Array): boolean => {
          innerCnt++;
          return false;
        });
        return e === 2;
      });
      expect(r).assertTrue();
      expect(outerCnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_6100
     * @tc.name int32ArraySomePart03Test061
     * @tc.desc Verify predicate subarray some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = arr.subarray(3);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        return sub.some((x: number, j: int, b: Int32Array): boolean => x === 4);
      });
      expect(r).assertTrue();
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_6200
     * @tc.name int32ArraySomePart03Test062
     * @tc.desc Verify byteOffset predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.$_set(2, 30);
      try {
        view.some((e: number, i: int, a: Int32Array): boolean => {
          if (i === 1) {
            throw new Error('offset-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(view.$_get(0)).assertEqual(10);
      expect(view.$_get(1)).assertEqual(20);
      expect(view.$_get(2)).assertEqual(30);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_6300
     * @tc.name int32ArraySomePart03Test063
     * @tc.desc Verify Int32Array.of predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          throw new Error('of-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(200);
      expect(arr.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_6400
     * @tc.name int32ArraySomePart03Test064
     * @tc.desc Verify subarray predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1, 4);
      try {
        child.some((e: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, 99);
          if (i === 1) {
            throw new Error('sub-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(99);
      expect(parent.$_get(2)).assertEqual(99);
      expect(parent.$_get(3)).assertEqual(4);
      expect(parent.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART03_6500
     * @tc.name int32ArraySomePart03Test065
     * @tc.desc Verify new Int32Array(length) predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      try {
        arr.some((e: number, i: int, a: Int32Array): boolean => {
          if (i === 1) {
            throw new Error('zeros-boom');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });
  });
}
