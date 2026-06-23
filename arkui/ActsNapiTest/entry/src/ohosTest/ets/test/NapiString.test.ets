/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import testNapi from 'libnapiString.so';

export default function stringTest() {
  describe('ActsStringTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testNapiString001
     * @tc.number SUB_NAPI_STRING_0100
     * @tc.desc   Original simple test for string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiString001 START');
      try {
        let ret = testNapi.createStringUtf8('abc');
        console.info('testCreateStringUtf80001 ret is: ' + ret);
        expect(ret).assertEqual('abc');
      } catch (err) {
        console.error('testNapiString001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
  })
}