/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@ohos.UiTest';

export default function scrollOnScrollStopTest() {

  describe('ScrollOnScrollStopTest', () => {

    let PAGE_TAG = 'ScrollOnScrollStopTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testScrollOnScrollStop001
     * @tc.number SUB_ARKUI_CAPI_SCROLL_ONSCROLLSTOP_0100
     * @tc.desc   test OnScrollStop event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOnScrollStop001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id("scrollCalled"));
      let rect = await component.getBounds();
      let displayId = await component.getDisplayId();
      let height = rect.bottom - rect.top;
      console.info("testScrollOnScrollStop001 height is" + height);
      let centerX = Math.round(Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(rect.top + height*0.2);
      let y2 = Math.round(rect.bottom - height*0.2);
      console.info("testScrollOnScrollStop001  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.swipeBetween(
        { x: centerX, y: y2, displayId: displayId },
        { x: centerX, y: y1, displayId: displayId });
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('scrollCalled').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testScrollOnScrollStop002
     * @tc.number SUB_ARKUI_CAPI_SCROLL_ONSCROLLSTOP_0200
     * @tc.desc   test OnScrollStop event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollOnScrollStop002', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      let component = await driver.findComponent(ON.id("scrollNotCalled"));
      let rect = await component.getBounds();
      let displayId = await component.getDisplayId();
      let width = rect.right - rect.left;
      console.info("testScrollOnScrollStop002 width is" + width);
      let centerY = Math.round(Utils.getRectVerticalCenterY(rect))
      let x1 = Math.round(rect.left + width*0.2);
      let x2 = Math.round(rect.right - width*0.2);
      console.info("testScrollOnScrollStop002  x1= " +  x1  + ", x2 = " + x2  + ", centerY = " + centerY);
      await driver.swipeBetween(
        { x: x2, y: centerY, displayId: displayId },
        { x: x1, y: centerY, displayId: displayId });
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('scrollNotCalled').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })
  })
}
