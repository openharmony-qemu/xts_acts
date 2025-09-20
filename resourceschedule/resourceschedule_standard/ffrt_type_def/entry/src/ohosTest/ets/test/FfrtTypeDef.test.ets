/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level, TestType, Size} from '@ohos/hypium';
import ffrt from 'libentry.so';
export default function ffrtTypeDefTest() {
  const EINVAL = 22;
  describe('ActsFfrtTypeDefTest', () => {
    let TAG = ""

    /**
     * @tc.number SUB_KERNEL_DISPATCH_entry_0010
     * @tc.name   ActsFfrtTypeDefTest0010
     * @tc.desc   Test ffrt_fiber_init api
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('ActsFfrtTypeDefTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "ActsFfrtTypeDefTest0010"
      try {
        console.info(TAG + "===> START");
        let ret : number = ffrt.ffrt_fiber_initTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(EINVAL);

      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
      }
      done();
    })
  })
}