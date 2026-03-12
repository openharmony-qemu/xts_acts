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
import {
  subtract,
  multiply,
  addTest,
  getHarName2
} from 'har/Index'

export default function staticLoadSourceHar() {
  describe('StaticLoadSourceHarTest', () => {

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0200
     * @tc.name    testSourceHar02
     * @tc.desc    Test static loading of the source HAR, invoking the files exported with relative paths ../xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testSourceHar02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testSourceHar02';
      try {
        expect(subtract(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0300
     * @tc.name    testSourceHar03
     * @tc.desc    Test static loading of the source HAR, invoking the folders exported with relative paths.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testSourceHar03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testSourceHar03';
      try {
        expect(multiply(3, 2)).assertEqual(6);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0500
     * @tc.name    testSourceHar05
     * @tc.desc    Load har, package name xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testSourceHar05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testSourceHar05';
      try {
        expect(addTest(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_SOURCE_HAR_0800
     * @tc.name    testSourceHar08
     * @tc.desc    Load har, two-level package name + path @xxx/xxx/file/xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testSourceHar08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testSourceHar08';
      try {
        expect(getHarName2()).assertEqual('load_har');
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

  })
}