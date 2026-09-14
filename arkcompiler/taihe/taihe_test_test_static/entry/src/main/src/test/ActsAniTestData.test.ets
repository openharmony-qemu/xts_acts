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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as ani_test from '../ets/ani_test';

export default function actsAniTestDataTest(): void {
  describe("ActsAniTestData", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Test_Anitestdata_STATIC_0100
     * @tc.name      test_data_struct
     * @tc.desc      Test Data struct creation and makeData return values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_data_struct", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_data_struct start');
      const option: ani_test.Data = {
      src: 'path/to/source',
      dest: 123,
      files: ['file1.txt', 'file2.txt', 'file3.txt']
      };
      ani_test.showData(option);

      const result = ani_test.makeData();
      expect(result.src).assertEqual('C++ Object');
      expect(result.dest).assertEqual(1);
      expect(result.files.length).assertEqual(2);
      expect(result.files[0]).assertEqual('file.txt');
      expect(result.files[1]).assertEqual('file.txt');
      console.log('test_data_struct done');
      done();
      console.log('test_data_struct end');

    })

    /**
     * @tc.number    SUB_Taihe_Test_Anitestdata_STATIC_0200
     * @tc.name      test_union
     * @tc.desc      Test union showUnion and makeUnion with all variant types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_union", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_union start');
      ani_test.showUnion((1).toInt());
      ani_test.showUnion(2.0f);
      ani_test.showUnion('Hello from STS!');
      ani_test.showUnion(null);
      ani_test.showUnion(undefined);

      const union1 = ani_test.makeUnion(1);
      expect(union1).assertEqual(100);

      const union2 = ani_test.makeUnion(2);
      expect(union2).assertEqual(0.5);

      const union3 = ani_test.makeUnion(3);
      expect(union3).assertEqual('Hello from C++!');

      const union4 = ani_test.makeUnion(4);
      expect(union4).assertEqual(null);

      const union0 = ani_test.makeUnion(0);
      expect(union0).assertEqual(undefined);
      console.log('test_union done');
      done();
      console.log('test_union end');

    })

    /**
     * @tc.number    SUB_Taihe_Test_Anitestdata_STATIC_0300
     * @tc.name      test_optional
     * @tc.desc      Test optional showOptionalInt and makeOptionalInt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_optional", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_optional start');
      ani_test.showOptionalInt((100).toInt());
      ani_test.showOptionalInt(undefined);

      const optTrue = ani_test.makeOptionalInt(true);
      expect(optTrue).assertEqual(10);

      const optFalse = ani_test.makeOptionalInt(false);
      expect(optFalse).assertEqual(undefined);
      console.log('test_optional done');
      done();
      console.log('test_optional end');

    })

    /**
     * @tc.number    SUB_Taihe_Test_Anitestdata_STATIC_0400
     * @tc.name      test_array
     * @tc.desc      Test array showArrayInt and makeArrayInt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_array", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_array start');
      ani_test.showArrayInt([1, 2, 3]);

      const arr = ani_test.makeArrayInt(10, 123);
      expect(arr.length).assertEqual(10);
      for (let i = 0; i < arr.length; i++) {
      expect(arr[i]).assertEqual(123);
      }
      console.log('test_array done');
      done();
      console.log('test_array end');

    })
  })
}