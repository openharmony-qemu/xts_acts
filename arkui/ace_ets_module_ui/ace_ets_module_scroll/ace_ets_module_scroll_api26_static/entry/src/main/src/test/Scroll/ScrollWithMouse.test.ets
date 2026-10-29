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
import { describe, it, expect, beforeEach, afterEach, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {
  MouseEvent,
  MouseButton,
  MouseAction,
  SourceType,
  SourceTool
} from '@ohos.arkui.component'
import { sendMouseEvent } from '@ohos.arkui.Test';
import Utils from '../../../ets/MainAbility/common/Utils';

export default function ScrollWithMouseTest() {
  describe('ScrollWithMouseTest', () => {

    beforeEach(async () => {
      console.info('ScrollWithMouseTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollWithMouse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ScrollWithMouseTest state pages:' + JSON.stringify(pages));
        if (!('scrollWithMouse' == pages.name)) {
          console.info('get ScrollWithMouseTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push ScrollWithMouseTest page error:' + err);
      }
      console.info('ScrollWithMouseTest beforeEach end');
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      let driver = Driver.create();
      let resetBtn = await driver.findComponent(ON.id('H_SCROLL_RESET'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(1500);
      console.info('ScrollWithMouseTest afterEach called');
    });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLLWITHMOUSE_STATIC_0100
     * @tc.name     scrollWithMouse_static_0100
     * @tc.desc     Horizontal Scroll with enableScrollWithMouse set to undefined (default)
     *               supports mouse left-button drag scrolling by default since API 26.2.0.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollWithMouse_static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollWithMouse_static_0100] START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.id('H_SCROLL_DEFAULT'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(500);
      let resetBtn = await driver.findComponent(ON.id('H_SCROLL_RESET'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(500);
      let strJson: string = inspector.getInspectorByKey('H_SCROLL_OFFSET');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[scrollWithMouse_static_0100] offset after drag: ' +
       obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('offset=0');
 
      let scrollComp = await driver.findComponent(ON.id('H_SCROLL'))
      let scrollRect = await scrollComp!.getBounds()
      let displayId = await scrollComp!.getDisplayId()
      let top = scrollRect.top;
      let left = scrollRect.left;
      let height = scrollRect.bottom - scrollRect.top;
      let width = scrollRect.right - scrollRect.left;
      console.info('ScrollWithMouseTest scroll rect: left: ' + scrollRect.left + ', right: ' + scrollRect.right
        + ', top: ' + scrollRect.top + ', bottom: ' + scrollRect.bottom);
      await driver.mouseDrag({
        x: (Math.round(left + width * 0.7)).toInt(),
        y: (Math.round(top + height / 2)).toInt(),
        displayId: displayId.toInt()
      },
        {
          x: (Math.round(left + width * 0.3)).toInt(),
          y: (Math.round(top + height / 2)).toInt(),
          displayId: displayId.toInt()
        })
      await Utils.sleep(2000);

      let strJson2: string = inspector.getInspectorByKey('H_SCROLL_OFFSET');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[scrollWithMouse_static_0100] offset after drag: ' +
       obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content') !== 'offset=0').assertTrue();
      console.info('[scrollWithMouse_static_0100] END');
      done();
    });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLLWITHMOUSE_STATIC_0200
     * @tc.name     scrollWithMouse_static_0200
     * @tc.desc     Horizontal Scroll with enableScrollWithMouse set to true
     *               supports mouse left-button drag scrolling.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollWithMouse_static_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollWithMouse_static_0200] START');
        let driver = Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.id('H_SCROLL_TRUE'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(500);
      let resetBtn = await driver.findComponent(ON.id('H_SCROLL_RESET'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(500);
      let strJson: string = inspector.getInspectorByKey('H_SCROLL_OFFSET');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[scrollWithMouse_static_0200] offset after drag: ' +
       obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('offset=0');

      let scrollComp = await driver.findComponent(ON.id('H_SCROLL'))
      let scrollRect = await scrollComp!.getBounds()
      let displayId = await scrollComp!.getDisplayId()
      let top = scrollRect.top;
      let left = scrollRect.left;
      let height = scrollRect.bottom - scrollRect.top;
      let width = scrollRect.right - scrollRect.left;
      console.info('ScrollWithMouseTest scroll rect: left: ' + scrollRect.left + ', right: ' + scrollRect.right
        + ', top: ' + scrollRect.top + ', bottom: ' + scrollRect.bottom);
      await driver.mouseDrag({
        x: (Math.round(left + width * 0.7)).toInt(),
        y: (Math.round(top + height / 2)).toInt(),
        displayId: displayId.toInt()
      },
        {
          x: (Math.round(left + width * 0.3)).toInt(),
          y: (Math.round(top + height / 2)).toInt(),
          displayId: displayId.toInt()
        })
      await Utils.sleep(2000);

      let strJson2: string = inspector.getInspectorByKey('H_SCROLL_OFFSET');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[scrollWithMouse_static_0200] offset after drag: ' +
       obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content') !== 'offset=0').assertTrue();
      console.info('[scrollWithMouse_static_0200] END');
      done();
    });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLLWITHMOUSE_STATIC_0300
     * @tc.name     scrollWithMouse_static_0300
     * @tc.desc     Horizontal Scroll with enableScrollWithMouse set to false
     *               does not respond to mouse left-button drag scrolling.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollWithMouse_static_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollWithMouse_static_0300] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.id('H_SCROLL_FALSE'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(500);
      let resetBtn = await driver.findComponent(ON.id('H_SCROLL_RESET'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(500);
      let strJson: string = inspector.getInspectorByKey('H_SCROLL_OFFSET');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[scrollWithMouse_static_0300] offset after drag: ' +
       obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('offset=0');

      let scrollComp = await driver.findComponent(ON.id('H_SCROLL'))
      let scrollRect = await scrollComp!.getBounds()
      let displayId = await scrollComp!.getDisplayId()
      let top = scrollRect.top;
      let left = scrollRect.left;
      let height = scrollRect.bottom - scrollRect.top;
      let width = scrollRect.right - scrollRect.left;
      console.info('ScrollWithMouseTest scroll rect: left: ' + scrollRect.left + ', right: ' + scrollRect.right
        + ', top: ' + scrollRect.top + ', bottom: ' + scrollRect.bottom);
      await driver.mouseDrag({
        x: (Math.round(left + width * 0.7)).toInt(),
        y: (Math.round(top + height / 2)).toInt(),
        displayId: displayId.toInt()
      },
        {
          x: (Math.round(left + width * 0.3)).toInt(),
          y: (Math.round(top + height / 2)).toInt(),
          displayId: displayId.toInt()
        })
      await Utils.sleep(2000);
      let strJson2: string = inspector.getInspectorByKey('H_SCROLL_OFFSET');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[scrollWithMouse_static_0300] offset after drag: ' +
       obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('offset=0');
      console.info('[scrollWithMouse_static_0300] END');
      done();
    });
  })
}