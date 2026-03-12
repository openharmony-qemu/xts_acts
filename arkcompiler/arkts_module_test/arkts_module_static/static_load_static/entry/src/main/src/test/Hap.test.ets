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
import { add as testAdd } from './fileTest/TestAdd';
import { subtract as testSubtract } from '../TestSubtract';
import { multiply as testMultiply } from './fileTest/Index';
import { ArrayList } from '@kit.ArkTS';
import hilog from '@ohos.hilog';

export default function staticLoadHap() {
  describe('HapTest', () => {
    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_HAP_0100
     * @tc.name    testStaticLoadHap01
     * @tc.desc    In this project HAP, use the relative path to load the file ./xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testStaticLoadHap01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStaticLoadHap01';
      try {
        expect(testAdd(3, 2)).assertEqual(5);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_HAP_0200
     * @tc.name    testStaticLoadHap02
     * @tc.desc    In this project HAP, use the relative path to load the file ../xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testStaticLoadHap02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStaticLoadHap02';
      try {
        expect(testSubtract(3, 2)).assertEqual(1);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_HAP_0300
     * @tc.name    testStaticLoadHap03
     * @tc.desc    In this project HAP, use the relative path to load the folder ./file,
     *                 equivalent to loading index.ets inside the folder.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testStaticLoadHap03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStaticLoadHap03';
      try {
        expect(testMultiply(3, 2)).assertEqual(6);
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_HAP_0500
     * @tc.name    testStaticLoadHap05
     * @tc.desc    In this project hap, load the kit, import {} from '@kit.xxx'
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testStaticLoadHap05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStaticLoadHap05';
      let length: int = 0;
      try {
        let array = new ArrayList<number>();
        array.add(1);
        length = array.length;
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
      expect(length).assertEqual(1);
    })

    /**
     * @tc.number  SUB_COMPILER_RUNTIME_STATIC_LOAD_HAP_0600
     * @tc.name    testStaticLoadHap06
     * @tc.desc    In this project hap, load the system so, @ohos.xxx.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testStaticLoadHap06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStaticLoadHap06';
      try {
        expect(hilog.LogLevel.DEBUG === 3).assertTrue();
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })
  })
}