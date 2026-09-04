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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Point} from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function getCurrentLocalPositionTest_AxisEvent(): void {
  describe('getCurrentLocalPositionTest_AxisEvent', () => {

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getCurrentLocalPosition/getCurrentLocalPosition_AxisEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get getCurrentLocalPositionstate pages:' + JSON.stringify(pages));
        if (!('getCurrentLocalPosition' == pages.name)) {
          console.info('get getCurrentLocalPosition state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push getCurrentLocalPosition page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      try {
      await CommonFunc.sleep(1000);
      console.info('getCurrentLocalPosition after each called');
      } catch (e) {
        console.error('error: ' + JSON.stringify(e));
      }
    });

    /**
     * @tc.name   SUB_ARKUI_AxisEvent_getCurrentLocalPosition_0100
     * @tc.number SUB_ARKUI_AxisEvent_getCurrentLocalPosition_0100
     * @tc.desc   test the getCurrentLocalPositionTest_static AxisEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_AxisEvent_getCurrentLocalPosition_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      console.info('[getCurrentLocalPositionTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button = await driver.findComponent(ON.id('Button01'));
      let point = await (button?.getBoundsCenter() as Promise<Point>);
      await driver.mouseScroll({x:point.x, y:point.y}, true, 120);
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text01');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[getCurrentLocalPositionTest_0100] strJson is: ' + strJson);
      console.info('[getCurrentLocalPositionTest_0100] getCurrentLocalPositionTest obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('getCurrentLocalPosition获取的坐标:x:11,y:11');

      console.info('[getCurrentLocalPositionTest_0100] END')
      } catch (e) {
        console.error('error: ' + JSON.stringify(e));
        expect().assertFail();
      } finally {
        done();
      }
    });
  })
}