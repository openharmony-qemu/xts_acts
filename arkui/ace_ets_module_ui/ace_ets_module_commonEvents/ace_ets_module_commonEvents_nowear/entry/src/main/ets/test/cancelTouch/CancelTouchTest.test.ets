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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function cancelTouchTest() {
  describe('CancelTouchTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CancelTouchTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CancelTouch/CancelTouch',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('CancelTouchPage' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push CancelTouch page success');
        }
      } catch (err) {
        console.error('push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   cancelTouch_0100
     * @tc.number SUB_ArkUI_ArkUI_cancelTouch_0100
     * @tc.desc   longClick on inner Scroll, verify cancelTouch triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancelTouch_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[cancelTouch_0100] START');
      let driver: Driver = Driver.create();
      let text: Component = await driver.findComponent(ON.id('fatherScrollText'));
      let point = await text.getBoundsCenter();
      await driver.longClickAt(point,3000);
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('outer')).assertEqual('outer');
      done();
    });
  });
}
