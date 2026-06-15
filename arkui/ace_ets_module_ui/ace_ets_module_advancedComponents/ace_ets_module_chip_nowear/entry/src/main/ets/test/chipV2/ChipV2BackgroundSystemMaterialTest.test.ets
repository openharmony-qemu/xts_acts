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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function ChipV2BackgroundSystemMaterialTest() {
  describe('ChipV2BackgroundSystemMaterialTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipV2BackgroundSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/ChipV2BackgroundSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipV2BackgroundSystemMaterial state pages:" + JSON.stringify(pages));
        if (!("ChipV2BackgroundSystemMaterial" == pages.name)) {
          console.info("get ChipV2BackgroundSystemMaterial pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2BackgroundSystemMaterial page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2BackgroundSystemMaterial page error:" + err);
      }
      console.info("ChipV2BackgroundSystemMaterial beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_BackgroundSystemMaterial_0100
     * @tc.number SUB_ARKUI_CHIPV2_BackgroundSystemMaterial_0100
     * @tc.desc   Test Chip backgroundSystemMaterial property with ImmersiveMaterial REGULAR style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_BackgroundSystemMaterial_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV2_BackgroundSystemMaterial_0100 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[0].$attrs.systemMaterial.material.immersiveOptions.style
      expect(systemMaterial).assertEqual("ImmersiveStyle.REGULAR");
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV2_BackgroundSystemMaterial_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ACTIVATEDBACKGROUNDSYSTEMMATERIAL_0100
     * @tc.number SUB_ARKUI_CHIPV2_ACTIVATEDBACKGROUNDSYSTEMMATERIAL_0100
     * @tc.desc   Test Chip activatedBackgroundSystemMaterial property with ImmersiveMaterial THICK style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ACTIVATEDBACKGROUNDSYSTEMMATERIAL_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV2_ACTIVATEDBACKGROUNDSYSTEMMATERIAL_0100 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[1].$attrs.systemMaterial.material.immersiveOptions.style
      expect(systemMaterial).assertEqual("ImmersiveStyle.THICK");
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV2_ACTIVATEDBACKGROUNDSYSTEMMATERIAL_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_BACKGROUNDSYSTEMMATERIAL_0200
     * @tc.number SUB_ARKUI_CHIPV2_BACKGROUNDSYSTEMMATERIAL_0200
     * @tc.desc   Test Chip default backgroundSystemMaterial behavior (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_BACKGROUNDSYSTEMMATERIAL_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV2_BACKGROUNDSYSTEMMATERIAL_0200 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[2].$attrs.systemMaterial
      expect(systemMaterial).assertUndefined()
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV2_BACKGROUNDSYSTEMMATERIAL_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV3_BACKGROUNDSYSTEMMATERIAL_0300
     * @tc.number SUB_ARKUI_CHIPV3_BACKGROUNDSYSTEMMATERIAL_0300
     * @tc.desc   Test Chip backgroundSystemMaterial property with undefined value (should use default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV3_BACKGROUNDSYSTEMMATERIAL_0300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV3_BACKGROUNDSYSTEMMATERIAL_0300 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[3].$attrs.systemMaterial
      expect(systemMaterial).assertUndefined()
      hilog.info(0x0000, 'ChipV2BackgroundSystemMaterialTest', 'SUB_ARKUI_CHIPV3_BACKGROUNDSYSTEMMATERIAL_0300 END');
    });
  });
}