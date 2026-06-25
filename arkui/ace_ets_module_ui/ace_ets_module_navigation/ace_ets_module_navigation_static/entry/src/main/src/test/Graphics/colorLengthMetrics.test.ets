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

export default function colorLengthMetrics() {
  describe('colorLengthMetrics', () => {
    beforeAll(async (): Promise<void> => {
      console.info('colorLengthMetrics beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('colorLengthMetrics beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Graphics/colorLengthMetrics',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get colorLengthMetrics state pages:' + JSON.stringify(pages));
        if (!('colorLengthMetrics' == pages.name)) {
          console.info('get colorLengthMetrics pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push colorLengthMetrics page error:' + err);
      }
      console.info('colorLengthMetrics beforeEach end');
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_static_0100
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_STATIC_0100
     * @tc.desc   Test ColorMetrics autoRefresh property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[colorMetrics_autoRefresh_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('colorMetrics_autoRefresh_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[colorMetrics_autoRefresh_static_0100] backgroundColor: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor') !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_static_0100] END');
      done();
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_static_0200
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_STATIC_0200
     * @tc.desc   Test ColorMetrics autoRefresh property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[colorMetrics_autoRefresh_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('colorMetrics_autoRefresh_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[colorMetrics_autoRefresh_static_0200] backgroundColor: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor') !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_static_0200] END');
      done();
    });

    /**
     * @tc.name   colorMetrics_autoRefresh_static_0300
     * @tc.number SUB_ARKUI_COLORMETRICS_AUTOREFRESH_STATIC_0300
     * @tc.desc   Test ColorMetrics autoRefresh property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('colorMetrics_autoRefresh_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[colorMetrics_autoRefresh_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('colorMetrics_autoRefresh_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[colorMetrics_autoRefresh_static_0300] backgroundColor: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor') !== undefined).assertTrue();
      console.info('[colorMetrics_autoRefresh_static_0300] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_static_0100
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_STATIC_0100
     * @tc.desc   Test LengthMetrics autoRefresh property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lengthMetrics_autoRefresh_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lengthMetrics_autoRefresh_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[lengthMetrics_autoRefresh_static_0100] padding: " +
        JSON.stringify(JSON.parseJsonElement(obj.getElement('$attrs').getString('padding'))));
      let result = JSON.parseJsonElement(obj.getElement('$attrs').getString('padding')).getString('top');
      expect(result !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_static_0100] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_static_0200
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_STATIC_0200
     * @tc.desc   Test LengthMetrics autoRefresh property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lengthMetrics_autoRefresh_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lengthMetrics_autoRefresh_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[lengthMetrics_autoRefresh_static_0200] padding: " +
        JSON.stringify(JSON.parseJsonElement(obj.getElement('$attrs').getString('padding'))));
      let result = JSON.parseJsonElement(obj.getElement('$attrs').getString('padding')).getString('top');
      expect(result !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_static_0200] END');
      done();
    });

    /**
     * @tc.name   lengthMetrics_autoRefresh_static_0300
     * @tc.number SUB_ARKUI_LENGTHMETRICS_AUTOREFRESH_STATIC_0300
     * @tc.desc   Test LengthMetrics autoRefresh property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lengthMetrics_autoRefresh_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lengthMetrics_autoRefresh_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lengthMetrics_autoRefresh_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[lengthMetrics_autoRefresh_static_0300] padding: " +
        JSON.stringify(JSON.parseJsonElement(obj.getElement('$attrs').getString('padding'))));
      let result = JSON.parseJsonElement(obj.getElement('$attrs').getString('padding')).getString('top');
      expect(result !== undefined).assertTrue();
      console.info('[lengthMetrics_autoRefresh_static_0300] END');
      done();
    });
  });
}