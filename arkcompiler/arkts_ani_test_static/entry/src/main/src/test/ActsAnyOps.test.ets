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

export default function anyOpsTest() {

  describe("ActsAnyOpsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e) {
      e = e as Error;
      console.log('loadFailed', e.message);
    }

    /*
     * @tc.number    : Any_CallMethod_0100
     * @tc.name      : Any_CallMethod_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_CallMethod_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_CallMethod_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_CallMethod();
        expect(result).assertTrue();
        console.log('Any_CallMethod_0100 done');
        done();
        console.log('Any_CallMethod_0100 end');
      })

    /*
     * @tc.number    : Any_GetByIndex_0100
     * @tc.name      : Any_GetByIndex_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_GetByIndex_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_GetByIndex_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_GetByIndex();
        expect(result).assertTrue();
        console.log('Any_GetByIndex_0100 done');
        done();
        console.log('Any_GetByIndex_0100 end');
      })

    /*
     * @tc.number    : Any_GetByValue_0100
     * @tc.name      : Any_GetByValue_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_GetByValue_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_GetByValue_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_GetByValue();
        expect(result).assertTrue();
        console.log('Any_GetByValue_0100 done');
        done();
        console.log('Any_GetByValue_0100 end');
      })

    /*
     * @tc.number    : Any_GetProperty_0100
     * @tc.name      : Any_GetProperty_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_GetProperty_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_GetProperty_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_GetProperty();
        expect(result).assertTrue();
        console.log('Any_GetProperty_0100 done');
        done();
        console.log('Any_GetProperty_0100 end');
      })

    /*
     * @tc.number    : Any_InstanceOf_0100
     * @tc.name      : Any_InstanceOf_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_InstanceOf_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_InstanceOf_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_InstanceOf();
        expect(result).assertTrue();
        console.log('Any_InstanceOf_0100 done');
        done();
        console.log('Any_InstanceOf_0100 end');
      })

    /*
     * @tc.number    : Any_New_0100
     * @tc.name      : Any_New_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_New_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_New_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_New();
        expect(result).assertTrue();
        console.log('Any_New_0100 done');
        done();
        console.log('Any_New_0100 end');
      })

    /*
     * @tc.number    : Any_SetByIndex_0100
     * @tc.name      : Any_SetByIndex_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_SetByIndex_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_SetByIndex_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_SetByIndex();
        expect(result).assertTrue();
        console.log('Any_SetByIndex_0100 done');
        done();
        console.log('Any_SetByIndex_0100 end');
      })

    /*
     * @tc.number    : Any_SetByValue_0100
     * @tc.name      : Any_SetByValue_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_SetByValue_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_SetByValue_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_SetByValue();
        expect(result).assertTrue();
        console.log('Any_SetByValue_0100 done');
        done();
        console.log('Any_SetByValue_0100 end');
      })

    /*
     * @tc.number    : Any_SetProperty_0100
     * @tc.name      : Any_SetProperty_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("Any_SetProperty_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        console.log('Any_SetProperty_0100 start');
        let cls = new Foo();
        let result = cls.test_Any_SetProperty();
        expect(result).assertTrue();
        console.log('Any_SetProperty_0100 done');
        done();
        console.log('Any_SetProperty_0100 end');
      })
  })
}