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
import * as StringIo from '../ets/string_io';

export default function stringIOTest(): void {
  describe("ActsStringIOTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_String_IoInput_STATIC_0100
     * @tc.name      test_input
     * @tc.desc      Test input() returns "input"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_input", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_input start');
      let str: string = StringIo.input();
      expect(str).assertEqual("input");
      console.log('test_input done');
      done();
      console.log('test_input end');

    });

    /**
     * @tc.number    SUB_Taihe_String_IoPrintln_STATIC_0200
     * @tc.name      test_println
     * @tc.desc      Test println() executes without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_println", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_println start');
      let caught: boolean = true;
      try {
        StringIo.println("println string");
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_println done');
      done();
      console.log('test_println end');

    });

    /**
     * @tc.number    SUB_Taihe_String_IoPrint_STATIC_0300
     * @tc.name      test_print
     * @tc.desc      Test print() executes without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_print", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_print start');
      let caught: boolean = true;
      try {
        StringIo.print("print string");
        StringIo.println(" ---");
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_print done');
      done();
      console.log('test_print end');

    });
  });
}