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
import Utils from '../../../ets/MainAbility/common/Utils';

export default function ScrollGetScrollStateTest() {
  describe('ScrollGetScrollStateTest', () => {

    beforeEach(async () => {
      console.info('ScrollGetScrollStateTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollGetScrollState',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ScrollGetScrollStateTest state pages:' + JSON.stringify(pages));
        if (!('scrollGetScrollState' == pages.name)) {
          console.info('get ScrollGetScrollStateTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push ScrollGetScrollStateTest page error:' + err);
      }
      console.info('ScrollGetScrollStateTest beforeEach end');
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      let driver = Driver.create();
      let resetBtn = await driver.findComponent(ON.id('getScrollState_reset'));
      await (resetBtn?.click() as Promise<void>);
      await Utils.sleep(1500);
      AppStorage.delete('getScrollState_lastResult');
      AppStorage.delete('getScrollState_stateRecord');
      console.info('ScrollGetScrollStateTest afterEach called');
    });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLL_GETSCROLLSTATE_STATIC_0100
     * @tc.name     scrollGetScrollState_static_0100
     * @tc.desc     Test Scroller getScrollState returns Idle when the container is not scrolling.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollGetScrollState_static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollGetScrollState_static_0100] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let btn = await driver.findComponent(ON.id('getScrollState_default'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(500);
        let result = AppStorage.get<string>('getScrollState_lastResult');
        console.info('[scrollGetScrollState_static_0100] result: ' + result);
        expect(result).assertEqual('Idle');
        console.info('[scrollGetScrollState_static_0100] END');
        done();
      });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLL_GETSCROLLSTATE_STATIC_0200
     * @tc.name     scrollGetScrollState_static_0200
     * @tc.desc     Test Scroller getScrollState returns Scroll while dragging the container.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollGetScrollState_static_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollGetScrollState_static_0200] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let resetRecordBtn = await driver.findComponent(ON.id('getScrollState_resetRecord'));
        await (resetRecordBtn?.click() as Promise<void>);
        await Utils.sleep(1000);

        let scrollComp = await driver.findComponent(ON.id('scrollGetScrollState_scroll'));
        let rect: Rect = await (scrollComp?.getBounds() as Promise<Rect>);
        let displayId = await scrollComp!.getDisplayId();
        let centerX: number = Math.round((rect.left + rect.right) / 2);
        let startY: number = Math.round(rect.top + (rect.bottom - rect.top) * 0.8);
        let endY: number = Math.round(rect.top + (rect.bottom - rect.top) * 0.2);
        await driver.swipeBetween(
          { x: centerX.toInt(),
            y: startY.toInt(), displayId: displayId.toInt() },
          { x: centerX.toInt(),
            y: endY.toInt(), displayId: displayId.toInt() }
        );
        await Utils.sleep(2000);
        let record: string = `${AppStorage.get<string>('getScrollState_stateRecord')}`;
        console.info('[scrollGetScrollState_static_0200] stateRecord: ' + record);
        expect(record.includes('Scroll')).assertTrue();
        console.info('[scrollGetScrollState_static_0200] END');
        done();
      });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLL_GETSCROLLSTATE_STATIC_0300
     * @tc.name     scrollGetScrollState_static_0300
     * @tc.desc     Test Scroller getScrollState returns Fling during animated scrolling.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollGetScrollState_static_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollGetScrollState_static_0300] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let resetRecordBtn = await driver.findComponent(ON.id('getScrollState_resetRecord'));
        await (resetRecordBtn?.click() as Promise<void>);
        await Utils.sleep(300);
        let animateBtn = await driver.findComponent(ON.id('getScrollState_animate'));
        await (animateBtn?.click() as Promise<void>);
        await Utils.sleep(1500);
        let record: string = `${AppStorage.get<string>('getScrollState_stateRecord')}`;
        console.info('[scrollGetScrollState_static_0300] stateRecord: ' + record);
        expect(record.includes('Fling')).assertTrue();
        console.info('[scrollGetScrollState_static_0300] END');
        done();
      });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLL_GETSCROLLSTATE_STATIC_0400
     * @tc.name     scrollGetScrollState_static_0400
     * @tc.desc     Test Scroller getScrollState returns Idle after the scrolling stops.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollGetScrollState_static_0400', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollGetScrollState_static_0400] START');
        let driver = Driver.create();
        await Utils.sleep(1000);

        let scrollComp = await driver.findComponent(ON.id('scrollGetScrollState_scroll'));
        let rect: Rect = await (scrollComp?.getBounds() as Promise<Rect>);
        let displayId = await scrollComp!.getDisplayId();
        let centerX: number = Math.round((rect.left + rect.right) / 2);
        let startY: number = Math.round(rect.top + (rect.bottom - rect.top) * 0.8);
        let endY: number = Math.round(rect.top + (rect.bottom - rect.top) * 0.2);
        await driver.swipeBetween(
          { x: centerX.toInt(),
            y: startY.toInt(), displayId: displayId.toInt() },
          { x: centerX.toInt(),
            y: endY.toInt(), displayId: displayId.toInt() }
        );
        await Utils.sleep(2000);
        let btn = await driver.findComponent(ON.id('getScrollState_default'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(2000);
        let result = AppStorage.get<string>('getScrollState_lastResult');
        console.info('[scrollGetScrollState_static_0400] result: ' + result);
        expect(result).assertEqual('Idle');
        console.info('[scrollGetScrollState_static_0400] END');
        done();
      });
 
    /**
     * @tc.number   SUB_ARKUI_SCROLL_GETSCROLLSTATE_STATIC_0500
     * @tc.name     scrollGetScrollState_static_0500
     * @tc.desc     Test Scroller getScrollState throws error 100004 when scroller is not bound to a component.
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('scrollGetScrollState_static_0500', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[scrollGetScrollState_static_0500] START');
        let driver = Driver.create();
        await Utils.sleep(1000);
        let unboundBtn = await driver.findComponent(ON.id('getScrollState_unbound'));
        await (unboundBtn?.click() as Promise<void>);
        await Utils.sleep(500);
        let result = AppStorage.get<string>('getScrollState_lastResult');
        console.info('[scrollGetScrollState_static_0500] result: ' + result);
        expect(result).assertEqual('100004');
        console.info('[scrollGetScrollState_static_0500] END');
        done();
      });
  })
}