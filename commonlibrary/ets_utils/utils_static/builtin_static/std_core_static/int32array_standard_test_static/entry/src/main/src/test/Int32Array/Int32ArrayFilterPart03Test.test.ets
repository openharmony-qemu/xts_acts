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
export default function int32ArrayFilterPart03Test(): void {
  describe('Int32ArrayFilterPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0100
     * @tc.name int32ArrayFilterPart03Test001
     * @tc.desc Verify filter missing callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.filter(undefined as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0200
     * @tc.name int32ArrayFilterPart03Test002
     * @tc.desc Verify filter null callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.filter(null as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0300
     * @tc.name int32ArrayFilterPart03Test003
     * @tc.desc Verify filter with 0 as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.filter((0) as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0400
     * @tc.name int32ArrayFilterPart03Test004
     * @tc.desc Verify filter with 1 as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.filter((1) as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0500
     * @tc.name int32ArrayFilterPart03Test005
     * @tc.desc Verify filter with Number.NaN as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter(Double.NaN as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0600
     * @tc.name int32ArrayFilterPart03Test006
     * @tc.desc Verify filter with Number.POSITIVE_INFINITY as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter(Double.POSITIVE_INFINITY as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0700
     * @tc.name int32ArrayFilterPart03Test007
     * @tc.desc Verify filter with negative Number.POSITIVE_INFINITY as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter((Double.NEGATIVE_INFINITY) as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0800
     * @tc.name int32ArrayFilterPart03Test008
     * @tc.desc Verify filter with empty string callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.filter(('') as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_0900
     * @tc.name int32ArrayFilterPart03Test009
     * @tc.desc Verify filter with non-empty string callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter(('hello') as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1000
     * @tc.name int32ArrayFilterPart03Test010
     * @tc.desc Verify filter with true as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter((true) as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1100
     * @tc.name int32ArrayFilterPart03Test011
     * @tc.desc Verify filter with false as callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter((false) as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1200
     * @tc.name int32ArrayFilterPart03Test012
     * @tc.desc Verify filter with plain object callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        let fakeObj: Object = new Object();
        arr.filter(fakeObj as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1300
     * @tc.name int32ArrayFilterPart03Test013
     * @tc.desc Verify filter with Int32Array instance callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let fake: Int32Array = new Int32Array(0);
      try {
        arr.filter(fake as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1400
     * @tc.name int32ArrayFilterPart03Test014
     * @tc.desc Verify filter with ArrayBuffer callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        arr.filter(buf as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1500
     * @tc.name int32ArrayFilterPart03Test015
     * @tc.desc Verify filter with JS array callback throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let fakeArr: number[] = [1, 2, 3];
      try {
        arr.filter(fakeArr as Object as (value: number, index: int, array: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1600
     * @tc.name int32ArrayFilterPart03Test016
     * @tc.desc Verify callback throw at first element propagates with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let errMsg: string = '';
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          throw new Error('first-boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        errMsg = e.message;
      }
      expect(errMsg).assertEqual('first-boom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1700
     * @tc.name int32ArrayFilterPart03Test017
     * @tc.desc Verify callback throw Error e.name is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1800
     * @tc.name int32ArrayFilterPart03Test018
     * @tc.desc Verify callback throw at middle element visits i+1 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let visited: number = 0;
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          visited = visited + 1;
          if (i === 2) {
            throw new Error('mid');
          }
          return v > 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visited).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_1900
     * @tc.name int32ArrayFilterPart03Test019
     * @tc.desc Verify callback throw at last element visits all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let visited: number = 0;
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          visited = visited + 1;
          if (i === a.length - 1) {
            throw new Error('last');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visited).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2000
     * @tc.name int32ArrayFilterPart03Test020
     * @tc.desc Verify callback throw RangeError preserves e.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          throw new RangeError('range-err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2100
     * @tc.name int32ArrayFilterPart03Test021
     * @tc.desc Verify callback throw TypeError preserves e.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          throw new TypeError('type-err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2200
     * @tc.name int32ArrayFilterPart03Test022
     * @tc.desc Verify callback throws at i=1 short-circuits subsequent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let reached: number = 0;
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 1) {
            throw new Error('stop');
          }
          reached = reached + 1;
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(reached).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2300
     * @tc.name int32ArrayFilterPart03Test023
     * @tc.desc Verify empty array filter does not invoke callback even with throw body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let called: boolean = false;
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => {
        called = true;
        throw new Error('should-not-reach');
      });
      expect(called).assertFalse();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2400
     * @tc.name int32ArrayFilterPart03Test024
     * @tc.desc Verify single element callback throw propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          throw new Error('single-elem');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2500
     * @tc.name int32ArrayFilterPart03Test025
     * @tc.desc Verify callback throw result assignment does not occur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let captured: Int32Array | null = null;
      let gotResult: boolean = false;
      try {
        let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) {
            throw new Error('abort');
          }
          return true;
        });
        captured = r;
        gotResult = true;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('abort');
      }
      expect(gotResult).assertFalse();
      expect(captured).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2600
     * @tc.name int32ArrayFilterPart03Test026
     * @tc.desc Verify mutation via third param survives throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          a.$_set(i, v + 100);
          if (i === 1) {
            throw new Error('after-write');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(110);
      expect(arr.$_get(1)).assertEqual(120);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2700
     * @tc.name int32ArrayFilterPart03Test027
     * @tc.desc Verify callback always false yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2800
     * @tc.name int32ArrayFilterPart03Test028
     * @tc.desc Verify even values filtered when predicate branches return true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => {
        if (v % 2 === 0) {
          return true;
        }
        return false;
      });
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_2900
     * @tc.name int32ArrayFilterPart03Test029
     * @tc.desc Verify always false and unsatisfied predicate both yield empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => false);
      let r2: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v > 9999);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3000
     * @tc.name int32ArrayFilterPart03Test030
     * @tc.desc Verify zero value filter v!==0 removes zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 0, 2, 0]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v !== 0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3100
     * @tc.name int32ArrayFilterPart03Test031
     * @tc.desc Verify true plus false result lengths sum to source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let rt: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      let rf: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => false);
      expect(rt.length + rf.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3200
     * @tc.name int32ArrayFilterPart03Test032
     * @tc.desc Verify empty array filter returns empty and does not call callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let count: number = 0;
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => {
        count = count + 1;
        return true;
      });
      expect(r.length).assertEqual(0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3300
     * @tc.name int32ArrayFilterPart03Test033
     * @tc.desc Verify empty array result has independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.buffer === arr.buffer).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3400
     * @tc.name int32ArrayFilterPart03Test034
     * @tc.desc Verify empty array result byteLength and byteOffset equal 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.byteLength).assertEqual(0);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3500
     * @tc.name int32ArrayFilterPart03Test035
     * @tc.desc Verify ArrayBuffer(0) constructed array filter returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3600
     * @tc.name int32ArrayFilterPart03Test036
     * @tc.desc Verify subarray begin greater than end yields empty filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = src.subarray(5, 10);
      let r: Int32Array = empty.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3700
     * @tc.name int32ArrayFilterPart03Test037
     * @tc.desc Verify subarray begin equals end yields empty filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = src.subarray(2, 2);
      let r: Int32Array = empty.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3800
     * @tc.name int32ArrayFilterPart03Test038
     * @tc.desc Verify chained filter on empty result stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v > 999);
      let r2: Int32Array = r1.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_3900
     * @tc.name int32ArrayFilterPart03Test039
     * @tc.desc Verify single element true filter returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4000
     * @tc.name int32ArrayFilterPart03Test040
     * @tc.desc Verify single element false filter returns empty leaving source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => false);
      expect(r.length).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4100
     * @tc.name int32ArrayFilterPart03Test041
     * @tc.desc Verify single zero element filter v===0 retains it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4200
     * @tc.name int32ArrayFilterPart03Test042
     * @tc.desc Verify single zero element filter v!==0 removes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v !== 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4300
     * @tc.name int32ArrayFilterPart03Test043
     * @tc.desc Verify single negative element filter v less than 0 retains it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4400
     * @tc.name int32ArrayFilterPart03Test044
     * @tc.desc Verify single INT_MAX retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4500
     * @tc.name int32ArrayFilterPart03Test045
     * @tc.desc Verify single INT_MIN retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4600
     * @tc.name int32ArrayFilterPart03Test046
     * @tc.desc Verify single element predicate i===0 retains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => i === 0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4700
     * @tc.name int32ArrayFilterPart03Test047
     * @tc.desc Verify single element predicate i!==0 removes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => i !== 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4800
     * @tc.name int32ArrayFilterPart03Test048
     * @tc.desc Verify callback third arg is same reference as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      let same: boolean = false;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        same = (a === arr);
        return true;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_4900
     * @tc.name int32ArrayFilterPart03Test049
     * @tc.desc Verify single element result has independent buffer after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      r.$_set(0, -77);
      expect(arr.$_get(0)).assertEqual(77);
      expect(r.$_get(0)).assertEqual(-77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5000
     * @tc.name int32ArrayFilterPart03Test050
     * @tc.desc Verify all same positive values retained on equality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v === 7);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5100
     * @tc.name int32ArrayFilterPart03Test051
     * @tc.desc Verify all same positive values non-matching predicate yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v !== 7);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5200
     * @tc.name int32ArrayFilterPart03Test052
     * @tc.desc Verify all zeros v!==0 yields empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v !== 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5300
     * @tc.name int32ArrayFilterPart03Test053
     * @tc.desc Verify all zeros true predicate all retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => true);
      expect(r.length).assertEqual(5);
      let allZero: boolean = true;
      for (let k: int = 0; k < r.length; k++) {
        if (r.$_get(k) !== 0) {
          allZero = false;
        }
      }
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5400
     * @tc.name int32ArrayFilterPart03Test054
     * @tc.desc Verify all same negatives v less than 0 retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, -3, -3]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v < 0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5500
     * @tc.name int32ArrayFilterPart03Test055
     * @tc.desc Verify throw at middle of all-same array visits correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
      let visited: number = 0;
      try {
        arr.filter((v: number, i: int, a: Int32Array): boolean => {
          visited = visited + 1;
          if (i === 3) {
            throw new Error('mid-all-same');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visited).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5600
     * @tc.name int32ArrayFilterPart03Test056
     * @tc.desc Verify all INT_MAX match v===INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5700
     * @tc.name int32ArrayFilterPart03Test057
     * @tc.desc Verify even-index predicate halves the all-same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 9, 9, 9, 9, 9]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => i % 2 === 0);
      expect(r.length).assertEqual(3);
      let allNine: boolean = true;
      for (let k: int = 0; k < r.length; k++) {
        if (r.$_get(k) !== 9) {
          allNine = false;
        }
      }
      expect(allNine).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5800
     * @tc.name int32ArrayFilterPart03Test058
     * @tc.desc Verify odd-index predicate floor half count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 4, 4, 4, 4]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => i % 2 === 1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_5900
     * @tc.name int32ArrayFilterPart03Test059
     * @tc.desc Verify closure sum of all-same array equals val times length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 6, 6, 6]);
      let sum: number = 0;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        sum = sum + v;
        return true;
      });
      expect(sum).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6000
     * @tc.name int32ArrayFilterPart03Test060
     * @tc.desc Verify callback value matches source element via index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let mismatch: boolean = false;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        if (v !== arr.$_get(i)) {
          mismatch = true;
        }
        return true;
      });
      expect(mismatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6100
     * @tc.name int32ArrayFilterPart03Test061
     * @tc.desc Verify callback index strictly increments from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let expectedIdx: number = 0;
      let wrongSeq: boolean = false;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        if (i !== expectedIdx) {
          wrongSeq = true;
        }
        expectedIdx = expectedIdx + 1;
        return true;
      });
      expect(wrongSeq).assertFalse();
      expect(expectedIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6200
     * @tc.name int32ArrayFilterPart03Test062
     * @tc.desc Verify callback third arg same reference as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sameRef: boolean = true;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        if (a !== arr) {
          sameRef = false;
        }
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6300
     * @tc.name int32ArrayFilterPart03Test063
     * @tc.desc Verify in-callback mutation propagates to later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 0]);
      let seen: number[] = [];
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        seen.push(v);
        if (i + 1 < a.length) {
          a.$_set(i + 1, v + 10);
        }
        return true;
      });
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(11);
      expect(seen[2]).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6400
     * @tc.name int32ArrayFilterPart03Test064
     * @tc.desc Verify a.length observed in callback matches source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let observedLen: number = -1;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          observedLen = a.length;
        }
        return false;
      });
      expect(observedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6500
     * @tc.name int32ArrayFilterPart03Test065
     * @tc.desc Verify even-index result preserves original ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => i % 2 === 0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6600
     * @tc.name int32ArrayFilterPart03Test066
     * @tc.desc Verify closure sum matches source sum when all true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sum: number = 0;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        sum = sum + v;
        return true;
      });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6700
     * @tc.name int32ArrayFilterPart03Test067
     * @tc.desc Verify source length unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.filter((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6800
     * @tc.name int32ArrayFilterPart03Test068
     * @tc.desc Verify source elements unchanged after filter without mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9, 12]);
      arr.filter((v: number, i: int, a: Int32Array): boolean => v > 5);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_6900
     * @tc.name int32ArrayFilterPart03Test069
     * @tc.desc Verify $_set on partial-result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, -4]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
      r.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(r.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_7000
     * @tc.name int32ArrayFilterPart03Test070
     * @tc.desc Verify mixed sign zero array v greater than 0 keeps positives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1, -2, 0, 2]);
      let r: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_7100
     * @tc.name int32ArrayFilterPart03Test071
     * @tc.desc Verify chained filter on result yields correct nested predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r1: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => v > 2);
      let r2: Int32Array = r1.filter((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(r2.length).assertEqual(2);
      expect(r2.$_get(0)).assertEqual(4);
      expect(r2.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_7200
     * @tc.name int32ArrayFilterPart03Test072
     * @tc.desc Verify callback invoked exactly source-length times partial match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let cnt: number = 0;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        cnt = cnt + 1;
        return v > 30;
      });
      expect(cnt).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART03_7300
     * @tc.name int32ArrayFilterPart03Test073
     * @tc.desc Verify callback invoked exactly source-length times when none match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cnt: number = 0;
      arr.filter((v: number, i: int, a: Int32Array): boolean => {
        cnt = cnt + 1;
        return false;
      });
      expect(cnt).assertEqual(4);
    });
  });
}
