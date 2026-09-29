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

import { describe, it, expect, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function refreshOnOffsetChangeTest() {

  describe('RefreshOnOffsetChangeTest', () => {

    /**
     * @tc.name   testRefreshOnOffsetChange001
     * @tc.number SUB_ARKUI_CAPI_REFRESH_ON_OFFSET_CHANGE_0100
     * @tc.desc   testing onOffsetChange for Refresh with red value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefreshOnOffsetChange001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'RefreshOnOffsetChangeTest';
      await Utils.pushPage(`refresh/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create();

      let component = await driver.findComponent(ON.id("RefreshOnOffsetChange"));
      let rect = await component.getBounds();
      let displayId = await component.getDisplayId();
      let x = Math.round(Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(Utils.getRectVerticalCenterY(rect));
      console.info("RefreshOnOffsetChangeTest  x= " +  x  + ", y = " + y);
      await driver.swipeBetween(
        { x: Math.round(x - vp2px(30)), y: Math.round(y - vp2px(100)), displayId: displayId },
        { x: Math.round(x + vp2px(30)), y: Math.round(y + vp2px(130)), displayId: displayId });
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('RefreshOnOffsetChange').$attrs.backgroundColor)
        .assertEqual('#FFFFFF00');
      done();
    })
  })
}
