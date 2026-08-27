'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, beforeEach, Level  } from '../../../../hypium/index';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil';

let libUtil:LibUtil = new LibUtil();

export default function customDialogBackGroundTest(){
  describe('customDialogBackGroundTest', () => {
    beforeEach(async (): Promise<void> => {
      try {
        await Utils.sleep(100);
      } catch (err) {
        console.info('customDialogBackGroundTest beforeEach sleep err: ' + JSON.stringify(err));
      }
    })

    
    /**
     * @tc.number   testCustomDialog001
     * @tc.name     testCustomDialog001
     * @tc.desc     testCustomDialog001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialog001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialog001()).assertEqual(0)
      done();
    });

    
    /**
     * @tc.number   testCustomDialog002
     * @tc.name     testCustomDialog002
     * @tc.desc     testCustomDialog002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialog002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialog002()).assertEqual(0)
      done();
    });

  })
}