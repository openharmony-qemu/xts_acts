'use static';
/**
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
import { describe, afterEach, it, expect, Level } from '../../../../hypium';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  BorderRadiusMode
} from '@kit.ArkUI';

export default function BorderRadiusModeTest() {
  describe('BorderRadiusModeTest', () => {

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BorderRadiusModeTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("BorderRadiusModeTest after each called");
    });

    /**
     * @tc.number   BorderRadiusModeTest_static_001
     * @tc.name     BorderRadiusModeTest_static_001
     * @tc.desc     BorderRadiusModeTest_static_001
     * @tc.level    Level.LEVEL2
     */
    it('BorderRadiusModeTest_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[BorderRadiusModeTest_static_001] START');
      expect(BorderRadiusMode.DEFAULT).assertEqual(0);
      console.info('[BorderRadiusModeTest_static_001] END');
      done();
    });

    /**
     * @tc.number   BorderRadiusModeTest_static_002
     * @tc.name     BorderRadiusModeTest_static_002
     * @tc.desc     BorderRadiusModeTest_static_002
     * @tc.level    Level.LEVEL2
     */
    it('BorderRadiusModeTest_static_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[BorderRadiusModeTest_static_002] START');
      expect(BorderRadiusMode.CUSTOM).assertEqual(1);
      console.info('[BorderRadiusModeTest_static_002] END');
      done();
    });
  })
}
