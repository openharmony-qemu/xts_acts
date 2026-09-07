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
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function headerFooterStickyColumn() {
  describe('headerFooterStickyColumn', () => {

    beforeEach(async () => {
      console.info('headerFooterStickyColumn beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyColumnLayout/headerFooterStickyColumn',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get headerFooterStickyColumn state pages:' + JSON.stringify(pages));
        if (!('headerFooterStickyColumn' == pages.name)) {
          console.info('get headerFooterStickyColumn pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push headerFooterStickyColumn page error:' + err);
      }
      console.info('headerFooterStickyColumn beforeEach end');
    });
    
    /**
     * @tc.name   lazyColumnHeader_static_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_HEADER_STATIC_0100
     * @tc.desc   Test LazyColumnLayout header property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnHeader_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnHeader_static_0100] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_header_default');
        let obj = JSON.parseJsonElement(strJson);
        let header = obj.getElement('$attrs').tryGetElement('header');
        console.log('[lazyColumnHeader_static_0100] header: '+ header)
        expect(obj.getElement('$attrs').tryGetElement('header')).assertUndefined();
        console.info('[lazyColumnHeader_static_0100] END');
        done();
      } catch (error) {
        console.error('[lazyColumnHeader_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnHeader_static_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_HEADER_STATIC_0200
     * @tc.desc   Test LazyColumnLayout header property with CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnHeader_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnHeader_static_0200] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_header_builder');
        let obj = JSON.parseJsonElement(strJson);
        let header = obj.getElement('$attrs').tryGetElement('header');
        console.log('[lazyColumnHeader_static_0200] header: '+ header)

        let strJson2 = inspector.getInspectorByKey('lazy_column_header');
        let obj2 = JSON.parseJsonElement(strJson2);
        console.info("[lazyColumnHeader_static_0200] content: " +
          JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('Header');
        console.info('[lazyColumnHeader_static_0200] END');
        done();
      } catch (error) {
        console.error('[lazyColumnHeader_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnHeader_static_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_HEADER_STATIC_0300
     * @tc.desc   Test LazyColumnLayout header property with undefined should remove header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnHeader_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnHeader_static_0300] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_header_undefined');
        let obj = JSON.parseJsonElement(strJson);
        let header = obj.getElement('$attrs').tryGetElement('header');
        console.log('[lazyColumnHeader_static_0300] header: '+ header)
        expect(obj.getElement('$attrs').tryGetElement('header')).assertUndefined();
        console.info('[lazyColumnHeader_static_0300] END');
        done();
      } catch (error) {
        console.error('[lazyColumnHeader_static_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnFooter_static_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_FOOTER_STATIC_0100
     * @tc.desc   Test LazyColumnLayout footer property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnFooter_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnFooter_static_0100] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_footer_default');
        let obj = JSON.parseJsonElement(strJson);
        let footer = obj.getElement('$attrs').tryGetElement('footer');
        console.log('[lazyColumnHeader_static_0300] footer: '+ footer)
        expect(obj.getElement('$attrs').tryGetElement('footer')).assertUndefined();
        console.info('[lazyColumnFooter_static_0100] END');
        done();
      } catch (error) {
        console.error('[lazyColumnFooter_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnFooter_static_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_FOOTER_STATIC_0200
     * @tc.desc   Test LazyColumnLayout footer property with CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnFooter_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnFooter_static_0200] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_footer_builder');
        let obj = JSON.parseJsonElement(strJson);
        let footer = obj.getElement('$attrs').tryGetElement('footer');
        console.log('[lazyColumnFooter_static_0200] footer: '+ footer)

        let strJson2 = inspector.getInspectorByKey('lazy_column_footer');
        let obj2 = JSON.parseJsonElement(strJson2);
        console.info("[lazyColumnFooter_static_0200] content: " +
          JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('Footer');
        console.info('[lazyColumnFooter_static_0200] END');
        done();
      } catch (error) {
        console.error('[lazyColumnFooter_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnFooter_static_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_FOOTER_STATIC_0300
     * @tc.desc   Test LazyColumnLayout footer property with undefined should remove footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnFooter_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnFooter_static_0300] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_footer_undefined');
        let obj = JSON.parseJsonElement(strJson);
        let footer = obj.getElement('$attrs').tryGetElement('footer');
        console.log('[lazyColumnFooter_static_0300] footer: '+ footer)
        expect(obj.getElement('$attrs').tryGetElement('footer')).assertUndefined();
        console.info('[lazyColumnFooter_static_0300] END');
        done();
      } catch (error) {
        console.error('[lazyColumnFooter_static_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnSticky_static_0100
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_STICKY_STATIC_0100
     * @tc.desc   Test LazyColumnLayout sticky property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSticky_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnSticky_static_0100] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_sticky_default');
        let obj = JSON.parseJsonElement(strJson);
        let sticky = obj.getElement('$attrs').tryGetElement('sticky');
        console.log('[lazyColumnSticky_static_0100] sticky: '+ sticky)
        expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.None');
        console.info('[lazyColumnSticky_static_0100] END');
        done();
      } catch (error) {
        console.error('[lazyColumnSticky_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnSticky_static_0200
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_STICKY_STATIC_0200
     * @tc.desc   Test LazyColumnLayout sticky property with StickyStyle.None
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSticky_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnSticky_static_0200] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_sticky_none');
        let obj = JSON.parseJsonElement(strJson);
        let sticky = obj.getElement('$attrs').tryGetElement('sticky');
        console.log('[lazyColumnSticky_static_0200] sticky: '+ sticky)
        expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.None');
        console.info('[lazyColumnSticky_static_0202] END');
        done();
      } catch (error) {
        console.error('[lazyColumnSticky_static_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnSticky_static_0300
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_STICKY_STATIC_0300
     * @tc.desc   Test LazyColumnLayout sticky property with StickyStyle.Header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSticky_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnSticky_static_0300] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_sticky_header');
        let obj = JSON.parseJsonElement(strJson);
        let sticky = obj.getElement('$attrs').tryGetElement('sticky');
        console.log('[lazyColumnSticky_static_0300] sticky: '+ sticky)
        expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.Header');
        console.info('[lazyColumnSticky_static_0300] END');
        done();
      } catch (error) {
        console.error('[lazyColumnSticky_static_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnSticky_static_0400
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_STICKY_STATIC_0400
     * @tc.desc   Test LazyColumnLayout sticky property with StickyStyle.Footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSticky_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnSticky_static_0400] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_sticky_footer');
        let obj = JSON.parseJsonElement(strJson);
        let sticky = obj.getElement('$attrs').tryGetElement('sticky');
        console.log('[lazyColumnSticky_static_0400] sticky: '+ sticky)
        expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.Footer');
        console.info('[lazyColumnSticky_static_0400] END');
        done();
      } catch (error) {
        console.error('[lazyColumnSticky_static_0400] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnSticky_static_0500
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_STICKY_STATIC_0500
     * @tc.desc   Test LazyColumnLayout sticky property with StickyStyle.BOTH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSticky_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnSticky_static_0500] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('lazyColumn_sticky_both');
        let obj = JSON.parseJsonElement(strJson);
        let sticky = obj.getElement('$attrs').tryGetElement('sticky');
        console.log('[lazyColumnSticky_static_0500] sticky: '+ sticky)
        expect(obj.getElement('$attrs').getString('sticky')).assertEqual('StickyStyle.Header | StickyStyle.Footer');
        console.info('[lazyColumnSticky_static_0500] END');
        done();
      } catch (error) {
        console.error('[lazyColumnSticky_static_0500] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   lazyColumnSticky_static_0600
     * @tc.number SUB_ARKUI_LAZYCOLUMNLAYOUT_STICKY_STATIC_0600
     * @tc.desc   Test LazyColumnLayout sticky property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyColumnSticky_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[lazyColumnSticky_static_0600] START');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let strJsonCompare = inspector.getInspectorByKey('lazyColumn_sticky_default');
        let objCompare = JSON.parseJsonElement(strJsonCompare);
        let strJson = inspector.getInspectorByKey('lazyColumn_sticky_undefined');
        let obj = JSON.parseJsonElement(strJson);
        let sticky = obj.getElement('$attrs').tryGetElement('sticky');
        console.log('[lazyColumnSticky_static_0500] sticky: '+ sticky)
        expect(obj.getElement('$attrs').getString('sticky'))
          .assertEqual(objCompare.getElement('$attrs').getString('sticky'));
        console.info('[lazyColumnSticky_static_0600] END');
        done();
      } catch (error) {
        console.error('[lazyColumnSticky_static_0600] error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}