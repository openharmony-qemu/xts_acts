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

class UserFoo implements ani_test.Foo {
    name: string;
    constructor(name: string) {
        this.name = name;
    }
    bar(): void {
        console.log('UserFoo(' + this.name + ') is calling bar()');
    }
}

export default function actsAniTestInterfaceTest(): void {
  describe("ActsAniTestInterface", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Test_Anitestinterface_STATIC_0100
     * @tc.name      test_interface_foo
     * @tc.desc      Test makeFoo returning C++ Foo implementations and callBar with user Foo implementations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_interface_foo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_interface_foo start');
      let impl_foo_list = ani_test.makeFoo(['A', 'B', 'C']);
      expect(impl_foo_list.length).assertEqual(3);
      for (let i = 0; i < impl_foo_list.length; i++) {
      impl_foo_list[i].bar();
      }

      const X: ani_test.Foo = new UserFoo('X');
      const Y: ani_test.Foo = new UserFoo('Y');
      const Z: ani_test.Foo = new UserFoo('Z');
      const userFoos: Array<ani_test.Foo> = [X, Y, Z];
      expect(userFoos.length).assertEqual(3);
      ani_test.callBar(userFoos);
      console.log('test_interface_foo done');
      done();
      console.log('test_interface_foo end');

    })
  })
}