'use static'
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, Level } from '../../../../hypium/index';
import { uiMaterial } from '@kit.ArkUI';

/**
 * Pure API coverage for MaterialLevel / getGlobalMaterialLevel /
 * isImmersiveMaterialSupported (issue #28051). No Ability start.
 */
export default function MaterialLevelTest(): void {
  describe('MaterialLevelTest', () => {
    /**
     * @tc.name   SUB_ARKUI_API_MaterialLevel_0100
     * @tc.number SUB_ARKUI_API_MaterialLevel_0100
     * @tc.desc   MaterialLevel.EXQUISITE equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_MaterialLevel_0100', Level.LEVEL0, async () => {
      expect(uiMaterial.MaterialLevel.EXQUISITE).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ARKUI_API_MaterialLevel_0200
     * @tc.number SUB_ARKUI_API_MaterialLevel_0200
     * @tc.desc   MaterialLevel.GENTLE equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_MaterialLevel_0200', Level.LEVEL0, async () => {
      expect(uiMaterial.MaterialLevel.GENTLE).assertEqual(1);
    });

    /**
     * @tc.name   SUB_ARKUI_API_MaterialLevel_0300
     * @tc.number SUB_ARKUI_API_MaterialLevel_0300
     * @tc.desc   MaterialLevel.SMOOTH equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_MaterialLevel_0300', Level.LEVEL0, async () => {
      expect(uiMaterial.MaterialLevel.SMOOTH).assertEqual(2);
    });

    /**
     * @tc.name   SUB_ARKUI_API_getGlobalMaterialLevel_0100
     * @tc.number SUB_ARKUI_API_getGlobalMaterialLevel_0100
     * @tc.desc   getGlobalMaterialLevel returns a valid MaterialLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_getGlobalMaterialLevel_0100', Level.LEVEL0, async () => {
      let level: uiMaterial.MaterialLevel = uiMaterial.getGlobalMaterialLevel();
      expect(level === uiMaterial.MaterialLevel.EXQUISITE ||
        level === uiMaterial.MaterialLevel.GENTLE ||
        level === uiMaterial.MaterialLevel.SMOOTH).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ARKUI_API_isImmersiveMaterialSupported_0100
     * @tc.number SUB_ARKUI_API_isImmersiveMaterialSupported_0100
     * @tc.desc   isImmersiveMaterialSupported returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_isImmersiveMaterialSupported_0100', Level.LEVEL0, async () => {
      let supported: boolean = uiMaterial.isImmersiveMaterialSupported();
      expect(supported === true || supported === false).assertEqual(true);
    });
  });
}
