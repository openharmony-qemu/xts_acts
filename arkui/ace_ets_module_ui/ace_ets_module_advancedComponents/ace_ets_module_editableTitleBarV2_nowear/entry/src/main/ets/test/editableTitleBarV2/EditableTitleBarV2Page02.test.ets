/**
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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../Utils';

export default function editableTitleBarV2Page02Test() {
  describe('editableTitleBarV2Page02', () => {
    beforeEach(async (done: Function) => {
      console.info('editableTitleBarV2Page02 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/editableTitleBarV2/EditableTitleBarV2Page02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EditableTitleBarV2Page02 state pages: ' + JSON.stringify(pages));
        if (!('EditableTitleBarV2Page02' == pages.name)) {
          console.info('get EditableTitleBarV2Page02 pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push EditableTitleBarV2Page02 page result successful');
        }
      } catch (err) {
        console.error('push EditableTitleBarV2Page02 page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('editableTitleBarV2Page02 beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('editableTitleBarV2Page02 after each called');
    })

    /**
     * @tc.number editableTitleBarV2Page02Test_0100
     * @tc.name   editableTitleBarV2Page02Test_0100
     * @tc.desc   Test EditableTitleBarV2 complete example
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('editableTitleBarV2Page02Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[editableTitleBarV2Page02Test_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let mainTitle = await driver.findComponent(ON.text('Complete'));
      expect(mainTitle !== null).assertTrue();

      let subTitle = await driver.findComponent(ON.text('All Features'));
      expect(subTitle !== null).assertTrue();

      console.info('[editableTitleBarV2Page02Test_0100] END');
      done();
    });

    /**
     * @tc.number editableTitleBarV2Page02Test_0200
     * @tc.name   editableTitleBarV2Page02Test_0200
     * @tc.desc   Test EditableTitleBarV2 with custom style
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('editableTitleBarV2Page02Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[editableTitleBarV2Page02Test_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let component = await driver.findComponent(ON.text('Custom Style'));
      expect(component !== null).assertTrue();

      console.info('[editableTitleBarV2Page02Test_0200] END');
      done();
    });
  })
}