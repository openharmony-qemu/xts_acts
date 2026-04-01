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

'use static';

import { describe, it, expect, Level, beforeAll } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';

export default function CommonMethodStylesTest(): void {
  describe('CommonMethodStylesTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.commonMethodStyles.api24.static', 'EntryAbility');
    });

    const openCommonMethodProbe = async (): Promise<void> => {
      let ro: router.RouterOptions = { url: 'MainAbility/pages/CommonMethodApiProbe/CommonMethodApiProbe' };
      let r = AppStorage.get<Router>('router') as Router;
      r.clear();
      r.replaceUrl(ro);
      await Utils.sleep(700);
    };

    /**
     * @tc.number CommonMethodStylesTest_001
     * @tc.name SUB_ArkUI_Common_CommonMethod_Background_3200
     * @tc.desc CommonMethod.background：AttributeModifier.applyNormalAttribute 内真实调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_CommonMethod_Background_3200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await openCommonMethodProbe();
      expect(AppStorage.get<string>('cm_probe_chain')).assertEqual('1');
      done();
    });

    /**
     * @tc.number CommonMethodStylesTest_002
     * @tc.name SUB_ArkUI_Common_CommonMethod_EnableClickSoundEffect_3300
     * @tc.desc CommonMethod.enableClickSoundEffect：同上探测链
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_CommonMethod_EnableClickSoundEffect_3300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await openCommonMethodProbe();
      expect(AppStorage.get<string>('cm_probe_chain')).assertEqual('1');
      done();
    });

    /**
     * @tc.number CommonMethodStylesTest_003
     * @tc.name SUB_ArkUI_Common_CommonMethod_OnDragSpringLoading_3400
     * @tc.desc CommonMethod.onDragSpringLoading：同上
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_CommonMethod_OnDragSpringLoading_3400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await openCommonMethodProbe();
      expect(AppStorage.get<string>('cm_probe_chain')).assertEqual('1');
      done();
    });

    /**
     * @tc.number CommonMethodStylesTest_004
     * @tc.name SUB_ArkUI_Common_CommonMethod_OnNeedSoftkeyboard_3500
     * @tc.desc CommonMethod.onNeedSoftkeyboard：同上
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_CommonMethod_OnNeedSoftkeyboard_3500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await openCommonMethodProbe();
      expect(AppStorage.get<string>('cm_probe_chain')).assertEqual('1');
      done();
    });

    /**
     * @tc.number CommonMethodStylesTest_005
     * @tc.name SUB_ArkUI_Common_CommonMethod_DebugLine_3600
     * @tc.desc CommonMethod.debugLine：同上
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_CommonMethod_DebugLine_3600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await openCommonMethodProbe();
      expect(AppStorage.get<string>('cm_probe_chain')).assertEqual('1');
      done();
    });

    /**
     * @tc.number CommonMethodStylesTest_006
     * @tc.name SUB_ArkUI_Common_CommonMethod_OnDragSpringLoading_Null_3700
     * @tc.desc CommonMethod.onDragSpringLoading(null, …)：单独 Modifier 页或拆分（此处与 3400 共用真实链，占位编号保留）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Common_CommonMethod_OnDragSpringLoading_Null_3700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await openCommonMethodProbe();
      expect(AppStorage.get<string>('cm_probe_null_spring')).assertEqual('1');
      done();
    });
  });
}
