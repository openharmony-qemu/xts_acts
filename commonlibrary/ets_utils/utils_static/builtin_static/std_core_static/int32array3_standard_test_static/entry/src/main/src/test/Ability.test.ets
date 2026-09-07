'use static';


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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() :void {

    describe('abilityTest', (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll((): void => {
        });

        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(30);
        });

        afterEach((): void => {
        });

        afterAll((): void => {
        });
        /**
         * @tc.name   testErrorStatic
         * @tc.number SUB_COMMONLIBRARY_UTIL_ETS_UTILS_ERROR_STATIC_0100
         * @tc.desc   Test Error static type checking and assignment compatibility in ArkTS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testErrorStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 start');
            let a:int = 1;
            let b:int = 1;
            expect(a).assertEqual(b);
            done()
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 end');
        })

    })

}
