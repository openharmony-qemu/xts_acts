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
import {
  describe,
  it,
  expect,
  Level,
  beforeAll,
  beforeEach,
  afterEach
} from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Driver, Component, UiWindow, ON, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function arcSwiperContent() {
  describe('arcSwiperContent', () => {
    beforeAll(async (): Promise<void> => {
      console.info('arcSwiperContent beforeEach start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api26.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      console.info('arcSwiperContent beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/arcSwiperContent',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get arcSwiperContent state pages:' + JSON.stringify(pages));
        if (!('arcSwiperContent' == pages.name)) {
          console.info('get arcSwiperContent pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push arcSwiperContent page error:' + err);
      }
      console.info('arcSwiperContent beforeEach end');
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_ANIMATION_0100
     * @tc.number SUB_ARKUI_ARCSWIPER_ANIMATION_0100
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_ANIMATION_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperContent_0100] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      let arc1 = await driver.findComponent(ON.id('arcs_customContent'));
      let swipeTabs = await (arc1?.getBounds() as Promise<Rect>);
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      let height = bottom - top;
      let width = right - left;
      await driver.drag(Math.round(left + width * 0.8).toInt(), Math.round(top + height / 2).toInt(),
        Math.round(left + width * 0.2).toInt(), Math.round(top + height / 2).toInt());
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('1'));
      let strJson = inspector.getInspectorByKey('onAnimationStart_arcs_content');
      console.info('[arcSwiperContent_0100] component obj1 is: ' + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info('[arcSwiperContent_0100] content: ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationStartIndex: 0');
      let strJson1 = inspector.getInspectorByKey('index1_arcs_content');
      console.info('[arcSwiperContent_0100] component obj1 is: ' + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info('[arcSwiperContent_0100] content1: ' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('index: 1');
      console.info('[arcSwiperContent_0100] END');
      done();
    });
  })
}
