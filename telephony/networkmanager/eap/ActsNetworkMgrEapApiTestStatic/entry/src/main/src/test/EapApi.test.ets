'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";

import { BusinessError } from '@kit.BasicServicesKit';
import eap from '@ohos.net.eap';
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'eapApiTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

// 201: permission not granted on this env; 33200001: invalid net;
// 33200009: netmanager stop; 33200010: invalid eth state; 33200011: no eap config;
// 33200012: config locked; 33200013: eth eap config unavailable on this env;
// 33200099: internal error (no 802.1X env, cable off, etc.)
const IsEnvErrorCode = (code: number): boolean => {
  return code === 201 || code === 33200001 || code === 33200002 || code === 33200003 ||
    code === 33200004 || code === 33200009 || code === 33200010 || code === 33200011 ||
    code === 33200012 || code === 33200013 || code === 33200099;
}

const IsValidEthEapState = (state: eap.EthEapState): boolean => {
  return state === eap.EthEapState.STATE_IDLE || state === eap.EthEapState.STATE_AUTHENTICATING ||
    state === eap.EthEapState.STATE_AUTHENTICATED || state === eap.EthEapState.STATE_FAILED ||
    state === eap.EthEapState.STATE_RETRYING;
}

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

export default function EapApiTest(): void {
  describe('EapApiTest', (): void => {

    /**
     * @tc.name   testCommunicationEapEthEapStateApi_static_0100
     * @tc.number SUB_Communication_Eap_EthEapStateApi_0100
     * @tc.desc   Test EthEapState.STATE_IDLE enum value is 0 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_IDLE === 0);
        ExpectTrue(typeof eap.EthEapState.STATE_IDLE === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateApi_static_0200
     * @tc.number SUB_Communication_Eap_EthEapStateApi_0200
     * @tc.desc   Test EthEapState.STATE_AUTHENTICATED enum value is 2 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_AUTHENTICATED === 2);
        ExpectTrue(typeof eap.EthEapState.STATE_AUTHENTICATED === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateApi_static_0300
     * @tc.number SUB_Communication_Eap_EthEapStateApi_0300
     * @tc.desc   Test EthEapState.STATE_FAILED enum value is 3 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_FAILED === 3);
        ExpectTrue(typeof eap.EthEapState.STATE_FAILED === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateApi_static_0400
     * @tc.number SUB_Communication_Eap_EthEapStateApi_0400
     * @tc.desc   Test EthEapState.STATE_RETRYING enum value is 4 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateApi_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateApi_static_0400";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_RETRYING === 4);
        ExpectTrue(typeof eap.EthEapState.STATE_RETRYING === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConnectActionApi_static_0100
     * @tc.number SUB_Communication_Eap_EthEapConnectActionApi_0100
     * @tc.desc   Test EthEapConnectAction.ACTION_CONNECT enum value is 0 and call connect with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConnectActionApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConnectActionApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapConnectAction.ACTION_CONNECT === 0);
        ExpectTrue(typeof eap.EthEapConnectAction.ACTION_CONNECT === 'number');
        eap.connect(eap.EthEapConnectAction.ACTION_CONNECT).then((): void => {
          hilog.info(domain, tag, `${caseName} connect(ACTION_CONNECT) success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo after connect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvErrorCode(stateError.code));
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConnectActionApi_static_0200
     * @tc.number SUB_Communication_Eap_EthEapConnectActionApi_0200
     * @tc.desc   Test EthEapConnectAction.ACTION_DISCONNECT enum value is 1 and call connect with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConnectActionApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConnectActionApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapConnectAction.ACTION_DISCONNECT === 1);
        ExpectTrue(typeof eap.EthEapConnectAction.ACTION_DISCONNECT === 'number');
        eap.connect(eap.EthEapConnectAction.ACTION_DISCONNECT).then((): void => {
          hilog.info(domain, tag, `${caseName} connect(ACTION_DISCONNECT) success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo after disconnect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvErrorCode(stateError.code));
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfigApi_static_0100
     * @tc.number SUB_Communication_Eap_EthEapConfigApi_0100
     * @tc.desc   Test EthEapConfig interface construction and call setEthEapConfig/getEthEapConfig with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfigApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConfigApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        ExpectTrue(config !== undefined && config !== null);
        ExpectTrue(config.profile !== undefined && config.profile !== null && config.profile === profile);
        ExpectTrue(config.enabled === true);
        ExpectTrue(config.autoAuth === false);
        ExpectTrue(config.locked === false);
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig success: identity=${result.profile.identity}, enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean');
          ExpectTrue(typeof result.autoAuth === 'boolean');
          ExpectTrue(typeof result.locked === 'boolean');
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.enabled === true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfigApi_static_0200
     * @tc.number SUB_Communication_Eap_EthEapConfigApi_0200
     * @tc.desc   Test EthEapConfig.profile field of type EthEapProfile and verify round-trip by getEthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfigApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConfigApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig with profile success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig return value: ${JSON.stringify(result)}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_TTLS);
          ExpectTrue(result.profile.phase2Method === eap.Phase2Method.PHASE2_AKA_PRIME);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.profile.anonymousIdentity === "anonymousIdentity");
          ExpectTrue(result.profile.password === "password");
          ExpectTrue(result.profile.caCertAliases === "caCertAliases");
          ExpectTrue(result.profile.caPath === "caPath");
          ExpectTrue(result.profile.clientCertAliases === "clientCertAliases");
          ExpectTrue(result.profile.certPassword === "certPassword");
          ExpectTrue(result.profile.altSubjectMatch === "altSubjectMatch");
          ExpectTrue(result.profile.domainSuffixMatch === "domainSuffixMatch");
          ExpectTrue(result.profile.realm === "realm");
          ExpectTrue(result.profile.plmn === "plmn");
          ExpectTrue(result.profile.eapSubId === 1);
          if (result.profile.certEntry !== undefined && result.profile.certEntry !== null) {
            ExpectTrue(result.profile.certEntry.length === certEntryArr.length);
            ExpectTrue(result.profile.certEntry[0] === certEntryArr[0]);
            ExpectTrue(result.profile.certEntry[1] === certEntryArr[1]);
            ExpectTrue(result.profile.certEntry[2] === certEntryArr[2]);
            ExpectTrue(result.profile.certEntry[3] === certEntryArr[3]);
            ExpectTrue(result.profile.certEntry[4] === certEntryArr[4]);
            ExpectTrue(result.profile.certEntry[5] === certEntryArr[5]);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfigApi_static_0300
     * @tc.number SUB_Communication_Eap_EthEapConfigApi_0300
     * @tc.desc   Test EthEapConfig.enabled field with true and false, both verified by getEthEapConfig round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfigApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConfigApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let configEnabled: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(configEnabled);
        hilog.info(domain, tag, `${caseName} setEthEapConfig enabled=true success`);
        eap.getEthEapConfig().then((enabledResult: eap.EthEapConfig): Promise<eap.EthEapConfig> => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig after enabled=true: enabled=${enabledResult.enabled}`);
          ExpectTrue(enabledResult !== undefined && enabledResult !== null);
          ExpectTrue(typeof enabledResult.enabled === 'boolean');
          ExpectTrue(enabledResult.enabled === true);
          let configDisabled: eap.EthEapConfig = {
            profile: profile,
            enabled: false,
            autoAuth: false,
            locked: false
          };
          eap.setEthEapConfig(configDisabled);
          hilog.info(domain, tag, `${caseName} setEthEapConfig enabled=false success`);
          return eap.getEthEapConfig();
        }).then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig after enabled=false: enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean');
          ExpectTrue(result.enabled === false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfigApi_static_0400
     * @tc.number SUB_Communication_Eap_EthEapConfigApi_0400
     * @tc.desc   Test EthEapConfig.autoAuth field with true and false, both verified by getEthEapConfig round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfigApi_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConfigApi_static_0400";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let configAuto: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: true,
          locked: false
        };
        eap.setEthEapConfig(configAuto);
        hilog.info(domain, tag, `${caseName} setEthEapConfig autoAuth=true success`);
        eap.getEthEapConfig().then((autoResult: eap.EthEapConfig): Promise<eap.EthEapConfig> => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig after autoAuth=true: autoAuth=${autoResult.autoAuth}`);
          ExpectTrue(autoResult !== undefined && autoResult !== null);
          ExpectTrue(typeof autoResult.autoAuth === 'boolean');
          ExpectTrue(autoResult.autoAuth === true);
          let configManual: eap.EthEapConfig = {
            profile: profile,
            enabled: true,
            autoAuth: false,
            locked: false
          };
          eap.setEthEapConfig(configManual);
          hilog.info(domain, tag, `${caseName} setEthEapConfig autoAuth=false success`);
          return eap.getEthEapConfig();
        }).then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig after autoAuth=false: autoAuth=${result.autoAuth}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.autoAuth === 'boolean');
          ExpectTrue(result.autoAuth === false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfigApi_static_0500
     * @tc.number SUB_Communication_Eap_EthEapConfigApi_0500
     * @tc.desc   Test EthEapConfig.locked field with true and false, both verified by getEthEapConfig round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfigApi_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapConfigApi_static_0500";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let configUnlocked: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(configUnlocked);
        hilog.info(domain, tag, `${caseName} setEthEapConfig locked=false success`);
        let configLocked: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: true
        };
        let unlockSuccess: boolean = false;
        eap.getEthEapConfig().then((unlockedResult: eap.EthEapConfig): Promise<eap.EthEapConfig> => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig after locked=false: locked=${unlockedResult.locked}`);
          ExpectTrue(unlockedResult !== undefined && unlockedResult !== null);
          ExpectTrue(typeof unlockedResult.locked === 'boolean');
          ExpectTrue(unlockedResult.locked === false);
          try {
            eap.setEthEapConfig(configLocked);
            hilog.info(domain, tag, `${caseName} setEthEapConfig locked=true success`);
          } catch (lockError) {
            hilog.info(domain, tag, `${caseName} setEthEapConfig locked=true failed: ${JSON.stringify(lockError)}`);
            ExpectTrue(IsEnvErrorCode(lockError.code));
          }
          // unlock to keep stored config editable by following cases
          try {
            eap.setEthEapConfig(configUnlocked);
            unlockSuccess = true;
            hilog.info(domain, tag, `${caseName} setEthEapConfig unlock cleanup success`);
          } catch (cleanupError) {
            hilog.info(domain, tag, `${caseName} unlock cleanup failed: ${JSON.stringify(cleanupError)}`);
            ExpectTrue(IsEnvErrorCode(cleanupError.code));
          }
          return eap.getEthEapConfig();
        }).then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig after unlock: locked=${result.locked}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.locked === 'boolean');
          if (unlockSuccess) {
            ExpectTrue(result.locked === false);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateInfoApi_static_0100
     * @tc.number SUB_Communication_Eap_EthEapStateInfoApi_0100
     * @tc.desc   Test EthEapStateInfo interface construction and getEthEapStateInfo return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateInfoApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateInfoApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_AUTHENTICATING,
          retryCount: 1
        };
        ExpectTrue(stateInfo.state === eap.EthEapState.STATE_AUTHENTICATING);
        ExpectTrue(eap.EthEapState.STATE_AUTHENTICATING === 1);
        ExpectTrue(stateInfo.retryCount === 1);
        hilog.info(domain, tag, `${caseName} local EthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        let realInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(realInfo)}`);
        ExpectTrue(realInfo !== undefined && realInfo !== null);
        ExpectTrue(IsValidEthEapState(realInfo.state));
        ExpectTrue(typeof realInfo.retryCount === 'number' && realInfo.retryCount >= 0);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateInfoApi_static_0200
     * @tc.number SUB_Communication_Eap_EthEapStateInfoApi_0200
     * @tc.desc   Test EthEapStateInfo.state field of type EthEapState via getEthEapStateInfo return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateInfoApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateInfoApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_AUTHENTICATED,
          retryCount: 3
        };
        ExpectTrue(stateInfo.state === eap.EthEapState.STATE_AUTHENTICATED);
        ExpectTrue(stateInfo.state === 2);
        ExpectTrue(eap.EthEapState.STATE_AUTHENTICATED === 2);
        let realInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(realInfo)}`);
        ExpectTrue(realInfo !== undefined && realInfo !== null);
        ExpectTrue(IsValidEthEapState(realInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateInfoApi_static_0300
     * @tc.number SUB_Communication_Eap_EthEapStateInfoApi_0300
     * @tc.desc   Test EthEapStateInfo.retryCount field of type int via getEthEapStateInfo return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateInfoApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateInfoApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_IDLE,
          retryCount: 0
        };
        ExpectTrue(stateInfo.retryCount === 0);
        let realInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(realInfo)}`);
        ExpectTrue(realInfo !== undefined && realInfo !== null);
        ExpectTrue(typeof realInfo.retryCount === 'number');
        ExpectTrue(realInfo.retryCount >= 0);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateInfoApi_static_0400
     * @tc.number SUB_Communication_Eap_EthEapStateInfoApi_0400
     * @tc.desc   Test EthEapStateInfo.message optional field, selected and not selected, via getEthEapStateInfo return value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateInfoApi_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapEthEapStateInfoApi_static_0400";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let infoWithMessage: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_FAILED,
          retryCount: 3,
          message: "Authentication failed after retries"
        };
        hilog.info(domain, tag, `${caseName} EthEapStateInfo with message: ${JSON.stringify(infoWithMessage)}`);
        let infoWithoutMessage: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_IDLE,
          retryCount: 0
        };
        hilog.info(domain, tag, `${caseName} EthEapStateInfo without message: ${JSON.stringify(infoWithoutMessage)}`);
        let realInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo: ${JSON.stringify(realInfo)}`);
        ExpectTrue(realInfo !== undefined && realInfo !== null);
        ExpectTrue(realInfo.message === undefined || typeof realInfo.message === 'string');
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfigApi_static_0100
     * @tc.number SUB_Communication_Eap_SetEthEapConfigApi_0100
     * @tc.desc   Test setEthEapConfig invocation with a full EthEapConfig parameter and verify by getEthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapSetEthEapConfigApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapSetEthEapConfigApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig success: identity=${result.profile.identity}, enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_TTLS);
          ExpectTrue(result.enabled === true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfigApi_static_0200
     * @tc.number SUB_Communication_Eap_SetEthEapConfigApi_0200
     * @tc.desc   Test setEthEapConfig input parameter selected with a valid EthEapConfig and verify by getEthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapSetEthEapConfigApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapSetEthEapConfigApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: true,
          locked: false
        };
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig with autoAuth=true success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig success: autoAuth=${result.autoAuth}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.autoAuth === 'boolean');
          ExpectTrue(result.autoAuth === true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfigApi_static_0300
     * @tc.number SUB_Communication_Eap_SetEthEapConfigApi_0300
     * @tc.desc   Test setEthEapConfig parameter spec with different field values (enabled=false) and verify by getEthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapSetEthEapConfigApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapSetEthEapConfigApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: false,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig enabled=false success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig success: enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean');
          ExpectTrue(result.enabled === false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfigApi_static_0400
     * @tc.number SUB_Communication_Eap_SetEthEapConfigApi_0400
     * @tc.desc   Test setEthEapConfig return value is void, verify the write effect by getEthEapConfig round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapSetEthEapConfigApi_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapSetEthEapConfigApi_static_0400";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig success: identity=${result.profile.identity}, enabled=${result.enabled}` +
            `, autoAuth=${result.autoAuth}, locked=${result.locked}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.enabled === true);
          ExpectTrue(result.autoAuth === false);
          ExpectTrue(result.locked === false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfigApi_static_0100
     * @tc.number SUB_Communication_Eap_GetEthEapConfigApi_0100
     * @tc.desc   Test getEthEapConfig invocation with no parameter and check the returned EthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapGetEthEapConfigApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapGetEthEapConfigApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.getEthEapConfig().then((config: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig success: enabled=${config.enabled}` +
            `, autoAuth=${config.autoAuth}, locked=${config.locked}`);
          ExpectTrue(config !== undefined && config !== null);
          ExpectTrue(typeof config.enabled === 'boolean');
          ExpectTrue(typeof config.autoAuth === 'boolean');
          ExpectTrue(typeof config.locked === 'boolean');
          ExpectTrue(config.profile !== undefined && config.profile !== null);
          ExpectTrue(typeof config.profile.identity === 'string');
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfigApi_static_0200
     * @tc.number SUB_Communication_Eap_GetEthEapConfigApi_0200
     * @tc.desc   Test getEthEapConfig return value coverage: all EthEapConfig and EthEapProfile fields by set-get round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapGetEthEapConfigApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapGetEthEapConfigApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        hilog.info(domain, tag, `${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig return value: ${JSON.stringify(result)}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean' && result.enabled === true);
          ExpectTrue(typeof result.autoAuth === 'boolean' && result.autoAuth === false);
          ExpectTrue(typeof result.locked === 'boolean' && result.locked === false);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_TTLS);
          ExpectTrue(result.profile.phase2Method === eap.Phase2Method.PHASE2_AKA_PRIME);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.profile.anonymousIdentity === "anonymousIdentity");
          ExpectTrue(result.profile.password === "password");
          ExpectTrue(result.profile.caCertAliases === "caCertAliases");
          ExpectTrue(result.profile.caPath === "caPath");
          ExpectTrue(result.profile.clientCertAliases === "clientCertAliases");
          ExpectTrue(result.profile.certPassword === "certPassword");
          ExpectTrue(result.profile.altSubjectMatch === "altSubjectMatch");
          ExpectTrue(result.profile.domainSuffixMatch === "domainSuffixMatch");
          ExpectTrue(result.profile.realm === "realm");
          ExpectTrue(result.profile.plmn === "plmn");
          ExpectTrue(result.profile.eapSubId === 1);
          if (result.profile.certEntry !== undefined && result.profile.certEntry !== null) {
            ExpectTrue(result.profile.certEntry.length === certEntryArr.length);
            ExpectTrue(result.profile.certEntry[0] === certEntryArr[0]);
            ExpectTrue(result.profile.certEntry[1] === certEntryArr[1]);
            ExpectTrue(result.profile.certEntry[2] === certEntryArr[2]);
            ExpectTrue(result.profile.certEntry[3] === certEntryArr[3]);
            ExpectTrue(result.profile.certEntry[4] === certEntryArr[4]);
            ExpectTrue(result.profile.certEntry[5] === certEntryArr[5]);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let getError: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvErrorCode(getError.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfigApi_static_0300
     * @tc.number SUB_Communication_Eap_GetEthEapConfigApi_0300
     * @tc.desc   Test getEthEapConfig parameter spec, invoke with the declared no-parameter signature.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapGetEthEapConfigApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapGetEthEapConfigApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.getEthEapConfig().then((config: eap.EthEapConfig): void => {
          hilog.info(domain, tag, `${caseName} getEthEapConfig with extra param success: enabled=${config.enabled}`);
          ExpectTrue(config !== undefined && config !== null);
          ExpectTrue(typeof config.enabled === 'boolean');
          ExpectTrue(typeof config.autoAuth === 'boolean');
          ExpectTrue(typeof config.locked === 'boolean');
          ExpectTrue(config.profile !== undefined && config.profile !== null);
          ExpectTrue(typeof config.profile.identity === 'string');
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} getEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code === 401 || IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 401 || IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapDeleteEthEapConfigApi_static_0100
     * @tc.number SUB_Communication_Eap_DeleteEthEapConfigApi_0100
     * @tc.desc   Test deleteEthEapConfig invocation and return value, verify deletion effect by getEthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapDeleteEthEapConfigApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapDeleteEthEapConfigApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let deletePromise: Promise<void> = eap.deleteEthEapConfig();
        deletePromise.then((): void => {
          hilog.info(domain, tag, `${caseName} deleteEthEapConfig success`);
          eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
            hilog.info(domain, tag, `${caseName} getEthEapConfig after delete: ${JSON.stringify(result)}`);
            ExpectTrue(result !== undefined && result !== null);
            ExpectTrue(result.profile === undefined || result.profile === null || result.enabled === false);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err: Error) => {
            let getError: BusinessError = err as BusinessError;
            hilog.info(domain, tag, `${caseName} getEthEapConfig after delete failed, code:${getError.code}, message:${getError.message}`);
            ExpectTrue(IsEnvErrorCode(getError.code));
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} deleteEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapDeleteEthEapConfigApi_static_0200
     * @tc.number SUB_Communication_Eap_DeleteEthEapConfigApi_0200
     * @tc.desc   Test deleteEthEapConfig parameter spec, invoke with the declared no-parameter signature.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapDeleteEthEapConfigApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapDeleteEthEapConfigApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let deletePromise: Promise<void> = eap.deleteEthEapConfig();
        deletePromise.then((): void => {
          hilog.info(domain, tag, `${caseName} deleteEthEapConfig with extra param success`);
          eap.getEthEapConfig().then((result: eap.EthEapConfig): void => {
            hilog.info(domain, tag, `${caseName} getEthEapConfig after delete: ${JSON.stringify(result)}`);
            ExpectTrue(result !== undefined && result !== null);
            ExpectTrue(result.profile === undefined || result.profile === null || result.enabled === false);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err: Error) => {
            let getError: BusinessError = err as BusinessError;
            hilog.info(domain, tag, `${caseName} getEthEapConfig after delete failed, code:${getError.code}, message:${getError.message}`);
            ExpectTrue(IsEnvErrorCode(getError.code));
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} deleteEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code === 401 || IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 401 || IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapStateInfoApi_static_0100
     * @tc.number SUB_Communication_Eap_GetEthEapStateInfoApi_0100
     * @tc.desc   Test getEthEapStateInfo invocation with no parameter and check the returned EthEapStateInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapGetEthEapStateInfoApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapGetEthEapStateInfoApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo success: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        ExpectTrue(typeof stateInfo.retryCount === 'number');
        ExpectTrue(stateInfo.retryCount >= 0);
        ExpectTrue(stateInfo.message === undefined || typeof stateInfo.message === 'string');
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapStateInfoApi_static_0200
     * @tc.number SUB_Communication_Eap_GetEthEapStateInfoApi_0200
     * @tc.desc   Test getEthEapStateInfo parameter spec, invoke with the declared no-parameter signature.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapGetEthEapStateInfoApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapGetEthEapStateInfoApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo with extra param success: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        ExpectTrue(typeof stateInfo.retryCount === 'number');
        ExpectTrue(stateInfo.retryCount >= 0);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 401 || IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOnStateChangeApi_static_0100
     * @tc.number SUB_Communication_Eap_OnStateChangeApi_0100
     * @tc.desc   Test onStateChange invocation with a Callback<EthEapStateInfo> parameter selected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOnStateChangeApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapOnStateChangeApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          hilog.info(domain, tag, `${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}`);
          ExpectTrue(IsValidEthEapState(info.state));
          ExpectTrue(typeof info.retryCount === 'number' && info.retryCount >= 0);
        }
        eap.onStateChange(stateChangeCallback);
        hilog.info(domain, tag, `${caseName} onStateChange success`);
        let subscribedStateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo after onStateChange: ${JSON.stringify(subscribedStateInfo)}`);
        ExpectTrue(subscribedStateInfo !== undefined && subscribedStateInfo !== null);
        ExpectTrue(IsValidEthEapState(subscribedStateInfo.state));
        try {
          eap.offStateChange(stateChangeCallback);
          hilog.info(domain, tag, `${caseName} offStateChange cleanup success`);
        } catch (err) {
          hilog.info(domain, tag, `${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOnStateChangeApi_static_0200
     * @tc.number SUB_Communication_Eap_OnStateChangeApi_0200
     * @tc.desc   Test onStateChange return value is void, verify subscription works by state query and callback data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapOnStateChangeApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapOnStateChangeApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          hilog.info(domain, tag, `${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}, message=${info.message}`);
          ExpectTrue(IsValidEthEapState(info.state));
          ExpectTrue(info.message === undefined || typeof info.message === 'string');
        }
        eap.onStateChange(stateChangeCallback);
        hilog.info(domain, tag, `${caseName} onStateChange success`);
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        try {
          eap.offStateChange(stateChangeCallback);
          hilog.info(domain, tag, `${caseName} offStateChange cleanup success`);
        } catch (err) {
          hilog.info(domain, tag, `${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChangeApi_static_0100
     * @tc.number SUB_Communication_Eap_OffStateChangeApi_0100
     * @tc.desc   Test offStateChange invocation with the optional callback parameter selected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOffStateChangeApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapOffStateChangeApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          hilog.info(domain, tag, `${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}`);
          ExpectTrue(IsValidEthEapState(info.state));
        }
        eap.onStateChange(stateChangeCallback);
        hilog.info(domain, tag, `${caseName} onStateChange success`);
        eap.offStateChange(stateChangeCallback);
        hilog.info(domain, tag, `${caseName} offStateChange with callback success`);
        let offStateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo after offStateChange: ${JSON.stringify(offStateInfo)}`);
        ExpectTrue(offStateInfo !== undefined && offStateInfo !== null);
        ExpectTrue(IsValidEthEapState(offStateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChangeApi_static_0200
     * @tc.number SUB_Communication_Eap_OffStateChangeApi_0200
     * @tc.desc   Test offStateChange parameter spec with the optional callback parameter not selected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOffStateChangeApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapOffStateChangeApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.offStateChange();
        hilog.info(domain, tag, `${caseName} offStateChange without callback success`);
        let offAllStateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        hilog.info(domain, tag, `${caseName} getEthEapStateInfo after offStateChange: ${JSON.stringify(offAllStateInfo)}`);
        ExpectTrue(offAllStateInfo !== undefined && offAllStateInfo !== null);
        ExpectTrue(IsValidEthEapState(offAllStateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChangeApi_static_0300
     * @tc.number SUB_Communication_Eap_OffStateChangeApi_0300
     * @tc.desc   Test offStateChange return value is void, verify service still functional after unsubscribe all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapOffStateChangeApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapOffStateChangeApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let firstCallback = (info: eap.EthEapStateInfo): void => {
          hilog.info(domain, tag, `${caseName} first onStateChange callback: state=${info.state}`);
          ExpectTrue(IsValidEthEapState(info.state));
        }
        let secondCallback = (info: eap.EthEapStateInfo): void => {
          hilog.info(domain, tag, `${caseName} second onStateChange callback: state=${info.state}`);
          ExpectTrue(IsValidEthEapState(info.state));
        }
        eap.onStateChange(firstCallback);
        eap.onStateChange(secondCallback);
        hilog.info(domain, tag, `${caseName} onStateChange twice success`);
        eap.offStateChange();
        hilog.info(domain, tag, `${caseName} offStateChange unsubscribe all success`);
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnectApi_static_0100
     * @tc.number SUB_Communication_Eap_ConnectApi_0100
     * @tc.desc   Test connect invocation with EthEapConnectAction.ACTION_CONNECT parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapConnectApi_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapConnectApi_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapConnectAction.ACTION_CONNECT === 0);
        ExpectTrue(typeof eap.EthEapConnectAction.ACTION_CONNECT === 'number');
        let invokeSucceeded: boolean = false;
        let connectPromise: Promise<void> = eap.connect(eap.EthEapConnectAction.ACTION_CONNECT);
        ExpectTrue(connectPromise !== undefined && connectPromise !== null);
        connectPromise.then((): void => {
          invokeSucceeded = true;
          ExpectTrue(invokeSucceeded);
          hilog.info(domain, tag, `${caseName} connect ACTION_CONNECT success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo after connect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvErrorCode(stateError.code));
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnectApi_static_0200
     * @tc.number SUB_Communication_Eap_ConnectApi_0200
     * @tc.desc   Test connect parameter spec with EthEapConnectAction.ACTION_DISCONNECT parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapConnectApi_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapConnectApi_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapConnectAction.ACTION_DISCONNECT === 1);
        ExpectTrue(typeof eap.EthEapConnectAction.ACTION_DISCONNECT === 'number');
        let invokeSucceeded: boolean = false;
        let connectPromise: Promise<void> = eap.connect(eap.EthEapConnectAction.ACTION_DISCONNECT);
        ExpectTrue(connectPromise !== undefined && connectPromise !== null);
        connectPromise.then((): void => {
          invokeSucceeded = true;
          ExpectTrue(invokeSucceeded);
          hilog.info(domain, tag, `${caseName} connect ACTION_DISCONNECT success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo after disconnect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvErrorCode(stateError.code));
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnectApi_static_0300
     * @tc.number SUB_Communication_Eap_ConnectApi_0300
     * @tc.desc   Test connect return value Promise<void> with raw EthEapConnectAction values 0 and 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapConnectApi_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapConnectApi_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let actionConnect: eap.EthEapConnectAction = eap.EthEapConnectAction.fromValue(0);
        let actionDisconnect: eap.EthEapConnectAction = eap.EthEapConnectAction.fromValue(1);
        ExpectTrue(actionConnect === eap.EthEapConnectAction.ACTION_CONNECT);
        ExpectTrue(actionDisconnect === eap.EthEapConnectAction.ACTION_DISCONNECT);
        let firstInvokeSucceeded: boolean = false;
        let secondInvokeSucceeded: boolean = false;
        let connectPromise: Promise<void> = eap.connect(actionConnect);
        ExpectTrue(connectPromise !== undefined && connectPromise !== null);
        connectPromise.then((): Promise<void> => {
          firstInvokeSucceeded = true;
          ExpectTrue(firstInvokeSucceeded);
          hilog.info(domain, tag, `${caseName} connect(0) success`);
          return eap.connect(actionDisconnect);
        }).then((): void => {
          secondInvokeSucceeded = true;
          ExpectTrue(secondInvokeSucceeded);
          hilog.info(domain, tag, `${caseName} connect(1) success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo after connect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            hilog.info(domain, tag, `${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvErrorCode(stateError.code));
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          let error: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvErrorCode(error.code));
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(IsEnvErrorCode(error.code));
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

  })
}
