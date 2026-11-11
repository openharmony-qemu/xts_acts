'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import fontManager from '@ohos.fontManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { BusinessError } from '@ohos.base';
import Context from 'application.Context';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';

export default function fontManagerStageNoPermissionStaticTest(): void {
  describe('FontManagerStageNoPermissionStaticTest', (): void => {
    console.info('*************start FontManagerStageNoPermissionStaticTest*************');
    let resContext: Context;
    let validFontPath: string = "";

    beforeAll(async () => {
      await UtilsTest.startAbility('ohos.acts.fontManagerNoPermission.static', 'EntryAbility')
      await UtilsTest.msSleep(1000)
      resContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext')!
      const cacheDir = resContext.resourceDir;
      console.info("cacheDir:" + cacheDir);
      validFontPath = `${cacheDir}/TestFont_Sans.ttf`;
    });
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    const validObserver: fontManager.FontClientObserver = {
      onServiceDied: () => {
        console.info('onServiceDied called');
      }
    };

    /**
     * @tc.number  SUB_Global_FontManager_OnFontObserver_Static_JS_0100
     * @tc.name    onFontObserver_noPermission_static_test_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("onFontObserver_noPermission_static_test_0100", Level.LEVEL2, () => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (error) {
        console.info('onFontObserver_noPermission_static_test_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
    })

    /**
     * @tc.number  SUB_Global_FontManager_InstallScopeFont_Static_JS_0100
     * @tc.name    installScopeFont_noPermission_static_test_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("installScopeFont_noPermission_static_test_0100", Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(validFontPath, fontManager.FontScope.SESSION);
      } catch (error) {
        console.info('installScopeFont_noPermission_static_test_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
      done()
    })

    /**
     * @tc.number  SUB_Global_FontManager_UninstallScopeFont_Static_JS_0100
     * @tc.name    uninstallScopeFont_noPermission_static_test_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("uninstallScopeFont_noPermission_static_test_0100", Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.uninstallScopeFont(validFontPath);
      } catch (error) {
        console.info('uninstallScopeFont_noPermission_static_test_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
      done()
    })

    /**
     * @tc.number  SUB_Global_FontManager_GetFontScope_Static_JS_0100
     * @tc.name    getFontScope_noPermission_static_test_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getFontScope_noPermission_static_test_0100", Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.getFontScope(validFontPath);
      } catch (error) {
        console.info('getFontScope_noPermission_static_test_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
      done()
    })

    /**
     * @tc.number  SUB_Global_FontManager_OffFontObserver_Static_JS_0100
     * @tc.name    offFontObserver_noPermission_static_test_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("offFontObserver_noPermission_static_test_0100", Level.LEVEL2, () => {
      try {
        fontManager.offFontObserver();
      } catch (error) {
        console.info('offFontObserver_noPermission_static_test_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
    })

    console.log('*************end FontManagerStageNoPermissionStaticTest*************');
  });
}
