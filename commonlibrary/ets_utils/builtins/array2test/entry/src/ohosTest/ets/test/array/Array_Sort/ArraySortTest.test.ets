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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ArraySortJs from './ArraySortTest';

interface SortAgeObj {
  age: number;
}

interface SortPersonObj {
  age: number;
  name: string;
}

interface SortNameObj {
  name: string;
}

interface SortScoreObj {
  score: number;
}

interface SortUserAgeInner {
  age: number;
}

interface SortUserAgeObj {
  user: SortUserAgeInner;
}

interface SortEventObj {
  event: string;
  date: string;
}

interface SortTagsObj {
  tags: string[];
}

interface SortCreatedObj {
  created: Date;
}

interface SortNameAgeOptional {
  name: string;
  age?: number;
}

interface SortPropCountTwo {
  a: number;
  b: number;
}

interface SortPropCountOne {
  c: number;
}

interface SortPropCountThree {
  d: number;
  e: number;
  f: number;
}

export default function ArraySortMindMapTest() {
  describe('ArraySortMindMapTest', () => {
    beforeAll(() => {
    })
    beforeEach(async (): Promise<void> => await Utils.msSleep(20))
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name testArraySortTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0100
     * @tc.desc MindMap sort test case 001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 5, 20, 15, 3];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('[10,15,20,3,5]');
    });

    /**
     * @tc.name testArraySortTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0200
     * @tc.desc MindMap sort test case 002
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 5, 20, 15, 3];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[3,5,10,15,20]');
    });

    /**
     * @tc.name testArraySortTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0300
     * @tc.desc MindMap sort test case 003
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2];
      const ref: number[] = arr;
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(ref)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name testArraySortTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0400
     * @tc.desc MindMap sort test case 004
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['banana', 'apple', 'cherry'];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('["apple","banana","cherry"]');
    });

    /**
     * @tc.name testArraySortTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0500
     * @tc.desc MindMap sort test case 005
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 5, 20, 15, 3];
      arr.sort((a: number, b: number): number => b - a);
      expect(JSON.stringify(arr)).assertEqual('[20,15,10,5,3]');
    });

    /**
     * @tc.name testArraySortTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0600
     * @tc.desc MindMap sort test case 006
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('[]');
    });

    /**
     * @tc.name testArraySortTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0700
     * @tc.desc MindMap sort test case 007
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('[42]');
    });

    /**
     * @tc.name testArraySortTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0800
     * @tc.desc MindMap sort test case 008
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 5, 5, 5];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('[5,5,5,5]');
    });

    /**
     * @tc.name testArraySortTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0900
     * @tc.desc MindMap sort test case 009
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [-3, -1, -5];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[-5,-3,-1]');
    });

    /**
     * @tc.name testArraySortTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1000
     * @tc.desc MindMap sort test case 010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, 3, -2, 0, 5];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[-2,0,0,3,5]');
    });

    /**
     * @tc.name testArraySortTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1100
     * @tc.desc MindMap sort test case 011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'ccc', 'bb'];
      arr.sort((a: string, b: string): number => a.length - b.length);
      expect(JSON.stringify(arr)).assertEqual('["a","bb","ccc"]');
    });

    /**
     * @tc.name testArraySortTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1200
     * @tc.desc MindMap sort test case 012
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortAgeObj[] = [{age: 30}, {age: 20}, {age: 25}];
      arr.sort((a: SortAgeObj, b: SortAgeObj): number => a.age - b.age);
      expect(JSON.stringify(arr)).assertEqual('[{"age":20},{"age":25},{"age":30}]');
    });

    /**
     * @tc.name testArraySortTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1300
     * @tc.desc MindMap sort test case 013
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[] = [10, '5', 20, '15'];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('[10,"15",20,"5"]');
    });

    /**
     * @tc.name testArraySortTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1400
     * @tc.desc MindMap sort test case 014
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['Banana', 'apple', 'Cherry'];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('["Banana","Cherry","apple"]');
    });

    /**
     * @tc.name testArraySortTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1500
     * @tc.desc MindMap sort test case 015
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['Banana', 'apple', 'Cherry'];
      arr.sort((a: string, b: string): number => a.toLowerCase().localeCompare(b.toLowerCase()));
      expect(JSON.stringify(arr)).assertEqual('["apple","Banana","Cherry"]');
    });

    /**
     * @tc.name testArraySortTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1600
     * @tc.desc MindMap sort test case 016
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      arr.sort((a: string, b: string): number => b.localeCompare(a));
      expect(JSON.stringify(arr)).assertEqual('["c","b","a"]');
    });

    /**
     * @tc.name testArraySortTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1700
     * @tc.desc MindMap sort test case 017
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | null)[] = [3, null, 1, null, 2];
      arr.sort((a: number | null, b: number | null): number => (a as number) - (b as number));
      expect(JSON.stringify(arr)).assertEqual('[null,null,1,2,3]');
    });

    /**
     * @tc.name testArraySortTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1800
     * @tc.desc MindMap sort test case 018
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [3, undefined, 1, 2];
      arr.sort((a: number | undefined, b: number | undefined): number =>
        (a !== undefined ? a : 0) - (b !== undefined ? b : 0));
      expect(JSON.stringify(arr)).assertEqual('[1,2,3,null]');
    });

    /**
     * @tc.name testArraySortTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_1900
     * @tc.desc MindMap sort test case 019
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortPersonObj[] = [
        {age: 25, name: 'Bob'},
        {age: 20, name: 'Alice'},
        {age: 25, name: 'Alice'}
      ];
      arr.sort((a: SortPersonObj, b: SortPersonObj): number => {
        if (a.age !== b.age) {
          return a.age - b.age;
        }
        return a.name.localeCompare(b.name);
      });
      expect(JSON.stringify(arr)).assertEqual('[{"age":20,"name":"Alice"},{"age":25,"name":"Alice"},{"age":25,"name":"Bob"}]');
    });

    /**
     * @tc.name testArraySortTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2000
     * @tc.desc MindMap sort test case 020
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3.14, 1.5, 2.71, 0.5];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[0.5,1.5,2.71,3.14]');
    });

    /**
     * @tc.name testArraySortTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2100
     * @tc.desc MindMap sort test case 021
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1000000, 500000, 2000000];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[500000,1000000,2000000]');
    });

    /**
     * @tc.name testArraySortTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2200
     * @tc.desc MindMap sort test case 022
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false, true, false];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('[false,false,true,true]');
    });

    /**
     * @tc.name testArraySortTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2300
     * @tc.desc MindMap sort test case 023
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['item2', 'item10', 'item1'];
      arr.sort((a: string, b: string): number => {
        const numA: number = parseInt(a.replace('item', ''));
        const numB: number = parseInt(b.replace('item', ''));
        return numA - numB;
      });
      expect(JSON.stringify(arr)).assertEqual('["item1","item2","item10"]');
    });

    /**
     * @tc.name testArraySortTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2400
     * @tc.desc MindMap sort test case 024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 1, 2];
      const original: number[] = arr;
      arr.sort((a: number, b: number): number => a - b);
      expect(arr === original).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2500
     * @tc.desc MindMap sort test case 025
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[3,5,8]');
    });

    /**
     * @tc.name testArraySortTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2600
     * @tc.desc MindMap sort test case 026. JS-only: sparse array hole sort semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn26_testSparseArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2700
     * @tc.desc MindMap sort test case 027
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['$', '!', '#', '%'];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('["!","#","$","%"]');
    });

    /**
     * @tc.name testArraySortTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2800
     * @tc.desc MindMap sort test case 028
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortNameObj[] = [{name: 'Anna'}, {name: 'Bob'}, {name: 'Alexandra'}];
      arr.sort((a: SortNameObj, b: SortNameObj): number => a.name.length - b.name.length);
      expect(JSON.stringify(arr)).assertEqual('[{"name":"Bob"},{"name":"Anna"},{"name":"Alexandra"}]');
    });

    /**
     * @tc.name testArraySortTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_2900
     * @tc.desc MindMap sort test case 029
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | string)[][] = [[3, 'c'], [1, 'a'], [2, 'b']];
      arr.sort((a: (number | string)[], b: (number | string)[]): number =>
        (a[0] as number) - (b[0] as number));
      expect(JSON.stringify(arr)).assertEqual('[[1,"a"],[2,"b"],[3,"c"]]');
    });

    /**
     * @tc.name testArraySortTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3000
     * @tc.desc MindMap sort test case 030
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['ä', 'a', 'b'];
      arr.sort((a: string, b: string): number => a.localeCompare(b));
      expect(JSON.stringify(arr)).assertEqual('["a","ä","b"]');
    });

    /**
     * @tc.name testArraySortTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3100
     * @tc.desc MindMap sort test case 031
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, NaN, 1, 2];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[3,null,1,2]');
    });

    /**
     * @tc.name testArraySortTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3200
     * @tc.desc MindMap sort test case 032
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['2023-12-01', '2023-01-15', '2023-06-30'];
      arr.sort();
      expect(JSON.stringify(arr)).assertEqual('["2023-01-15","2023-06-30","2023-12-01"]');
    });

    /**
     * @tc.name testArraySortTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3300
     * @tc.desc MindMap sort test case 033
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Date[] = [new Date(2023, 11, 1), new Date(2023, 0, 15), new Date(2023, 5, 30)];
      arr.sort((a: Date, b: Date): number => a.getTime() - b.getTime());
      expect(arr[0].getTime()).assertEqual(new Date(2023, 0, 15).getTime());
      expect(arr[1].getTime()).assertEqual(new Date(2023, 5, 30).getTime());
      expect(arr[2].getTime()).assertEqual(new Date(2023, 11, 1).getTime());
    });

    /**
     * @tc.name testArraySortTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3400
     * @tc.desc MindMap sort test case 034
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['apple', 'banana', 'cherry'];
      arr.sort((a: string, b: string): number => {
        const lastA: string = a[a.length - 1];
        const lastB: string = b[b.length - 1];
        return lastA.localeCompare(lastB);
      });
      expect(JSON.stringify(arr)).assertEqual('["banana","apple","cherry"]');
    });

    /**
     * @tc.name testArraySortTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3500
     * @tc.desc MindMap sort test case 035
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1];
      const originalLength: number = arr.length;
      arr.sort((a: number, b: number): number => a - b);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.name testArraySortTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3600
     * @tc.desc MindMap sort test case 036
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[3,5,8]');
    });

    /**
     * @tc.name testArraySortTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3700
     * @tc.desc MindMap sort test case 037
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [-3, 1, -5, 2];
      arr.sort((a: number, b: number): number => Math.abs(a) - Math.abs(b));
      expect(JSON.stringify(arr)).assertEqual('[1,2,-3,-5]');
    });

    /**
     * @tc.name testArraySortTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3800
     * @tc.desc MindMap sort test case 038
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['č', 'a', 'b', 'ć'];
      arr.sort((a: string, b: string): number => a.localeCompare(b));
      expect(JSON.stringify(arr)).assertEqual('["a","b","ć","č"]');
    });

    /**
     * @tc.name testArraySortTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_3900
     * @tc.desc MindMap sort test case 039
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortScoreObj[] = [{score: 80}, {score: 90}, {score: 70}];
      arr.sort((a: SortScoreObj, b: SortScoreObj): number => b.score - a.score);
      expect(JSON.stringify(arr)).assertEqual('[{"score":90},{"score":80},{"score":70}]');
    });

    /**
     * @tc.name testArraySortTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4000
     * @tc.desc MindMap sort test case 040. JS-only: heterogeneous default sort with object literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn41_testMixedTypesSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4100
     * @tc.desc MindMap sort test case 041
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const countVowels = (str: string): number => (str.match(/[aeiou]/gi) ?? []).length;
      const arr: string[] = ['apple', 'banana', 'cherry'];
      arr.sort((a: string, b: string): number => countVowels(a) - countVowels(b));
      expect(JSON.stringify(arr)).assertEqual('["cherry","apple","banana"]');
    });

    /**
     * @tc.name testArraySortTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4200
     * @tc.desc MindMap sort test case 042
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 5], [2, 3], [3, 7]];
      arr.sort((a: number[], b: number[]): number => a[1] - b[1]);
      expect(JSON.stringify(arr)).assertEqual('[[2,3],[1,5],[3,7]]');
    });

    /**
     * @tc.name testArraySortTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4300
     * @tc.desc MindMap sort test case 043
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr[arr.length - 1]).assertEqual(9);
    });

    /**
     * @tc.name testArraySortTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4400
     * @tc.desc MindMap sort test case 044
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name testArraySortTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4500
     * @tc.desc MindMap sort test case 045
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 1, 3];
      arr.sort((_a: number, _b: number): number => 0);
      expect(JSON.stringify(arr)).assertEqual('[2,1,3]');
    });

    /**
     * @tc.name testArraySortTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4600
     * @tc.desc MindMap sort test case 046
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['apple', 'Banana', 'cherry', 'Date'];
      arr.sort((a: string, b: string): number => {
        const firstA: string = a.charAt(0).toUpperCase();
        const firstB: string = b.charAt(0).toUpperCase();
        return firstA.localeCompare(firstB);
      });
      expect(JSON.stringify(arr)).assertEqual('["apple","Banana","cherry","Date"]');
    });

    /**
     * @tc.name testArraySortTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4700
     * @tc.desc MindMap sort test case 047
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: RegExp[] = [/z/, /a/, /m/];
      arr.sort((a: RegExp, b: RegExp): number => a.source.localeCompare(b.source));
      expect(arr[0].source).assertEqual('a');
      expect(arr[1].source).assertEqual('m');
      expect(arr[2].source).assertEqual('z');
    });

    /**
     * @tc.name testArraySortTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4800
     * @tc.desc MindMap sort test case 048
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortUserAgeObj[] = [
        {user: {age: 30}},
        {user: {age: 20}},
        {user: {age: 25}}
      ];
      arr.sort((a: SortUserAgeObj, b: SortUserAgeObj): number => a.user.age - b.user.age);
      expect(JSON.stringify(arr)).assertEqual('[{"user":{"age":20}},{"user":{"age":25}},{"user":{"age":30}}]');
    });

    /**
     * @tc.name testArraySortTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_4900
     * @tc.desc MindMap sort test case 049. JS-only: Node Buffer runtime dependency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn50_testBufferSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5000
     * @tc.desc MindMap sort test case 050
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['apple', 'banana', 'pineapple', 'grape'];
      arr.sort((a: string, b: string): number => {
        const hasA: number = a.includes('app') ? 0 : 1;
        const hasB: number = b.includes('app') ? 0 : 1;
        return hasA - hasB;
      });
      expect(JSON.stringify(arr)).assertEqual('["apple","pineapple","banana","grape"]');
    });

    /**
     * @tc.name testArraySortTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5100
     * @tc.desc MindMap sort test case 051
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: number = 1000; i > 0; i--) {
        arr.push(i);
      }
      const start: number = Date.now();
      arr.sort((a: number, b: number): number => a - b);
      const elapsed: number = Date.now() - start;
      expect(elapsed < 100).assertEqual(true);
      expect(arr[0]).assertEqual(1);
      expect(arr[999]).assertEqual(1000);
    });

    /**
     * @tc.name testArraySortTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5200
     * @tc.desc MindMap sort test case 052
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 3, 2, 3, 1, 3, 2, 1, 4];
      const countMap: Map<number, number> = new Map<number, number>();
      for (let i: number = 0; i < arr.length; i++) {
        const n: number = arr[i];
        const prev: number = countMap.get(n) ?? 0;
        countMap.set(n, prev + 1);
      }
      const unique: number[] = Array.from(new Set<number>(arr));
      unique.sort((a: number, b: number): number => (countMap.get(b) ?? 0) - (countMap.get(a) ?? 0));
      expect(JSON.stringify(unique)).assertEqual('[1,3,2,4]');
    });

    /**
     * @tc.name testArraySortTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5300
     * @tc.desc MindMap sort test case 053
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.sort((_a: number, _b: number): number => 1);
      expect(JSON.stringify(arr)).assertEqual('[1,2]');
    });

    /**
     * @tc.name testArraySortTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5400
     * @tc.desc MindMap sort test case 054
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [2, 1];
      arr.sort((_a: number, _b: number): number => -1);
      expect(JSON.stringify(arr)).assertEqual('[1,2]');
    });

    /**
     * @tc.name testArraySortTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5500
     * @tc.desc MindMap sort test case 055
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getAsciiSum = (str: string): number =>
        str.split('').reduce((sum: number, ch: string): number => sum + ch.charCodeAt(0), 0);
      const arr: string[] = ['a', 'bc', 'def'];
      arr.sort((a: string, b: string): number => getAsciiSum(a) - getAsciiSum(b));
      expect(JSON.stringify(arr)).assertEqual('["a","bc","def"]');
    });

    /**
     * @tc.name testArraySortTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5600
     * @tc.desc MindMap sort test case 056
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([3, 1, 2, 3]);
      const arr: number[] = Array.from(set);
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name testArraySortTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5700
     * @tc.desc MindMap sort test case 057
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: SortCreatedObj = { created: new Date(2023, 0, 1) };
      const obj2: SortCreatedObj = { created: new Date(2023, 1, 1) };
      const obj3: SortCreatedObj = { created: new Date(2022, 11, 31) };
      const arr: SortCreatedObj[] = [obj1, obj2, obj3];
      arr.sort((a: SortCreatedObj, b: SortCreatedObj): number =>
        a.created.getTime() - b.created.getTime());
      expect(arr[0]).assertEqual(obj3);
      expect(arr[1]).assertEqual(obj1);
      expect(arr[2]).assertEqual(obj2);
    });

    /**
     * @tc.name testArraySortTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5800
     * @tc.desc MindMap sort test case 058
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('a', 3);
      map.set('b', 1);
      map.set('c', 2);
      const values: number[] = Array.from(map.values());
      values.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(values)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name testArraySortTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_5900
     * @tc.desc MindMap sort test case 059
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isPalindrome = (str: string): boolean => str === str.split('').reverse().join('');
      const arr: string[] = ['level', 'hello', 'madam', 'world'];
      arr.sort((a: string, b: string): number => {
        const aIsPal: number = isPalindrome(a) ? 0 : 1;
        const bIsPal: number = isPalindrome(b) ? 0 : 1;
        return aIsPal - bIsPal;
      });
      expect(JSON.stringify(arr)).assertEqual('["level","madam","hello","world"]');
    });

    /**
     * @tc.name testArraySortTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6000
     * @tc.desc MindMap sort test case 060. JS-only: Array.prototype.sort.call on arrayLike
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn61_testArrayLikeSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6100
     * @tc.desc MindMap sort test case 061
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [3, 4, 1, 2, 5];
      arr.sort((a: number, b: number): number => {
        if (a % 2 === 0 && b % 2 !== 0) {
          return -1;
        }
        if (a % 2 !== 0 && b % 2 === 0) {
          return 1;
        }
        return a - b;
      });
      expect(JSON.stringify(arr)).assertEqual('[2,4,1,3,5]');
    });

    /**
     * @tc.name testArraySortTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6200
     * @tc.desc MindMap sort test case 062. JS-only: Symbol construction and description compare
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn63_testSymbolSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6300
     * @tc.desc MindMap sort test case 063
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortNameAgeOptional[] = [
        { name: 'Alice', age: 25 },
        { name: 'Bob' },
        { name: 'Charlie', age: 30 }
      ];
      arr.sort((a: SortNameAgeOptional, b: SortNameAgeOptional): number => {
        const hasAgeA: number = a.age !== undefined ? 0 : 1;
        const hasAgeB: number = b.age !== undefined ? 0 : 1;
        if (hasAgeA !== hasAgeB) {
          return hasAgeA - hasAgeB;
        }
        return (a.age ?? 0) - (b.age ?? 0);
      });
      expect(JSON.stringify(arr)).assertEqual('[{"name":"Alice","age":25},{"name":"Charlie","age":30},{"name":"Bob"}]');
    });

    /**
     * @tc.name testArraySortTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6400
     * @tc.desc MindMap sort test case 064
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['10', '5', '20', '15', '3'];
      arr.sort((a: string, b: string): number => parseInt(a) - parseInt(b));
      expect(JSON.stringify(arr)).assertEqual('["3","5","10","15","20"]');
    });

    /**
     * @tc.name testArraySortTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6500
     * @tc.desc MindMap sort test case 065. JS-only: Object.prototype.toString type tag ordering
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn66_testElementTypeSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6600
     * @tc.desc MindMap sort test case 066. JS-only: nested array type priority with untyped object literals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn67_testArrayTypePrioritySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6700
     * @tc.desc MindMap sort test case 067
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getNumberSum = (str: string): number => {
        const numbers: string[] = str.match(/\d/g) ?? [];
        return numbers.reduce((sum: number, num: string): number => sum + parseInt(num), 0);
      };
      const arr: string[] = ['a1b2', 'c3d4', 'e5f0'];
      arr.sort((a: string, b: string): number => getNumberSum(a) - getNumberSum(b));
      expect(JSON.stringify(arr)).assertEqual('["a1b2","e5f0","c3d4"]');
    });

    /**
     * @tc.name testArraySortTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6800
     * @tc.desc MindMap sort test case 068
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9, 2, 7];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.name testArraySortTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_6900
     * @tc.desc MindMap sort test case 069
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortNameObj[] = [{name: 'Anna'}, {name: 'Bob'}, {name: 'Alex'}];
      arr.sort((a: SortNameObj, b: SortNameObj): number => a.name.length - b.name.length);
      expect(JSON.stringify(arr)).assertEqual('[{"name":"Bob"},{"name":"Anna"},{"name":"Alex"}]');
    });

    /**
     * @tc.name testArraySortTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7000
     * @tc.desc MindMap sort test case 070
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['', 'apple', '', 'banana'];
      arr.sort((a: string, b: string): number => {
        if (a === '' && b !== '') {
          return -1;
        }
        if (a !== '' && b === '') {
          return 1;
        }
        return a.localeCompare(b);
      });
      expect(JSON.stringify(arr)).assertEqual('["","","apple","banana"]');
    });

    /**
     * @tc.name testArraySortTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7100
     * @tc.desc MindMap sort test case 071
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [-3, 1, -2, 4];
      arr.sort((a: number, b: number): number => a * a - b * b);
      expect(JSON.stringify(arr)).assertEqual('[1,-2,-3,4]');
    });

    /**
     * @tc.name testArraySortTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7200
     * @tc.desc MindMap sort test case 072. JS-only: generator function and yield
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn73_testGeneratorResultSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7300
     * @tc.desc MindMap sort test case 073
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortEventObj[] = [
        {event: 'Meeting', date: '2023-12-01'},
        {event: 'Party', date: '2023-01-15'},
        {event: 'Conference', date: '2023-06-30'}
      ];
      arr.sort((a: SortEventObj, b: SortEventObj): number =>
        new Date(a.date).getTime() - new Date(b.date).getTime());
      expect(JSON.stringify(arr)).assertEqual(
        '[{"event":"Party","date":"2023-01-15"},{"event":"Conference","date":"2023-06-30"},{"event":"Meeting","date":"2023-12-01"}]');
    });

    /**
     * @tc.name testArraySortTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7400
     * @tc.desc MindMap sort test case 074
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      arr.sort((a: number, b: number): number => a - b);
      let isIncreasing: boolean = true;
      for (let i: number = 1; i < arr.length; i++) {
        if (arr[i] <= arr[i - 1]) {
          isIncreasing = false;
        }
      }
      expect(isIncreasing).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7500
     * @tc.desc MindMap sort test case 075
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const countUpperCase = (str: string): number => (str.match(/[A-Z]/g) ?? []).length;
      const arr: string[] = ['Apple', 'BANANA', 'cherry', 'Date'];
      arr.sort((a: string, b: string): number => countUpperCase(b) - countUpperCase(a));
      expect(JSON.stringify(arr)).assertEqual('["BANANA","Apple","Date","cherry"]');
    });

    /**
     * @tc.name testArraySortTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7600
     * @tc.desc MindMap sort test case 076
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1], [1, 2, 3], [1, 2]];
      arr.sort((a: number[], b: number[]): number => a.length - b.length);
      expect(JSON.stringify(arr)).assertEqual('[[1],[1,2],[1,2,3]]');
    });

    /**
     * @tc.name testArraySortTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7700
     * @tc.desc MindMap sort test case 077. JS-only: object method callback with this binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn78_testObjectMethodReturnSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7800
     * @tc.desc MindMap sort test case 078
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [Infinity, 5, -Infinity, 10];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(10);
      expect(arr[0] < arr[1]).assertEqual(true);
      expect(arr[3] > arr[2]).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_7900
     * @tc.desc MindMap sort test case 079
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr.every((val: number, i: number, array: number[]): boolean =>
        i === 0 || val >= array[i - 1])).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8000
     * @tc.desc MindMap sort test case 080
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortNameObj[] = [{name: 'Charlie'}, {name: 'Alice'}, {name: 'Bob'}];
      arr.sort((a: SortNameObj, b: SortNameObj): number => b.name.localeCompare(a.name));
      expect(JSON.stringify(arr)).assertEqual('[{"name":"Charlie"},{"name":"Bob"},{"name":"Alice"}]');
    });

    /**
     * @tc.name testArraySortTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8100
     * @tc.desc MindMap sort test case 081
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      const expected: number[] = [...arr].sort((a: number, b: number): number => a - b);
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify(expected));
    });

    /**
     * @tc.name testArraySortTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8200
     * @tc.desc MindMap sort test case 082. JS-only: sort functions by Function.length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn84_testFunctionParameterCountSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8300
     * @tc.desc MindMap sort test case 083
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0x10, 0x5, 0x1A, 0x3];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[3,5,16,26]');
    });

    /**
     * @tc.name testArraySortTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8400
     * @tc.desc MindMap sort test case 084
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const countChar = (str: string, char: string): number =>
        (str.match(new RegExp(char, 'g')) ?? []).length;
      const arr: string[] = ['apple', 'banana', 'pineapple', 'grape'];
      arr.sort((a: string, b: string): number => countChar(b, 'p') - countChar(a, 'p'));
      expect(JSON.stringify(arr)).assertEqual('["pineapple","apple","grape","banana"]');
    });

    /**
     * @tc.name testArraySortTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8500
     * @tc.desc MindMap sort test case 085
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err1: Error = new Error('B error');
      const err2: Error = new Error('A error');
      const err3: Error = new Error('C error');
      const arr: Error[] = [err1, err2, err3];
      arr.sort((a: Error, b: Error): number => a.message.localeCompare(b.message));
      expect(arr[0]).assertDeepEquals(err2);
      expect(arr[1]).assertDeepEquals(err1);
      expect(arr[2]).assertDeepEquals(err3);
    });

    /**
     * @tc.name testArraySortTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8600
     * @tc.desc MindMap sort test case 086
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isPrime = (num: number): boolean => {
        if (num <= 1) {
          return false;
        }
        for (let i: number = 2; i <= Math.sqrt(num); i++) {
          if (num % i === 0) {
            return false;
          }
        }
        return true;
      };
      const arr: number[] = [4, 5, 9, 7, 10];
      arr.sort((a: number, b: number): number => {
        if (isPrime(a) && !isPrime(b)) {
          return -1;
        }
        if (!isPrime(a) && isPrime(b)) {
          return 1;
        }
        return a - b;
      });
      expect(JSON.stringify(arr)).assertEqual('[5,7,4,9,10]');
    });

    /**
     * @tc.name testArraySortTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8700
     * @tc.desc MindMap sort test case 087
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [9, 3, 7, 1, 5];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name testArraySortTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8800
     * @tc.desc MindMap sort test case 088
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: SortTagsObj[] = [
        {tags: ['js', 'array']},
        {tags: ['sort']},
        {tags: ['test', 'case', 'function']}
      ];
      arr.sort((a: SortTagsObj, b: SortTagsObj): number => a.tags.length - b.tags.length);
      expect(JSON.stringify(arr)).assertEqual(
        '[{"tags":["sort"]},{"tags":["js","array"]},{"tags":["test","case","function"]}]');
    });

    /**
     * @tc.name testArraySortTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_8900
     * @tc.desc MindMap sort test case 089
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1e3, 5e2, 2e3, 3e1];
      arr.sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(arr)).assertEqual('[30,500,1000,2000]');
    });

    /**
     * @tc.name testArraySortTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9000
     * @tc.desc MindMap sort test case 090
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['apple', 'apricot', 'banana', 'avocado'];
      arr.sort((a: string, b: string): number => {
        const aHas: number = a.startsWith('ap') ? 0 : 1;
        const bHas: number = b.startsWith('ap') ? 0 : 1;
        return aHas - bHas || a.localeCompare(b);
      });
      expect(JSON.stringify(arr)).assertEqual('["apple","apricot","avocado","banana"]');
    });

    /**
     * @tc.name testArraySortTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9100
     * @tc.desc MindMap sort test case 091. JS-only: WeakMap key ordering
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn93_testWeakMapKeysSort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9200
     * @tc.desc MindMap sort test case 092
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getDigitCount = (num: number): number => Math.abs(num).toString().length;
      const arr: number[] = [123, 45, 6, 7890];
      arr.sort((a: number, b: number): number => getDigitCount(a) - getDigitCount(b));
      expect(JSON.stringify(arr)).assertEqual('[6,45,123,7890]');
    });

    /**
     * @tc.name testArraySortTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9300
     * @tc.desc MindMap sort test case 093
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr.some((val: number): boolean => val === 8)).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9400
     * @tc.desc MindMap sort test case 094
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: SortPropCountTwo = { a: 1, b: 2 };
      const obj2: SortPropCountOne = { c: 3 };
      const obj3: SortPropCountThree = { d: 4, e: 5, f: 6 };
      const arr: (SortPropCountTwo | SortPropCountOne | SortPropCountThree)[] = [obj1, obj2, obj3];
      arr.sort((a: SortPropCountTwo | SortPropCountOne | SortPropCountThree,
        b: SortPropCountTwo | SortPropCountOne | SortPropCountThree): number =>
        Object.keys(a).length - Object.keys(b).length);
      expect(arr[0]).assertEqual(obj2);
      expect(arr[1]).assertEqual(obj1);
      expect(arr[2]).assertEqual(obj3);
    });

    /**
     * @tc.name testArraySortTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9500
     * @tc.desc MindMap sort test case 095
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [0, -0, 1, -1];
      arr.sort((a: number, b: number): number => a - b);
      expect(arr[3]).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.name testArraySortTest0195
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9600
     * @tc.desc MindMap sort test case 096
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getLastPos = (str: string, char: string): number => str.lastIndexOf(char);
      const arr: string[] = ['apple', 'pineapple', 'grape', 'banana'];
      arr.sort((a: string, b: string): number => getLastPos(a, 'p') - getLastPos(b, 'p'));
      expect(JSON.stringify(arr)).assertEqual('["banana","apple","grape","pineapple"]');
    });

    /**
     * @tc.name testArraySortTest0196
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9700
     * @tc.desc MindMap sort test case 097. JS-only: Promise array stable sort semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySortJs.Fn99_testPromiseArraySort()).assertEqual(true);
    });

    /**
     * @tc.name testArraySortTest0197
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9800
     * @tc.desc MindMap sort test case 098
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [4, 5, 2, 7, 10, 3];
      arr.sort((a: number, b: number): number => {
        if (a % 2 !== 0 && b % 2 === 0) {
          return -1;
        }
        if (a % 2 === 0 && b % 2 !== 0) {
          return 1;
        }
        return a - b;
      });
      expect(JSON.stringify(arr)).assertEqual('[3,5,7,2,4,10]');
    });

    /**
     * @tc.name testArraySortTest0198
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_9900
     * @tc.desc MindMap sort test case 099
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      const sorted1: number[] = arr.sort((a: number, b: number): number => a - b);
      const sorted2: number[] = [...arr].sort((a: number, b: number): number => a - b);
      expect(JSON.stringify(sorted1)).assertEqual(JSON.stringify(sorted2));
    });

    /**
     * @tc.name testArraySortTest0199
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SORT_SUPPLEMENT_TEST_0199
     * @tc.desc MindMap sort test case 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySortTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 3, 8, 1, 9];
      arr.sort((a: number, b: number): number => a - b);
      const keys: number[] = Array.from(arr.keys());
      expect(JSON.stringify(keys)).assertEqual('[0,1,2,3,4]');
    });

  })
}
