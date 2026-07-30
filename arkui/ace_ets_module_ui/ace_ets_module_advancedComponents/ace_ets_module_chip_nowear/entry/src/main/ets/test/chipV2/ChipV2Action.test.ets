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


export default function ChipV2Action() {
  describe('ChipV2Action', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/ChipV2Action',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipV2Action state pages: " + JSON.stringify(pages));
        if (!("ChipV2Action" == pages.name)) {
          console.info("get ChipV2Action state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2Action page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2Action page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2Action_0100
     * @tc.number SUB_ARKUI_API_ChipV2Action_0100
     * @tc.desc   action event test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2Action_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipV2Action_0100 START');
      await CommonFunc.sleep(1000);
      let ChipV2ActionCol = CommonFunc.getComponentRect('ChipV2ActionCol');
      let rom: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let flexRom: ESObject = rom
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      let rightImg: ESObject = rom
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
        .$children[0]
      let flexPadding: ESObject = JSON.parse(flexRom.$attrs.padding);
      console.info('flexRom padding：' + JSON.stringify(flexPadding));
      let right: number = ChipV2ActionCol.right - vp2px(Number(flexPadding.right.match(/\d+/)[0])) -
      vp2px(Number(rightImg.$attrs.width.match(/\d+/)[0]) / 2) + globalThis.winLeft;
      let top: number = ChipV2ActionCol.top + vp2px(Number(flexPadding.top.match(/\d+/)[0])) +
      vp2px(Number(rightImg.$attrs.height.match(/\d+/)[0]) / 2) + globalThis.winTop;
      console.info('SUB_ARKUI_API_ChipV2Action_0100 rightImg right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.click(
        Math.round(right), Math.round(top)
      );
      await CommonFunc.sleep(1000);
      console.info('SUB_ARKUI_API_ChipV2Action_0100 click success');
      let strJson1: ESObject = JSON.parse(getInspectorByKey('tvChipV2Action'));
      console.info('[SUB_ARKUI_API_ChipV2Action_0100] strJson1 is: ' + JSON.stringify(strJson1));
      expect(strJson1.$attrs.content).assertEqual('action');
      console.info('[SUB_ARKUI_API_ChipV2Action_0100] END');
      done();
    });
  })
}
