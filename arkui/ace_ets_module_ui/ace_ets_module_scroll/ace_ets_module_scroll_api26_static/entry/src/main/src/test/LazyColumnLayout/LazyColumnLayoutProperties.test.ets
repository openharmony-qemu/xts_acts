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
import { Color } from '@ohos.arkui.component'
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

export default function LazyColumnLayoutProperties() {
  describe('LazyColumnLayoutProperties', () => {

    beforeAll(async (): Promise<void> => {
      console.info("LazyColumnLayoutProperties beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('LazyColumnLayoutProperties beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyColumnLayout/LazyColumnLayoutProperties',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get LazyColumnLayoutProperties state pages:' + JSON.stringify(pages));
        if (!('LazyColumnLayoutProperties' == pages.name)) {
          console.info('get LazyColumnLayoutProperties pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push LazyColumnLayoutProperties page error:' + err);
      }
      console.info('LazyColumnLayoutProperties beforeEach end');
    });

    /**
     * @tc.name   lazyColumnSpace_static_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_STATIC_0100
     * @tc.desc   Test LazyColumnLayout space property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnSpace_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_space_default');
      console.info("[lazyColumnSpace_static_0100] space: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual("0.00vp");

      let result = AppStorage.get<string>('LazyColumnLayout_onVisible');
      console.info('[lazyColumnSpace_static_0100] result: ' + JSON.stringify(result));
      expect(AppStorage.get<string>('LazyColumnLayout_onVisible')).assertEqual("success");
      await CommonFunc.sleep(500);
      AppStorage.delete('LazyColumnLayout_onVisible')
      console.info('[lazyColumnSpace_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_static_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_STATIC_0200
     * @tc.desc   Test LazyColumnLayout space property with LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnSpace_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_space_vp');
      console.info("[lazyColumnSpace_static_0200] space: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual("10.00vp");
      console.info('[lazyColumnSpace_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_static_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_STATIC_0300
     * @tc.desc   Test LazyColumnLayout space property with LengthMetrics.px(20)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnSpace_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_space_px');
      console.info("[lazyColumnSpace_static_0300] space: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')).assertEqual("20.00px");
      console.info('[lazyColumnSpace_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_static_0400
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_STATIC_0400
     * @tc.desc   Test LazyColumnLayout space property with negative value should use 0vp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnSpace_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('lazyColumn_space_default');
      let strJson = inspector.getInspectorByKey('lazyColumn_space_negative');
      console.info("[lazyColumnSpace_static_0400] strJsonCompare space: " +
        JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('space'));
      console.info("[lazyColumnSpace_static_0400] space: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('space'));
      console.info('[lazyColumnSpace_static_0400] END');
      done();
    });

    /**
     * @tc.name   lazyColumnSpace_static_0500
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_SPACE_STATIC_0500
     * @tc.desc   Test LazyColumnLayout space property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSpace_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnSpace_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('lazyColumn_space_default');
      let strJson = inspector.getInspectorByKey('lazyColumn_space_undefined');
      console.info("[lazyColumnSpace_static_0500] strJsonCompare space: " +
        JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('space'));
      console.info("[lazyColumnSpace_static_0500] space: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('space'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('space'));
      console.info('[lazyColumnSpace_static_0500] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_static_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_STATIC_0100
     * @tc.desc   Test LazyColumnLayout alignItems property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnAlignItems_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_alignItems_default');
      console.info("[lazyColumnAlignItems_static_0100] alignItems: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual("HorizontalAlign.Center");
      console.info('[lazyColumnAlignItems_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_static_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_STATIC_0200
     * @tc.desc   Test LazyColumnLayout alignItems property with HorizontalAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnAlignItems_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_alignItems_start');
      console.info("[lazyColumnAlignItems_static_0200] alignItems: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual("HorizontalAlign.Start");
      console.info('[lazyColumnAlignItems_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_static_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_STATIC_0300
     * @tc.desc   Test LazyColumnLayout alignItems property with HorizontalAlign.Center
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnAlignItems_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_alignItems_center');
      console.info("[lazyColumnAlignItems_static_0300] alignItems: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual("HorizontalAlign.Center");
      console.info('[lazyColumnAlignItems_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_static_0400
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_STATIC_0400
     * @tc.desc   Test LazyColumnLayout alignItems property with HorizontalAlign.End
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnAlignItems_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('lazyColumn_alignItems_end');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[lazyColumnAlignItems_static_0400] alignItems: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems')));
      expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.End');
      console.info('[lazyColumnAlignItems_static_0400] END');
      done();
    });

    /**
     * @tc.name   lazyColumnAlignItems_static_0500
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_ALIGNITEMS_STATIC_0500
     * @tc.desc   Test LazyColumnLayout alignItems property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnAlignItems_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyColumnAlignItems_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('lazyColumn_alignItems_default');
      let strJson = inspector.getInspectorByKey('lazyColumn_alignItems_undefined');
      console.info("[lazyColumnAlignItems_static_0500] strJsonCompare alignItems: " +
        JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('alignItems'));
      console.info("[lazyColumnAlignItems_static_0500] alignItems: " +
        JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignItems'))
        .assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('alignItems'));
      console.info('[lazyColumnAlignItems_static_0500] END');
      done();
    });
  });
}