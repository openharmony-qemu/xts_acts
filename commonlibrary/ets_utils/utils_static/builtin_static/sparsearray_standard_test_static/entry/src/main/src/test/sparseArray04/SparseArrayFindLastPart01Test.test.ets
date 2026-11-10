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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
interface SparseArrayFindLastPart01Point {
  x: int;
  y: int;
}
interface SparseArrayFindLastPart01Label {
  name: string;
  tag: string;
}
interface SparseArrayFindLastPart01NullableItem {
  key: int;
  val: string | null;
}
interface SparseArrayFindLastPart01Inner {
  count: int;
}
interface SparseArrayFindLastPart01Outer {
  label: string;
  detail: SparseArrayFindLastPart01Inner;
}
class SparseArrayFindLastPart01Item {
  id: int = 0;
  name: string = '';
}
export default function sparseArrayFindLastPart01Test(): void {
  describe('SparseArrayFindLastPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_PART01_0100
     * @tc.name sparseArrayFindLastPart01Test001
     * @tc.desc findLast-with-match returns last matching value & traversal/empty (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. findLast elem>15 on (10,20,30) -> 30
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.findLast((elem: int): boolean => elem > 15)).assertEqual(30);
      // 2. findLast index===0 on (10,20,30) -> 10
      const arr2 = new SparseArray<int>(10, 20, 30);
      expect(arr2.findLast((elem: int, index: int): boolean => index === 0)).assertEqual(10);
      // 3. findLast index===1 on (10,20,30,40) -> 20
      const arr3 = new SparseArray<int>(10, 20, 30, 40);
      expect(arr3.findLast((elem: int, index: int): boolean => index === 1)).assertEqual(20);
      // 4. findLast string length>5 on ('apple','banana','cherry') -> 'cherry'
      const arr4 = new SparseArray<string>('apple', 'banana', 'cherry');
      expect(arr4.findLast((elem: string): boolean => elem.length > 5)).assertEqual('cherry');
      // 5. findLast typeof string on ('test') -> 'test'
      const arr5 = new SparseArray<string>('test');
      expect(arr5.findLast((elem: string): boolean => typeof elem === 'string')).assertEqual('test');
      // 6. findLast typeof boolean on (true) -> true
      const arr6 = new SparseArray<boolean>(true);
      expect(arr6.findLast((elem: boolean): boolean => typeof elem === 'boolean')).assertTrue();
      // 7. findLast typeof double on (3.14) -> 3.14
      const arr7 = new SparseArray<double>(3.14);
      expect(arr7.findLast((elem: double): boolean => typeof elem === 'number')).assertEqual(3.14);
      const date8: Date = new Date(5000);
      const arr8 = new SparseArray<Date>(date8);
      expect(arr8.findLast((elem: Date): boolean => typeof elem === 'object')).assertEqual(date8);
      // 9. right-to-left traversal through holes visits indices 4,2,0
      const arr9 = new SparseArray<int>(5);
      arr9[0] = 10;
      arr9[2] = 30;
      arr9[4] = 50;
      let visited9: int[] = [];
      arr9.findLast((elem: int, index: int): boolean => {
        visited9.push(index);
        return false;
      });
      expect(visited9[0]).assertEqual(4);
      expect(visited9[1]).assertEqual(2);
      expect(visited9[2]).assertEqual(0);
      // 10. all-hole length=3 array -> predicate not called
      const arr10 = new SparseArray<int>(3);
      let called10: boolean = false;
      arr10.findLast((elem: int, index: int): boolean => {
        called10 = true;
        return false;
      });
      expect(called10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_PART01_0200
     * @tc.name sparseArrayFindLastPart01Test002
     * @tc.desc callback args & throw propagation (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. callback receives (elem, index, array.length) on (5,15,25)
      const arr1 = new SparseArray<int>(5, 15, 25);
      let allThree1: boolean = false;
      arr1.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
        if (elem === 15 && index === 1 && array.length === 3) {
          allThree1 = true;
        }
        return false;
      });
      expect(allThree1).assertTrue();
      // 2. callback index typeof 'int' on (100) arr[0]=1
      const arr2 = new SparseArray<int>(100);
      arr2[0] = 1;
      let typeMatches2: boolean = false;
      arr2.findLast((elem: int, index: int): boolean => {
        if (typeof index === 'int') {
          typeMatches2 = true;
        }
        return false;
      });
      expect(typeMatches2).assertTrue();
      // 3. callback array === arr on (7,14,21)
      const arr3 = new SparseArray<int>(7, 14, 21);
      let sameRef3: boolean = false;
      arr3.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
        sameRef3 = array === arr3;
        return true;
      });
      expect(sameRef3).assertTrue();
      // 4. callback array[index] === elem matchCount=3 on (5,10,15)
      const arr4 = new SparseArray<int>(5, 10, 15);
      let matchCount4: int = 0;
      arr4.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
        if (array[index] === elem) {
          matchCount4 = matchCount4 + 1;
        }
        return false;
      });
      expect(matchCount4).assertEqual(3);
      // 5. callback array[0] hole undefined on (4) arr[1]=20,arr[2]=30
      const arr5 = new SparseArray<int>(4);
      arr5[1] = 20;
      arr5[2] = 30;
      let holeUndef5: boolean = false;
      arr5.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
        if (index === 2) {
          let holeVal5 = array[0];
          holeUndef5 = holeVal5 === undefined;
        }
        return false;
      });
      expect(holeUndef5).assertTrue();
      // 6. callback mutates array[0]=999 during iteration on (1,2,3)
      const arr6 = new SparseArray<int>(1, 2, 3);
      arr6.findLast((elem: int, index: int, array: SparseArray<int>): boolean => {
        array[0] = 999;
        return true;
      });
      expect(arr6[0]).assertEqual(999);
      // 7. findLast propagates FormatError thrown by callback
      const dNormal7: Date = new Date(5000);
      const dAnother7: Date = new Date(10000);
      const arr7 = new SparseArray<Date>(dNormal7, dAnother7);
      try {
        arr7.findLast((elem: Date): boolean => {
          throw new FormatError('invalid date');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_PART01_0300
     * @tc.name sparseArrayFindLastPart01Test003
     * @tc.desc typed elements: primitives & special values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. predicate receives elem int=0 on (7,0,3)
      const arr1 = new SparseArray<int>(7, 0, 3);
      let receivedZero1: boolean = false;
      arr1.findLast((elem: int): boolean => {
        if (elem === 0) {
          receivedZero1 = true;
        }
        return false;
      });
      expect(receivedZero1).assertTrue();
      // 2. predicate receives elem int=-2147483648 on (-2147483648,5,10)
      const arr2 = new SparseArray<int>(-2147483648, 5, 10);
      let lastElem2: int = 0;
      arr2.findLast((elem: int): boolean => {
        lastElem2 = elem;
        return false;
      });
      expect(lastElem2).assertEqual(-2147483648);
      // 3. predicate receives empty string '' on ('hello','','world')
      const arr3 = new SparseArray<string>('hello', '', 'world');
      let receivedEmpty3: boolean = false;
      arr3.findLast((elem: string): boolean => {
        if (elem.length === 0) {
          receivedEmpty3 = true;
        }
        return false;
      });
      expect(receivedEmpty3).assertTrue();
      // 4. predicate receives Unicode string on ('start','中文测试','end')
      const arr4 = new SparseArray<string>('start', '中文测试', 'end');
      let receivedUnicode4: boolean = false;
      arr4.findLast((elem: string): boolean => {
        if (elem === '中文测试') {
          receivedUnicode4 = true;
        }
        return false;
      });
      expect(receivedUnicode4).assertTrue();
      // 5. predicate receives '\0' on ('a','\0','b')
      const arr5 = new SparseArray<string>('a', '\0', 'b');
      let receivedNullChar5: boolean = false;
      arr5.findLast((elem: string): boolean => {
        if (elem === '\0') {
          receivedNullChar5 = true;
        }
        return false;
      });
      expect(receivedNullChar5).assertTrue();
      // 6. predicate receives 1000-char string on ('x',longStr,'y')
      let longStr6: string = '';
      for (let i6: int = 0; i6 < 1000; i6++) {
        longStr6 = longStr6 + 'a';
      }
      const arr6 = new SparseArray<string>('x', longStr6, 'y');
      let receivedLong6: boolean = false;
      arr6.findLast((elem: string): boolean => {
        if (elem.length === 1000) {
          receivedLong6 = true;
        }
        return false;
      });
      expect(receivedLong6).assertTrue();
      // 7. predicate receives boolean true on (false,true,false)
      const arr7 = new SparseArray<boolean>(false, true, false);
      let receivedTrue7: boolean = false;
      arr7.findLast((elem: boolean): boolean => {
        if (elem === true) {
          receivedTrue7 = true;
        }
        return false;
      });
      expect(receivedTrue7).assertTrue();
      // 8. predicate receives boolean false on (true,false,true)
      const arr8 = new SparseArray<boolean>(true, false, true);
      let receivedFalse8: boolean = false;
      arr8.findLast((elem: boolean): boolean => {
        if (elem === false) {
          receivedFalse8 = true;
        }
        return false;
      });
      expect(receivedFalse8).assertTrue();
      // 9. predicate receives double NaN on (1.0,NaN,2.0)
      const arr9 = new SparseArray<double>(1.0, Double.NaN, 2.0);
      let receivedNan9: boolean = false;
      arr9.findLast((elem: double): boolean => {
        if (isNaN(elem)) {
          receivedNan9 = true;
        }
        return false;
      });
      expect(receivedNan9).assertTrue();
      // 10. predicate receives double Infinity on (0.5,POSITIVE_INFINITY,1.5)
      const arr10 = new SparseArray<double>(0.5, Double.POSITIVE_INFINITY, 1.5);
      let receivedInf10: boolean = false;
      arr10.findLast((elem: double): boolean => {
        if (elem === Double.POSITIVE_INFINITY) {
          receivedInf10 = true;
        }
        return false;
      });
      expect(receivedInf10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_PART01_0400
     * @tc.name sparseArrayFindLastPart01Test004
     * @tc.desc typed elements: objects, interfaces & classes (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. predicate receives RegExp source='abc' on (r1,r2)
      const reg1: RegExp = new RegExp('abc', 'g');
      const reg2: RegExp = new RegExp('def');
      const arr1 = new SparseArray<RegExp>(reg1, reg2);
      let receivedPattern1: boolean = false;
      arr1.findLast((elem: RegExp): boolean => {
        if (elem.source === 'abc') {
          receivedPattern1 = true;
        }
        return false;
      });
      expect(receivedPattern1).assertTrue();
      // 2. predicate receives nested int[] length===0 on (arrOne,arrEmpty,arrTwo)
      const subEmpty: int[] = [];
      const subOne: int[] = [1];
      const subTwo: int[] = [2, 3];
      const arr2 = new SparseArray<int[]>(subOne, subEmpty, subTwo);
      let receivedEmpty2: boolean = false;
      arr2.findLast((elem: int[]): boolean => {
        if (elem.length === 0) {
          receivedEmpty2 = true;
        }
        return false;
      });
      expect(receivedEmpty2).assertTrue();
      // 3. predicate receives interface Point x=5,y=10 on (p1,p2,p3)
      const pt1: SparseArrayFindLastPart01Point = { x: 1 as int, y: 2 as int };
      const pt2: SparseArrayFindLastPart01Point = { x: 5 as int, y: 10 as int };
      const pt3: SparseArrayFindLastPart01Point = { x: 3 as int, y: 6 as int };
      const arr3 = new SparseArray<SparseArrayFindLastPart01Point>(pt1, pt2, pt3);
      let foundPt3: boolean = false;
      arr3.findLast((elem: SparseArrayFindLastPart01Point): boolean => {
        if (elem.x === (5 as int) && elem.y === (10 as int)) {
          foundPt3 = true;
        }
        return false;
      });
      expect(foundPt3).assertTrue();
      // 4. predicate receives interface with null val on (it1,it2)
      const ni1: SparseArrayFindLastPart01NullableItem = { key: 1 as int, val: 'a' };
      const ni2: SparseArrayFindLastPart01NullableItem = { key: 2 as int, val: null };
      const arr4 = new SparseArray<SparseArrayFindLastPart01NullableItem>(ni1, ni2);
      let receivedNull4: boolean = false;
      arr4.findLast((elem: SparseArrayFindLastPart01NullableItem): boolean => {
        if (elem.val === null) {
          receivedNull4 = true;
        }
        return false;
      });
      expect(receivedNull4).assertTrue();
      // 5. predicate receives nested interface count=20 on (out1,out2)
      const inner1: SparseArrayFindLastPart01Inner = { count: 10 as int };
      const outer1: SparseArrayFindLastPart01Outer = { label: 'A', detail: inner1 };
      const inner2: SparseArrayFindLastPart01Inner = { count: 20 as int };
      const outer2: SparseArrayFindLastPart01Outer = { label: 'B', detail: inner2 };
      const arr5 = new SparseArray<SparseArrayFindLastPart01Outer>(outer1, outer2);
      let receivedNested5: boolean = false;
      arr5.findLast((elem: SparseArrayFindLastPart01Outer): boolean => {
        if (elem.detail.count === (20 as int)) {
          receivedNested5 = true;
        }
        return false;
      });
      expect(receivedNested5).assertTrue();
      // 6. predicate receives Error message='beta' on (e1,e2)
      const err1: Error = new Error('alpha');
      const err2: Error = new Error('beta');
      const arr6 = new SparseArray<Error>(err1, err2);
      let receivedBeta6: boolean = false;
      arr6.findLast((elem: Error): boolean => {
        if (elem.message === 'beta') {
          receivedBeta6 = true;
        }
        return false;
      });
      expect(receivedBeta6).assertTrue();
      // 7. predicate receives class name='second' on (it1,it2)
      const item1: SparseArrayFindLastPart01Item = new SparseArrayFindLastPart01Item();
      item1.id = 1;
      item1.name = 'first';
      const item2: SparseArrayFindLastPart01Item = new SparseArrayFindLastPart01Item();
      item2.id = 2;
      item2.name = 'second';
      const arr7 = new SparseArray<SparseArrayFindLastPart01Item>(item1, item2);
      let receivedClass7: boolean = false;
      arr7.findLast((elem: SparseArrayFindLastPart01Item): boolean => {
        if (elem.name === 'second') {
          receivedClass7 = true;
        }
        return false;
      });
      expect(receivedClass7).assertTrue();
      // 8. predicate receives typeof int 'int' on arr[0]=42
      const arr8 = new SparseArray<int>();
      arr8[0] = 42;
      let typeMatches8: boolean = false;
      arr8.findLast((elem: int): boolean => {
        if (typeof elem === 'int') {
          typeMatches8 = true;
        }
        return false;
      });
      expect(typeMatches8).assertTrue();
    });
  });
}
