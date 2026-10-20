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
import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
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

// 注入单个鼠标事件（左键），坐标为窗口坐标
function sendMouseEventAt(action: MouseAction, x: number, y: number, width: number, height: number): boolean {
  let result: boolean = sendMouseEvent({
    windowX: x,
    windowY: y,
    displayX: x,
    displayY: y,
    x: x,
    y: y,
    button: MouseButton.Left,
    action: action,
    timestamp: new Date().getTime() as long,
    target: {
      area: {
        width: width,
        height: height,
        position: {
          x: 0,
          y: 0
        },
        globalPosition: {
          x: 0,
          y: 0
        }
      }
    },
    source: SourceType.Mouse,
    tiltX: 0,
    tiltY: 0,
    sourceTool: SourceTool.Finger,
    pressure: 0,
    stopPropagation: () => {
    },
    getModifierKeyState: (keys: Array<string>): boolean => {
      console.info('getModifierKeyState keys: ' + keys);
      return true;
    }
  } as MouseEvent);
  return result;
}

// 模拟鼠标左键按住从startX水平拖拽至endX：按下 -> 多步移动 -> 抬起
async function mouseDragHorizontal(startX: number, endX: number, centerY: number,
  width: number, height: number): Promise<void> {
  let steps: number = 8;
  let xStep: number = (endX - startX) / steps;
  console.info('mouseDragHorizontal press at x: ' + startX);
  sendMouseEventAt(MouseAction.Press, startX, centerY, width, height);
  await Utils.sleep(50);
  for (let i = 1; i <= steps; i++) {
    sendMouseEventAt(MouseAction.Move, Math.round(startX + xStep * i), centerY, width, height);
    await Utils.sleep(20);
  }
  console.info('mouseDragHorizontal release at x: ' + endX);
  sendMouseEventAt(MouseAction.Release, endX, centerY, width, height);
  await Utils.sleep(50);
}

// 读取组件文本内容
function getComponentTextContent(id: string): string {
  let strJson: string = inspector.getInspectorByKey(id);
  let obj = JSON.parseJsonElement(strJson);
  return obj.getElement('$attrs').getString('content');
}

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

    // 点击按钮设置enableScrollWithMouse属性值并复位滚动位置（静态模式不允许嵌套函数声明，使用箭头函数）
    let prepare = async (driver: Driver, btnId: string): Promise<void> => {
      let btn = await driver.findComponent(ON.id(btnId));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(500);
      let resetBtn = await driver.findComponent(ON.id('H_SCROLL_RESET'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(500);
    };

    // 在水平Scroll组件上执行鼠标左键拖拽（由右向左）
    let dragOnScroll = async (driver: Driver): Promise<void> => {
      let scrollComp = await driver.findComponent(ON.id('H_SCROLL'));
      let rect: Rect = await (scrollComp?.getBounds() as Promise<Rect>);
      let centerY: number = Math.round((rect.top + rect.bottom) / 2);
      let startX: number = Math.round(rect.left + (rect.right - rect.left) * 0.8);
      let endX: number = Math.round(rect.left + (rect.right - rect.left) * 0.2);
      let width: number = rect.right - rect.left;
      let height: number = rect.bottom - rect.top;
      console.info('ScrollWithMouseTest scroll rect: left: ' + rect.left + ', right: ' + rect.right
        + ', top: ' + rect.top + ', bottom: ' + rect.bottom);
      await mouseDragHorizontal(startX, endX, centerY, width, height);
    };

    /**
     * @tc.number   SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100
     * @tc.name     SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100
     * @tc.desc     Horizontal Scroll with enableScrollWithMouse set to undefined (default)
     *               supports mouse left-button drag scrolling by default since API 26.2.0.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        await prepare(driver, 'H_SCROLL_DEFAULT');
        let stateContent: string = getComponentTextContent('H_SCROLL_STATE');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100] state: ' + stateContent);
        expect(stateContent).assertEqual('enableScrollWithMouse: undefined');
        let offsetBefore: string = getComponentTextContent('H_SCROLL_OFFSET');
        expect(offsetBefore).assertEqual('offset=0');
        await dragOnScroll(driver);
        await Utils.sleep(500);
        let offsetAfter: string = getComponentTextContent('H_SCROLL_OFFSET');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100] offset after drag: ' + offsetAfter);
        expect(offsetAfter !== 'offset=0').assertTrue();
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0100] END');
        done();
      });

    /**
     * @tc.number   SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200
     * @tc.name     SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200
     * @tc.desc     Horizontal Scroll with enableScrollWithMouse set to true
     *               supports mouse left-button drag scrolling.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        await prepare(driver, 'H_SCROLL_TRUE');
        let stateContent: string = getComponentTextContent('H_SCROLL_STATE');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200] state: ' + stateContent);
        expect(stateContent).assertEqual('enableScrollWithMouse: true');
        let offsetBefore: string = getComponentTextContent('H_SCROLL_OFFSET');
        expect(offsetBefore).assertEqual('offset=0');
        await dragOnScroll(driver);
        await Utils.sleep(500);
        let offsetAfter: string = getComponentTextContent('H_SCROLL_OFFSET');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200] offset after drag: ' + offsetAfter);
        expect(offsetAfter !== 'offset=0').assertTrue();
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0200] END');
        done();
      });

    /**
     * @tc.number   SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300
     * @tc.name     SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300
     * @tc.desc     Horizontal Scroll with enableScrollWithMouse set to false
     *               does not respond to mouse left-button drag scrolling.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        await prepare(driver, 'H_SCROLL_FALSE');
        let stateContent: string = getComponentTextContent('H_SCROLL_STATE');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300] state: ' + stateContent);
        expect(stateContent).assertEqual('enableScrollWithMouse: false');
        let offsetBefore: string = getComponentTextContent('H_SCROLL_OFFSET');
        expect(offsetBefore).assertEqual('offset=0');
        await dragOnScroll(driver);
        await Utils.sleep(500);
        let offsetAfter: string = getComponentTextContent('H_SCROLL_OFFSET');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300] offset after drag: ' + offsetAfter);
        expect(offsetAfter).assertEqual('offset=0');
        console.info('[SUB_ARKUI_SCROLLWITHMOUSE_STATICTEST_0300] END');
        done();
      });
  })
}
