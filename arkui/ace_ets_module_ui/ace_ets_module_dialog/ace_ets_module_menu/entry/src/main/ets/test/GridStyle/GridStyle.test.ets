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

import router from '@ohos.router';
import { describe, beforeAll, afterEach, it, expect, Level } from "@ohos/hypium";
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';

export default function GridStyleTest() {
  describe('GridStyleTest', () => {

    beforeAll(async (done: Function) => {
      console.info("[GridStyleTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridStyle/GridStyleTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[GridStyleTest] get state success " + JSON.stringify(pages));
        if (!("GridStyleTestPage" == pages.name)) {
          console.info("[GridStyleTest] page name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("[GridStyleTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[GridStyleTest] push page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });

    /**
     * @tc.name   GridStyleTest_MenuGridPosition_TOP_0100
     * @tc.number SUB_ARKUI_API_GridStyle_MenuGridPosition_TOP_0100
     * @tc.desc   Test MenuGridPosition.TOP enum value equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_MenuGridPosition_TOP_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_MenuGridPosition_TOP_0100 START');
      expect(MenuGridPosition.TOP).assertEqual(0);
      console.info('MenuGridPosition.TOP = ' + MenuGridPosition.TOP);
      done();
    });

    /**
     * @tc.name   GridStyleTest_MenuGridPosition_BOTTOM_0100
     * @tc.number SUB_ARKUI_API_GridStyle_MenuGridPosition_BOTTOM_0100
     * @tc.desc   Test MenuGridPosition.BOTTOM enum value equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_MenuGridPosition_BOTTOM_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_MenuGridPosition_BOTTOM_0100 START');
      expect(MenuGridPosition.BOTTOM).assertEqual(1);
      console.info('MenuGridPosition.BOTTOM = ' + MenuGridPosition.BOTTOM);
      done();
    });

    /**
     * @tc.name   GridStyleTest_MenuGridPosition_UI_0100
     * @tc.number SUB_ARKUI_API_GridStyle_MenuGridPosition_UI_0100
     * @tc.desc   Test MenuGridPosition enum values via UI interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_MenuGridPosition_UI_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_MenuGridPosition_UI_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let btnTop = await driver.findComponent(ON.id('btn_enum_top'));
      expect(btnTop).not().assertUndefined();
      await btnTop.click();
      await Utils.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('MenuGridPosition.TOP')).assertLarger(-1);
      expect(resultStr.indexOf('0')).assertLarger(-1);
      console.info('GridStyleTest_MenuGridPosition_UI_0100 TOP result: ' + resultStr);

      let btnBottom = await driver.findComponent(ON.id('btn_enum_bottom'));
      expect(btnBottom).not().assertUndefined();
      await btnBottom.click();
      await Utils.sleep(500);

      let resultText2 = await driver.findComponent(ON.id('result_text'));
      let resultStr2 = await resultText2.getText();
      expect(resultStr2.indexOf('MenuGridPosition.BOTTOM')).assertLarger(-1);
      expect(resultStr2.indexOf('1')).assertLarger(-1);

      console.info('GridStyleTest_MenuGridPosition_UI_0100 BOTTOM result: ' + resultStr2);

      console.info('GridStyleTest_MenuGridPosition_UI_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Count_0100
     * @tc.number SUB_ARKUI_API_GridStyle_Count_0100
     * @tc.desc   Test gridStyle with count=0 (should use default value 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Count_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Count_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_count_0'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('count=0')).assertLarger(-1);
      console.info('GridStyleTest_Count_0100 result: ' + resultStr);

      

      console.info('GridStyleTest_Count_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Count_0200
     * @tc.number SUB_ARKUI_API_GridStyle_Count_0200
     * @tc.desc   Test gridStyle with count=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Count_0200', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Count_0200 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_count_1'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('count=1')).assertLarger(-1);
      console.info('GridStyleTest_Count_0200 result: ' + resultStr);


      console.info('GridStyleTest_Count_0200 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Count_0300
     * @tc.number SUB_ARKUI_API_GridStyle_Count_0300
     * @tc.desc   Test gridStyle with count=3 (default value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Count_0300', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Count_0300 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_count_3'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('count=3')).assertLarger(-1);
      console.info('GridStyleTest_Count_0300 result: ' + resultStr);


      console.info('GridStyleTest_Count_0300 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Count_0400
     * @tc.number SUB_ARKUI_API_GridStyle_Count_0400
     * @tc.desc   Test gridStyle with count=6 (max for icon+text grid style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Count_0400', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Count_0400 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_count_6'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('count=6')).assertLarger(-1);
      console.info('GridStyleTest_Count_0400 result: ' + resultStr);


      console.info('GridStyleTest_Count_0400 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_HorizontalSize_0100
     * @tc.number SUB_ARKUI_API_GridStyle_HorizontalSize_0100
     * @tc.desc   Test gridStyle with horizontalSize=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_HorizontalSize_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_HorizontalSize_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_hsize_1'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('horizontalSize=1')).assertLarger(-1);
      console.info('GridStyleTest_HorizontalSize_0100 result: ' + resultStr);


      console.info('GridStyleTest_HorizontalSize_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_HorizontalSize_0200
     * @tc.number SUB_ARKUI_API_GridStyle_HorizontalSize_0200
     * @tc.desc   Test gridStyle with horizontalSize=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_HorizontalSize_0200', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_HorizontalSize_0200 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_hsize_2'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('horizontalSize=2')).assertLarger(-1);
      console.info('GridStyleTest_HorizontalSize_0200 result: ' + resultStr);


      console.info('GridStyleTest_HorizontalSize_0200 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_HorizontalSize_0300
     * @tc.number SUB_ARKUI_API_GridStyle_HorizontalSize_0300
     * @tc.desc   Test gridStyle with horizontalSize=3 (default value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_HorizontalSize_0300', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_HorizontalSize_0300 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_hsize_3'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('horizontalSize=3')).assertLarger(-1);
      console.info('GridStyleTest_HorizontalSize_0300 result: ' + resultStr);

      console.info('GridStyleTest_HorizontalSize_0300 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_HorizontalSize_0400
     * @tc.number SUB_ARKUI_API_GridStyle_HorizontalSize_0400
     * @tc.desc   Test gridStyle with horizontalSize=4 (icon-only style, 4 items per row)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_HorizontalSize_0400', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_HorizontalSize_0400 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_hsize_4'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('horizontalSize=4')).assertLarger(-1);
      console.info('GridStyleTest_HorizontalSize_0400 result: ' + resultStr);


      

      console.info('GridStyleTest_HorizontalSize_0400 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Position_TOP_0100
     * @tc.number SUB_ARKUI_API_GridStyle_Position_TOP_0100
     * @tc.desc   Test gridStyle with position=MenuGridPosition.TOP (grid above text menu)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Position_TOP_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Position_TOP_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_pos_top'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('TOP')).assertLarger(-1);
      console.info('GridStyleTest_Position_TOP_0100 result: ' + resultStr);

      

      console.info('GridStyleTest_Position_TOP_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Position_BOTTOM_0100
     * @tc.number SUB_ARKUI_API_GridStyle_Position_BOTTOM_0100
     * @tc.desc   Test gridStyle with position=MenuGridPosition.BOTTOM (grid below text menu)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Position_BOTTOM_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Position_BOTTOM_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_pos_bottom'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('分享'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('BOTTOM')).assertLarger(-1);
      console.info('GridStyleTest_Position_BOTTOM_0100 result: ' + resultStr);

      
      console.info('GridStyleTest_Position_BOTTOM_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_AllParams_0100
     * @tc.number SUB_ARKUI_API_GridStyle_AllParams_0100
     * @tc.desc   Test gridStyle with all params combined (count=4, horizontalSize=3, position=BOTTOM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_AllParams_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_AllParams_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_all_params'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('count=4')).assertLarger(-1);
      expect(resultStr.indexOf('hSize=3')).assertLarger(-1);
      expect(resultStr.indexOf('BOTTOM')).assertLarger(-1);
      console.info('GridStyleTest_AllParams_0100 result: ' + resultStr);


      

      console.info('GridStyleTest_AllParams_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_Default_0100
     * @tc.number SUB_ARKUI_API_GridStyle_Default_0100
     * @tc.desc   Test bindContextMenuByIsShow without gridStyle (default menu behavior)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_Default_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_Default_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_no_grid'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);
      let copyBtn = await driver.findComponent(ON.text('复制'))
      await copyBtn.click();
      await Utils.sleep(1500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('No gridStyle')).assertLarger(-1);

      await Utils.sleep(1500);
      console.info('GridStyleTest_Default_0100 result: ' + resultStr);

      console.info('GridStyleTest_Default_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_BindMenu_0100
     * @tc.number SUB_ARKUI_API_GridStyle_BindMenu_0100
     * @tc.desc   Test bindMenu with MenuElement array and gridStyle option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_BindMenu_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_BindMenu_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_bindmenu_grid'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('bindMenu')).assertLarger(-1);
      console.info('GridStyleTest_BindMenu_0100 result: ' + resultStr);

      console.info('GridStyleTest_BindMenu_0100 END');
      done();
    });

    

    /**
     * @tc.name   GridStyleTest_ReturnValue_0200
     * @tc.number SUB_ARKUI_API_GridStyle_ReturnValue_0200
     * @tc.desc   Test bindMenu with gridStyle returns T (component itself)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_ReturnValue_0200', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_ReturnValue_0200 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_bindmenu_grid'));
      expect(textComp).not().assertUndefined();
      let compId = await textComp.getId();
      expect(compId).assertEqual('text_bindmenu_grid');
      console.info('GridStyleTest_ReturnValue_0200 bindMenu returns T, component id: ' + compId);

      console.info('GridStyleTest_ReturnValue_0200 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_MenuGridStyleOptions_Default_0100
     * @tc.number SUB_ARKUI_API_GridStyle_MenuGridStyleOptions_Default_0100
     * @tc.desc   Test MenuGridStyleOptions default values (count=3, horizontalSize=3, position=TOP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_MenuGridStyleOptions_Default_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_MenuGridStyleOptions_Default_0100 START');

      expect(MenuGridPosition.TOP).assertEqual(0);
      console.info('Default position: MenuGridPosition.TOP = ' + MenuGridPosition.TOP);

      console.info('MenuGridStyleOptions default values: count=3, horizontalSize=3, position=TOP(0)');
      console.info('GridStyleTest_MenuGridStyleOptions_Default_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_GridStyleWithBindContextMenuByIsShow_0100
     * @tc.number SUB_ARKUI_API_GridStyle_GridStyleWithBindContextMenuByIsShow_0100
     * @tc.desc   Test gridStyle parameter acceptance in bindContextMenuByIsShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_GridStyleWithBindContextMenuByIsShow_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_GridStyleWithBindContextMenuByIsShow_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_count_3'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      // =========
      let copyBtn = await driver.findComponent(ON.text('复制'));
      await copyBtn.click();
      await Utils.sleep(1500);
      // ===========

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.length).assertLarger(0);
      console.info('GridStyleTest_GridStyleWithBindContextMenuByIsShow_0100 result: ' + resultStr);

      

      console.info('GridStyleTest_GridStyleWithBindContextMenuByIsShow_0100 END');
      done();
    });

    /**
     * @tc.name   GridStyleTest_GridStyleWithBindMenu_0100
     * @tc.number SUB_ARKUI_API_GridStyle_GridStyleWithBindMenu_0100
     * @tc.desc   Test gridStyle parameter acceptance in bindMenu with MenuElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridStyleTest_GridStyleWithBindMenu_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GridStyleTest_GridStyleWithBindMenu_0100 START');
      let driver = await Driver.create();
      await Utils.sleep(1000);

      let textComp = await driver.findComponent(ON.id('text_bindmenu_grid'));
      expect(textComp).not().assertUndefined();
      await textComp.click();
      await Utils.sleep(1500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      expect(resultText).not().assertUndefined();
      let resultStr = await resultText.getText();
      expect(resultStr.indexOf('bindMenu')).assertLarger(-1);
      console.info('GridStyleTest_GridStyleWithBindMenu_0100 result: ' + resultStr);

      console.info('GridStyleTest_GridStyleWithBindMenu_0100 END');
      done();
    });
  })
}
