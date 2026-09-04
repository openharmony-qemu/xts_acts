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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GridLayoutOptionsUn() {
  describe('GridLayoutOptionsUn', () => {
    beforeEach(async (done: Function) => {
      console.info("GridLayoutOptionsUn beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid_iiregular/GridLayoutOptionsUn",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridLayoutOptionsUn state pages: " + JSON.stringify(pages));
        if (!("GridLayoutOptionsUn" == pages.name)) {
          console.info("get GridLayoutOptionsUn state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridLayoutOptionsUn page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push GridLayoutOptionsUn page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   gridLayoutOptionsUn_0100
     * @tc.number SUB_ARKUI_GRID_GRIDLAYOUTOPTIONS_UNDEFINED_0100
     * @tc.desc   Test Grid with undefined GridLayoutOptions, verify component exists and type is Grid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridLayoutOptionsUn_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridLayoutOptionsUn_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson: string = getInspectorByKey('grid_layoutOptions_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[gridLayoutOptionsUn_0100] $type: ' + obj.$type);
        expect(obj.$type).assertEqual('Grid');
        console.info('[gridLayoutOptionsUn_0100] END');
        done();
      } catch (error) {
        console.error('[gridLayoutOptionsUn_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   gridLayoutOptionsUn_0200
     * @tc.number SUB_ARKUI_GRID_GRIDLAYOUTOPTIONS_UNDEFINED_0200
     * @tc.desc   Test Grid with undefined GridLayoutOptions, verify columnsTemplate property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridLayoutOptionsUn_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[gridLayoutOptionsUn_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson: string = getInspectorByKey('grid_layoutOptions_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[gridLayoutOptionsUn_0200] columnsTemplate: ' + obj.$attrs.columnsTemplate);
        expect(obj.$attrs.columnsTemplate).assertEqual('1fr 1fr 1fr');
        console.info('[gridLayoutOptionsUn_0200] END');
        done();
      } catch (error) {
        console.error('[gridLayoutOptionsUn_0200] error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   gridLayoutOptionsUn_0300
     * @tc.number SUB_ARKUI_GRID_GRIDLAYOUTOPTIONS_UNDEFINED_0300
     * @tc.desc   Test Grid with null GridLayoutOptions, verify component exists and type is Grid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridLayoutOptionsUn_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[gridLayoutOptionsUn_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let strJson: string = getInspectorByKey('grid_layoutOptions_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[gridLayoutOptionsUn_0300] $type: ' + obj.$type);
        expect(obj.$type).assertEqual('Grid');
        console.info('[gridLayoutOptionsUn_0300] END');
        done();
      } catch (error) {
        console.error('[gridLayoutOptionsUn_0300] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
