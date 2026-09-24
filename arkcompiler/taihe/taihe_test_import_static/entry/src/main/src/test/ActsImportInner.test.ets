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
import * as ohos_test from '../ets/@ohos.test';

export default function actsImportInnerTest(): void {
  describe("ActsImportInnerTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ImportInner_FUNC_STATIC_0100
     * @tc.name      test_MyStruct_0001
     * @tc.desc      inner.MyStruct interface construction and field access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MyStruct_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MyStruct_0001 start');
      let myStruct: ohos_test.inner.MyStruct = { v: 10 };
      expect(myStruct.v).assertEqual(10);
      myStruct.v = 20;
      expect(myStruct.v).assertEqual(20);
      console.log('test_MyStruct_0001 done');
      done();
      console.log('test_MyStruct_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportInner_FUNC_STATIC_0200
     * @tc.name      test_MyClass_Construct_0001
     * @tc.desc      inner.MyClass construction with v and u fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MyClass_Construct_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MyClass_Construct_0001 start');
      let obj = new ohos_test.inner.MyClass(5, 15);
      expect(obj.v).assertEqual(5);
      expect(obj.u).assertEqual(15);
      console.log('test_MyClass_Construct_0001 done');
      done();
      console.log('test_MyClass_Construct_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportInner_FUNC_STATIC_0300
     * @tc.name      test_MyClass_CopyConstruct_0001
     * @tc.desc      inner.MyClass copy construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MyClass_CopyConstruct_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MyClass_CopyConstruct_0001 start');
      let obj1 = new ohos_test.inner.MyClass(100, 200);
      let obj2 = new ohos_test.inner.MyClass(obj1);
      expect(obj2.v).assertEqual(100);
      expect(obj2.u).assertEqual(200);
      console.log('test_MyClass_CopyConstruct_0001 done');
      done();
      console.log('test_MyClass_CopyConstruct_0001 end');
    });
  })
}