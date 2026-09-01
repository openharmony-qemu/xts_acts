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


import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function PolygonUndefinedTest() {
  describe('PolygonUndefinedTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("PolygonUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Polygon/polygonUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get PolygonUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("polygonUndefined" == pages.name)) {
          console.info("get polygonUndefined pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push polygonUndefined page error:" + err);
      }
      console.info("PolygonUndefinedTest beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    PolygonUndefinedTest_static_0100
     * @tc.name      PolygonUndefinedTest_static_0100
     * @tc.desc      PolygonUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('PolygonUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[PolygonUndefinedTest_static_0100] START');
      try {
      let driver: Driver = Driver.create()
      const uiContext = AppStorage.get<UIContext>('uiContent')!;
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Polygon');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      console.info('[PolygonUndefinedTest_static_0100] points 1 is: ' + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('points')));
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('points')[0][0].asDouble())).assertEqual(0);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('points')[0][1].asDouble())).assertEqual(0);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('points')[1][0].asDouble())).assertEqual(50);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('points')[1][1].asDouble())).assertEqual(100);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('points')[2][0].asDouble())).assertEqual(100);
      expect(uiContext.px2vp(obj.getElement('$attrs').getArray('points')[2][1].asDouble())).assertEqual(0);

      let changeBtn = await driver.findComponent(ON.id('Polygon_points'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('Polygon');
      obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      console.info('[PolygonUndefinedTest_static_0100] points 2 is: ' + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('points')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('points'))).assertEqual('[]');

      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[PolygonUndefinedTest_static_0100] END');
      done();
      } catch (err) {
        console.error('PolygonUndefinedTest_static_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    });

  })
}
