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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function ChipGroupSystemMaterialTest() {
  describe('ChipGroupSystemMaterialTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipGroupSystemMaterialTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroup/ChipGroupSystemMaterial",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipGroupSystemMaterial" == pages.name)) {
          console.info("get ChipGroupSystemMaterialTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipGroupSystemMaterialTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupSystemMaterialTest page error:" + err);
      }
  
      done();
    });
    afterEach(() => {
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   chipGroupBackgroundSystemMaterial_0100
     * @tc.number SUB_ARKUI_CHIPGROUP_BACKGROUNDSYSTEMMATERIAL_0100
     * @tc.desc   Test ChipGroup backgroundSystemMaterial property with ImmersiveMaterial ULTRA_THIN style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipGroupBackgroundSystemMaterial_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'chipGroupBackgroundSystemMaterial_0100 START');
      let result: ESObject = getInspectorTree();
      let systemMaterial: string = result.$children[0].$children[0].$children[0].$children[0].$children[0].$children[0].$children[1].$attrs.systemMaterial?.material?.immersiveOptions?.style;
      expect(systemMaterial).assertEqual('ImmersiveStyle.ULTRA_THIN_EC_SUB');
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'chipGroupBackgroundSystemMaterial_0100 END');
    });

    /**
     * @tc.name   chipGroupBackgroundSystemMaterial_0200
     * @tc.number SUB_ARKUI_CHIPGROUP_BACKGROUNDSYSTEMMATERIAL_0200
     * @tc.desc   Test ChipGroup backgroundSystemMaterial property with ImmersiveMaterial ULTRA_THICK style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipGroupBackgroundSystemMaterial_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'chipGroupBackgroundSystemMaterial_0200 START');
      let result: ESObject = getInspectorTree();
      let systemMaterial: string = result.$children[0].$children[0].$children[1].$children[0].$children[0].$children[0].$attrs.systemMaterial?.material?.immersiveOptions?.style;
      expect(systemMaterial).assertEqual('ImmersiveStyle.ULTRA_THICK_EC_SUB');
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'chipGroupBackgroundSystemMaterial_0200 END');
    });

    /**
     * @tc.name   chipGroupBackgroundSystemMaterial_0400
     * @tc.number SUB_ARKUI_CHIPGROUP_BACKGROUNDSYSTEMMATERIAL_0400
     * @tc.desc   Test ChipGroup backgroundSystemMaterial property with undefined value (should use default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipGroupBackgroundSystemMaterial_0400', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'chipGroupBackgroundSystemMaterial_0400 START');
      let result: ESObject = getInspectorTree();
      let systemMaterial: string = result.$children[0].$children[2].$children[0].$children[0].$children[0].$children[0].$children[1].$attrs.systemMaterial;
      expect(systemMaterial).assertUndefined();
      hilog.info(0x0000, 'ChipGroupSystemMaterialTest', 'chipGroupBackgroundSystemMaterial_0400 END');
    });
  });
}