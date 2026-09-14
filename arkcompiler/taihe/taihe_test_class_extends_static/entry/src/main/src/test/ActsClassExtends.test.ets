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
import * as foo from '../ets/foo'

export default function classExtendsTest(): void {
  describe("ActsClassExtendsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ClassExtendsStruct_STATIC_0100
     * @tc.name      test_ClassExtendsStruct_Static_0001
     * @tc.desc      Test struct class extends: DerivedDataClass inherits from BaseDataClass, FooDataInterface, BarDataInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ClassExtendsStruct_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ClassExtendsStruct_Static_0001 start');
      try {
        let data: foo.DerivedDataClass = foo.makeDerivedDataClass();
        expect(data.a).assertEqual("base");
        expect(data.p).assertEqual("foo");
        expect(data.q).assertEqual("bar");
        expect(data.x).assertEqual(42);
        expect(data.y).assertEqual(56);
      } catch (e) {
        console.log('test_ClassExtendsStruct_Static_0001 failed', e.message);
        expect().assertFail();
      }
      console.log('test_ClassExtendsStruct_Static_0001 done');
      done();
      console.log('test_ClassExtendsStruct_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ClassExtendsInterface_STATIC_0100
     * @tc.name      test_ClassExtendsInterface_Static_0001
     * @tc.desc      Test interface class extends: DerivedMethodClass inherits from BaseMethodClass, FooInterface, BarInterface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ClassExtendsInterface_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ClassExtendsInterface_Static_0001 start');
      try {
        let obj: foo.DerivedMethodClass = new foo.DerivedMethodClass();
        expect(obj.base()).assertEqual("base");
        expect(obj.foo()).assertEqual("foo");
        expect(obj.bar()).assertEqual("bar");
        expect(obj.derived()).assertEqual("derived");
      } catch (e) {
        console.log('test_ClassExtendsInterface_Static_0001 failed', e.message);
        expect().assertFail();
      }
      console.log('test_ClassExtendsInterface_Static_0001 done');
      done();
      console.log('test_ClassExtendsInterface_Static_0001 end');
    });
  })
}