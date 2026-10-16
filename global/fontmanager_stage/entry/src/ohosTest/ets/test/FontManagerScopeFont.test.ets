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

const ERR_INVALID_PARAM = 401;
const ERR_FILE_NOT_EXISTS = 31100101;
const ERR_FILE_VERIFY_FAIL = 31100102;
const ERR_INSTALLED_ALREADY = 31100104;
const ERR_SCOPE_FONT_NOT_FOUND = 31100112;
const ERR_SCOPE_FONT_REPEATED_REGISTER = 31100113;
const ERR_SCOPE_FONT_NOT_REGISTERED = 31100115;

const SCOPE_APP = fontManager.FontScope.APP;
const SCOPE_SESSION = fontManager.FontScope.SESSION;

export default function fontManagerScopeFontTest() {
  describe('FontManagerScopeFontTest', () => {
    let resContext: Context;
    let validFontPath: string;
    let errorFontPath: string;
    let notExistPath: string;

    beforeAll(() => {
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      const cacheDir = resContext.resourceDir;
      validFontPath = `${cacheDir}/TestFont_Sans.ttf`;
      errorFontPath = `${cacheDir}/errorTTF.ttf`;
      notExistPath = `${cacheDir}/not_exist_font.ttf`;
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
     * @tc.name   test_installScopeFont_0100
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0100
     * @tc.desc   test installScopeFont with null url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0100', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(null, SCOPE_APP);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0200
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0200
     * @tc.desc   test installScopeFont with undefined url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0200', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(undefined, SCOPE_APP);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0300
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0300
     * @tc.desc   test installScopeFont with empty string url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0300', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont('', SCOPE_APP);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0400
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0400
     * @tc.desc   test installScopeFont with not exist path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0400', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(notExistPath, SCOPE_SESSION);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_FILE_NOT_EXISTS);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0500
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0500
     * @tc.desc   test installScopeFont with invalid scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0500', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(validFontPath, 2 as fontManager.FontScope);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0600
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0600
     * @tc.desc   test installScopeFont app scope without observer registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0600', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_APP);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_REGISTERED);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0700
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0700
     * @tc.desc   test installScopeFont with unsupported font file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0700', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(errorFontPath, SCOPE_SESSION);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_FILE_VERIFY_FAIL);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_0800
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0800
     * @tc.desc   test installScopeFont duplicate install
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_0800', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   test_installScopeFont_0900
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_0900
     * @tc.desc   test installScopeFont session scope success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_installScopeFont_0900', Level.LEVEL0, async (done: Function) => {
      try {
        let value = await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
        console.info('test_installScopeFont_0900 value:' + value);
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
     * @tc.name   test_installScopeFont_1000
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_1000
     * @tc.desc   test installScopeFont app scope success with observer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_installScopeFont_1000', Level.LEVEL0, async (done: Function) => {
      try {
        fontManager.onFontObserver(validObserver);
      } catch (e) {}
      try {
        let value = await fontManager.installScopeFont(validFontPath, SCOPE_APP);
        console.info('test_installScopeFont_1000 value:' + value);
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
     * @tc.name   test_uninstallScopeFont_1100
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_JS_1100
     * @tc.desc   test uninstallScopeFont with null url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_uninstallScopeFont_1100', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.uninstallScopeFont(null);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_1200
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_JS_1200
     * @tc.desc   test uninstallScopeFont with undefined url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_uninstallScopeFont_1200', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.uninstallScopeFont(undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_1300
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_JS_1300
     * @tc.desc   test uninstallScopeFont with empty string url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_uninstallScopeFont_1300', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.uninstallScopeFont('');
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_1400
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_JS_1400
     * @tc.desc   test uninstallScopeFont not installed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_uninstallScopeFont_1400', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.uninstallScopeFont(notExistPath);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_FOUND);
      }
      done();
    });

    /**
     * @tc.name   test_uninstallScopeFont_1500
     * @tc.number SUB_Global_FontManager_UninstallScopeFont_JS_1500
     * @tc.desc   test uninstallScopeFont success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_uninstallScopeFont_1500', Level.LEVEL0, async (done: Function) => {
      try {
        await fontManager.installScopeFont(validFontPath, SCOPE_SESSION);
      } catch (e) {
        expect(false).assertTrue();
      }
      try {
        let value = await fontManager.uninstallScopeFont(validFontPath);
        console.info('test_uninstallScopeFont_1500 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_1600
     * @tc.number SUB_Global_FontManager_GetFontScope_JS_1600
     * @tc.desc   test getFontScope with null url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getFontScope_1600', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.getFontScope(null);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_1700
     * @tc.number SUB_Global_FontManager_GetFontScope_JS_1700
     * @tc.desc   test getFontScope with undefined url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getFontScope_1700', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.getFontScope(undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_1800
     * @tc.number SUB_Global_FontManager_GetFontScope_JS_1800
     * @tc.desc   test getFontScope not installed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getFontScope_1800', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.getFontScope(notExistPath);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_FOUND);
      }
      done();
    });

    /**
     * @tc.name   test_getFontScope_1900
     * @tc.number SUB_Global_FontManager_GetFontScope_JS_1900
     * @tc.desc   test getFontScope session scope success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getFontScope_1900', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   test_getFontScope_2000
     * @tc.number SUB_Global_FontManager_GetFontScope_JS_2000
     * @tc.desc   test getFontScope app scope success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getFontScope_2000', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   test_onFontObserver_2100
     * @tc.number SUB_Global_FontManager_OnFontObserver_JS_2100
     * @tc.desc   test onFontObserver with null observer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_onFontObserver_2100', Level.LEVEL2, (done: Function) => {
      try {
        fontManager.onFontObserver(null);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_onFontObserver_2200
     * @tc.number SUB_Global_FontManager_OnFontObserver_JS_2200
     * @tc.desc   test onFontObserver with undefined observer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_onFontObserver_2200', Level.LEVEL2, (done: Function) => {
      try {
        fontManager.onFontObserver(undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_onFontObserver_2300
     * @tc.number SUB_Global_FontManager_OnFontObserver_JS_2300
     * @tc.desc   test onFontObserver with empty object observer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_onFontObserver_2300', Level.LEVEL2, (done: Function) => {
      try {
        fontManager.onFontObserver({} as fontManager.FontClientObserver);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_onFontObserver_2400
     * @tc.number SUB_Global_FontManager_OnFontObserver_JS_2400
     * @tc.desc   test onFontObserver duplicate register
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_onFontObserver_2400', Level.LEVEL2, (done: Function) => {
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
      done();
    });

    /**
     * @tc.name   test_onFontObserver_2500
     * @tc.number SUB_Global_FontManager_OnFontObserver_JS_2500
     * @tc.desc   test onFontObserver success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_onFontObserver_2500', Level.LEVEL0, (done: Function) => {
      try {
        let value = fontManager.onFontObserver(validObserver);
        console.info('test_onFontObserver_2500 value:' + value);
        expect(value).assertEqual(undefined);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        try {
          fontManager.offFontObserver();
        } catch (e) {}
      }
      done();
    });

    /**
     * @tc.name   test_offFontObserver_2600
     * @tc.number SUB_Global_FontManager_OffFontObserver_JS_2600
     * @tc.desc   test offFontObserver not registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_offFontObserver_2600', Level.LEVEL2, (done: Function) => {
      try {
        fontManager.offFontObserver();
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_REGISTERED);
      }
      done();
    });

    /**
     * @tc.name   test_offFontObserver_2700
     * @tc.number SUB_Global_FontManager_OffFontObserver_JS_2700
     * @tc.desc   test offFontObserver success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_offFontObserver_2700', Level.LEVEL0, (done: Function) => {
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
      done();
    });

    /**
     * @tc.name   test_getFontScope_2800
     * @tc.number SUB_Global_FontManager_GetFontScope_JS_2800
     * @tc.desc   test getFontScope with empty url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getFontScope_2800', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.getFontScope('');
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_INVALID_PARAM);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_2900
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_2900
     * @tc.desc   test installScopeFont with null second param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_2900', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(validFontPath, null);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_REGISTERED);
      }
      done();
    });

    /**
     * @tc.name   test_installScopeFont_3000
     * @tc.number SUB_Global_FontManager_InstallScopeFont_JS_3000
     * @tc.desc   test installScopeFont with undefined second param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_installScopeFont_3000', Level.LEVEL2, async (done: Function) => {
      try {
        await fontManager.installScopeFont(validFontPath, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(ERR_SCOPE_FONT_NOT_REGISTERED);
      }
      done();
    });

    /**
     * @tc.name   test_onServiceDied_3100
     * @tc.number SUB_Global_FontManager_OnServiceDied_JS_3100
     * @tc.desc   test onServiceDied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_onServiceDied_3100', Level.LEVEL2, () => {
      let value = validObserver.onServiceDied();
      expect(value).assertEqual(undefined);
    });

  });
}
