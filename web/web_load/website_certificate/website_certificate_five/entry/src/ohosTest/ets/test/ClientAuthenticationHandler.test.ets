/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, expect, it, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202512;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ClientAuthenticationHandlerTest() {
  describe('ClientAuthenticationHandlerTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/clientAuthenticationHandler"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get clientAuthenticationHandler state success " + JSON.stringify(pages));
        if (!("clientAuthenticationHandler" == pages.name)) {
          console.info("get clientAuthenticationHandler state success " + JSON.stringify(pages.name));
          await router.push(options);
          console.info("push clientAuthenticationHandler page success");
        }
      } catch (err) {
        console.error("push clientAuthenticationHandler page error: " + err);
      }
      await driver.waitForComponent(ON.id("clientAuthenticationHandlerButton"), 10000);
      console.log("waitForComponent clientAuthenticationHandlerButton");
      done()
    });

    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("clientAuthenticationHandler beforeEach start");
      done();
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmType001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_API_001
     * @tc.desc   test clientAuthenticationHandler confirm string wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmType001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmType001', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmType001', 1, 25121101, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerButton', 10, '');
    })

    /**
     * @tc.name   testClientAuthenticationHandlerConfirmType002
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_API_002
     * @tc.desc   test clientAuthenticationHandler confirm CredentialType 2 wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmType002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmType002', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmType001', 1, 25121102, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmType003
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_API_003
     * @tc.desc   test clientAuthenticationHandler confirm CredentialType 3 wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmType003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmType003', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmType003', 1, 25121103, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmType004
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_API_004
     * @tc.desc   test clientAuthenticationHandler confirm CredentialType 4 wrong ssl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmType004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent('emitClientAuthenticationHandlerConfirmType004', EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent('testClientAuthenticationHandlerConfirmType004', true, 25121104, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('clientAuthenticationHandlerButton', 10, '');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmTypeEnum001
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_ENUM_API_001
     * @tc.desc   test clientAuthenticationHandler CredentialType CREDENTIAL_USER 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmTypeEnum001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  () =>{
      try {
        console.log('testClientAuthenticationHandlerConfirmTypeEnum001 start');
        expect(CredentialType.CREDENTIAL_USER).assertEqual(2);
      } catch (error) {
        console.log('testClientAuthenticationHandlerConfirmTypeEnum001 error==>' + error.toString());
        expect(false).assertTrue();
      }
      console.log('testClientAuthenticationHandlerConfirmTypeEnum001 end');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmTypeEnum002
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_ENUM_API_002
     * @tc.desc   test clientAuthenticationHandler CredentialType CREDENTIAL_APP 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmTypeEnum002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  () =>{
      try {
        console.log('testClientAuthenticationHandlerConfirmTypeEnum002 start');
        expect(CredentialType.CREDENTIAL_APP).assertEqual(3);
      } catch (error) {
        console.log('testClientAuthenticationHandlerConfirmTypeEnum002 error==>' + error.toString());
        expect(false).assertTrue();
      }
      console.log('testClientAuthenticationHandlerConfirmTypeEnum002 end');
    })
    /**
     * @tc.name   testClientAuthenticationHandlerConfirmTypeEnum003
     * @tc.number SUB_ACE_WEB_CLIENTAUTHTICATIONHANDLERCONFIRM_CREDENTIALTYPE_ENUM_API_003
     * @tc.desc   test clientAuthenticationHandler CredentialType CREDENTIAL_UKEY 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClientAuthenticationHandlerConfirmTypeEnum003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  () =>{
      try {
        console.log('testClientAuthenticationHandlerConfirmTypeEnum003 start');
        expect(CredentialType.CREDENTIAL_UKEY).assertEqual(4);
      } catch (error) {
        console.log('testClientAuthenticationHandlerConfirmTypeEnum003 error==>' + error.toString());
        expect(false).assertTrue();
      }
      console.log('testClientAuthenticationHandlerConfirmTypeEnum003 end');
    })

  })
}