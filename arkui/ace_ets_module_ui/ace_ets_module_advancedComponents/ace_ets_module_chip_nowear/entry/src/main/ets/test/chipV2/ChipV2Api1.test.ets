/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,  Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function ChipV2Api1() {
  describe('ChipV2Api1', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipV2Api1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/ChipV2Api1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipV2Api1 state pages:" + JSON.stringify(pages));
        if (!("ChipV2Api1" == pages.name)) {
          console.info("get ChipV2Api1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2Api1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2Api1 page error:" + err);
      }
      console.info("ChipV2Api1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2Api1_0100
     * @tc.number SUB_ARKUI_API_ChipV2Api1_0100
     * @tc.desc   SUB_ARKUI_API_ChipV2Api1_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2Api1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipV2Api1_0100 START');
      await CommonFunc.sleep(1000);


      sendEventByKey('ChipV2Api1_btn1',10,"")
      await CommonFunc.sleep(1000);
      console.info('Activated click after')

      let text = getInspectorByKey('ChipV2Api1_text');
      expect(JSON.stringify(JSON.parse(text).$attrs.content)).assertEqual('\"#FFFF0000\"');
      await CommonFunc.sleep(1000);
      let rom: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      let btn: ESObject = rom
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[2]
      console.info('[SUB_ARKUI_API_ChipV2Api1_0100] btn.$attrs.accessibilityDescription is: ' +
      JSON.stringify(btn.$attrs.accessibilityDescription));
      expect(btn.$attrs.accessibilityDescription).assertEqual('helloActivate');
      console.info('SUB_ARKUI_API_ChipV2Api1_0100 END');
      done();
    });

  })
}