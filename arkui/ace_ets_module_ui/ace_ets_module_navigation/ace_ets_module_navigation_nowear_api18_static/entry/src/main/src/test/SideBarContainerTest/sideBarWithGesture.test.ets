'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { NavPathInfo, NavigationDividerStyle, ScrollEffectType } from '@ohos.arkui.component';

export default function sideBarWithGesture() {
  describe('sideBarWithGesture', () => {
    beforeAll(async (): Promise<void> => {
      console.info("sideBarWithGesture beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear18.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info('sideBarWithGesture beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sideBarWithGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get sideBarWithGesture state pages:' + JSON.stringify(pages));
        if (!('sideBarWithGesture' == pages.name)) {
          console.info('get sideBarWithGesture pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push sideBarWithGesture page error:' + err);
      }
      console.info('sideBarWithGesture beforeEach end');
    });

    /**
     * @tc.name   showSideBarWithGesture_static_0100
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_STATIC_0100
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[showSideBarWithGesture_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sideBarContainer_showSideBarWithGesture_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showSideBarWithGesture_static_0100] type: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
      console.info("[showSideBarWithGesture_static_0100] showSideBarWithGesture: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBarWithGesture')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('SideBarContainerType.DISPLACE');
      console.info('[showSideBarWithGesture_static_0100] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_static_0200
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_STATIC_0200
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[showSideBarWithGesture_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sideBarContainer_showSideBarWithGesture_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showSideBarWithGesture_static_0200] type: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
      console.info("[showSideBarWithGesture_static_0200] showSideBarWithGesture: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBarWithGesture')));
      expect(obj.getElement('$attrs').getString('type'))
        .assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.getElement('$attrs').getString('showSideBarWithGesture'))
        .assertEqual('true');
      console.info('[showSideBarWithGesture_static_0200] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_static_0300
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_STATIC_0300
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with false value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[showSideBarWithGesture_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sideBarContainer_showSideBarWithGesture_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showSideBarWithGesture_static_0300] type: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
      console.info("[showSideBarWithGesture_static_0300] showSideBarWithGesture: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBarWithGesture')));
      expect(obj.getElement('$attrs').getString('type'))
        .assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.getElement('$attrs').getString('showSideBarWithGesture'))
        .assertEqual('false');
      console.info('[showSideBarWithGesture_static_0300] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_static_0400
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_STATIC_0400
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[showSideBarWithGesture_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sideBarContainer_showSideBarWithGesture_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showSideBarWithGesture_static_0400] type: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
      console.info("[showSideBarWithGesture_static_0400] showSideBarWithGesture: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBarWithGesture')));
      expect(obj.getElement('$attrs').getString('type'))
        .assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.getElement('$attrs').getString('showSideBarWithGesture'))
        .assertEqual('false');
      console.info('[showSideBarWithGesture_static_0400] END');
      done();
    });
  });
}