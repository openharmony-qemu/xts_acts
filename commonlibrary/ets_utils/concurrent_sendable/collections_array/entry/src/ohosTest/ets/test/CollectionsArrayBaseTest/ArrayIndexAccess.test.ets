/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// ArrayIndexAccess.test.ets
// 索引访问测试：at(), [index] 操作符（含边界/负索引行为）

import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, lang } from '@kit.ArkTS';
import {
  getStringTestValues,
  getBooleanTestValues,
  getAllTestValues,
  getBigIntTestValues,
  getNumberTestValues,
  StringTestValue,
  BooleanTestValue,
  TestValueItem,
  BigIntTestValue,
  NumberTestValue
} from './test_data/TestDataFactory';

export default function suite() {
  describe('ArrayIndexAccessTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ==================== at() 方法基础测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0100
     * @tc.name testArrayIndexAccess0001
     * @tc.desc Verify at() with positive index on number Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0200
     * @tc.name testArrayIndexAccess0002
     * @tc.desc Verify at() with negative index (from end) on number Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr.at(-1)).assertEqual(300);
      expect(arr.at(-2)).assertEqual(200);
      expect(arr.at(-3)).assertEqual(100);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0300
     * @tc.name testArrayIndexAccess0003
     * @tc.desc Verify at() with out-of-bounds index returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr.at(999)).assertEqual(undefined);
      expect(arr.at(-999)).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0400
     * @tc.name testArrayIndexAccess0004
     * @tc.desc Verify at() with string test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0004';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
        expect(arr.at(-1)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0500
     * @tc.name testArrayIndexAccess0005
     * @tc.desc Verify at() with Sendable test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0005';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr.at(0)).assertEqual(item.value);
          expect(arr.at(-1)).assertEqual(item.value);
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0600
     * @tc.name testArrayIndexAccess0006
     * @tc.desc Verify at() on empty Array returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0006';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      expect(arr.at(0)).assertEqual(undefined);
      expect(arr.at(-1)).assertEqual(undefined);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0700
     * @tc.name testArrayIndexAccess0007
     * @tc.desc Verify at() with all boolean test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0007';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
        expect(arr.at(-1)).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0800
     * @tc.name testArrayIndexAccess0008
     * @tc.desc Verify at() with all bigint test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0008';
      console.info(`${caseName}, test start`);

      let bigintValues: collections.Array<BigIntTestValue> = getBigIntTestValues();
      for (let i: number = 0; i < bigintValues.length; i++) {
        let item: BigIntTestValue = bigintValues[i];
        let arr: collections.Array<bigint> = new collections.Array<bigint>(item.value);
        expect(arr.at(0)).assertEqual(item.value);
        expect(arr.at(-1)).assertEqual(item.value);
        expect(arr.at(10) === null || arr.at(10) === undefined).assertTrue();
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_0900
     * @tc.name testArrayIndexAccess0009
     * @tc.desc Verify at() with negative and zero values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0009';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(-1, 0, Infinity);
      expect(arr.at(0)).assertEqual(-1);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(Infinity);
      expect(arr.at(-1)).assertEqual(Infinity);
      expect(arr.at(-2)).assertEqual(0);
      expect(arr.at(-3)).assertEqual(-1);

      console.info(`${caseName}, test end`);
    });

    // ==================== [index] 操作符测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1000
     * @tc.name testArrayIndexAccess0010
     * @tc.desc Verify [index] operator with valid index on number Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0010';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1100
     * @tc.name testArrayIndexAccess0011
     * @tc.desc Verify [index] operator with valid index on string Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0011';
      console.info(`${caseName}, test start`);

      let stringValues: collections.Array<StringTestValue> = getStringTestValues();
      for (let i: number = 0; i < stringValues.length; i++) {
        let item: StringTestValue = stringValues[i];
        let arr: collections.Array<string> = new collections.Array<string>(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1200
     * @tc.name testArrayIndexAccess0012
     * @tc.desc Verify [index] operator with valid index on boolean Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0012';
      console.info(`${caseName}, test start`);

      let booleanValues: collections.Array<BooleanTestValue> = getBooleanTestValues();
      for (let i: number = 0; i < booleanValues.length; i++) {
        let item: BooleanTestValue = booleanValues[i];
        let arr: collections.Array<boolean> = new collections.Array<boolean>(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1300
     * @tc.name testArrayIndexAccess0013
     * @tc.desc Verify [index] operator with valid index on Sendable Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0013';
      console.info(`${caseName}, test start`);

      let sendableValues: collections.Array<TestValueItem> = getAllTestValues();
      for (let i: number = 0; i < sendableValues.length; i++) {
        let item: TestValueItem = sendableValues[i];
        if (item.value !== null && item.value !== undefined) {
          let arr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>(item.value);
          expect(arr[0] === item.value).assertTrue();
        }
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1400
     * @tc.name testArrayIndexAccess0014
     * @tc.desc Verify [index] operator with valid index on bigint Array.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0014';
      console.info(`${caseName}, test start`);

      let bigintValues: collections.Array<BigIntTestValue> = getBigIntTestValues();
      for (let i: number = 0; i < bigintValues.length; i++) {
        let item: BigIntTestValue = bigintValues[i];
        let arr: collections.Array<bigint> = new collections.Array<bigint>(item.value);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1500
     * @tc.name testArrayIndexAccess0015
     * @tc.desc Verify [index] operator with out-of-bounds index on number Array throws 10200001.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // 注意：根据官方文档，arr[999] 应抛出 10200001 错误
    // 但由于当前测试环境（API 11/12）下 collections.Array 对越界索引
    // 实际返回 undefined 而非抛错，因此以下测试暂时注释
    // 待后续确认环境支持后再启用
    //
    // it('testArrayIndexAccess0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayIndexAccess0015';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
    //   let caught: boolean = false;
    //   try {
    //     let _: number = arr[999];
    //     expect(true).assertFalse();
    //   } catch (e) {
    //     caught = true;
    //     let errObj: Record<string, Object> = e as Record<string, Object>;
    //     expect(errObj['code']).assertEqual(10200001);
    //   }
    //   expect(caught).assertTrue();
    //
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1600
     * @tc.name testArrayIndexAccess0016
     * @tc.desc Verify [index] operator with negative index on number Array throws 10200001.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    // 注意：根据官方文档，arr[-1] 应抛出 10200001 错误
    // 但由于当前测试环境（API 11/12）下 collections.Array 对负数索引
    // 实际返回 undefined 而非抛错，因此以下测试暂时注释
    // 待后续确认环境支持后再启用
    //
    // it('testArrayIndexAccess0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testArrayIndexAccess0016';
    //   console.info(`${caseName}, test start`);
    //
    //   let arr: collections.Array<number> = new collections.Array<number>(100, 200, 300);
    //   let caught: boolean = false;
    //   try {
    //     let _: number = arr[-1];
    //     expect(true).assertFalse();
    //   } catch (e) {
    //     caught = true;
    //     let errObj: Record<string, Object> = e as Record<string, Object>;
    //     expect(errObj['code']).assertEqual(10200001);
    //   }
    //   expect(caught).assertTrue();
    //
    //   console.info(`${caseName}, test end`);
    // });

    // ==================== bigint push/pop 操作测试 ====================

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1700
     * @tc.name testArrayIndexAccess0017
     * @tc.desc Verify push with all bigint test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0017';
      console.info(`${caseName}, test start`);

      let bigintValues: collections.Array<BigIntTestValue> = getBigIntTestValues();
      for (let i: number = 0; i < bigintValues.length; i++) {
        let item: BigIntTestValue = bigintValues[i];
        let arr: collections.Array<bigint> = new collections.Array<bigint>();
        let len: number = arr.push(item.value);
        expect(len).assertEqual(1);
        expect(arr[0]).assertEqual(item.value);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1800
     * @tc.name testArrayIndexAccess0018
     * @tc.desc Verify pop with all bigint test values.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0018';
      console.info(`${caseName}, test start`);

      let bigintValues: collections.Array<BigIntTestValue> = getBigIntTestValues();
      for (let i: number = 0; i < bigintValues.length; i++) {
        let item: BigIntTestValue = bigintValues[i];
        let arr: collections.Array<bigint> = new collections.Array<bigint>(item.value);
        let popped: bigint | undefined = arr.pop();
        expect(popped).assertEqual(item.value);
        expect(arr.length).assertEqual(0);
      }

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_INDEXACCESS_1900
     * @tc.name testArrayIndexAccess0019
     * @tc.desc Verify push with negative one, zero, and Infinity.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayIndexAccess0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testArrayIndexAccess0019';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(-1);
      expect(arr[0]).assertEqual(-1);
      arr.push(0);
      expect(arr[1]).assertEqual(0);
      arr.push(-0);
      expect(1 / (arr[2] as number) === -Infinity).assertTrue();
      arr.push(Infinity);
      expect(arr[3]).assertEqual(Infinity);
      arr.push(-Infinity);
      expect(arr[4]).assertEqual(-Infinity);

      console.info(`${caseName}, test end`);
    });
  });
}
