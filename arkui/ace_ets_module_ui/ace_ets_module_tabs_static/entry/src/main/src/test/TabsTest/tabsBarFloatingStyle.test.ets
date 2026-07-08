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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { Color } from '@ohos.arkui.component'
import uiMaterial from '@ohos.arkui.uiMaterial'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function tabsBarFloatingStyle() {
  describe('tabsBarFloatingStyle', () => {

    beforeAll(async (): Promise<void> => {
      console.info("tabsBarFloatingStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.tabs.static", "EntryAbility")
      await UtilsTest.msSleep(2000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('tabsBarFloatingStyle beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsBarFloatingStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get tabsBarFloatingStyle state pages:' + JSON.stringify(pages));
        if (!('tabsBarFloatingStyle' == pages.name)) {
          console.info('get tabsBarFloatingStyle pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push tabsBarFloatingStyle page error:' + err);
      }
      console.info('tabsBarFloatingStyle beforeEach end');
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0100
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0100
     * @tc.desc   Test Tabs barFloatingStyle with basic empty style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_basic_floating');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[tabsBarFloatingStyle_static_0100] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(barFloatingStyle).not().assertEqual(undefined);
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      expect(obj.getElement('$attrs').getString('barOverlap')).assertEqual('true');
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0200
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0200
     * @tc.desc   Test Tabs barFloatingStyle with full parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_full_params');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[tabsBarFloatingStyle_static_0200] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(barFloatingStyle.getString('barSideMargin')).assertEqual('20.00vp');
      expect(barFloatingStyle.getString('barBottomMargin')).assertEqual('30.00vp');
      expect(barFloatingStyle.getString('maskColor')).assertEqual('#80FFFFFF');
      expect(barFloatingStyle.getString('maskHeight')).assertEqual('50.00vp');
      expect(barFloatingStyle.getBoolean('adaptToHandedness')).assertEqual(false);
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0300
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0300
     * @tc.desc   Test Tabs barFloatingStyle with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_barFloatingStyle_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[tabsBarFloatingStyle_static_0300] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(barFloatingStyle).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0400
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0400
     * @tc.desc   Test Tabs barFloatingStyle with adaptToHandedness=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_adaptToHandedness_true');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[tabsBarFloatingStyle_static_0400] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(barFloatingStyle.getBoolean('adaptToHandedness')).assertEqual(true);
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0500
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0500
     * @tc.desc   Test Tabs barFloatingStyle with adaptToHandedness=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_adaptToHandedness_false');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[tabsBarFloatingStyle_static_0500] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(barFloatingStyle.getBoolean('adaptToHandedness')).assertEqual(false);
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0600
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0600
     * @tc.desc   Test Tabs barFloatingStyle with barWidth all parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_barWidth_all');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      let barWidth = barFloatingStyle.getElement('barWidth');
      console.log('[tabsBarFloatingStyle_static_0600] barWidth: ' + JSON.stringify(barWidth))
      expect(barWidth.getString('smallBarWidth')).assertEqual('100.00vp');
      expect(barWidth.getString('mediumBarWidth')).assertEqual('200.00vp');
      expect(barWidth.getString('largeBarWidth')).assertEqual('300.00vp');
      done();
    });

    /**
     * @tc.name   tabsBarFloatingStyle_static_0700
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_STATIC_0700
     * @tc.desc   Test Tabs barFloatingStyle with barWidth undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('tabsBarFloatingStyle_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_barWidth_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      let barWidth = barFloatingStyle.getElement('barWidth');
      console.log('[tabsBarFloatingStyle_static_0700] barWidth: ' + JSON.stringify(barWidth))
      expect(barWidth).not().assertEqual(undefined);
      done();
    });
  })
}