'use static';
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


import { describe, beforeAll, beforeEach, afterEach, it, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  assertPropSame, assertChildrenSame, assertSystemMaterialSame, assertSmoke,
} from '../common/AbnormalAssertHelper';
import { ensureAbnormalPage } from '../common/AbnormalPageRouter';

export default function ChipV2AbnormalOptionsTest(): void {
  describe('ChipV2AbnormalOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      await CommonFunc.sleep(300);
    });

    afterEach(async () => {
      await CommonFunc.sleep(300);
    });



    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_PREFIXICON_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_PREFIXICON_UNDEFINED_0100
     * @tc.desc   prefixIcon undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_PREFIXICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_prefixIcon_u');
      assertChildrenSame('abn_prefixIcon_u', 'abn_prefixIcon_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_SUFFIXICON_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_SUFFIXICON_UNDEFINED_0100
     * @tc.desc   suffixIcon undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_SUFFIXICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_suffixIcon_u');
      assertChildrenSame('abn_suffixIcon_u', 'abn_suffixIcon_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ALLOWCLOSE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ALLOWCLOSE_UNDEFINED_0100
     * @tc.desc   allowClose undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ALLOWCLOSE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_allowClose_u');
      assertChildrenSame('abn_allowClose_u', 'abn_allowClose_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_CLOSEICON_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_CLOSEICON_UNDEFINED_0100
     * @tc.desc   closeIcon undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_CLOSEICON_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_closeIcon_u');
      assertChildrenSame('abn_closeIcon_u', 'abn_closeIcon_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ENABLED_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ENABLED_UNDEFINED_0100
     * @tc.desc   enabled undefined 与默认 enabled 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ENABLED_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_enabled_u');
      assertPropSame('abn_enabled_u', 'abn_enabled_d', 'enabled', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ACTIVATED_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ACTIVATED_UNDEFINED_0100
     * @tc.desc   activated undefined 冒烟（Inspector 无对应字段）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ACTIVATED_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_activated_u');
      assertSmoke('abn_activated_u', 'abn_activated_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_BACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_BACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   backgroundColor undefined 与默认 backgroundColor 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_BACKGROUNDCOLOR_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_backgroundColor_u');
      assertPropSame('abn_backgroundColor_u', 'abn_backgroundColor_d', 'backgroundColor', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ACTIVATEDBGCOLOR_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ACTIVATEDBGCOLOR_UNDEFINED_0100
     * @tc.desc   activatedBgColor undefined 与默认 backgroundColor 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ACTIVATEDBGCOLOR_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_activatedBgColor_u');
      assertPropSame('abn_activatedBgColor_u', 'abn_activatedBgColor_d', 'backgroundColor', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_BORDERRADIUS_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_BORDERRADIUS_UNDEFINED_0100
     * @tc.desc   borderRadius undefined 与默认 borderRadius 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_BORDERRADIUS_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_borderRadius_u');
      assertPropSame('abn_borderRadius_u', 'abn_borderRadius_d', 'borderRadius', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_SIZE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_SIZE_UNDEFINED_0100
     * @tc.desc   size undefined 与默认 size 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_SIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_size_u');
      assertPropSame('abn_size_u', 'abn_size_d', 'size', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_DIRECTION_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_DIRECTION_UNDEFINED_0100
     * @tc.desc   direction undefined 与默认 direction 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_DIRECTION_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_direction_u');
      assertPropSame('abn_direction_u', 'abn_direction_d', 'direction', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_A11YDESC_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_A11YDESC_UNDEFINED_0100
     * @tc.desc   a11yDesc undefined 与默认 accessibilityDescription 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_A11YDESC_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_a11yDesc_u');
      assertPropSame('abn_a11yDesc_u', 'abn_a11yDesc_d', 'accessibilityDescription', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_A11YLEVEL_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_A11YLEVEL_UNDEFINED_0100
     * @tc.desc   a11yLevel undefined 与默认 accessibilityLevel 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_A11YLEVEL_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_a11yLevel_u');
      assertPropSame('abn_a11yLevel_u', 'abn_a11yLevel_d', 'accessibilityLevel', 'root');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_A11YSELTYPE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_A11YSELTYPE_UNDEFINED_0100
     * @tc.desc   a11ySelType undefined 冒烟（Inspector 无对应字段）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_A11YSELTYPE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_a11ySelType_u');
      assertSmoke('abn_a11ySelType_u', 'abn_a11ySelType_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_MAXFONTSCALE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_MAXFONTSCALE_UNDEFINED_0100
     * @tc.desc   maxFontScale undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_MAXFONTSCALE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_maxFontScale_u');
      assertChildrenSame('abn_maxFontScale_u', 'abn_maxFontScale_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_MINFONTSCALE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_MINFONTSCALE_UNDEFINED_0100
     * @tc.desc   minFontScale undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_MINFONTSCALE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_minFontScale_u');
      assertChildrenSame('abn_minFontScale_u', 'abn_minFontScale_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_PADDING_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_PADDING_UNDEFINED_0100
     * @tc.desc   padding undefined 与默认 padding 属性值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_PADDING_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_padding_u');
      assertPropSame('abn_padding_u', 'abn_padding_d', 'padding', 'inner');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_FONTSIZE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_FONTSIZE_UNDEFINED_0100
     * @tc.desc   fontSize undefined 等价默认：子树结构一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_FONTSIZE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_fontSize_u');
      assertChildrenSame('abn_fontSize_u', 'abn_fontSize_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ACTBGSYSMATERIAL_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ACTBGSYSMATERIAL_UNDEFINED_0100
     * @tc.desc   activatedBackgroundSystemMaterial undefined 与默认 systemMaterial 一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ACTBGSYSMATERIAL_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_actBgSysMaterial_u');
      assertSystemMaterialSame('abn_actBgSysMaterial_u', 'abn_actBgSysMaterial_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ONCLOSE_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ONCLOSE_UNDEFINED_0100
     * @tc.desc   onClose undefined 冒烟（Inspector 无对应字段）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ONCLOSE_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_onClose_u');
      assertSmoke('abn_onClose_u', 'abn_onClose_d');
    });

    /**
     * @tc.name   SUB_ARKUI_CHIPV2_ABN_ONCLICKED_UNDEFINED_0100
     * @tc.number SUB_ARKUI_CHIPV2_ABN_ONCLICKED_UNDEFINED_0100
     * @tc.desc   onClicked undefined 冒烟（Inspector 无对应字段）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CHIPV2_ABN_ONCLICKED_UNDEFINED_0100', Level.LEVEL0, async () => {
      await ensureAbnormalPage('abn_onClicked_u');
      assertSmoke('abn_onClicked_u', 'abn_onClicked_d');
    });
  });
}
