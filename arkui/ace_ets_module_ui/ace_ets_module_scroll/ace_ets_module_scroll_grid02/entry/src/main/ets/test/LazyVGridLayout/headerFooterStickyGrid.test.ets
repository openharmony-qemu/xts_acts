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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function headerFooterStickyGrid() {
  describe('headerFooterStickyGrid', () => {
    beforeEach(async (done: Function) => {
      console.info("headerFooterStickyGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/headerFooterStickyGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get headerFooterStickyGrid state pages:" + JSON.stringify(pages));
        if (!("headerFooterStickyGrid" == pages.name)) {
          console.info("get headerFooterStickyGrid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push headerFooterStickyGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push headerFooterStickyGrid page error:" + err);
      }
      console.info("headerFooterStickyGrid beforeEach end");
      done();
    });

    /**
     * @tc.name   lazyVGridHeader_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_HEADER_PARAM_0100
     * @tc.desc   Test LazyVGridLayout header property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridHeader_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridHeader_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let strJson: string = getInspectorByKey('lazyVGrid_header_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridHeader_0100] header: " + JSON.stringify(obj.$attrs.header));
      expect(obj.$attrs.header).assertUndefined();
      console.info('[lazyVGridHeader_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVGridHeader_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_HEADER_PARAM_0200
     * @tc.desc   Test LazyVGridLayout header property with CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridHeader_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridHeader_0200] START');
      let strJson: string = getInspectorByKey('lazyVGrid_header_builder');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridHeader_0200] header: " + JSON.stringify(obj.$attrs.header));

      let strJson2: string = getInspectorByKey('lazy_grid_header');
      console.info("[lazyVGridHeader_0200] content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('Header');
      console.info('[lazyVGridHeader_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVGridHeader_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_HEADER_PARAM_0300
     * @tc.desc   Test LazyVGridLayout header property with null should remove header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridHeader_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridHeader_0300] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_header_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_header_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridHeader_0300] header: " + JSON.stringify(obj.$attrs.header));
      expect(obj.$attrs.header).assertUndefined();
      console.info('[lazyVGridHeader_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVGridHeader_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_HEADER_PARAM_0400
     * @tc.desc   Test LazyVGridLayout header property with undefined should remove header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridHeader_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridHeader_0400] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_header_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_header_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridHeader_0400] header: " + JSON.stringify(obj.$attrs.header));
      expect(obj.$attrs.header).assertUndefined();
      console.info('[lazyVGridHeader_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVGridFooter_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_FOOTER_PARAM_0100
     * @tc.desc   Test LazyVGridLayout footer property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridFooter_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridFooter_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let strJson: string = getInspectorByKey('lazyVGrid_footer_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridFooter_0100] footer: " + JSON.stringify(obj.$attrs.footer));
      expect(obj.$attrs.footer).assertUndefined();
      console.info('[lazyVGridFooter_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVGridFooter_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_FOOTER_PARAM_0200
     * @tc.desc   Test LazyVGridLayout footer property with CustomBuilder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridFooter_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridFooter_0200] START');
      let strJson: string = getInspectorByKey('lazyVGrid_footer_builder');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridFooter_0200] footer: " + JSON.stringify(obj.$attrs.footer));

      let strJson2: string = getInspectorByKey('lazy_grid_footer');
      console.info("[lazyVGridFooter_0200] content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('Footer');
      console.info('[lazyVGridFooter_0200] END');
      done();
    });

    /**
     * @tc.name   lazyVGridFooter_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_FOOTER_PARAM_0300
     * @tc.desc   Test LazyVGridLayout footer property with null should remove footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridFooter_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridFooter_0300] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_footer_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_footer_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridFooter_0300] footer: " + JSON.stringify(obj.$attrs.footer));
      expect(obj.$attrs.footer).assertUndefined();
      console.info('[lazyVGridFooter_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVGridFooter_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_FOOTER_PARAM_0400
     * @tc.desc   Test LazyVGridLayout footer property with undefined should remove footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridFooter_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridFooter_0400] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_footer_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_footer_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridFooter_0400] footer: " + JSON.stringify(obj.$attrs.footer));
      expect(obj.$attrs.footer).assertUndefined();
      console.info('[lazyVGridFooter_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0100
     * @tc.desc   Test LazyVGridLayout sticky property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0100] START');
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0100] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.None');
      console.info('[lazyVGridSticky_0100] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0200
     * @tc.desc   Test LazyVGridLayout sticky property with StickyStyle.None
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0200] START');
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_none');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0200] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.None');
      console.info('[lazyVGridSticky_0202] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0300
     * @tc.desc   Test LazyVGridLayout sticky property with StickyStyle.Header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0300] START');
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_header');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0300] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.Header');
      console.info('[lazyVGridSticky_0300] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0400
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0400
     * @tc.desc   Test LazyVGridLayout sticky property with StickyStyle.Footer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0400] START');
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_footer');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0400] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.Footer');
      console.info('[lazyVGridSticky_0400] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0500
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0500
     * @tc.desc   Test LazyVGridLayout sticky property with StickyStyle.BOTH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0500] START');
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_both');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0500] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).assertEqual('StickyStyle.Header | StickyStyle.Footer');
      console.info('[lazyVGridSticky_0500] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0600
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0600
     * @tc.desc   Test LazyVGridLayout sticky property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0600] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_sticky_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0600] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).not().assertUndefined();
      expect(obj.$attrs.sticky).assertEqual(objCompare.$attrs.sticky);
      console.info('[lazyVGridSticky_0600] END');
      done();
    });

    /**
     * @tc.name   lazyVGridSticky_0700
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_STICKY_PARAM_0700
     * @tc.desc   Test LazyVGridLayout sticky property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('lazyVGridSticky_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[lazyVGridSticky_0700] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_sticky_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_sticky_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[lazyVGridSticky_0700] sticky: " + JSON.stringify(obj.$attrs.sticky));
      expect(obj.$attrs.sticky).not().assertUndefined();
      expect(obj.$attrs.sticky).assertEqual(objCompare.$attrs.sticky);
      console.info('[lazyVGridSticky_0700] END');
      done();
    });
  });
}