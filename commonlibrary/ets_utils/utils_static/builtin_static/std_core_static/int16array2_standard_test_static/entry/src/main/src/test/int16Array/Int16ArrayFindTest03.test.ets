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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayFindTestThreeTest(): void {
  describe('Int16ArrayFindTestThreeTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0100
     * @tc.name testInt16ArrayFindTestThree001
     * @tc.desc Verify find propagates TypeError thrown by predicate on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new TypeError('type mismatch');
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0200
     * @tc.name testInt16ArrayFindTestThree002
     * @tc.desc Verify find propagates RangeError thrown by predicate on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 6, 7);
      try {
        arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new RangeError('out of range');
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0300
     * @tc.name testInt16ArrayFindTestThree003
     * @tc.desc Verify find propagates Error thrown by predicate on second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      try {
        arr.find((value: number, _index: int, _array: Int16Array): boolean => {
          if (value === 2) {
            throw new Error('throw at second');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0400
     * @tc.name testInt16ArrayFindTestThree004
     * @tc.desc Verify find propagates Error thrown by predicate on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      try {
        arr.find((value: number, index: int, _array: Int16Array): boolean => {
          if (index === 2) {
            throw new Error('throw at last');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0500
     * @tc.name testInt16ArrayFindTestThree005
     * @tc.desc Verify find propagates custom Error message from predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new Error('custom-predicate-error');
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('Error');
        let actual2: string = e.message;
        expect(actual2).assertEqual('custom-predicate-error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0600
     * @tc.name testInt16ArrayFindTestThree006
     * @tc.desc Verify find on empty Int16Array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        return true;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0700
     * @tc.name testInt16ArrayFindTestThree007
     * @tc.desc Verify find on empty array does not invoke predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf);
      arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0800
     * @tc.name testInt16ArrayFindTestThree008
     * @tc.desc Verify find on single-element array returns element when predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_0900
     * @tc.name testInt16ArrayFindTestThree009
     * @tc.desc Verify find on single-element array returns undefined when predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1000
     * @tc.name testInt16ArrayFindTestThree010
     * @tc.desc Verify find on single-element array invokes predicate with index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(77);
      let capturedIndex: int = -1;
      arr.find((_value: number, index: int, _array: Int16Array): boolean => {
        capturedIndex = index;
        return true;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1100
     * @tc.name testInt16ArrayFindTestThree011
     * @tc.desc Verify find on all-zero array returns undefined when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      arr.$_set(0, 0);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.$_set(3, 0);
      arr.$_set(4, 0);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1200
     * @tc.name testInt16ArrayFindTestThree012
     * @tc.desc Verify find on all-zero array returns first element when predicate always true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      arr.$_set(0, 0);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.$_set(3, 0);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1300
     * @tc.name testInt16ArrayFindTestThree013
     * @tc.desc Verify find returns element at first index where index condition matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      arr.$_set(0, 100);
      arr.$_set(1, 100);
      arr.$_set(2, 100);
      arr.$_set(3, 100);
      arr.$_set(4, 100);
      let result: number | undefined = arr.find((_value: number, index: int, _array: Int16Array): boolean => {
        return index >= 2;
      });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1400
     * @tc.name testInt16ArrayFindTestThree014
     * @tc.desc Verify find returns first matching value among identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 50, 50, 50);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === 50;
      });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1500
     * @tc.name testInt16ArrayFindTestThree015
     * @tc.desc Verify find returns -1 when all identical elements match predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -1, -1, -1);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === -1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1600
     * @tc.name testInt16ArrayFindTestThree016
     * @tc.desc Verify find returns undefined when no identical elements satisfy predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 10, 10, 10);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 100;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1700
     * @tc.name testInt16ArrayFindTestThree017
     * @tc.desc Verify find propagates RangeError when predicate calls OOB $_get(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          return array.$_get(-1) === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1800
     * @tc.name testInt16ArrayFindTestThree018
     * @tc.desc Verify find propagates RangeError when predicate calls OOB $_get(length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          return array.$_get(4) === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_1900
     * @tc.name testInt16ArrayFindTestThree019
     * @tc.desc Verify find propagates RangeError when predicate calls OOB $_get(length+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          return array.$_get(3) === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2000
     * @tc.name testInt16ArrayFindTestThree020
     * @tc.desc Verify find propagates RangeError when predicate calls OOB $_get(-length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 4, 5);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          return array.$_get(-4) === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2100
     * @tc.name testInt16ArrayFindTestThree021
     * @tc.desc Verify find propagates RangeError when predicate calls OOB $_get(large)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          return array.$_get(10000) === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2200
     * @tc.name testInt16ArrayFindTestThree022
     * @tc.desc Verify find propagates RangeError when predicate calls OOB $_get(large negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(13, 14);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          return array.$_get(-9999) === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2300
     * @tc.name testInt16ArrayFindTestThree023
     * @tc.desc Verify find propagates RangeError when predicate calls $_get with OOB index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42, 43);
      try {
        arr.find((_value: number, _index: int, array: Int16Array): boolean => {
          let validGet: number = array.$_get(0);
          let oobGet: number = array.$_get(2);
          return validGet !== undefined && oobGet === undefined;
        });
        expect().assertFail();
      } catch (e) {
        let actual1: string = e.name;
        expect(actual1).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2400
     * @tc.name testInt16ArrayFindTestThree024
     * @tc.desc Verify find reads later element current value after $_set mutation and captures 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let capturedAtIdx1: number = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 999);
          return false;
        }
        if (index === 1) {
          capturedAtIdx1 = value;
          return false;
        }
        return false;
      });
      expect(capturedAtIdx1).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2500
     * @tc.name testInt16ArrayFindTestThree025
     * @tc.desc Verify find uses original snapshot value after predicate $_set on current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25);
      let capturedAtIdx0: number = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 888);
          capturedAtIdx0 = value;
          return false;
        }
        return false;
      });
      expect(capturedAtIdx0).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2600
     * @tc.name testInt16ArrayFindTestThree026
     * @tc.desc Verify find continues iteration after predicate $_set on already visited index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9);
      let callCount: int = 0;
      arr.find((_value: number, index: int, array: Int16Array): boolean => {
        callCount = callCount + 1;
        if (index >= 1) {
          array.$_set(0, 777);
        }
        return false;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2700
     * @tc.name testInt16ArrayFindTestThree027
     * @tc.desc Verify find predicate can read other original values via array.$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      let nextValAtIdx0: number = 0;
      arr.find((_value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          nextValAtIdx0 = array.$_get(1);
          return false;
        }
        return false;
      });
      expect(nextValAtIdx0).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2800
     * @tc.name testInt16ArrayFindTestThree028
     * @tc.desc Verify find predicate external counter side effect is observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let externalCount: int = 0;
      arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        externalCount = externalCount + 1;
        return false;
      });
      expect(externalCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_2900
     * @tc.name testInt16ArrayFindTestThree029
     * @tc.desc Verify find predicate external boolean side effect is observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let flag: boolean = false;
      arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        if (value === 10) {
          flag = true;
        }
        return false;
      });
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3000
     * @tc.name testInt16ArrayFindTestThree030
     * @tc.desc Verify find predicate external array side effect is observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(7, 14, 21);
      let sideArr: int[] = [0, 0, 0];
      src.find((_value: number, index: int, _array: Int16Array): boolean => {
        sideArr[index] = 1;
        return false;
      });
      let actual1: number = sideArr[0];
      expect(actual1).assertEqual(1);
      let actual2: number = sideArr[1];
      expect(actual2).assertEqual(1);
      let actual3: number = sideArr[2];
      expect(actual3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3100
     * @tc.name testInt16ArrayFindTestThree031
     * @tc.desc Verify find predicate direct $_get after $_set sees updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(30, 40, 50);
      let directReadAtIdx0: number = 0;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 99);
          directReadAtIdx0 = array.$_get(0);
        }
        return false;
      });
      expect(directReadAtIdx0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3200
     * @tc.name testInt16ArrayFindTestThree032
     * @tc.desc Verify find predicate $_set mutates original array after iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33);
      arr.find((_value: number, index: int, array: Int16Array): boolean => {
        array.$_set(index, 0);
        return false;
      });
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3300
     * @tc.name testInt16ArrayFindTestThree033
     * @tc.desc Verify nested find inside find predicate works and returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
      let result: number | undefined = arr.find((value: number, _index: int, array: Int16Array): boolean => {
        let inner: number | undefined = array.find((v: number, _i: int, _a: Int16Array): boolean => {
          return v > value;
        });
        return inner !== undefined;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3400
     * @tc.name testInt16ArrayFindTestThree034
     * @tc.desc Verify find predicate mixed nested find API call returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9);
      let result: number | undefined = arr.find((_value: number, _index: int, array: Int16Array): boolean => {
        let hasSix: boolean = false;
        array.find((v: number, _i: int, _a: Int16Array): boolean => {
          if (v === 6) {
            hasSix = true;
            return true;
          }
          return false;
        });
        return hasSix;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3500
     * @tc.name testInt16ArrayFindTestThree035
     * @tc.desc Verify find returns undefined when value never exceeds closure-controlled threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let threshold: int = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        threshold = threshold + 1;
        return value > threshold;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3600
     * @tc.name testInt16ArrayFindTestThree036
     * @tc.desc Verify find with cumulative sum predicate returns expected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sum: number = 0;
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        sum = sum + value;
        return sum > 5;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3700
     * @tc.name testInt16ArrayFindTestThree037
     * @tc.desc Verify find returns undefined when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 6, 7);
      let result: number | undefined = arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3800
     * @tc.name testInt16ArrayFindTestThree038
     * @tc.desc Verify find returns undefined when even-value predicate never matches odds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 5, 7);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_3900
     * @tc.name testInt16ArrayFindTestThree039
     * @tc.desc Verify find returns first element matching logical AND predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 15, 20);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 5 && value < 18;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4000
     * @tc.name testInt16ArrayFindTestThree040
     * @tc.desc Verify find returns first element matching logical OR predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 100, 200);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value < 0 || value > 150;
      });
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4100
     * @tc.name testInt16ArrayFindTestThree041
     * @tc.desc Verify find returns first element matching logical NOT predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 1, 2);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return !(value === 0);
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4200
     * @tc.name testInt16ArrayFindTestThree042
     * @tc.desc Verify find returns first element matching strict inequality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, 0, 5);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value !== 0;
      });
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4300
     * @tc.name testInt16ArrayFindTestThree043
     * @tc.desc Verify find invokes predicate for ascending indices 0 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let indices: int[] = [0, 0, 0];
      arr.find((_value: number, index: int, _array: Int16Array): boolean => {
        indices[index] = 1;
        return false;
      });
      let actual1: number = indices[0];
      expect(actual1).assertEqual(1);
      let actual2: number = indices[1];
      expect(actual2).assertEqual(1);
      let actual3: number = indices[2];
      expect(actual3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4400
     * @tc.name testInt16ArrayFindTestThree044
     * @tc.desc Verify find stops calling predicate after first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        callCount = callCount + 1;
        return value >= 3;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4500
     * @tc.name testInt16ArrayFindTestThree045
     * @tc.desc Verify find predicate value equals array.$_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(17, 34, 51);
      let allMatch: boolean = true;
      arr.find((value: number, index: int, array: Int16Array): boolean => {
        if (value !== array.$_get(index)) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4600
     * @tc.name testInt16ArrayFindTestThree046
     * @tc.desc Verify find predicate array parameter is same reference as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4);
      let isSameRef: boolean = false;
      arr.find((_value: number, _index: int, array: Int16Array): boolean => {
        if (array === arr) {
          isSameRef = true;
        }
        return false;
      });
      expect(isSameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4700
     * @tc.name testInt16ArrayFindTestThree047
     * @tc.desc Verify find predicate index increases from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 5, 5);
      let indexSum: int = 0;
      arr.find((_value: number, index: int, _array: Int16Array): boolean => {
        indexSum = indexSum + index;
        return false;
      });
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4800
     * @tc.name testInt16ArrayFindTestThree048
     * @tc.desc Verify find matches int16 min boundary -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 100);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === -32768;
      });
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_4900
     * @tc.name testInt16ArrayFindTestThree049
     * @tc.desc Verify find matches int16 max boundary 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 32767, 1);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === 32767;
      });
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5000
     * @tc.name testInt16ArrayFindTestThree050
     * @tc.desc Verify find is stable for same predicate across two calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let first: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 7;
      });
      let second: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 7;
      });
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5100
     * @tc.name testInt16ArrayFindTestThree051
     * @tc.desc Verify find without match does not mutate original array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 5;
      });
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5200
     * @tc.name testInt16ArrayFindTestThree052
     * @tc.desc Verify find does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(6, 7, 8, 9);
      let lenBefore: int = arr.length;
      arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
        return false;
      });
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5300
     * @tc.name testInt16ArrayFindTestThree053
     * @tc.desc Verify find returns first positive value in mixed sign array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, -3, 2, -1, 4);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5400
     * @tc.name testInt16ArrayFindTestThree054
     * @tc.desc Verify find returns first negative value in mixed sign array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, -2, 5, -4);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5500
     * @tc.name testInt16ArrayFindTestThree055
     * @tc.desc Verify find returns first non-zero value when zeros present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 5, 0);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value !== 0;
      });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5600
     * @tc.name testInt16ArrayFindTestThree056
     * @tc.desc Verify find returns zero when zero is the matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 0, 1);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5700
     * @tc.name testInt16ArrayFindTestThree057
     * @tc.desc Verify find locates value 25 in large 50-element Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(50);
      for (let i: int = 0; i < 50; i++) {
        arr.$_set(i, i);
      }
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === 25;
      });
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5800
     * @tc.name testInt16ArrayFindTestThree058
     * @tc.desc Verify find returns max boundary among min zero max array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value === 32767;
      });
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_5900
     * @tc.name testInt16ArrayFindTestThree059
     * @tc.desc Verify find leaves array unchanged after predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.find((value: number, _index: int, _array: Int16Array): boolean => {
          if (value === 20) {
            throw new Error('abort');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let actualErrorName: string = e.name;
        let expectedErrorName: string = 'Error';
        expect(actualErrorName).assertEqual(expectedErrorName);
      }
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_THREE_6000
     * @tc.name testInt16ArrayFindTestThree060
     * @tc.desc Verify find works again after previous predicate Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      try {
        arr.find((_value: number, _index: int, _array: Int16Array): boolean => {
          throw new Error('fail');
        });
        expect().assertFail();
      } catch (e) {
        let actualErrorName: string = e.name;
        let expectedErrorName: string = 'Error';
        expect(actualErrorName).assertEqual(expectedErrorName);
      }
      let result: number | undefined = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
        return value > 7;
      });
      expect(result).assertEqual(10);
    });
  });
}
