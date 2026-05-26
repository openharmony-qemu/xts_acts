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
export default function ChipBackgroundSystemMaterialTest() {
  describe('ChipBackgroundSystemMaterialTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipBackgroundSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chip/ChipBackgroundSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipBackgroundSystemMaterial state pages:" + JSON.stringify(pages));
        if (!("ChipBackgroundSystemMaterial" == pages.name)) {
          console.info("get ChipBackgroundSystemMaterial pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipBackgroundSystemMaterial page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipBackgroundSystemMaterial page error:" + err);
      }
      console.info("ChipBackgroundSystemMaterial beforeEach end");
      done();
    });

    afterEach(() => {
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'afterEach: test case finished');
    });

    afterAll(async () => {
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   chipBackgroundSystemMaterial_0100
     * @tc.number SUB_ARKUI_CHIP_BACKGROUNDSYSTEMMATERIAL_0100
     * @tc.desc   Test Chip backgroundSystemMaterial property with ImmersiveMaterial REGULAR style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipBackgroundSystemMaterial_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipBackgroundSystemMaterial_0100 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[0].$attrs.systemMaterial.material.immersiveOptions.style
      expect(systemMaterial).assertEqual("ImmersiveStyle.REGULAR");
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipBackgroundSystemMaterial_0100 END');
    });

    /**
     * @tc.name   chipActivatedBackgroundSystemMaterial_0100
     * @tc.number SUB_ARKUI_CHIP_ACTIVATEDBACKGROUNDSYSTEMMATERIAL_0100
     * @tc.desc   Test Chip activatedBackgroundSystemMaterial property with ImmersiveMaterial THICK style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipActivatedBackgroundSystemMaterial_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipActivatedBackgroundSystemMaterial_0100 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[1].$attrs.systemMaterial.material.immersiveOptions.style
      expect(systemMaterial).assertEqual("ImmersiveStyle.THICK");
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipActivatedBackgroundSystemMaterial_0100 END');
    });

    /**
     * @tc.name   chipBackgroundSystemMaterial_0200
     * @tc.number SUB_ARKUI_CHIP_BACKGROUNDSYSTEMMATERIAL_0200
     * @tc.desc   Test Chip default backgroundSystemMaterial behavior (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipBackgroundSystemMaterial_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipBackgroundSystemMaterial_0200 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[2].$attrs.systemMaterial
      expect(systemMaterial).assertUndefined()
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipBackgroundSystemMaterial_0200 END');
    });

    /**
     * @tc.name   chipBackgroundSystemMaterial_0300
     * @tc.number SUB_ARKUI_CHIP_BACKGROUNDSYSTEMMATERIAL_0300
     * @tc.desc   Test Chip backgroundSystemMaterial property with undefined value (should use default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('chipBackgroundSystemMaterial_0300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipBackgroundSystemMaterial_0300 START');
      let result: ESObject = getInspectorTree()
      let systemMaterial: string  = result.$children[0].$children[3].$attrs.systemMaterial
      expect(systemMaterial).assertUndefined()
      hilog.info(0x0000, 'ChipBackgroundSystemMaterialTest', 'chipBackgroundSystemMaterial_0300 END');
    });
  });
}