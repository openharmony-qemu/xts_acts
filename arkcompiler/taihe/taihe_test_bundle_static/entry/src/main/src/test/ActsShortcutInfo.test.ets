'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import * as test_bundle from '../ets/shortcutInfo'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function shortcutInfoTest(): void {
  describe("ActsShortcutInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0100
     * @tc.name      test_shortcutInfo_id_0001
     * @tc.desc      Test ShortcutInfo id getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_id_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_id_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.id).assertEqual("ShortcutInfo::GetId");
      console.log('test_shortcutInfo_id_0001 done');
      done();
      console.log('test_shortcutInfo_id_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0200
     * @tc.name      test_shortcutInfo_bundleName_0001
     * @tc.desc      Test ShortcutInfo bundleName getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_bundleName_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_bundleName_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.bundleName).assertEqual("ShortcutInfo::GetBundleName");
      console.log('test_shortcutInfo_bundleName_0001 done');
      done();
      console.log('test_shortcutInfo_bundleName_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0300
     * @tc.name      test_shortcutInfo_hostAbility_0001
     * @tc.desc      Test ShortcutInfo hostAbility getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_hostAbility_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_hostAbility_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.hostAbility).assertEqual("ShortcutInfo::GetHostAbility");
      console.log('test_shortcutInfo_hostAbility_0001 done');
      done();
      console.log('test_shortcutInfo_hostAbility_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0400
     * @tc.name      test_shortcutInfo_icon_0001
     * @tc.desc      Test ShortcutInfo icon getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_icon_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_icon_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.icon).assertEqual("ShortcutInfo::GetIcon");
      console.log('test_shortcutInfo_icon_0001 done');
      done();
      console.log('test_shortcutInfo_icon_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0500
     * @tc.name      test_shortcutInfo_iconId_0001
     * @tc.desc      Test ShortcutInfo iconId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_iconId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_iconId_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.iconId).assertEqual(4096);
      console.log('test_shortcutInfo_iconId_0001 done');
      done();
      console.log('test_shortcutInfo_iconId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0600
     * @tc.name      test_shortcutInfo_label_0001
     * @tc.desc      Test ShortcutInfo label getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_label_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_label_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.label).assertEqual("ShortcutInfo::GetLabel");
      console.log('test_shortcutInfo_label_0001 done');
      done();
      console.log('test_shortcutInfo_label_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0700
     * @tc.name      test_shortcutInfo_labelId_0001
     * @tc.desc      Test ShortcutInfo labelId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_labelId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_labelId_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.labelId).assertEqual(4096);
      console.log('test_shortcutInfo_labelId_0001 done');
      done();
      console.log('test_shortcutInfo_labelId_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0800
     * @tc.name      test_shortcutInfo_disableMessage_0001
     * @tc.desc      Test ShortcutInfo disableMessage getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_disableMessage_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_disableMessage_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.disableMessage).assertEqual("ShortcutInfo::GetDisableMessage");
      console.log('test_shortcutInfo_disableMessage_0001 done');
      done();
      console.log('test_shortcutInfo_disableMessage_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_0900
     * @tc.name      test_shortcutInfo_isStatic_0001
     * @tc.desc      Test ShortcutInfo isStatic getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_isStatic_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_isStatic_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.isStatic).assertTrue();
      console.log('test_shortcutInfo_isStatic_0001 done');
      done();
      console.log('test_shortcutInfo_isStatic_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_1000
     * @tc.name      test_shortcutInfo_isHomeShortcut_0001
     * @tc.desc      Test ShortcutInfo isHomeShortcut getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_isHomeShortcut_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_isHomeShortcut_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.isHomeShortcut).assertTrue();
      console.log('test_shortcutInfo_isHomeShortcut_0001 done');
      done();
      console.log('test_shortcutInfo_isHomeShortcut_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ShortcutInfo_Static_1100
     * @tc.name      test_shortcutInfo_isEnabled_0001
     * @tc.desc      Test ShortcutInfo isEnabled getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_shortcutInfo_isEnabled_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_shortcutInfo_isEnabled_0001 start');
      let shortInfo = test_bundle.getShortcutInfo();
      expect(shortInfo.isEnabled).assertTrue();
      console.log('test_shortcutInfo_isEnabled_0001 done');
      done();
      console.log('test_shortcutInfo_isEnabled_0001 end');
    });
  })
}