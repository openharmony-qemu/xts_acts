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
import * as rename_test from '../ets/rename_test';

export default function renameClassTest(): void {
  describe("ActsRenameClassTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Rename_ClassStructCtor_STATIC_0100
     * @tc.name      test_renamed_struct_class_ctor
     * @tc.desc      Test @class struct OldMyStruct renamed to MyStruct with ctor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_renamed_struct_class_ctor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_renamed_struct_class_ctor start');
      let s: rename_test.MyStruct = new rename_test.MyStruct(null, 123, "abc");
      expect(s.a).assertEqual(123);
      expect(s.b).assertEqual("abc");
      console.log('test_renamed_struct_class_ctor done');
      done();
      console.log('test_renamed_struct_class_ctor end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_ClassStructStaticFunc_STATIC_0200
     * @tc.name      test_renamed_struct_class_static_func
     * @tc.desc      Test static function on renamed @class struct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_renamed_struct_class_static_func", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_renamed_struct_class_static_func start');
      let result: string = rename_test.MyStruct.staticFunc();
      expect(result).assertEqual("Hello from MyStructStaticFunc");
      console.log('test_renamed_struct_class_static_func done');
      done();
      console.log('test_renamed_struct_class_static_func end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_ClassInterfaceCtor_STATIC_0300
     * @tc.name      test_renamed_interface_class_ctor
     * @tc.desc      Test @class interface OldMyInterface renamed to MyInterface with ctor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_renamed_interface_class_ctor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_renamed_interface_class_ctor start');
      let obj: rename_test.MyInterface = new rename_test.MyInterface(null);
      let result: string = obj.doSomething("test");
      expect(result).assertEqual("Hello, test");
      console.log('test_renamed_interface_class_ctor done');
      done();
      console.log('test_renamed_interface_class_ctor end');

    });

    /**
     * @tc.number    SUB_Taihe_Rename_ClassInterfaceStaticMethod_STATIC_0400
     * @tc.name      test_renamed_interface_class_static_method
     * @tc.desc      Test static method on renamed @class interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_renamed_interface_class_static_method", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_renamed_interface_class_static_method start');
      let result: string = rename_test.MyInterface.staticMethod();
      expect(result).assertEqual("Hello from MyInterfaceStaticMethod");
      console.log('test_renamed_interface_class_static_method done');
      done();
      console.log('test_renamed_interface_class_static_method end');

    });
  });
}