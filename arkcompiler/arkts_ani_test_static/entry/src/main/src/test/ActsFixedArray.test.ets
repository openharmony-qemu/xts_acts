/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function fixedArrayTest() {

  describe("ActsFixedArrayTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /*
     * @tc.number    : FixedArray_GetLength_0100
     * @tc.name      : FixedArray_GetLength_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_GetLength_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_GetLength_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_GetLength();
        expect(result).assertTrue();
        console.log('FixedArray_GetLength_0100 done');
        done();
        console.log('FixedArray_GetLength_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Boolean_0100
     * @tc.name      : FixedArray_Boolean_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Boolean_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Boolean_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Boolean();
        expect(result).assertTrue();
        console.log('FixedArray_Boolean_0100 done');
        done();
        console.log('FixedArray_Boolean_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Byte_0100
     * @tc.name      : FixedArray_Byte_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Byte_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Byte_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Byte();
        expect(result).assertTrue();
        console.log('FixedArray_Byte_0100 done');
        done();
        console.log('FixedArray_Byte_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Char_0100
     * @tc.name      : FixedArray_Char_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Char_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Char_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Char();
        expect(result).assertTrue();
        console.log('FixedArray_Char_0100 done');
        done();
        console.log('FixedArray_Char_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Short_0100
     * @tc.name      : FixedArray_Short_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Short_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Short_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Short();
        expect(result).assertTrue();
        console.log('FixedArray_Short_0100 done');
        done();
        console.log('FixedArray_Short_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Int_0100
     * @tc.name      : FixedArray_Int_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Int_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Int_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Int();
        expect(result).assertTrue();
        console.log('FixedArray_Int_0100 done');
        done();
        console.log('FixedArray_Int_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Long_0100
     * @tc.name      : FixedArray_Long_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Long_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Long_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Long();
        expect(result).assertTrue();
        console.log('FixedArray_Long_0100 done');
        done();
        console.log('FixedArray_Long_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Float_0100
     * @tc.name      : FixedArray_Float_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Float_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Float_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Float();
        expect(result).assertTrue();
        console.log('FixedArray_Float_0100 done');
        done();
        console.log('FixedArray_Float_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Double_0100
     * @tc.name      : FixedArray_Double_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Double_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Double_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Double();
        expect(result).assertTrue();
        console.log('FixedArray_Double_0100 done');
        done();
        console.log('FixedArray_Double_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Get_Ref_0100
     * @tc.name      : FixedArray_Get_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Get_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Get_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Get_Ref();
        expect(result).assertTrue();
        console.log('FixedArray_Get_Ref_0100 done');
        done();
        console.log('FixedArray_Get_Ref_0100 end');
      })

    /*
     * @tc.number    : FixedArray_New_Ref_0100
     * @tc.name      : FixedArray_New_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_New_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_New_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_New_Ref();
        expect(result).assertTrue();
        console.log('FixedArray_New_Ref_0100 done');
        done();
        console.log('FixedArray_New_Ref_0100 end');
      })

    /*
     * @tc.number    : FixedArray_Set_Ref_0100
     * @tc.name      : FixedArray_Set_Ref_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("FixedArray_Set_Ref_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('FixedArray_Set_Ref_0100 start');
        let cls = new Foo();
        let result = cls.test_FixedArray_Set_Ref();
        expect(result).assertTrue();
        console.log('FixedArray_Set_Ref_0100 done');
        done();
        console.log('FixedArray_Set_Ref_0100 end');
      })
  })
}