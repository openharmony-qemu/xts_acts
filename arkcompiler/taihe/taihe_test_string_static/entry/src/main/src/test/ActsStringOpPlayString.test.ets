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
import * as StringOp from '../ets/string_op';
import {PlayString} from '../ets/string_op';

export default function stringOpPlayStringTest(): void {
  describe("ActsStringOpPlayStringTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_String_OpPlaystringName_STATIC_0100
     * @tc.name      test_playString_name
     * @tc.desc      Test PlayString.name getter returns "PlayString"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_playString_name", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_playString_name start');
      let playStr: PlayString = StringOp.makePlayStringIface();
      expect(playStr.name).assertEqual("PlayString");
      console.log('test_playString_name done');
      done();
      console.log('test_playString_name end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpPlaystringPick_STATIC_0200
     * @tc.name      test_playString_pick_1_2
     * @tc.desc      Test pickString(["abc","edf","xyz"], 1, 2) returns "edfxyz"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_playString_pick_1_2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_playString_pick_1_2 start');
      let playStr: PlayString = StringOp.makePlayStringIface();
      let res: string = playStr.pickString(["abc", "edf", "xyz"], 1, 2);
      expect(res).assertEqual("edfxyz");
      console.log('test_playString_pick_1_2 done');
      done();
      console.log('test_playString_pick_1_2 end');

    });

    /**
     * @tc.number    SUB_Taihe_String_OpPlaystringPick_STATIC_0300
     * @tc.name      test_playString_pick_0_1
     * @tc.desc      Test pickString(["abc","edf","xyz"], 0, 1) returns "abcedf"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_playString_pick_0_1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_playString_pick_0_1 start');
      let playStr: PlayString = StringOp.makePlayStringIface();
      let res: string = playStr.pickString(["abc", "edf", "xyz"], 0, 1);
      expect(res).assertEqual("abcedf");
      console.log('test_playString_pick_0_1 done');
      done();
      console.log('test_playString_pick_0_1 end');

    });
  });
}