'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import * as test_array from '../ets/Index'

export default function arrayTest(): void {
  describe("ActsArrayTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_SumArray_STATIC_0100
     * @tc.name      test_SumArray_Static_0001
     * @tc.desc      sumArray sums int array with base
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SumArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SumArray_Static_0001 start');
      let numbers: int[] = [1, 2, 3, 4, 5];
      let sum = test_array.sumArray(numbers, 100);
      expect(sum).assertEqual(115);
      console.log('test_SumArray_Static_0001 done');
      done();
      console.log('test_SumArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_GetArrayValue_STATIC_0100
     * @tc.name      test_GetArrayValue_Static_0001
     * @tc.desc      getArrayValue reads long array by index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetArrayValue_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetArrayValue_Static_0001 start');
      let nums: long[] = [35, 45, 55];
      let res = test_array.getArrayValue(nums, 2);
      expect(res).assertEqual((55).toLong());
      console.log('test_GetArrayValue_Static_0001 done');
      done();
      console.log('test_GetArrayValue_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ToStingArray_STATIC_0100
     * @tc.name      test_ToStingArray_Static_0001
     * @tc.desc      toStingArray converts int array to string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ToStingArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ToStingArray_Static_0001 start');
      let nums: int[] = [35, 45, 55];
      let res = test_array.toStingArray(nums);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual("35");
      expect(res[1]).assertEqual("45");
      expect(res[2]).assertEqual("55");
      console.log('test_ToStingArray_Static_0001 done');
      done();
      console.log('test_ToStingArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MakeIntArray_STATIC_0100
     * @tc.name      test_MakeIntArray_Static_0001
     * @tc.desc      makeIntArray builds int array with given value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MakeIntArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MakeIntArray_Static_0001 start');
      let arr = test_array.makeIntArray(5, 3);
      expect(arr.length).assertEqual(3);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(5);
      }
      console.log('test_MakeIntArray_Static_0001 done');
      done();
      console.log('test_MakeIntArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MakeEnumArray_STATIC_0100
     * @tc.name      test_MakeEnumArray_Static_0001
     * @tc.desc      makeEnumArray builds enum array with given value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MakeEnumArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MakeEnumArray_Static_0001 start');
      let arr = test_array.makeEnumArray(test_array.Color.GREEN, 5);
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(test_array.Color.GREEN);
      }
      console.log('test_MakeEnumArray_Static_0001 done');
      done();
      console.log('test_MakeEnumArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MakeRecordArray_STATIC_0100
     * @tc.name      test_MakeRecordArray_Static_0001
     * @tc.desc      makeRecordArray builds record array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MakeRecordArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MakeRecordArray_Static_0001 start');
      let arr = test_array.makeRecordArray("k", 128, 3);
      expect(arr.length).assertEqual(3);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]["k"]).assertEqual((128).toLong());
      }
      console.log('test_MakeRecordArray_Static_0001 done');
      done();
      console.log('test_MakeRecordArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MakeStructArray_STATIC_0100
     * @tc.name      test_MakeStructArray_Static_0001
     * @tc.desc      makeStructArray builds struct array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MakeStructArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MakeStructArray_Static_0001 start');
      let arr = test_array.makeStructArray("a", "b", 5, 3);
      expect(arr.length).assertEqual(3);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i].a).assertEqual("a");
        expect(arr[i].b).assertEqual("b");
        expect(arr[i].c).assertEqual(5);
      }
      console.log('test_MakeStructArray_Static_0001 done');
      done();
      console.log('test_MakeStructArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MakeIntArray2_STATIC_0100
     * @tc.name      test_MakeIntArray2_Static_0001
     * @tc.desc      makeIntArray2 builds nested int array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MakeIntArray2_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MakeIntArray2_Static_0001 start');
      let arr = test_array.makeIntArray(5, 3);
      let arr2 = test_array.makeIntArray2(arr, 3);
      expect(arr2.length).assertEqual(3);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i].length).assertEqual(3);
        for (let j = 0; j < arr2[i].length; j++) {
          expect(arr2[i][j]).assertEqual(5);
        }
      }
      console.log('test_MakeIntArray2_Static_0001 done');
      done();
      console.log('test_MakeIntArray2_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ChangeEnumArray_STATIC_0100
     * @tc.name      test_ChangeEnumArray_Static_0001
     * @tc.desc      changeEnumArray replaces enum array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ChangeEnumArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ChangeEnumArray_Static_0001 start');
      let arr = test_array.makeEnumArray(test_array.Color.GREEN, 5);
      let arr2 = test_array.changeEnumArray(arr, test_array.Color.BLUE);
      expect(arr2.length).assertEqual(5);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i]).assertEqual(test_array.Color.BLUE);
      }
      console.log('test_ChangeEnumArray_Static_0001 done');
      done();
      console.log('test_ChangeEnumArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ChangeRecordArray_STATIC_0100
     * @tc.name      test_ChangeRecordArray_Static_0001
     * @tc.desc      changeRecordArray replaces record array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ChangeRecordArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ChangeRecordArray_Static_0001 start');
      let arr = test_array.makeRecordArray("k", 128, 3);
      let arr2 = test_array.changeRecordArray(arr, "v", 21);
      expect(arr2.length).assertEqual(3);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i]["v"]).assertEqual((21).toLong());
      }
      console.log('test_ChangeRecordArray_Static_0001 done');
      done();
      console.log('test_ChangeRecordArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ChangeStructArray_STATIC_0100
     * @tc.name      test_ChangeStructArray_Static_0001
     * @tc.desc      changeStructArray replaces struct array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ChangeStructArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ChangeStructArray_Static_0001 start');
      let arr = test_array.makeStructArray("a", "b", 5, 3);
      let arr2 = test_array.changeStructArray(arr, "aa", "bb", 3);
      expect(arr2.length).assertEqual(3);
      for (let i = 0; i < arr2.length; i++) {
        expect(arr2[i].a).assertEqual("aa");
        expect(arr2[i].b).assertEqual("bb");
        expect(arr2[i].c).assertEqual(3);
      }
      console.log('test_ChangeStructArray_Static_0001 done');
      done();
      console.log('test_ChangeStructArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_FetchBinaryData_STATIC_0100
     * @tc.name      test_FetchBinaryData_Static_0001
     * @tc.desc      fetchBinaryData sync, promise and async variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FetchBinaryData_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_FetchBinaryData_Static_0001 start');
      let syncData = test_array.fetchBinaryDataSync(5);
      expect(syncData.length).assertEqual(5);
      let promiseData = await test_array.fetchBinaryData(5);
      expect(promiseData.length).assertEqual(5);
      let asyncLen: int = 0;
      await new Promise<int>((resolve, reject): void => {
        test_array.fetchBinaryData(5, (error: BusinessError | null, data?: Array<float>): void => {
          if (error !== null && error.code !== 0) {
            reject(error as Error);
          } else {
            asyncLen = data!.length;
            resolve(asyncLen);
          }
        });
      });
      expect(asyncLen).assertEqual(5);
      console.log('test_FetchBinaryData_Static_0001 done');
      done();
      console.log('test_FetchBinaryData_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MakeStructArrayArray_STATIC_0100
     * @tc.name      test_MakeStructArrayArray_Static_0001
     * @tc.desc      makeStructArrayArray builds nested struct array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MakeStructArrayArray_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MakeStructArrayArray_Static_0001 start');
      let arr = test_array.makeStructArrayArray("a", "b", 5, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0].length).assertEqual(2);
      for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr[i].length; j++) {
          expect(arr[i][j].a).assertEqual("a");
          expect(arr[i][j].b).assertEqual("b");
          expect(arr[i][j].c).assertEqual(5);
        }
      }
      console.log('test_MakeStructArrayArray_Static_0001 done');
      done();
      console.log('test_MakeStructArrayArray_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_EnumColor_STATIC_0100
     * @tc.name      test_EnumColor_Static_0001
     * @tc.desc      Color enum string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumColor_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_EnumColor_Static_0001 start');
      let red: string = test_array.Color.RED.valueOf();
      let green: string = test_array.Color.GREEN.valueOf();
      let blue: string = test_array.Color.BLUE.valueOf();
      expect(red).assertEqual("Red");
      expect(green).assertEqual("Green");
      expect(blue).assertEqual("Blue");
      console.log('test_EnumColor_Static_0001 done');
      done();
      console.log('test_EnumColor_Static_0001 end');
    });
  })
}
