'use static';
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import { Foo, OptNamespace } from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcOptTest(): void {
  describe("TcOptTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_OPT_TEST_0400
     * @tc.name testTcOpt0004
     * @tc.desc Verify that default native mode can create and return a managed string object.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcOpt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result: string = cls.test_OptDefaultCreateString("hello");
      expect(result).assertEqual("default:hello");
    });

    /**
     * @tc.number SUB_TC_OPT_TEST_0700
     * @tc.name testTcOpt0007
     * @tc.desc Verify that Quick native can read a string and also execute the Excel-required thread-start path.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcOpt0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();

      let length: int = cls.test_OptQuickWithString("quick");
      expect(length).assertEqual(5);

      let threadResult: boolean = cls.test_OptQuickStartThread();
      expect(threadResult).assertTrue();
    });

    /**
     * @tc.number SUB_TC_OPT_TEST_0800
     * @tc.name testTcOpt0008
     * @tc.desc Verify the default native add function used for comparison with Direct and Quick modes.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcOpt0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result: int = cls.test_OptDefaultAdd(6, 7);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_TC_OPT_TEST_1000
     * @tc.name testTcOpt0010
     * @tc.desc Verify that Quick native can read a managed string and create a temporary string as required by Excel.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcOpt0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result: int = cls.test_OptQuickCreateTempString("temporary");
      expect(result).assertEqual(9);
    });

  });
}
