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

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import * as test from '../ets/Index'

export default function keepNameTest(): void {
  describe("ActsKeepNameTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC1_STATIC_0100
     * @tc.name      test_foo_bar_Static_0001
     * @tc.desc      Foo.Bar() with no input should not throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_bar_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_bar_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        foo.bar();
      } catch (e) {
        pass = false;
        console.log('foo_bar failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_bar_Static_0001 done');
      done();
      console.log('test_foo_bar_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC2_STATIC_0100
     * @tc.name      test_foo_set_name_Static_0001
     * @tc.desc      Foo.SetName(String) should set the name property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_set_name_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_set_name_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        foo.name = "taihe";
        let name = foo.name;
        expect(name).assertEqual("taihe");
      } catch (e) {
        pass = false;
        console.log('foo_set_name failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_set_name_Static_0001 done');
      done();
      console.log('test_foo_set_name_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC3_STATIC_0100
     * @tc.name      test_foo_get_name_default_Static_0001
     * @tc.desc      Foo.GetName() should return the default name "foo"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_get_name_default_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_get_name_default_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        let name = foo.name;
        expect(name).assertEqual("foo");
      } catch (e) {
        pass = false;
        console.log('foo_get_name_default failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_get_name_default_Static_0001 done');
      done();
      console.log('test_foo_get_name_default_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC4_STATIC_0100
     * @tc.name      test_foo_set_get_name_Static_0001
     * @tc.desc      Foo.SetName() then GetName() should return the updated name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_foo_set_get_name_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_set_get_name_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        foo.name = "openharmony";
        let name = foo.name;
        expect(name).assertEqual("openharmony");
      } catch (e) {
        pass = false;
        console.log('foo_set_get_name failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_set_get_name_Static_0001 done');
      done();
      console.log('test_foo_set_get_name_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC5_STATIC_0100
     * @tc.name      test_print_foo_name_Static_0001
     * @tc.desc      PrintFooName(Foo) should return the foo's name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_print_foo_name_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_print_foo_name_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        foo.name = "test_name";
        let result = test.printFooName(foo);
        expect(result).assertEqual("test_name");
      } catch (e) {
        pass = false;
        console.log('print_foo_name failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_print_foo_name_Static_0001 done');
      done();
      console.log('test_print_foo_name_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC6_STATIC_0100
     * @tc.name      test_get_foo_iface_Static_0001
     * @tc.desc      GetFooIface() should return a Foo instance without throwing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_get_foo_iface_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_get_foo_iface_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
      } catch (e) {
        pass = false;
        console.log('get_foo_iface failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_get_foo_iface_Static_0001 done');
      done();
      console.log('test_get_foo_iface_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC7_STATIC_0100
     * @tc.name      test_get_ibase_Static_0001
     * @tc.desc      GetIBase(String, String) should return an IBase instance without throwing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_get_ibase_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_get_ibase_Static_0001 start');
      let pass: boolean = true;
      try {
        let ibase = test.getIBase("hello", "world");
      } catch (e) {
        pass = false;
        console.log('get_ibase failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_get_ibase_Static_0001 done');
      done();
      console.log('test_get_ibase_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC8_STATIC_0100
     * @tc.name      test_ibase_on_set_callback_Static_0001
     * @tc.desc      IBase.OnSet(callback) should invoke the callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ibase_on_set_callback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ibase_on_set_callback_Static_0001 start');
      let pass: boolean = true;
      let callbackInvoked: boolean = false;
      try {
        let ibase = test.getIBase("hello", "world");
        ibase.onSet((): void => {
          callbackInvoked = true;
          console.log("onSet callback invoked!");
        });
        expect(callbackInvoked).assertTrue();
      } catch (e) {
        pass = false;
        console.log('ibase_on_set_callback failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ibase_on_set_callback_Static_0001 done');
      done();
      console.log('test_ibase_on_set_callback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC9_STATIC_0100
     * @tc.name      test_ibase_off_set_callback_Static_0001
     * @tc.desc      IBase.OffSet(callback) should invoke the callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ibase_off_set_callback_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ibase_off_set_callback_Static_0001 start');
      let pass: boolean = true;
      let callbackInvoked: boolean = false;
      try {
        let ibase = test.getIBase("hello", "world");
        ibase.offSet((): void => {
          callbackInvoked = true;
          console.log("offSet callback invoked!");
        });
        expect(callbackInvoked).assertTrue();
      } catch (e) {
        pass = false;
        console.log('ibase_off_set_callback failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ibase_off_set_callback_Static_0001 done');
      done();
      console.log('test_ibase_off_set_callback_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC10_STATIC_0100
     * @tc.name      test_foo_set_name_empty_Static_0001
     * @tc.desc      Foo.SetName("") with empty string should set empty name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_foo_set_name_empty_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_set_name_empty_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        foo.name = "";
        let name = foo.name;
        expect(name).assertEqual("");
      } catch (e) {
        pass = false;
        console.log('foo_set_name_empty failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_set_name_empty_Static_0001 done');
      done();
      console.log('test_foo_set_name_empty_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_KeepName_FUNC11_STATIC_0100
     * @tc.name      test_foo_set_name_unicode_Static_0001
     * @tc.desc      Foo.SetName() with unicode string should work correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_foo_set_name_unicode_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      console.log('test_foo_set_name_unicode_Static_0001 start');
      let pass: boolean = true;
      try {
        let foo = test.getFooIface();
        foo.name = "你好世界";
        let name = foo.name;
        expect(name).assertEqual("你好世界");
      } catch (e) {
        pass = false;
        console.log('foo_set_name_unicode failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_foo_set_name_unicode_Static_0001 done');
      done();
      console.log('test_foo_set_name_unicode_Static_0001 end');
    });
  });
}