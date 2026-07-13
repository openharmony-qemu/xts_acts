'use static';
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
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

export default function headerFooterStickyFlow() {
  describe('headerFooterStickyFlow', () => {

    beforeAll(async (): Promise<void> => {
      console.info("headerFooterStickyFlow beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.scroll.api26.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('headerFooterStickyFlow beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyVWaterFlowLayout/headerFooterStickyFlow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get headerFooterStickyFlow state pages:' + JSON.stringify(pages));
        if (!('headerFooterStickyFlow' == pages.name)) {
          console.info('get headerFooterStickyFlow pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push headerFooterStickyFlow page error:' + err);
      }
      console.info('headerFooterStickyFlow beforeEach end');
    });

    /**
     * @tc.name   lazyVWaterFlowHeader_static_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_HEADER_STATIC_0100
     * @tc.desc   Test LazyVWaterFlowLayout header property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowHeader_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowHeader_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_header_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[lazyVWaterFlowHeader_static_0100] 111111111111111111');
      let header = obj.getElement('$attrs').tryGetElement('header');
      console.info('[lazyVWaterFlowHeader_static_0100] 2222222222222222222');
      console.log('[lazyVWaterFlowHeader_static_0100] header: ' + header);
      expect(obj.getElement('$attrs').tryGetElement('header')).assertUndefined();
      console.info('[lazyVWaterFlowHeader_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowHeader_static_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_HEADER_STATIC_0200
     * @tc.desc   Test LazyVWaterFlowLayout header property with CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowHeader_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowHeader_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_header_builder');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[lazyVWaterFlowHeader_static_0200] 111111111111111111');
      let header = obj.getElement('$attrs').tryGetElement('header');
      console.log('[lazyVWaterFlowHeader_static_0200] header: ' + header);

      let strJson2 = inspector.getInspectorByKey('lazy_waterflow_header');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[lazyVWaterFlowHeader_static_0200] 2222222222222222');
      console.info('[lazyVWaterFlowHeader_static_0200] content: ' +
        JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Header');
      console.info('[lazyVWaterFlowHeader_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowHeader_static_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_HEADER_STATIC_0300
     * @tc.desc   Test LazyVWaterFlowLayout header property with undefined should remove header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowHeader_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowHeader_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_header_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let header = obj.getElement('$attrs').tryGetElement('header');
      console.log('[lazyVWaterFlowHeader_static_0300] header: ' + header);
      expect(obj.getElement('$attrs').tryGetElement('header')).assertUndefined();
      console.info('[lazyVWaterFlowHeader_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowFooter_static_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_FOOTER_STATIC_0100
     * @tc.desc   Test LazyVWaterFlowLayout footer property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowFooter_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowFooter_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_footer_default');
      let obj = JSON.parseJsonElement(strJson);
      let footer = obj.getElement('$attrs').tryGetElement('footer');
      console.log('[lazyVWaterFlowFooter_static_0100] footer: ' + footer);
      expect(obj.getElement('$attrs').tryGetElement('footer')).assertUndefined();
      console.info('[lazyVWaterFlowFooter_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowFooter_static_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_FOOTER_STATIC_0200
     * @tc.desc   Test LazyVWaterFlowLayout footer property with CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowFooter_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowFooter_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_footer_builder');
      let obj = JSON.parseJsonElement(strJson);
      let footer = obj.getElement('$attrs').tryGetElement('footer');
      console.log('[lazyVWaterFlowFooter_static_0200] footer: ' + footer);

      let strJson2 = inspector.getInspectorByKey('lazy_waterflow_footer');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[lazyVWaterFlowFooter_static_0200] content: ' +
        JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Footer');
      console.info('[lazyVWaterFlowFooter_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowFooter_static_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_FOOTER_STATIC_0300
     * @tc.desc   Test LazyVWaterFlowLayout footer property with undefined should remove footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowFooter_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowFooter_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_footer_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let footer = obj.getElement('$attrs').tryGetElement('footer');
      console.log('[lazyVWaterFlowFooter_static_0300] footer: ' + footer);
      expect(obj.getElement('$attrs').tryGetElement('footer')).assertUndefined();
      console.info('[lazyVWaterFlowFooter_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowSticky_static_0100
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_STICKY_STATIC_0100
     * @tc.desc   Test LazyVWaterFlowLayout sticky property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowSticky_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowSticky_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_sticky_default');
      let obj = JSON.parseJsonElement(strJson);
      let sticky = obj.getElement('$attrs').tryGetElement('sticky');
      console.log('[lazyVWaterFlowSticky_static_0100] sticky: ' + sticky);
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.None');
      console.info('[lazyVWaterFlowSticky_static_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowSticky_static_0200
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_STICKY_STATIC_0200
     * @tc.desc   Test LazyVWaterFlowLayout sticky property with StickyStyle.None
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowSticky_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowSticky_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_sticky_none');
      let obj = JSON.parseJsonElement(strJson);
      let sticky = obj.getElement('$attrs').tryGetElement('sticky');
      console.log('[lazyVWaterFlowSticky_static_0200] sticky: ' + sticky);
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.None');
      console.info('[lazyVWaterFlowSticky_static_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowSticky_static_0300
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_STICKY_STATIC_0300
     * @tc.desc   Test LazyVWaterFlowLayout sticky property with StickyStyle.Header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowSticky_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowSticky_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_sticky_header');
      let obj = JSON.parseJsonElement(strJson);
      let sticky = obj.getElement('$attrs').tryGetElement('sticky');
      console.log('[lazyVWaterFlowSticky_static_0300] sticky: ' + sticky);
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.Header');
      console.info('[lazyVWaterFlowSticky_static_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowSticky_static_0400
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_STICKY_STATIC_0400
     * @tc.desc   Test LazyVWaterFlowLayout sticky property with StickyStyle.Footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowSticky_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowSticky_static_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_sticky_footer');
      let obj = JSON.parseJsonElement(strJson);
      let sticky = obj.getElement('$attrs').tryGetElement('sticky');
      console.log('[lazyVWaterFlowSticky_static_0400] sticky: ' + sticky);
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.Footer');
      console.info('[lazyVWaterFlowSticky_static_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowSticky_static_0500
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_STICKY_STATIC_0500
     * @tc.desc   Test LazyVWaterFlowLayout sticky property with StickyStyle.BOTH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowSticky_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowSticky_static_0500] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_sticky_both');
      let obj = JSON.parseJsonElement(strJson);
      let sticky = obj.getElement('$attrs').tryGetElement('sticky');
      console.log('[lazyVWaterFlowSticky_static_0500] sticky: ' + sticky);
      expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.Header | StickyStyle.Footer');
      console.info('[lazyVWaterFlowSticky_static_0500] END');
      done();
    });

    /**
     * @tc.name   lazyVWaterFlowSticky_static_0600
     * @tc.number SUB_ARKUI_LAZYVWATERFLOWLAYOUT_STICKY_STATIC_0600
     * @tc.desc   Test LazyVWaterFlowLayout sticky property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVWaterFlowSticky_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[lazyVWaterFlowSticky_static_0600] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let strJsonCompare = inspector.getInspectorByKey('lazyVWaterFlow_sticky_default');
      let objCompare = JSON.parseJsonElement(strJsonCompare);
      let strJson = inspector.getInspectorByKey('lazyVWaterFlow_sticky_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let sticky = obj.getElement('$attrs').tryGetElement('sticky');
      console.log('[lazyVWaterFlowSticky_static_0600] sticky: ' + sticky);
      expect(obj.getElement('$attrs').getString('sticky'))
        .assertEqual(objCompare.getElement('$attrs').getString('sticky'));
      console.info('[lazyVWaterFlowSticky_static_0600] END');
      done();
    });
  });
}