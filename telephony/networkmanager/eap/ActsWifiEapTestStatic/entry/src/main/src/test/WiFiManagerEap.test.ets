'use static';
/*
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

import eap from '@ohos.net.eap';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'wifiManagerEapTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function wifiEapTest(): void {
  let eapBufferArr = new Uint8Array(5);
  eapBufferArr[0] = 1;
  eapBufferArr[1] = 2;
  eapBufferArr[2] = 3;
  eapBufferArr[3] = 4;
  eapBufferArr[4] = 5;
  const eapData: eap.EapData = {
    msgId: 1,
    eapBuffer: eapBufferArr,
    bufferLen: 5
  }
  describe('wifiEapTest', () => {
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll called');
      done();
    })
    beforeEach(() => {
      hilog.info(domain, tag, 'beforeEach called');
    })
    afterEach(() => {
      hilog.info(domain, tag, 'afterEach called');
    })
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll called');
      done();
    })

    /**
     * @tc.name   SUB_Communication_Netmanager_Eap_js_static_0100
     * @tc.number SUB_Communication_Netmanager_Eapjs_0100
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_js_static_0100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const validNetType = 1;
          const validEapCode = 1;
          const validEapType = 1;
          let getEapData = (eapData: eap.EapData): void => {
            hilog.info(domain, tag,
              "SUB_Communication_Netmanager_Eap_js_static_0100 callback eapData : " + JSON.stringify(eapData));
            setTimeout(() => {
              try {
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0100 callback replyCustom");
                eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
                hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0100 replyCustomEapData success");
              } catch (error) {
                hilog.info(domain, tag,
                  "SUB_Communication_Netmanager_Eap_js_static_0100 replyCustomEapData failed : " + error);
              }
            }, 1 * 1000);
          }
          eap.regCustomEapHandler(validNetType, validEapCode, validEapType, getEapData);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0100 regCustomEapHandler success");
          expect(true).assertTrue();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_js_static_0100 regCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200006) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register invalid NetType`);
            expect().assertFail();
          } else if (error.code === 33200007) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register invalid EapCode`);
            expect().assertFail();
          } else if (error.code === 33200008) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register invalid EapType`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0100 eap register undefined errorcode`);
            expect().assertFail();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_Communication_Netmanager_Eap_js_static_0200
     * @tc.number SUB_Communication_Netmanager_Eapjs_0200
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_js_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const validNetType: int = 1;
        const validEapCode: int = 1;
        const validEapType: int = 1;
        const unregisterAndFinish = () => {
          try {
            hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 unregCustomEapHandler start");
            eap.unregCustomEapHandler(validNetType, validEapCode, validEapType, (eapData: eap.EapData): void => {
              hilog.info(domain, tag,
                "SUB_Communication_Netmanager_Eap_js_static_0200 callback eapData : " + JSON.stringify(eapData));
              setTimeout(() => {
                try {
                  hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 callback replyCustom");
                  eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH, eapData);
                  hilog.info(domain, tag,
                    "SUB_Communication_Netmanager_Eap_js_static_0200 replyCustomEapData success");
                } catch (error) {
                  hilog.info(domain, tag,
                    "SUB_Communication_Netmanager_Eap_js_static_0200 replyCustomEapData failed : " + error);
                }
              }, 1 * 1000);
            })
            hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 unregCustomEapHandler success");
            expect(true).assertTrue();
          } catch (error) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0200 unregCustomEapHandler failed,code is ${error.code}, message is ${error.message}`);
            if (error.code === 201) {
              hilog.info(domain, tag,
                `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister permission denied`);
              expect(true).assertTrue();
            } else if (error.code === 33200006) {
              hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister invalid NetType`);
              expect().assertFail();
            } else if (error.code === 33200007) {
              hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister invalid EapCode`);
              expect().assertFail();
            } else if (error.code === 33200008) {
              hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister invalid EapType`);
              expect().assertFail();
            } else if (error.code === 33200009) {
              hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister netmanager stop`);
              expect(true).assertTrue();
            } else if (error.code === 33200099) {
              hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister internal error`);
              expect(true).assertTrue();
            } else {
              hilog.info(domain, tag,
                `SUB_Communication_Netmanager_Eap_js_static_0200 eap unregister undefined errorcode`);
              expect().assertFail();
            }
          } finally {
            done();
          }
        }
        let getEapData = (eapData: eap.EapData): void => {
          hilog.info(domain, tag,
            "SUB_Communication_Netmanager_Eap_js_static_0200 callback eapData : " + JSON.stringify(eapData));
          setTimeout(() => {
            try {
              hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 callback replyCustom");
              eap.replyCustomEapData(eap.CustomResult.RESULT_FINISH, eapData);
              hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 replyCustomEapData success");
              hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 regCustomEapHandler success");
            } catch (error) {
              hilog.info(domain, tag,
                "SUB_Communication_Netmanager_Eap_js_static_0200 replyCustomEapData failed : " + `code:${JSON.stringify(error?.code)}` + `message:${JSON.stringify(error?.message)}`);
            } finally {
              unregisterAndFinish();
              done();
            }
          }, 1 * 1000);
        }
        try {
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 regCustomEapHandler start");
          eap.regCustomEapHandler(validNetType, validEapCode, validEapType, getEapData);
        } catch(err) {
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0200 regCustomEapHandler fail" + `code:${JSON.stringify(err?.code)}` + `message:${JSON.stringify(err?.message)}`);
          done();
        }
      })

    /**
     * @tc.name   SUB_Communication_Netmanager_Eap_js_static_0300
     * @tc.number SUB_Communication_Netmanager_Eapjs_0300
     * @tc.desc   Test eap register api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_js_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0300 replyCustomEapData start");
          eap.replyCustomEapData(eap.CustomResult.RESULT_FAIL, eapData)
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0300 replyCustomEapData success");
          expect(true).assertTrue();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_js_static_0300 replyCustomEapData failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0300 eap replyCustomEapData permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200004) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0300 eap replyCustomEapData invalid result`);
            expect(true).assertTrue();
          } else if (error.code === 33200005) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0300 eap replyCustomEapData invalid size of eap data`);
            expect(true).assertTrue();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0300 eap replyCustomEapData netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0300 eap replyCustomEapData internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0300 eap replyCustomEapData undefined errorcode`);
            expect().assertFail();
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.name   SUB_Communication_Netmanager_Eap_js_static_0400
     * @tc.number SUB_Communication_Netmanager_Eapjs_0400
     * @tc.desc   Test eap unregister api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_js_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          // 1. 测试EapData接口（通过创建实例验证结构）
          let eapBuffer = new Uint8Array(2);
          eapBuffer[0] = 0x01;
          eapBuffer[1] = 0x02;
          const testEapData: eap.EapData = {
            msgId: 1,
            eapBuffer: eapBuffer,
            bufferLen: 2
          };
          hilog.info(domain, tag, `[eap_test] EapData.msgId: ${testEapData.msgId},type:` + (typeof testEapData.msgId));
          hilog.info(domain, tag, `[eap_test] EapData.eapBuffer length: ${testEapData.eapBuffer.length}`);
          hilog.info(domain, tag,
            `[eap_test] EapData.bufferLen: ${testEapData.bufferLen},type:` + (typeof testEapData.bufferLen));
          // 验证接口属性类型
          expect(typeof testEapData.msgId).assertEqual('int');
          expect(testEapData.eapBuffer instanceof Uint8Array).assertTrue();
          expect(typeof testEapData.bufferLen).assertEqual('int');

          // 2. 测试CustomResult枚举
          hilog.info(domain, tag, `[eap_test] CustomResult.RESULT_FAIL: ${eap.CustomResult.RESULT_FAIL}`);
          hilog.info(domain, tag, `[eap_test] CustomResult.RESULT_NEXT: ${eap.CustomResult.RESULT_NEXT}`);
          hilog.info(domain, tag, `[eap_test] CustomResult.RESULT_FINISH: ${eap.CustomResult.RESULT_FINISH}`);
          // 验证枚举成员存在性和类型
          expect(eap.CustomResult.RESULT_FAIL).assertEqual(0);
          expect(eap.CustomResult.RESULT_NEXT).assertEqual(1);
          expect(eap.CustomResult.RESULT_FINISH).assertEqual(2);
          expect(typeof eap.CustomResult.RESULT_FINISH).assertEqual('int');

          // 3. 测试EapMethod枚举
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_NONE: ${eap.EapMethod.EAP_NONE}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_PEAP: ${eap.EapMethod.EAP_PEAP}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_TLS: ${eap.EapMethod.EAP_TLS}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_TTLS: ${eap.EapMethod.EAP_TTLS}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_PWD: ${eap.EapMethod.EAP_PWD}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_SIM: ${eap.EapMethod.EAP_SIM}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_AKA: ${eap.EapMethod.EAP_AKA}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_AKA_PRIME: ${eap.EapMethod.EAP_AKA_PRIME}`);
          hilog.info(domain, tag, `[eap_test] EapMethod.EAP_UNAUTH_TLS: ${eap.EapMethod.EAP_UNAUTH_TLS}`);
          // ... 其他EapMethod成员
          expect(eap.EapMethod.EAP_NONE).assertEqual(0);
          expect(eap.EapMethod.EAP_PEAP).assertEqual(1);
          expect(eap.EapMethod.EAP_TLS).assertEqual(2);
          expect(eap.EapMethod.EAP_TTLS).assertEqual(3);
          expect(eap.EapMethod.EAP_PWD).assertEqual(4);
          expect(eap.EapMethod.EAP_SIM).assertEqual(5);
          expect(eap.EapMethod.EAP_AKA).assertEqual(6);
          expect(eap.EapMethod.EAP_AKA_PRIME).assertEqual(7);
          expect(eap.EapMethod.EAP_UNAUTH_TLS).assertEqual(8);

          // 4. 测试Phase2Method枚举
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_NONE: ${eap.Phase2Method.PHASE2_NONE}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_PAP: ${eap.Phase2Method.PHASE2_PAP}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_MSCHAP: ${eap.Phase2Method.PHASE2_MSCHAP}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_MSCHAPV2: ${eap.Phase2Method.PHASE2_MSCHAPV2}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_GTC: ${eap.Phase2Method.PHASE2_GTC}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_SIM: ${eap.Phase2Method.PHASE2_SIM}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_AKA: ${eap.Phase2Method.PHASE2_AKA}`);
          hilog.info(domain, tag, `[eap_test] Phase2Method.PHASE2_AKA_PRIME: ${eap.Phase2Method.PHASE2_AKA_PRIME}`);
          // ... 其他Phase2Method成员
          expect(eap.Phase2Method.PHASE2_NONE).assertEqual(0);
          expect(eap.Phase2Method.PHASE2_PAP).assertEqual(1);
          expect(eap.Phase2Method.PHASE2_MSCHAP).assertEqual(2);
          expect(eap.Phase2Method.PHASE2_MSCHAPV2).assertEqual(3);
          expect(eap.Phase2Method.PHASE2_GTC).assertEqual(4);
          expect(eap.Phase2Method.PHASE2_SIM).assertEqual(5);
          expect(eap.Phase2Method.PHASE2_AKA).assertEqual(6);
          expect(eap.Phase2Method.PHASE2_AKA_PRIME).assertEqual(7);

          // 5. 测试EthEapProfile接口（通过实例验证）
          let certEntry = new Uint8Array(2);
          certEntry[0] = 0x03;
          certEntry[1] = 0x04;
          const testProfile: eap.EthEapProfile = {
            eapMethod: eap.EapMethod.EAP_PEAP,
            phase2Method: eap.Phase2Method.PHASE2_PAP,
            identity: 'testIdentity',
            anonymousIdentity: 'anonymous',
            password: 'testPwd',
            caCertAliases: 'caAlias',
            caPath: '/path/to/ca',
            clientCertAliases: 'clientAlias',
            certEntry: certEntry,
            certPassword: 'certPwd',
            altSubjectMatch: 'altMatch',
            domainSuffixMatch: 'domainSuffix',
            realm: 'realm',
            plmn: 'plmn',
            eapSubId: 1
          };
          hilog.info(domain, tag, `[eap_test] EthEapProfile.eapMethod: ${testProfile.eapMethod}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.phase2Method: ${testProfile.eapMethod}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.identity: ${testProfile.identity}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.anonymousIdentity: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.password: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.caCertAliases: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.caPath: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.clientCertAliases: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.certPassword: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.altSubjectMatch: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.domainSuffixMatch: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.realm: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.plmn: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.eapSubId: ${testProfile.eapSubId}`);
          hilog.info(domain, tag, `[eap_test] EthEapProfile.certEntry length: ${testProfile.certEntry.length}`);
          // 验证接口属性类型和赋值
          expect(testProfile.eapMethod).assertEqual(eap.EapMethod.EAP_PEAP);
          expect(testProfile.phase2Method).assertEqual(eap.Phase2Method.PHASE2_PAP);
          expect(typeof testProfile.identity).assertEqual('string');
          expect(typeof testProfile.anonymousIdentity).assertEqual('string');
          expect(typeof testProfile.password).assertEqual('string');
          expect(typeof testProfile.caCertAliases).assertEqual('string');
          expect(typeof testProfile.caPath).assertEqual('string');
          expect(typeof testProfile.clientCertAliases).assertEqual('string');
          expect(typeof testProfile.certPassword).assertEqual('string');
          expect(typeof testProfile.altSubjectMatch).assertEqual('string');
          expect(typeof testProfile.domainSuffixMatch).assertEqual('string');
          expect(typeof testProfile.realm).assertEqual('string');
          expect(typeof testProfile.plmn).assertEqual('string');
          expect(typeof testProfile.eapSubId).assertEqual('int');
          expect(testProfile.certEntry instanceof Uint8Array).assertTrue();

        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_js_static_0400 test fail: ${(error as Error).message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.name   SUB_Communication_Netmanager_Eap_js_static_0500
     * @tc.number SUB_Communication_Netmanager_Eapjs_0500
     * @tc.desc   Test eap startEthEap api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_js_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let netId = 100;
        let certEntryArr = new Uint8Array(6);
        certEntryArr[0] = 5;
        certEntryArr[1] = 6;
        certEntryArr[2] = 7;
        certEntryArr[3] = 8;
        certEntryArr[4] = 9;
        certEntryArr[5] = 10;
        let profile: eap.EthEapProfile = {
          eapMethod: eap.EapMethod.EAP_TTLS,
          phase2Method: eap.Phase2Method.PHASE2_AKA_PRIME,
          identity: "identity",
          anonymousIdentity: "anonymousIdentity",
          password: "password",
          caCertAliases: "caCertAliases",
          caPath: "caPath",
          clientCertAliases: "clientCertAliases",
          certEntry: certEntryArr,
          certPassword: "certPassword",
          altSubjectMatch: "altSubjectMatch",
          domainSuffixMatch: "domainSuffixMatch",
          realm: "realm",
          plmn: "plmn",
          eapSubId: 1
        };
        try {
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0500 startEthEap start");
          eap.startEthEap(netId, profile);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0500 startEthEap success");
          expect(true).assertTrue();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_js_static_0500 startEthEap failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200001) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap invalid netId`);
            expect(true).assertTrue();
          } else if (error.code === 33200003) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap invalid profile`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200010) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap invalid eth state.`);
            expect().assertFail();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0500 eap startEthEap undefined errorcode`);
            expect().assertFail();
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_Communication_Netmanager_Eap_js_static_0600
     * @tc.number SUB_Communication_Netmanager_Eapjs_0600
     * @tc.desc   Test eap logOffEthEap api functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_Netmanager_Eap_js_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let netId = 100;
        try {
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0600 logOffEthEap start");
          eap.logOffEthEap(netId);
          hilog.info(domain, tag, "SUB_Communication_Netmanager_Eap_js_static_0600 logOffEthEap success");
          expect(true).assertTrue();
        } catch (error) {
          hilog.info(domain, tag,
            `SUB_Communication_Netmanager_Eap_js_static_0600 logOffEthEap failed,code is ${error.code}, message is ${error.message}`);
          if (error.code === 201) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap permission denied`);
            expect(true).assertTrue();
          } else if (error.code === 33200001) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap invalid netId`);
            expect(true).assertTrue();
          } else if (error.code === 33200002) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap Log off fail`);
            expect().assertFail();
          } else if (error.code === 33200009) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap netmanager stop`);
            expect(true).assertTrue();
          } else if (error.code === 33200010) {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap invalid eth state.`);
            expect().assertFail();
          } else if (error.code === 33200099) {
            hilog.info(domain, tag, `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap internal error`);
            expect(true).assertTrue();
          } else {
            hilog.info(domain, tag,
              `SUB_Communication_Netmanager_Eap_js_static_0600 eap logOffEthEap undefined errorcode`);
            expect().assertFail();
          }
        }
        done();
      })
  })
}
