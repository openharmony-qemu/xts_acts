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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { BusinessError } from '@ohos.base';
import { GlobalContext } from './global';
export default function fontManagerNoPermissionTest() {
  describe('FontManagerNoPermissionTest', () => {
    console.info('*************start FontManagerNoPermissionTest*************');
    let resContext: Context;

    beforeAll(() => {
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
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
     * @tc.number  SUB_Global_FontManager_OnFontObserver_JS_0100
     * @tc.name    test_onFontObserver_noPermission_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("test_onFontObserver_noPermission_0100", Level.LEVEL2, () => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (error) {
        console.info('test_onFontObserver_noPermission_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
    })

    /**
     * @tc.number  SUB_Global_FontManager_InstallScopeFont_JS_0100
     * @tc.name    test_installScopeFont_noPermission_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("test_installScopeFont_noPermission_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(resContext.resourceDir + '/' + 'TestFont_Sans.ttf', 1);
      } catch (error) {
        console.info('test_installScopeFont_noPermission_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
      done()
    })

    /**
     * @tc.number  SUB_Global_FontManager_UninstallScopeFont_JS_0100
     * @tc.name    test_uninstallScopeFont_noPermission_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("test_uninstallScopeFont_noPermission_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.uninstallScopeFont(resContext.resourceDir + '/' + 'TestFont_Sans.ttf');
      } catch (error) {
        console.info('test_uninstallScopeFont_noPermission_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
      done()
    })

    /**
     * @tc.number  SUB_Global_FontManager_GetFontScope_JS_0100
     * @tc.name    test_getFontScope_noPermission_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("test_getFontScope_noPermission_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.getFontScope(resContext.resourceDir + '/' + 'TestFont_Sans.ttf');
      } catch (error) {
        console.info('test_getFontScope_noPermission_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
      done()
    })

    /**
     * @tc.number  SUB_Global_FontManager_OffFontObserver_JS_0100
     * @tc.name    test_offFontObserver_noPermission_0100
     * @tc.desc    no permission
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("test_offFontObserver_noPermission_0100", Level.LEVEL2, () => {
      try {
        fontManager.offFontObserver();
      } catch (error) {
        console.info('test_offFontObserver_noPermission_0100 error code: ' + (error as BusinessError).code);
        expect((error as BusinessError).code).assertEqual(201);
      }
    })

    console.log('*************end FontManagerNoPermissionTest*************');
  });
}
