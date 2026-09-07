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
 * Fill BD-BJ blank gaps for user_agent related APIs (param-spec: empty/null/undefined).
 * Source: arkts_dynamic_sdk_result.xlsx / 接口覆盖详情 / web / BG blank.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';

function logCode(tag: string, error: Object): void {
  console.info(tag + ' code=' + JSON.parse(JSON.stringify(error))['code']);
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

export default function webUaBlankParamSpec() {
  describe('webUaBlankParamSpec', () => {
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
        try {
          meta.setBrandVersionList(null);
        } catch (error) {
          logCode('setBrandVersionList(null)', error);
        }
        try {
          meta.setBrandVersionList(undefined);
        } catch (error) {
          logCode('setBrandVersionList(undefined)', error);
        }
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
        try {
          meta.setFormFactors(null);
        } catch (error) {
          logCode('setFormFactors(null)', error);
        }
        try {
          meta.setFormFactors(undefined);
        } catch (error) {
          logCode('setFormFactors(undefined)', error);
        }
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
        try {
          meta.setMobile(null);
        } catch (error) {
          logCode('setMobile(null)', error);
        }
        try {
          meta.setMobile(undefined);
        } catch (error) {
          logCode('setMobile(undefined)', error);
        }
        try {
          meta.setWow64(null);
        } catch (error) {
          logCode('setWow64(null)', error);
        }
        try {
          meta.setWow64(undefined);
        } catch (error) {
          logCode('setWow64(undefined)', error);
        }
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
        try {
          webview.WebviewController.setUserAgentClientHintsEnabled(null);
        } catch (error) {
          logCode('setUserAgentClientHintsEnabled(null)', error);
        }
        try {
          webview.WebviewController.setUserAgentClientHintsEnabled(undefined);
        } catch (error) {
          logCode('setUserAgentClientHintsEnabled(undefined)', error);
        }
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
        try {
          ctrl.setUserAgentMetadata('', meta);
        } catch (error) {
          logCode('setUserAgentMetadata("")', error);
        }
        try {
          ctrl.setUserAgentMetadata(null, meta);
        } catch (error) {
          logCode('setUserAgentMetadata(null)', error);
        }
        try {
          ctrl.setUserAgentMetadata(undefined, meta);
        } catch (error) {
          logCode('setUserAgentMetadata(undefined)', error);
        }
        try {
          let got: webview.UserAgentMetadata = ctrl.getUserAgentMetadata('');
          expect(got !== undefined).assertTrue();
        } catch (error) {
          logCode('getUserAgentMetadata("")', error);
        }
        try {
          ctrl.getUserAgentMetadata(null);
        } catch (error) {
          logCode('getUserAgentMetadata(null)', error);
        }
        try {
          ctrl.getUserAgentMetadata(undefined);
        } catch (error) {
          logCode('getUserAgentMetadata(undefined)', error);
        }
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
        try {
          ctrl.setUrlTrustList('', true, true);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
        try {
          ctrl.setUrlTrustList(null, true, false);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
        try {
          ctrl.setUrlTrustList(undefined, false, true);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
        try {
          ctrl.setUrlTrustList(jsonOk, null, false);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
        try {
          ctrl.setUrlTrustList(jsonOk, undefined, true);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
        try {
          ctrl.setUrlTrustList(jsonOk, true, null);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
        try {
          ctrl.setUrlTrustList(jsonOk, false, undefined);
        } catch (error) {
          let code: number = Number(JSON.parse(JSON.stringify(error))['code']);
          expect(code === 401 || code === 17100001).assertTrue();
        }
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
          expect(Number(JSON.parse(JSON.stringify(error))['code'])).assertEqual(17100001);
          hit = true;
        }
        expect(hit).assertTrue();
        done();
      })
  })
}
