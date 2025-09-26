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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
const SLEEP_TIME = 1000;

export default function SwipeActionTest(){

  describe('SwipeActionTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.number    swipeActionTest001
     * @tc.name      swipeActionTest001
     * @tc.desc      test ListItemSwipeActionManager is EXPANDED,
     *               listItem slide out on the left side
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('swipeActionTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`list/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.text('listItem 0'));
      let rect = await list.getBounds();
      let left = rect.left;
      let button1 = await driver.findComponent(ON.id('expandList'));
      await button1.click();
      await Utils.sleep(SLEEP_TIME);
      let list1 = await driver.findComponent(ON.text('listItem 0'));
      let rect1 = await list1.getBounds();
      let left1 = rect1.left;
      let distance = left1-left;
      expect(distance>0).assertEqual(true);
      let button2 = await driver.findComponent(ON.id('collapseList'));
      await button2.click();
      await Utils.sleep(SLEEP_TIME);
      done();
    });

    /**
     * @tc.number    swipeActionTest002
     * @tc.name      swipeActionTest002
     * @tc.desc      test ListItemSwipeActionManager is collapse,
     *               listItem slide to close
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */
    it('swipeActionTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'swipeActionTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`);
      await Utils.sleep(SLEEP_TIME);
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button1 = await driver.findComponent(ON.id('expandList'));
      await button1.click();
      await Utils.sleep(SLEEP_TIME);
      let list = await driver.findComponent(ON.text('listItem 0'));
      let rect = await list.getBounds();
      let left = rect.left;
      let button2 = await driver.findComponent(ON.id('collapseList'));
      await button2.click();
      await Utils.sleep(SLEEP_TIME);
      let list1 = await driver.findComponent(ON.text('listItem 0'));
      let rect1 = await list1.getBounds();
      let left1 = rect1.left;
      let distance = left-left1;
      expect(distance>0).assertEqual(true);
      done();
    });

  })
}