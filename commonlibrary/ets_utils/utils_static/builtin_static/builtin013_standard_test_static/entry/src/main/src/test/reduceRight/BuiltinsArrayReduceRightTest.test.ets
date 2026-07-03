'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

interface Item {
  x: number;
}

interface ObjType {
  a?: number;
  b?: number;
}

export default function BuiltinsArrayReduceRightTest(): void {
  describe("BuiltinsArrayReduceRightTest", () => {
    beforeAll(async () => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(async () => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0100
     * @tc.desc   Verify reduceRight() with numeric array and initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      let sum: number = arr.reduceRight((acc: number, cur: number) => acc + cur, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0200
     * @tc.desc   Verify reduceRight() with string array concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<string> = ['a', 'b', 'c'];
      let result: string = arr.reduceRight((acc: string, cur: string) => acc + cur, '');
      expect(result).assertEqual('cba');
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0300
     * @tc.desc   Verify reduceRight() summing object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<Item> = [{x: 1}, {x: 2}, {x: 3}];
      let sum: number = arr.reduceRight((acc: number, cur: Item) => acc + cur.x, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0400
     * @tc.desc   Verify reduceRight() without initial value (uses last element)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      let sum: number = arr.reduceRight((acc: number, cur: number) => acc + cur);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0500
     * @tc.desc   Verify reduceRight() with single element array without initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [5];
      let result: number = arr.reduceRight((acc: number, cur: number) => acc + cur);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0600
     * @tc.desc   Verify reduceRight() returning number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: number = arr.reduceRight((acc: number, cur: number) => acc * cur, 1);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0700
     * @tc.desc   Verify reduceRight() returning string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: string = arr.reduceRight((acc: string, cur: number) => acc + cur.toString(), '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0800
     * @tc.desc   Verify reduceRight() returning object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<ObjType> = [{a: 1}, {b: 2}];

      let initial: ObjType = {};
      let result: ObjType = arr.reduceRight((acc: ObjType, cur: ObjType): ObjType => {
        const res: ObjType = {};
        if (acc.a !== undefined) res.a = acc.a;
        if (acc.b !== undefined) res.b = acc.b;
        if (cur.a !== undefined) res.a = cur.a;
        if (cur.b !== undefined) res.b = cur.b;
        return res;
      }, initial);

      expect(result.a).assertEqual(1);
      expect(result.b).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_0900
     * @tc.desc   Verify reduceRight() returning array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReduceRightTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reduceRight((acc: Array<number>, cur: number) => [...acc, cur], []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_1000
     * @tc.desc   Verify reduceRight() with explicit initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceRightTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: number = arr.reduceRight((acc: number, cur: number) => acc + cur, 100);
      expect(result).assertEqual(106);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_1100
     * @tc.desc   Verify reduceRight() on empty array with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceRightTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [];
      let result: number = arr.reduceRight((acc: number, cur: number) => acc + cur, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_1200
     * @tc.desc   Verify reduceRight() on single element with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceRightTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [5];
      let result: number = arr.reduceRight((acc: number, cur: number) => acc + cur, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_1300
     * @tc.desc   Verify reduceRight() with null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceRightTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | null> = [1, null, 3];
      let result: number = arr.reduceRight((acc: number, cur: number | null) => {
        let val: number = cur !== null ? cur : 0;
        return acc + val;
      }, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_1400
     * @tc.desc   Verify reduceRight() with boolean initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceRightTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<boolean> = [true, false, true];
      let result: boolean = arr.reduceRight((acc: boolean, cur: boolean) => acc && cur, true);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_TEST_1500
     * @tc.desc   Verify reduceRight() vs reduce() subtraction difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceRightTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let reduceResult: number = arr.reduce((acc: number, cur: number) => acc - cur);
      let reduceRightResult: number = arr.reduceRight((acc: number, cur: number) => acc - cur);
      expect(reduceResult).assertEqual(-4);
      expect(reduceRightResult).assertEqual(0);
    });

  });
}
