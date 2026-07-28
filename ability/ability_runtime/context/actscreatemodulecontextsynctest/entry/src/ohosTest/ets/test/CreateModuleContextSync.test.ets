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

import { describe, it, expect, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application';
import { BusinessError } from '@ohos.base';

const ERR_INVALID_PARAM = 401;
const ERR_CONTEXT_NOT_EXIST = 16000011;
const ERR_MODULE_NOT_EXIST = 16000021;
const BUNDLE_NAME = 'com.example.createmodulecontexttest';

export default function actsCreateModuleContextSyncTest() {
  describe("CreateModuleContextSync", () => {
    let moduleContext: common.Context | null;

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0100
     * @tc.number SUB_AA_CreateModuleContextSync_0100
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0100", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0100 begin");
      moduleContext = application.createModuleContextSync(
        globalThis.abilityContext, "entry_test");
      let bundleName = moduleContext!.applicationInfo.name;
      expect(bundleName).assertEqual(BUNDLE_NAME);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0200
     * @tc.number SUB_AA_CreateModuleContextSync_0200
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0200", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0200 begin");
      moduleContext = application.createModuleContextSync(
        globalThis.abilityContext, "feature");
      let bundleName = moduleContext!.applicationInfo.name;
      expect(bundleName).assertEqual(BUNDLE_NAME);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0300
     * @tc.number SUB_AA_CreateModuleContextSync_0300
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0300", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0300 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityContext, "entry_assist");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0400
     * @tc.number SUB_AA_CreateModuleContextSync_0400
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0400", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0400 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityContext, "abc");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0500
     * @tc.number SUB_AA_CreateModuleContextSync_0500
     * @tc.desc   Verify that createModuleContextSync throws 401 when moduleName is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0500", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0500 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityContext, undefined);
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_INVALID_PARAM);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0600
     * @tc.number SUB_AA_CreateModuleContextSync_0600
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0600", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0600 begin");
      moduleContext = application.createModuleContextSync(
        globalThis.abilityStageContext, "entry_test");
      let bundleName = moduleContext!.applicationInfo.name;
      expect(bundleName).assertEqual(BUNDLE_NAME);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0700
     * @tc.number SUB_AA_CreateModuleContextSync_0700
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0700", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0700 begin");
      moduleContext = application.createModuleContextSync(
        globalThis.abilityStageContext, "feature");
      let bundleName = moduleContext!.applicationInfo.name;
      expect(bundleName).assertEqual(BUNDLE_NAME);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0800
     * @tc.number SUB_AA_CreateModuleContextSync_0800
     * @tc.desc   Verify that createModuleContextSync throws 16000021 when module does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0800", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0800 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityStageContext, "entry_assist");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_0900
     * @tc.number SUB_AA_CreateModuleContextSync_0900
     * @tc.desc   Verify that createModuleContextSync throws 16000021 when module does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_0900", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_0900 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityStageContext, "createmodue");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_1000
     * @tc.number SUB_AA_CreateModuleContextSync_1000
     * @tc.desc   Verify that createModuleContextSync throws 401 when moduleName is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_1000", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_1000 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityStageContext, undefined);
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_INVALID_PARAM);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_1100
     * @tc.number SUB_AA_CreateModuleContextSync_1100
     * @tc.desc   Verify that createModuleContextSync throws 401 when context is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_1100", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_1100 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          null, "entry_test");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_INVALID_PARAM);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_1200
     * @tc.number SUB_AA_CreateModuleContextSync_1200
     * @tc.desc   Verify that createModuleContextSync throws 16000011 when context does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_1200", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_1200 begin");
      moduleContext = null;
      let fakeContext = { stageMode: true } as common.Context;
      try {
        moduleContext = application.createModuleContextSync(
          fakeContext, "entry_test");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_CONTEXT_NOT_EXIST);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContextSync_1300
     * @tc.number SUB_AA_CreateModuleContextSync_1300
     * @tc.desc   Verify that createModuleContextSync throws 16000021 when moduleName is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContextSync_1300", Level.LEVEL0, (done:Function) => {
      console.info("SUB_AA_CreateModuleContextSync_1300 begin");
      moduleContext = null;
      try {
        moduleContext = application.createModuleContextSync(
          globalThis.abilityContext, "");
        expect().assertFail();
      } catch (err) {
        let e = err as BusinessError;
        console.debug("====>e====>" + JSON.stringify(e));
        expect(e.code).assertEqual(ERR_MODULE_NOT_EXIST);
      }
      expect(moduleContext).assertEqual(null);
      done();
    });
  });
}
