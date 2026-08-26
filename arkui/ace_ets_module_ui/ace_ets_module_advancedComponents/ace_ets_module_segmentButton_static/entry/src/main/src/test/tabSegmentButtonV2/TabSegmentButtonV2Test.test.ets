'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import { describe, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
export default function TabSegmentButtonV2Test() {
  describe('TabSegmentButtonV2Test', () => {

    beforeEach(async (): Promise<void> => {
      console.info("TabSegmentButtonV2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabSegmentButtonV2/TabSegmentButtonV2Example',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TabSegmentButtonV2Test state pages:" + JSON.stringify(pages));
        if (!("TabSegmentButtonV2Example" == pages.name)) {
          console.info("get TabSegmentButtonV2Test pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabSegmentButtonV2Test page error:" + err);
      }
      console.info("TabSegmentButtonV2Test beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
        console.info('TabSegmentButtonV2Test after each called');
      } catch (err) {
        console.error("TabSegmentButtonV2Test afterEach sleep err: " + JSON.stringify(err));
      }
    });


    /**
     * @tc.number    TabSegmentButtonV2Test_static_0100
     * @tc.name      TabSegmentButtonV2Test_static_0100
     * @tc.desc      TabSegmentButtonV2Test_static_0100
     * @tc.level     2
     */
    it('TabSegmentButtonV2Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0100", "START");
        try {
          let tabSegmentButton = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
          console.log("TabSegmentButtonV2Test_static_0100", JSON.stringify(tabSegmentButton))
          console.log("TabSegmentButtonV2Test_static_0100 itemMinFontScale ", tabSegmentButton.getElement('$attrs').getString('minFontScale'))
          console.log("TabSegmentButtonV2Test_static_0100 itemMaxFontScale ", tabSegmentButton.getElement('$attrs').getString('maxFontScale'))
          console.log("TabSegmentButtonV2Test_static_0100 itemSelectedFontSize ", tabSegmentButton.getElement('$attrs').getString('fontSize'))
          console.log("TabSegmentButtonV2Test_static_0100 itemSelectedFontColor ", tabSegmentButton.getElement('$attrs').getString('fontColor'))
          console.log("TabSegmentButtonV2Test_static_0100 itemSelectedFontWeight ", tabSegmentButton.getElement('$attrs').getString('fontWeight'))
          expect(tabSegmentButton.getElement('$attrs').getString('minFontScale')).assertEqual('0.500000');
          expect(tabSegmentButton.getElement('$attrs').getString('maxFontScale')).assertEqual('1.200000');
          expect(tabSegmentButton.getElement('$attrs').getString('fontSize')).assertEqual('18.00fp');
          expect(tabSegmentButton.getElement('$attrs').getString('fontColor')).assertEqual('#FF0000FF');
          expect(tabSegmentButton.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
          await CommonFunc.sleep(500);
          console.log("TabSegmentButtonV2Test_static_0100", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0100] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });



     /**
      * @tc.number    TabSegmentButtonV2Test_static_0110
      * @tc.name      TabSegmentButtonV2Test_static_0110
      * @tc.desc      TabSegmentButtonV2Test_static_0110
      * @tc.level     2
      */
     it('TabSegmentButtonV2Test_static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0110", "START");
        try {
          let borderRadius = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[0]
          console.log("TabSegmentButtonV2Test_static_0110 itemBorderRadius ", borderRadius.getElement('$attrs').getString('borderRadius'))
          expect(borderRadius.getElement('$attrs').getString('borderRadius')).assertEqual('10.00px');
          await CommonFunc.sleep(500);
          console.log("TabSegmentButtonV2Test_static_0110", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0110] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });


     /**
      * @tc.number    TabSegmentButtonV2Test_static_0120
      * @tc.name      TabSegmentButtonV2Test_static_0120
      * @tc.desc      TabSegmentButtonV2Test_static_0120
      * @tc.level     2
      */
      it('TabSegmentButtonV2Test_static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0120", "START");
        try {
          let itemSpace = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[0]
            .getArray("$children")[0]
            await CommonFunc.sleep(500);
            let itemUnselected = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
              .getArray("$children")[0]
              .getArray("$children")[0]
              .getArray("$children")[0]
              .getArray("$children")[0]
              .getArray("$children")[0]
              .getArray("$children")[5]
              .getArray("$children")[1]
              .getArray("$children")[0]
              .getArray("$children")[0]
            console.log("TabSegmentButtonV2Test_static_0120 itemSpace ", itemSpace.getElement('$attrs').getString('space'))
            console.log("TabSegmentButtonV2Test_static_0120 itemFontSize ", itemUnselected.getElement('$attrs').getString('fontSize'))
            console.log("TabSegmentButtonV2Test_static_0120 itemFontColor ", itemUnselected.getElement('$attrs').getString('fontColor'))
            console.log("TabSegmentButtonV2Test_static_0120 itemFontWeight ", itemUnselected.getElement('$attrs').getString('fontWeight'))
            expect(itemSpace.getElement('$attrs').getString('space')).assertEqual('2.00vp');
            expect(itemUnselected.getElement('$attrs').getString('fontSize')).assertEqual('15.00fp');
            expect(itemUnselected.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
            expect(itemUnselected.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
            await CommonFunc.sleep(500);
            console.log("TabSegmentButtonV2Test_static_0120", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0120] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });


      /**
       * @tc.number    TabSegmentButtonV2Test_static_0130
       * @tc.name      TabSegmentButtonV2Test_static_0130
       * @tc.desc      TabSegmentButtonV2Test_static_0130
       * @tc.level     2
       */
      it('TabSegmentButtonV2Test_static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0130", "START");
        try {
          let symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[1]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
          console.log("TabSegmentButtonV2Test_static_0130 itemSymbolFontSize ", symbol.getElement('$attrs').getString('fontSize'))
          expect(symbol.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
          await CommonFunc.sleep(500);
          console.log("TabSegmentButtonV2Test_static_0130", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0130] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });



     /**
      * @tc.number    TabSegmentButtonV2Test_static_0140
      * @tc.name      TabSegmentButtonV2Test_static_0140
      * @tc.desc      TabSegmentButtonV2Test_static_0140
      * @tc.level     2
      */
      it('TabSegmentButtonV2Test_static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0140", "START");
        try {
          let itemMinHeight = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[2]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[0]
          console.log("TabSegmentButtonV2Test_static_0140 itemMinHeight ", itemMinHeight.getElement('$attrs').getString('height'))
          expect(itemMinHeight.getElement('$attrs').getString('height')).assertEqual('80.00vp');
          await CommonFunc.sleep(500);
          console.log("TabSegmentButtonV2Test_static_0140", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0140] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });


      /**
       * @tc.number    TabSegmentButtonV2Test_static_0150
       * @tc.name      TabSegmentButtonV2Test_static_0150
       * @tc.desc      TabSegmentButtonV2Test_static_0150
       * @tc.level     2
       */
      it('TabSegmentButtonV2Test_static_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0150", "START");
        try {
          let imageSegment = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[2]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[0]
          console.log("TabSegmentButtonV2Test_static_0150 itemIconSize ", imageSegment.getElement('$attrs').getElement('size').getString('width'))
          console.log("TabSegmentButtonV2Test_static_0150 itemSelectedIconFillColor ", imageSegment.getElement('$attrs').getString('fillColor'))
          expect(imageSegment.getElement('$attrs').getElement('size').getString('width')).assertEqual('30.00vp');
          expect(imageSegment.getElement('$attrs').getString('fillColor')).assertEqual('#FF000000');
          await CommonFunc.sleep(500);
          console.log("TabSegmentButtonV2Test_static_0150", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0150] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.number    TabSegmentButtonV2Test_static_0160
     * @tc.name      TabSegmentButtonV2Test_static_0160
     * @tc.desc      TabSegmentButtonV2Test_static_0160
     * @tc.level     2
     */
      it('TabSegmentButtonV2Test_static_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("TabSegmentButtonV2Test_static_0160", "START");
        try {
          let imageUnselected = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[2]
            .getArray("$children")[0]
            .getArray("$children")[0]
            .getArray("$children")[5]
            .getArray("$children")[1]
            .getArray("$children")[0]
            .getArray("$children")[0]
          console.log("TabSegmentButtonV2Test_static_0160 itemIconFillColor ", imageUnselected.getElement('$attrs').getString('fillColor'))
          expect(imageUnselected.getElement('$attrs').getString('fillColor')).assertEqual('#99000000');
          console.log("TabSegmentButtonV2Test_static_0160", "END");
        } catch (error) {
          console.error('[TabSegmentButtonV2Test_static_0160] error: ' + JSON.stringify(error));
          expect(false).assertTrue();
        }
        done();
      });
  })
}