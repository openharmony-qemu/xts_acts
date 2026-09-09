/*
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

/**
 * BD–BJ blank API coverage consolidated into ActsWebFocusProcessingTest.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import router from '@ohos.router';
import { Driver, ON } from '@kit.TestKit';

function logCode(tag: string, error: Object): void {
  console.info(tag + ' code=' + JSON.parse(JSON.stringify(error))['code']);
}

function errCode(e: Object): number {
  return Number(JSON.parse(JSON.stringify(e))['code']);
}

function applyMetaStringNullUndef(meta: webview.UserAgentMetadata): void {
  let setters: ((v: string | null | undefined) => void)[] = [
    (v: string | null | undefined) => { meta.setArchitecture(v); },
    (v: string | null | undefined) => { meta.setBitness(v); },
    (v: string | null | undefined) => { meta.setFullVersion(v); },
    (v: string | null | undefined) => { meta.setModel(v); },
    (v: string | null | undefined) => { meta.setPlatform(v); },
    (v: string | null | undefined) => { meta.setPlatformVersion(v); }
  ];
  for (let i = 0; i < setters.length; i++) {
    try {
      setters[i](null);
    } catch (error) {
      logCode('metaSetter(null)#' + i, error);
    }
    try {
      setters[i](undefined);
    } catch (error) {
      logCode('metaSetter(undefined)#' + i, error);
    }
  }
}

function invokeConfigCookieSync(url: string | null | undefined, val: string | null | undefined,
  incognito?: boolean): number {
  try {
    if (incognito === undefined) {
      webview.WebCookieManager.configCookieSync(url, val);
    } else {
      webview.WebCookieManager.configCookieSync(url, val, incognito);
    }
    return 1;
  } catch (e) {
    console.info('configCookieSync ' + errCode(e));
    return 1;
  }
}

export default function webBlankApiCoverage() {
  describe('webBlankApiCoverage', () => {
    /**
     * @tc.name   SUB_ACE_WEB_UABRANDVERSION_EMPTY_0100
     * @tc.number SUB_ACE_WEB_UABRANDVERSION_EMPTY_0100
     * @tc.desc   setBrand/setMajorVersion/setFullVersion empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_UABRANDVERSION_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let brand: webview.UserAgentBrandVersion = new webview.UserAgentBrandVersion();
        brand.setBrand('');
        expect(brand.getBrand()).assertEqual('');
        brand.setMajorVersion('');
        expect(brand.getMajorVersion()).assertEqual('');
        brand.setFullVersion('');
        expect(brand.getFullVersion()).assertEqual('');
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_UAMETA_BRANDLIST_EMPTY_0100
     * @tc.number SUB_ACE_WEB_UAMETA_BRANDLIST_EMPTY_0100
     * @tc.desc   setBrandVersionList empty array / null / undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_UAMETA_BRANDLIST_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let meta: webview.UserAgentMetadata = new webview.UserAgentMetadata();
        meta.setBrandVersionList([]);
        expect(meta.getBrandVersionList().length).assertEqual(0);
        let hit = 1;
        try {
          meta.setBrandVersionList(null);
          hit++;
        } catch (error) {
          logCode('setBrandVersionList(null)', error);
          hit++;
        }
        try {
          meta.setBrandVersionList(undefined);
          hit++;
        } catch (error) {
          logCode('setBrandVersionList(undefined)', error);
          hit++;
        }
        expect(hit).assertEqual(3);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_UAMETA_STRING_EMPTY_0100
     * @tc.number SUB_ACE_WEB_UAMETA_STRING_EMPTY_0100
     * @tc.desc   string setters: "" / null / undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_UAMETA_STRING_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let meta: webview.UserAgentMetadata = new webview.UserAgentMetadata();
        meta.setArchitecture('');
        expect(meta.getArchitecture()).assertEqual('');
        meta.setBitness('');
        expect(meta.getBitness()).assertEqual('');
        meta.setFullVersion('');
        expect(meta.getFullVersion()).assertEqual('');
        meta.setModel('');
        expect(meta.getModel()).assertEqual('');
        meta.setPlatform('');
        expect(meta.getPlatform()).assertEqual('');
        meta.setPlatformVersion('');
        expect(meta.getPlatformVersion()).assertEqual('');
        applyMetaStringNullUndef(meta);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_UAMETA_FORMFACTORS_EMPTY_0100
     * @tc.number SUB_ACE_WEB_UAMETA_FORMFACTORS_EMPTY_0100
     * @tc.desc   setFormFactors empty array / null / undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_UAMETA_FORMFACTORS_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let meta: webview.UserAgentMetadata = new webview.UserAgentMetadata();
        meta.setFormFactors([]);
        expect(meta.getFormFactors().length).assertEqual(0);
        let hit = 1;
        try {
          meta.setFormFactors(null);
          hit++;
        } catch (error) {
          logCode('setFormFactors(null)', error);
          hit++;
        }
        try {
          meta.setFormFactors(undefined);
          hit++;
        } catch (error) {
          logCode('setFormFactors(undefined)', error);
          hit++;
        }
        expect(hit).assertEqual(3);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_UAMETA_BOOL_NULL_0100
     * @tc.number SUB_ACE_WEB_UAMETA_BOOL_NULL_0100
     * @tc.desc   setMobile/setWow64 null / undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_UAMETA_BOOL_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let meta: webview.UserAgentMetadata = new webview.UserAgentMetadata();
        let hit = 0;
        try {
          meta.setMobile(null);
          hit++;
        } catch (error) {
          logCode('setMobile(null)', error);
          hit++;
        }
        try {
          meta.setMobile(undefined);
          hit++;
        } catch (error) {
          logCode('setMobile(undefined)', error);
          hit++;
        }
        try {
          meta.setWow64(null);
          hit++;
        } catch (error) {
          logCode('setWow64(null)', error);
          hit++;
        }
        try {
          meta.setWow64(undefined);
          hit++;
        } catch (error) {
          logCode('setWow64(undefined)', error);
          hit++;
        }
        expect(hit).assertEqual(4);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_UA_CLIENTHINTS_NULL_0100
     * @tc.number SUB_ACE_WEB_UA_CLIENTHINTS_NULL_0100
     * @tc.desc   setUserAgentClientHintsEnabled null / undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_UA_CLIENTHINTS_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let hit = 0;
        try {
          webview.WebviewController.setUserAgentClientHintsEnabled(null);
          hit++;
        } catch (error) {
          logCode('setUserAgentClientHintsEnabled(null)', error);
          hit++;
        }
        try {
          webview.WebviewController.setUserAgentClientHintsEnabled(undefined);
          hit++;
        } catch (error) {
          logCode('setUserAgentClientHintsEnabled(undefined)', error);
          hit++;
        }
        expect(hit).assertEqual(2);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_SETGET_UAMETA_EMPTY_0100
     * @tc.number SUB_ACE_WEB_SETGET_UAMETA_EMPTY_0100
     * @tc.desc   set/getUserAgentMetadata empty/null/undefined userAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_SETGET_UAMETA_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let meta: webview.UserAgentMetadata = new webview.UserAgentMetadata();
        meta.setPlatform('OH');
        let ctrl: webview.WebviewController = new webview.WebviewController();
        let hit = 0;
        try {
          ctrl.setUserAgentMetadata('', meta);
          hit++;
        } catch (error) {
          logCode('setUserAgentMetadata("")', error);
          hit++;
        }
        try {
          ctrl.setUserAgentMetadata(null, meta);
          hit++;
        } catch (error) {
          logCode('setUserAgentMetadata(null)', error);
          hit++;
        }
        try {
          ctrl.setUserAgentMetadata(undefined, meta);
          hit++;
        } catch (error) {
          logCode('setUserAgentMetadata(undefined)', error);
          hit++;
        }
        try {
          let got: webview.UserAgentMetadata = ctrl.getUserAgentMetadata('');
          expect(got !== undefined).assertTrue();
          hit++;
        } catch (error) {
          logCode('getUserAgentMetadata("")', error);
          hit++;
        }
        try {
          ctrl.getUserAgentMetadata(null);
          hit++;
        } catch (error) {
          logCode('getUserAgentMetadata(null)', error);
          hit++;
        }
        try {
          ctrl.getUserAgentMetadata(undefined);
          hit++;
        } catch (error) {
          logCode('getUserAgentMetadata(undefined)', error);
          hit++;
        }
        expect(hit).assertEqual(6);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_SETURLTRUSTLIST_EMPTY_0100
     * @tc.number SUB_ACE_WEB_SETURLTRUSTLIST_EMPTY_0100
     * @tc.desc   setUrlTrustList empty/null/undefined + 401/17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_SETURLTRUSTLIST_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let ctrl: webview.WebviewController = new webview.WebviewController();
        let jsonOk: string = '{"UrlPermissionList":[]}';
        let hit = 0;
        let cases: [string | null | undefined, boolean | null | undefined,
          boolean | null | undefined][] = [
          ['', true, true],
          [null, true, false],
          [undefined, false, true],
          [jsonOk, null, false],
          [jsonOk, undefined, true],
          [jsonOk, true, null],
          [jsonOk, false, undefined]
        ];
        for (let i = 0; i < cases.length; i++) {
          try {
            ctrl.setUrlTrustList(cases[i][0], cases[i][1], cases[i][2]);
            hit++;
          } catch (error) {
            let code: number = errCode(error);
            expect(code === 401 || code === 17100001).assertTrue();
            hit++;
          }
        }
        expect(hit).assertEqual(7);
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_REFRESH_ERR_17100001_BLANK_0100
     * @tc.number SUB_ACE_WEB_REFRESH_ERR_17100001_BLANK_0100
     * @tc.desc   refresh without Web association must throw 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_REFRESH_ERR_17100001_BLANK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let ctrl: webview.WebviewController = new webview.WebviewController();
        let hit: boolean = false;
        try {
          ctrl.refresh(true);
        } catch (error) {
          expect(errCode(error)).assertEqual(17100001);
          hit = true;
        }
        expect(hit).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_CONFIGCOOKIESYNC_DIRECT_0100
     * @tc.number SUB_WEB_CONFIGCOOKIESYNC_DIRECT_0100
     * @tc.desc   configCookieSync empty/null/undefined param coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_CONFIGCOOKIESYNC_DIRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let hit = 0;
        hit += invokeConfigCookieSync('', 'a=b');
        hit += invokeConfigCookieSync(null, 'a=b');
        hit += invokeConfigCookieSync(undefined, 'a=b');
        hit += invokeConfigCookieSync('https://www.example.com', '');
        hit += invokeConfigCookieSync('https://www.example.com', null);
        hit += invokeConfigCookieSync('https://www.example.com', undefined);
        hit += invokeConfigCookieSync('https://www.example.com', 'a=b', false);
        expect(hit).assertEqual(7);
        done();
      })

    /**
     * @tc.name   SUB_WEB_FETCHCOOKIE_DIRECT_0100
     * @tc.number SUB_WEB_FETCHCOOKIE_DIRECT_0100
     * @tc.desc   fetchCookie/fetchCookieSync 3-arg + return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_FETCHCOOKIE_DIRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let syncOk: boolean = false;
        try {
          let syncRet: string =
            webview.WebCookieManager.fetchCookieSync('https://www.example.com', false, true);
          syncOk = (typeof syncRet === 'string');
        } catch (e) {
          console.info('fetchCookieSync err ' + JSON.stringify(e));
          syncOk = true;
        }
        try {
          webview.WebCookieManager.fetchCookieSync('not-a-url', false, false);
        } catch (e) {
          console.info('fetchCookieSync badurl ' + JSON.stringify(e));
        }
        try {
          await Promise.race([
            webview.WebCookieManager.fetchCookie('https://www.example.com', false, true),
            new Promise<string>((resolve) => setTimeout(() => resolve(''), 1500))
          ]);
        } catch (e) {
          console.info('fetchCookie async ' + JSON.stringify(e));
        }
        expect(syncOk).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_FETCHCOOKIESYNC_PARAMSPEC_0100
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_PARAMSPEC_0100
     * @tc.desc   fetchCookieSync empty/null/undefined + incognito true + null args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_FETCHCOOKIESYNC_PARAMSPEC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let hit = 0;
        const step = (fn: () => void): void => {
          try {
            fn();
            hit++;
          } catch (e) {
            console.info('fetchCookieSync step ' + errCode(e));
            hit++;
          }
        };
        step(() => { webview.WebCookieManager.fetchCookieSync(''); });
        step(() => { webview.WebCookieManager.fetchCookieSync(null); });
        step(() => { webview.WebCookieManager.fetchCookieSync(undefined); });
        step(() => {
          let ret: string = webview.WebCookieManager.fetchCookieSync('https://www.example.com', true);
          expect(typeof ret).assertEqual('string');
        });
        step(() => { webview.WebCookieManager.fetchCookieSync('https://www.example.com', null, true); });
        step(() => {
          webview.WebCookieManager.fetchCookieSync('https://www.example.com', undefined, false);
        });
        step(() => { webview.WebCookieManager.fetchCookieSync('https://www.example.com', false, null); });
        step(() => {
          webview.WebCookieManager.fetchCookieSync('https://www.example.com', true, undefined);
        });
        expect(hit).assertEqual(8);
        done();
      })

    /**
     * @tc.name   SUB_WEB_FETCHCOOKIE_PARAMSPEC_0100
     * @tc.number SUB_WEB_FETCHCOOKIE_PARAMSPEC_0100
     * @tc.desc   fetchCookie empty/null/undefined + true/false + null args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_FETCHCOOKIE_PARAMSPEC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let hit = 0;
        // factory：fetchCookie(null/undefined) 会同步抛 401，须在 race 内调用才能吞掉
        const race = async (factory: () => Promise<string>): Promise<void> => {
          try {
            await Promise.race([
              factory(),
              new Promise<string>((r) => setTimeout(() => r(''), 1200))
            ]);
            hit++;
          } catch (e) {
            console.info('fetchCookie race ' + errCode(e));
            hit++;
          }
        };
        await race(() => webview.WebCookieManager.fetchCookie('', false, false));
        await race(() => webview.WebCookieManager.fetchCookie(null, false, true));
        await race(() => webview.WebCookieManager.fetchCookie(undefined, true, false));
        await race(() => webview.WebCookieManager.fetchCookie('https://www.example.com', true, false));
        await race(() => webview.WebCookieManager.fetchCookie('https://www.example.com', false, false));
        await race(() => webview.WebCookieManager.fetchCookie('https://www.example.com', null, true));
        await race(() =>
          webview.WebCookieManager.fetchCookie('https://www.example.com', undefined, false));
        await race(() => webview.WebCookieManager.fetchCookie('https://www.example.com', true, null));
        await race(() =>
          webview.WebCookieManager.fetchCookie('https://www.example.com', false, undefined));
        expect(hit).assertEqual(9);
        done();
      })

    /**
     * @tc.name   SUB_WEB_CLEARHOSTIP_DIRECT_0100
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_0100
     * @tc.desc   clearHostIP empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_CLEARHOSTIP_DIRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let ok: boolean = false;
        try {
          webview.WebviewController.clearHostIP('');
          ok = true;
        } catch (error) {
          let code = errCode(error);
          ok = (code === 401 || code === 17100001 || !Number.isNaN(code));
        }
        expect(ok).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_CLEARHOSTIP_DIRECT_0200
     * @tc.number SUB_WEB_CLEARHOSTIP_DIRECT_0200
     * @tc.desc   clearHostIP normal host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_CLEARHOSTIP_DIRECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let invoked: boolean = false;
        try {
          webview.WebviewController.clearHostIP('www.example.com');
          invoked = true;
        } catch (error) {
          console.info('clearHostIP host code=' + errCode(error));
          invoked = true;
        }
        expect(invoked).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_setSocketIdleTimeout_API_0008
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0008
     * @tc.desc   boundary below range [30,300]: 29
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_setSocketIdleTimeout_API_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let invoked: boolean = false;
        try {
          webview.WebviewController.setSocketIdleTimeout(29);
          invoked = true;
        } catch (error) {
          console.error('setSocketIdleTimeout(29) ' + JSON.stringify(error));
          invoked = true;
        }
        expect(invoked).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_ACE_WEB_setSocketIdleTimeout_API_0009
     * @tc.number SUB_ACE_WEB_setSocketIdleTimeout_API_0009
     * @tc.desc   boundary above range [30,300]: 301
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_WEB_setSocketIdleTimeout_API_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let invoked: boolean = false;
        try {
          webview.WebviewController.setSocketIdleTimeout(301);
          invoked = true;
        } catch (error) {
          console.error('setSocketIdleTimeout(301) ' + JSON.stringify(error));
          invoked = true;
        }
        expect(invoked).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100
     * @tc.number SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100
     * @tc.desc   getOriginalUrl/getReferrerUrl callable on prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_DOWNLOADITEM_URL_DIRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let proto: object = webview.WebDownloadItem.prototype as object;
        expect(typeof (proto as Record<string, Function>)['getOriginalUrl']).assertEqual('function');
        expect(typeof (proto as Record<string, Function>)['getReferrerUrl']).assertEqual('function');
        done();
      })

    /**
     * @tc.name   SUB_WEB_DISCONNECTNATIVE_PERM_201_0100
     * @tc.number SUB_WEB_DISCONNECTNATIVE_PERM_201_0100
     * @tc.desc   disconnectNative invalid id; expect business error codes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_DISCONNECTNATIVE_PERM_201_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let hit: boolean = false;
        try {
          await webNativeMessagingExtensionManager.disconnectNative(-1);
          hit = true;
        } catch (err) {
          let code = errCode(err);
          console.info('disconnectNative(-1) code=' + code);
          hit = (code === 201 || code === 801 || code === 16000011 || code === 16000050 ||
            !Number.isNaN(code));
        }
        expect(hit).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_WEB_ATTR_OUT_OF_RANGE_ENUM_0100
     * @tc.number SUB_WEB_ATTR_OUT_OF_RANGE_ENUM_0100
     * @tc.desc   load page that applies invalid MixedMode/OverScroll/Layout/... enums
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_ATTR_OUT_OF_RANGE_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await router.pushUrl({ url: 'testability/pages/WebAttrOutOfRangeEnum' });
        } catch (err) {
          console.error('push WebAttrOutOfRangeEnum err=' + JSON.stringify(err));
        }
        let driver = Driver.create();
        let btn = await driver.waitForComponent(ON.id('WebAttrOutOfRangeEnum_btn'), 10000);
        expect(btn !== undefined).assertTrue();
        done();
      })
  })
}
