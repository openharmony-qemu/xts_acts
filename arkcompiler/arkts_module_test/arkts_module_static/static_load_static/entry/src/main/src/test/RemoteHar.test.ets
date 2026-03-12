'use static'
/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect ,TestType, Size, Level } from '../../../hypium/index';
import { TAG as ConstantTAG } from '../../../hypium/index';

export default function staticLoadRemoteHar() {
  describe('StaticLoadRemoteHarTest', () => {

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_Remote_HAR_0400
     * @tc.name    testRemoteHar04
     * @tc.desc    Remote har, two-level package name + path @xxx/xxx/file/xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRemoteHar04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testRemoteHar04';
      try {
        expect(ConstantTAG).assertEqual('[Hypium]');
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })
  })
}