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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium-dynamic';
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
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

let displayID: number = AppStorage.get('displayID') ? AppStorage.get('displayID') as number : 0;

export default function APIsetOnHoverTest() {
  describe('APIsetOnHoverTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIsetOnHoverTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/APIsetOnHover",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIsetOnHoverTest state pages: " + JSON.stringify(pages));
        if (!("APIsetOnHover" == pages.name)) {
          console.info("get APIsetOnHoverTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push APIsetOnHoverTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIsetOnHoverTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   APIsetOnHoverTest_0100
     * @tc.number APIsetOnHoverTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIsetOnHoverTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('APIsetOnHoverTest_0100 START');
      let strJson = getInspectorByKey('setOnHover_1');
      expect(strJson !== '').assertTrue();
      let obj:ESObject = JSON.parse(strJson);
      console.info("[APIsetOnHoverTest_0100] component obj is: " + JSON.stringify(obj));
      let rectInfo: Object[] = JSON.parse('[' + obj.$rect + ']');
      let left: number = JSON.parse('[' + rectInfo[0] + ']')[0];
      let top: number = JSON.parse('[' + rectInfo[0] + ']')[1];
      let right: number = JSON.parse('[' + rectInfo[1] + ']')[0];
      let bottom: number = JSON.parse('[' + rectInfo[1] + ']')[1];
      let centerX: number = Math.floor((left + right) / 2);
      let centerY: number = Math.floor((top + bottom) / 2);
      let curDisplayID: number = AppStorage.get('displayID') ? AppStorage.get('displayID') as number : 0;
      console.info("[APIsetOnHoverTest_0100] center point: x=" + centerX + ", y=" + centerY + ", displayId=" + curDisplayID);
      let driver = await Driver.create()
      await driver.mouseMoveTo({x: centerX, y: centerY, displayId: curDisplayID})
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('setOnHover_1');
      let obj2:ESObject = JSON.parse(strJson2);
      console.info("[APIsetOnHoverTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[APIsetOnHoverTest_0100] title: " + JSON.stringify(obj2.$attrs.content));
      console.info("[APIsetOnHoverTest_0100] backgroundColor: " + JSON.stringify(obj2.$attrs.backgroundColor));
      expect(obj2.$attrs.content).assertEqual('setOnHover');
      expect(obj2.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[APIsetOnHoverTest_0100] END');
      done();
    });
  })
}