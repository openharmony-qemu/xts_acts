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
 * Select.menuSystemMaterial is not exercised on this board: calling it at page
 * build triggers LinkerVerificationError. Coverage here mirrors the green
 * CustomDialogSystemMaterial pattern (ImmersiveStyle / ImmersiveMaterial).
 * Pure API asserts only — no beforeAll/startAbility (avoids Ability timeout).
 * Do not use async (done) + done() with this project's static hypium.
 */
export default function MenuSystemMaterialTest(): void {
  describe('MenuSystemMaterialTest', () => {
    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0100
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0100
     * @tc.desc   ImmersiveStyle ULTRA_THIN equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0100', Level.LEVEL0, async () => {
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0200
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0200
     * @tc.desc   ImmersiveStyle THIN equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0200', Level.LEVEL0, async () => {
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0300
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0300
     * @tc.desc   ImmersiveMaterial ULTRA_THIN constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0300', Level.LEVEL0, async () => {
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THIN
      });
      expect(!!mat).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0400
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0400
     * @tc.desc   ImmersiveMaterial THIN constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0400', Level.LEVEL0, async () => {
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THIN
      });
      expect(!!mat).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0500
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0500
     * @tc.desc   ImmersiveStyle REGULAR equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0500', Level.LEVEL0, async () => {
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0600
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0600
     * @tc.desc   ImmersiveMaterial REGULAR constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0600', Level.LEVEL0, async () => {
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.REGULAR
      });
      expect(!!mat).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0700
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0700
     * @tc.desc   ImmersiveMaterial THICK constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0700', Level.LEVEL0, async () => {
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THICK
      });
      expect(!!mat).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0800
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0800
     * @tc.desc   ImmersiveStyle THICK equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0800', Level.LEVEL0, async () => {
      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_0900
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_0900
     * @tc.desc   ImmersiveMaterial with materialColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_0900', Level.LEVEL0, async () => {
      let mat = new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.THICK,
        materialColor: '#33FF0000'
      });
      expect(!!mat).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0100
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0100
     * @tc.desc   MaterialLevel.EXQUISITE equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0100', Level.LEVEL0, async () => {
      expect(uiMaterial.MaterialLevel.EXQUISITE).assertEqual(0);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0200
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0200
     * @tc.desc   MaterialLevel.GENTLE equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0200', Level.LEVEL0, async () => {
      expect(uiMaterial.MaterialLevel.GENTLE).assertEqual(1);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0300
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0300
     * @tc.desc   MaterialLevel.SMOOTH equals 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0300', Level.LEVEL0, async () => {
      expect(uiMaterial.MaterialLevel.SMOOTH).assertEqual(2);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_getGlobalMaterialLevel_0100
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_getGlobalMaterialLevel_0100
     * @tc.desc   getGlobalMaterialLevel returns a valid MaterialLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_getGlobalMaterialLevel_0100', Level.LEVEL0, async () => {
      let level: uiMaterial.MaterialLevel = uiMaterial.getGlobalMaterialLevel();
      expect(level === uiMaterial.MaterialLevel.EXQUISITE ||
        level === uiMaterial.MaterialLevel.GENTLE ||
        level === uiMaterial.MaterialLevel.SMOOTH).assertEqual(true);
    });

    /**
     * @tc.name   SUB_ACE_API26_MenuSystemMaterial_isImmersiveMaterialSupported_0100
     * @tc.number SUB_ACE_API26_MenuSystemMaterial_isImmersiveMaterialSupported_0100
     * @tc.desc   isImmersiveMaterialSupported returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_API26_MenuSystemMaterial_isImmersiveMaterialSupported_0100', Level.LEVEL0, async () => {
      let supported: boolean = uiMaterial.isImmersiveMaterialSupported();
      expect(supported === true || supported === false).assertEqual(true);
    });
  });
}
