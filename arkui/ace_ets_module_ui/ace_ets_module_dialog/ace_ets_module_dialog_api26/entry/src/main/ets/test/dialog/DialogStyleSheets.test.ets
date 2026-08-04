/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import DialogApi26TestHelper from '../common/DialogApi26TestHelper';

export default function DialogStyleSheets() {
  describe('DialogStyleSheets', () => {
    beforeEach(async (done: Function) => {
      console.info('[ARKUI_DYN] DialogStyleSheets beforeEach');
      await DialogApi26TestHelper.openPageIfNeeded('DialogStyleSheets', 'MainAbility/pages/dialog/DialogStyleSheets');
      done();
    });

    afterEach(async () => {
      console.info('[ARKUI_DYN] DialogStyleSheets afterEach');
    });
    afterAll(async () => {
      await DialogApi26TestHelper.leavePage();
      console.info('[ARKUI_DYN] DialogStyleSheets afterAll');
    });


    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleSheets_0100
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleSheets_0100
     * @tc.desc present DialogSheet sheets and dismiss
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleSheets_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0100 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_style_sheets_only'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(2500);
      let cover = await driver.waitForComponent(ON.id('style_sheets_cover'), 3000);
      let coverTxt = await cover.getText();
      expect(coverTxt.indexOf('sheets_') >= 0).assertTrue();
      let idLabel = await driver.findComponent(ON.id('style_sheets_dialog_id'));
      let idTxt = await idLabel.getText();
      expect(idTxt !== 'dialogId=-1').assertTrue();
      let label = await driver.findComponent(ON.id('style_sheets_action'));
      let txt = await label.getText();
      expect(txt.indexOf('sheets') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleSheets_0200
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleSheets_0200
     * @tc.desc sheets with icon field via present path
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleSheets_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0200 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_style_sheets_only'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(2500);
      let cover = await driver.waitForComponent(ON.id('style_sheets_cover'), 3000);
      let coverTxt = await cover.getText();
      expect(coverTxt.indexOf('sheets_') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleSheets_0300
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleSheets_0300
     * @tc.desc sheets combined with buttons and gridCount
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleSheets_0300', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0300 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_style_sheets_buttons'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(2500);
      let cover = await driver.waitForComponent(ON.id('style_sheets_cover'), 3000);
      let coverTxt = await cover.getText();
      expect(coverTxt.indexOf('sheet_btn_') >= 0).assertTrue();
      let idLabel = await driver.findComponent(ON.id('style_sheets_dialog_id'));
      let idTxt = await idLabel.getText();
      expect(idTxt !== 'dialogId=-1').assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleSheets_0400
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleSheets_0400
     * @tc.desc gridCount style dialog real click GridOK
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleSheets_0400', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0400 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_style_sheets_grid'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(1500);
      let title = await driver.waitForComponent(ON.text('GridTitle'), 3000);
      expect(title !== null).assertTrue();
      let ok = await driver.waitForComponent(ON.text('GridOK'), 3000);
      expect(ok !== null).assertTrue();
      await ok.click();
      await CommonFunc.sleep(200);
      let label = await driver.findComponent(ON.id('style_sheets_action'));
      let txt = await label.getText();
      expect(txt.indexOf('GridOK') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_DialogApi26_DialogStyleSheets_0500
     * @tc.name SUB_ArkUI_DialogApi26_DialogStyleSheets_0500
     * @tc.desc DialogSheet/DialogMessage field coverage
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level 2
     */
    it('SUB_ArkUI_DialogApi26_DialogStyleSheets_0500', Level.LEVEL2, async (done: Function) => {
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0500 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(200);
      let btn = await driver.waitForComponent(ON.id('btn_style_sheets_cover'), 5000);
      expect(btn !== null).assertTrue();
      await btn.click();
      await CommonFunc.sleep(200);
      let cover = await driver.findComponent(ON.id('style_sheets_cover'));
      let txt = await cover.getText();
      expect(txt.indexOf('CoverSheet') >= 0).assertTrue();
      let label = await driver.findComponent(ON.id('style_sheets_action'));
      let a = await label.getText();
      expect(a.indexOf('fieldsCovered') >= 0).assertTrue();
      console.info('[ARKUI_DYN] SUB_ArkUI_DialogApi26_DialogStyleSheets_0500 END');
      done();
    });

  });
}
