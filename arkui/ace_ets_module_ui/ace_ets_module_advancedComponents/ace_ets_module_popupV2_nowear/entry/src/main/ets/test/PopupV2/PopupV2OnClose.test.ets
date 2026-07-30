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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  MouseButton,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function PopupV2OnCloseTest() {
  describe('PopupV2OnCloseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PopupV2/PopupV2OnClose',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PopupV2OnCloseTest state pages: " + JSON.stringify(pages));
        if (!("PopupV2OnCloseTest" == pages.name)) {
          console.info("get PopupV2OnCloseTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PopupV2OnCloseTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PopupV2OnCloseTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100
     * @tc.number SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100
     * @tc.desc   onClose event test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      console.info('SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100 START');
      let PopupV2ActionCol = CommonFunc.getComponentRect('PopupV2OnClick');
      await CommonFunc.sleep(200);
      let right: number = PopupV2ActionCol.right - vp2px(22) + globalThis.winLeft;
      let top: number = PopupV2ActionCol.top + vp2px(18) + globalThis.winTop;
      await CommonFunc.sleep(200);
      console.info('SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100 right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.mouseClick({
        x: Math.round(right), y: Math.round(top)
      }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100 click success');

      let strJson1 = getInspectorByKey('PopupV2OnClickText');
      await CommonFunc.sleep(1000);
      console.info("[SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onClose');
      console.info('[SUB_ACE_ARKUI_POPUPV2ONCLOSE_0100] END');

      done();
    });


  })
}
