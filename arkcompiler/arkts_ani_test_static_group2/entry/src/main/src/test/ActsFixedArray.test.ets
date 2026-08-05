'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function fixedArrayTest(): void {

  describe("ActsFixedArrayTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GET_0100
     * @tc.name      test_FixedArray_Get_0001
     * @tc.desc      get ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Get_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Get_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get();
        expect(result).assertTrue();
        console.log('test_FixedArray_Get_0001 done');
        done();
        console.log('test_FixedArray_Get_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GET_0200
     * @tc.name      test_FixedArray_Get_0002
     * @tc.desc      get ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Get_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Get_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Get_0002 done');
        done();
        console.log('test_FixedArray_Get_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GET_0300
     * @tc.name      test_FixedArray_Get_0003
     * @tc.desc      get ref ok tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Get_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Get_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Get_0003 done');
        done();
        console.log('test_FixedArray_Get_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GETLENGTH_0100
     * @tc.name      test_FixedArray_GetLength_0001
     * @tc.desc      get length reference array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_GetLength_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_GetLength_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength();
        expect(result).assertTrue();
        console.log('test_FixedArray_GetLength_0001 done');
        done();
        console.log('test_FixedArray_GetLength_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GETLENGTH_0200
     * @tc.name      test_FixedArray_GetLength_0002
     * @tc.desc      get length invalid args test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_GetLength_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_GetLength_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_GetLength_0002 done');
        done();
        console.log('test_FixedArray_GetLength_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_GETLENGTH_0300
     * @tc.name      test_FixedArray_GetLength_0003
     * @tc.desc      get length reference component types test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_GetLength_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_GetLength_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_GetLength_0003 done');
        done();
        console.log('test_FixedArray_GetLength_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_0100
     * @tc.name      test_FixedArray_New_0001
     * @tc.desc      new ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_0001 done');
        done();
        console.log('test_FixedArray_New_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_0200
     * @tc.name      test_FixedArray_New_0002
     * @tc.desc      new ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_0002 done');
        done();
        console.log('test_FixedArray_New_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_0300
     * @tc.name      test_FixedArray_New_0003
     * @tc.desc      new object array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_0003 done');
        done();
        console.log('test_FixedArray_New_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_0400
     * @tc.name      test_FixedArray_New_0004
     * @tc.desc      new object array test 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_0004 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_03();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_0004 done');
        done();
        console.log('test_FixedArray_New_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_NEW_0500
     * @tc.name      test_FixedArray_New_0005
     * @tc.desc      new object array test 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_New_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_New_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_New_0005 done');
        done();
        console.log('test_FixedArray_New_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_0100
     * @tc.name      test_FixedArray_Set_0001
     * @tc.desc      set ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_0001 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_0001 done');
        done();
        console.log('test_FixedArray_Set_0001 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_0200
     * @tc.name      test_FixedArray_Set_0002
     * @tc.desc      set ref error tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_0002 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_01();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_0002 done');
        done();
        console.log('test_FixedArray_Set_0002 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_0300
     * @tc.name      test_FixedArray_Set_0003
     * @tc.desc      set ref ok tests
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_0003 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_02();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_0003 done');
        done();
        console.log('test_FixedArray_Set_0003 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_0400
     * @tc.name      test_FixedArray_Set_0004
     * @tc.desc      set ref error value to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Set_0400 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_03();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_0004 done');
        done();
        console.log('test_FixedArray_Set_0004 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_0500
     * @tc.name      test_FixedArray_Set_0005
     * @tc.desc      set get union to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_0005 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_04();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_0005 done');
        done();
        console.log('test_FixedArray_Set_0005 end');
      })

    /**
     * @tc.number    SUB_ANI_FIXEDARRAY_SET_0600
     * @tc.name      test_FixedArray_Set_0006
     * @tc.desc      set get stability to array test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it("test_FixedArray_Set_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('test_FixedArray_Set_0006 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_05();
        expect(result).assertTrue();
        console.log('test_FixedArray_Set_0006 done');
        done();
        console.log('test_FixedArray_Set_0006 end');
      })
  })
}
