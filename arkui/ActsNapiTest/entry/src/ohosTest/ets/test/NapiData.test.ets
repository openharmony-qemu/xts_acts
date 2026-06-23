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
import testNapi from 'libnapiData.so';

export default function dataTest() {
  describe('ActsDataTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testNapiData001
     * @tc.number SUB_NAPI_DATA_0100
     * @tc.desc   Original simple test for data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "testNapiData001";
      console.info(`${TAG} START`);
      try {
        let value = testNapi.napiCreateDate();
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });
  })
}