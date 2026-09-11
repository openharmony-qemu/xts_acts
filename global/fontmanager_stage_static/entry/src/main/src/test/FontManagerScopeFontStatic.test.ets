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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Context from 'application.Context';

const ERR_INVALID_PARAM: int = 401;
const ERR_FILE_NOT_EXISTS: int = 31100101;
const ERR_FILE_VERIFY_FAIL: int = 31100102;
const ERR_INSTALLED_ALREADY: int = 31100104;
const ERR_SCOPE_FONT_NOT_FOUND: int = 31100112;
const ERR_SCOPE_FONT_REPEATED_REGISTER: int = 31100113;
const ERR_SCOPE_FONT_NOT_REGISTERED: int = 31100115;

const SCOPE_APP = fontManager.FontScope.APP;
const SCOPE_SESSION = fontManager.FontScope.SESSION;

class DummyObserver implements fontManager.FontClientObserver {
  onServiceDied(): void  {}
};

export default function fontManagerScopeFontTest():void {
  describe('FontManagerScopeFontStaticTest', () => {
    let validFontPath: string = "";
    let errorFontPath: string = "";
    let notExistPath: string = "";
    let resContext: Context;

    beforeAll(() => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      resContext = abilityDelegator.getAppContext()
      const cacheDir = resContext.resourceDir;
      validFontPath = `${cacheDir}/TestFont_Sans.ttf`;
      errorFontPath = `${cacheDir}/errorTTF.ttf`;
      notExistPath = `${cacheDir}/not_exist_font.ttf`;
    });
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    const validObserver = new DummyObserver();

    /**
     * @tc.name   test_installScopeFont_static_0300
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_0300
     * @tc.desc   test installScopeFont with empty string url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont('', SCOPE_APP);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_static_0400
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_0400
     * @tc.desc   test installScopeFont with not exist path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(notExistPath, SCOPE_SESSION);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_FILE_NOT_EXISTS);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_static_0600
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_0600
     * @tc.desc   test installScopeFont app scope without observer registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_APP);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_REGISTERED);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_static_0700
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_0700
     * @tc.desc   test installScopeFont with unsupported font file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(errorFontPath, SCOPE_SESSION);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_FILE_VERIFY_FAIL);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_static_0800
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_0800
     * @tc.desc   test installScopeFont duplicate install
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
      } catch (error) {
        expect(false).assertTrue();
      }
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INSTALLED_ALREADY);
      }
      try {
        await fontManager.uninstallScopeFont(validFontPath);
      } catch (e) {}
      done();
    });

    /**
     * @tc.name   test_installScopeFont_static_0900
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_0900
     * @tc.desc   test installScopeFont session scope success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_installScopeFont_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let value = await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
        console.info('test_installScopeFont_static_0900 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        try {
          await fontManager.uninstallScopeFont(validFontPath);
        } catch (e) {}
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_static_1000
     * @tc.number SUB_Global_FontManager_InstallScopeFont_Static_JS_1000
     * @tc.desc   test installScopeFont app scope success with observer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_installScopeFont_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (e) {}
      try {
        let value = await fontManager.installScopeFont(validFontPath, SCOPE_APP);
        console.info('test_installScopeFont_static_1000 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        try {
          await fontManager.uninstallScopeFont(validFontPath);
        } catch (e) {}
        try {
          fontManager.offFontObserver();
        } catch (e) {}
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_static_1300
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_Static_JS_1300
     * @tc.desc   test uninstallScopeFont with empty string url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_uninstallScopeFont_static_1300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.uninstallScopeFont('');
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_static_1400
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_Static_JS_1400
     * @tc.desc   test uninstallScopeFont not installed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_uninstallScopeFont_static_1400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.uninstallScopeFont(notExistPath);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_FOUND);
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_static_1500
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_Static_JS_1500
     * @tc.desc   test uninstallScopeFont success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_uninstallScopeFont_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
      } catch (e) {
        expect(false).assertTrue();
      }
      try {
        let value = await fontManager.uninstallScopeFont(validFontPath);
        console.info('test_uninstallScopeFont_static_1500 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_static_1800
     * @tc.number SUB_Global_FontManager_GetFontScope_Static_JS_1800
     * @tc.desc   test getFontScope not installed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getFontScope_static_1800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await fontManager.getFontScope(notExistPath);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_FOUND);
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_static_1900
     * @tc.number SUB_Global_FontManager_GetFontScope_Static_JS_1900
     * @tc.desc   test getFontScope session scope success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getFontScope_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
      } catch (e) {
        expect(false).assertTrue();
      }
      try {
        let scope = await fontManager.getFontScope(validFontPath);
        expect(scope).assertEqual(SCOPE_SESSION);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        try {
          await fontManager.uninstallScopeFont(validFontPath);
        } catch (e) {}
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_static_2000
     * @tc.number SUB_Global_FontManager_GetFontScope_Static_JS_2000
     * @tc.desc   test getFontScope app scope success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getFontScope_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (e) {}
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_APP);
      } catch (e) {
        expect(false).assertTrue();
      }
      try {
        let scope = await fontManager.getFontScope(validFontPath);
        expect(scope).assertEqual(SCOPE_APP);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        try {
          await fontManager.uninstallScopeFont(validFontPath);
        } catch (e) {}
        try {
          fontManager.offFontObserver();
        } catch (e) {}
      }
      done();
    });

    /**
     * @tc.name   test_onFontObserver_static_2400
     * @tc.number SUB_Global_FontManager_OnFontObserver_Static_JS_2400
     * @tc.desc   test onFontObserver duplicate register
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_onFontObserver_static_2400', Level.LEVEL2, () => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (e) {}
      try {
        fontManager.onFontObserver(validObserver);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_REPEATED_REGISTER);
      } finally {
        try {
          fontManager.offFontObserver();
        } catch (e) {}
      }
    });

    /**
     * @tc.name   test_onFontObserver_static_2500
     * @tc.number SUB_Global_FontManager_OnFontObserver_Static_JS_2500
     * @tc.desc   test onFontObserver success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_onFontObserver_static_2500', Level.LEVEL0, () => {
      try {
        let value = fontManager.onFontObserver(validObserver);
        console.info('test_onFontObserver_static_2500 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        try {
          fontManager.offFontObserver();
        } catch (e) {}
      }
    });

    /**
     * @tc.name   test_offFontObserver_static_2600
     * @tc.number SUB_Global_FontManager_OffFontObserver_Static_JS_2600
     * @tc.desc   test offFontObserver not registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_offFontObserver_static_2600', Level.LEVEL2, () => {
      try {
        fontManager.offFontObserver();
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_REGISTERED);
      }
    });

    /**
     * @tc.name   test_offFontObserver_static_2700
     * @tc.number SUB_Global_FontManager_OffFontObserver_Static_JS_2700
     * @tc.desc   test offFontObserver success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_offFontObserver_static_2700', Level.LEVEL0, () => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (e) {}
      try {
        let value = fontManager.offFontObserver();
        console.info('test_offFontObserver_2700 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_getFontScope_Static_2800
     * @tc.number SUB_Global_FontManager_GetFontScope_Static_JS_2800
     * @tc.desc   test getFontScope with empty url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getFontScope_Static_2800', Level.LEVEL2, async () => {
      try {
        await fontManager.getFontScope('');
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
    });
  });
}
