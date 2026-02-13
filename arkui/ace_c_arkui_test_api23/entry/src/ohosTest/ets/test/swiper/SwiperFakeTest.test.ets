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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';

export default function SwiperFakeTest() {

  describe('SwiperFakeTest', () => {

    let PAGE_TAG = 'SwiperFakeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`swiper/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   SwiperFakeTest_0100
     * @tc.number SwiperFakeTest_0100
     * @tc.desc   test 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperFakeTest_0100',  Level.LEVEL3, async (done: Function) => {
      console.info('SwiperFakeTest_0100 START');
      let driver: Driver = Driver.create();

      console.info('SwiperFakeTest_0100 END');

      done();
    });
  })
}