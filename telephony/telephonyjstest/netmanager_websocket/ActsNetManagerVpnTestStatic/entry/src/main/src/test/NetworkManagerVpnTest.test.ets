'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import vpnExtension from '@ohos.net.vpnExtension';
import VpnExtensionAbility from '@ohos.app.ability.VpnExtensionAbility';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'networkManagerVpnTestTag';
let socketFd = 38;
let context2: vpnExtension.VpnExtensionContext | undefined;

let config: vpnExtension.VpnConfig = {
  addresses: [{
    address: {
      address: '10.0.0.5',
      family: 1
    },
    prefixLength: 24
  }],
  routes: [],
  dnsAddresses: ["114.114.114.114"],
  searchDomains: [],
  mtu: 1400,
  isIPv4Accepted: true,
  isIPv6Accepted: false,
  isInternal: true,
  isBlocking: false,
  trustedApplications: [],
  blockedApplications: ["com.example.vpn_xts"]
}

let vpnConfig: vpnExtension.VpnConfig = {
  vpnId: '123456',
  addresses: [{
    address: {
      address: '10.0.0.5',
      family: 1
    },
    prefixLength: 24
  }],
  routes: [],
  dnsAddresses: ["114.114.114.114"],
  searchDomains: [],
  mtu: 1400,
  isIPv4Accepted: true,
  isIPv6Accepted: false,
  isInternal: true,
  isBlocking: false,
  trustedApplications: [],
  blockedApplications: ["com.example.vpn_xts"]
}

export default function NetworkManagerVpnTest(): void {
  describe('NetworkManagerVpnTest', () => {
    beforeAll(async () => {
      hilog.info(domain, tag, '%{public}s', 'NetworkManager_ActsNetworkManagerVpnTest beforeAll start');
      let vpnExtensionAbility = new VpnExtensionAbility();
      context2 = vpnExtensionAbility.context;
      hilog.info(domain, tag, '%{public}s', 'NetworkManager_ActsNetworkManagerVpnTest beforeAll end');
    });
    afterAll(async () => {
      hilog.info(domain, tag, '%{public}s', 'NetworkManager_ActsNetworkManagerVpnTest afterAll start');
      hilog.info(domain, tag, '%{public}s', 'NetworkManager_ActsNetworkManagerVpnTest afterAll end');
    });

    /**
     * @tc.name testNetworkManagerVPNstartVpnExtensionAbilityPromise_static_0100
     * @tc.number SUB_NetworkManager_VPN_startVpnExtensionAbility_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNstartVpnExtensionAbilityPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNstartVpnExtensionAbilityPromise_static_0100';
      let want: Want = {};
      try {
        vpnExtension.startVpnExtensionAbility(want);
        hilog.info(domain, tag, '%{public}s', `${caseName} startVpnExtensionAbility success`);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} startVpnExtensionAbility fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNcreateVpnConnectionAsync_static_0100
     * @tc.number SUB_NetworkManager_VPN_createVpnConnection_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNcreateVpnConnectionAsync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNcreateVpnConnectionAsync_static_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        hilog.info(domain, tag, '%{public}s', `${caseName} create success`);
        expect(vpnInstance !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNsetAlwaysOnVpnEnabledPromise_static_0100
     * @tc.number SUB_NetworkManager_VPN_setAlwaysOnVpnEnabled_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNsetAlwaysOnVpnEnabledPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNsetAlwaysOnVpnEnabledPromise_static_0100';
      try {
        await vpnExtension.setAlwaysOnVpnEnabled(true, 'com.example.vpn_xts');
        hilog.info(domain, tag, '%{public}s', `${caseName} setAlwaysOnVpnEnabled success`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNisAlwaysOnVpnEnabledPromise_static_0100
     * @tc.number SUB_NetworkManager_VPN_isAlwaysOnVpnEnabled_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNisAlwaysOnVpnEnabledPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNisAlwaysOnVpnEnabledPromise_static_0100';
      try {
        await vpnExtension.isAlwaysOnVpnEnabled('com.example.vpn_xts');
        hilog.info(domain, tag, '%{public}s', `${caseName} isAlwaysOnVpnEnabled success`);
        expect().assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(error.code === 201).assertTrue();
        done();
      }
    });
    /**
     * @tc.name testNetworkManagerVPNcreatePromise_static_0100
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNcreatePromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNcreatePromise_static_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        try {
          await vpnInstance.create(config);
          hilog.info(domain, tag, '%{public}s', `${caseName} create success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} create fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_create_Promise_static_0300
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_static_0300';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        try {
          await vpnInstance.create(vpnConfig);
          hilog.info(domain, tag, '%{public}s', `${caseName} create success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} create fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_create_Promise_static_0500
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_static_0500';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        let vpnConfig: vpnExtension.VpnConfig = {
          vpnId: '123456',
          addresses: [],
          routes: [],
          dnsAddresses: [],
          searchDomains: [""],
          mtu: 1400,
          isIPv4Accepted: false,
          isIPv6Accepted: true,
          isInternal: false,
          isBlocking: true,
          trustedApplications: [""],
          blockedApplications: []
        }
        try {
          await vpnInstance.create(vpnConfig);
          hilog.info(domain, tag, '%{public}s', `${caseName} create success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} create fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_create_Promise_static_0600
     * @tc.number SUB_NetworkManager_VPN_create_Promise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_create_Promise_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_create_Promise_static_0600';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        let vpnConfig: vpnExtension.VpnConfig = {
          vpnId: '123456',
          addresses: [],
          routes: [{
            iface: "eth0",
            destination: {
              address: {
                address:'',
                family:1,
                port:8080
              },
              prefixLength:1
            },
            gateway: {
              address:'',
              family:1,
              port:8080
            },
            hasGateway: true,
            isDefaultRoute: true,
          }],
          dnsAddresses: [""],
          searchDomains: ["114.114.114.114"],
          mtu: 1400,
          isIPv4Accepted: false,
          isIPv6Accepted: true,
          isInternal: false,
          isBlocking: true,
          trustedApplications: ["com.example.vpn_xts"],
          blockedApplications: [""]
        }
        try {
          await vpnInstance.create(vpnConfig);
          hilog.info(domain, tag, '%{public}s', `${caseName} create success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} create fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(error.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_protect_Promise_static_0100
     * @tc.number SUB_NetworkManager_VPN_protect_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_protect_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_protect_Promise_static_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        try {
          await vpnInstance.protect(socketFd);
          hilog.info(domain, tag, '%{public}s', `${caseName} protect success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} protect fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_destroy_Promise_static_0100
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_static_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        try {
          await vpnInstance.destroy();
          hilog.info(domain, tag, '%{public}s', `${caseName} destroy success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} destroy fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNstopVpnExtensionAbilityPromise_static_0100
     * @tc.number SUB_NetworkManager_VPN_stopVpnExtensionAbility_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNstopVpnExtensionAbilityPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNstopVpnExtensionAbilityPromise_static_0100';
      let want: Want = {};
      try {
        vpnExtension.stopVpnExtensionAbility(want);
        hilog.info(domain, tag, '%{public}s', `${caseName} stopVpnExtensionAbility success`);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} stopVpnExtensionAbility fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_generateVpnId_Promise_static_0100
     * @tc.number SUB_NetworkManager_VPN_generateVpnId_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_generateVpnId_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_generateVpnId_Promise_static_0100';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2!);
        try {
          let data = await vpnConnection.generateVpnId();
          hilog.info(domain, tag, '%{public}s', `${caseName} generateVpnId success ${JSON.stringify(data)}`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} generateVpnId fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} generateVpnId error code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_destroy_Promise_static_0200
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_static_0200';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2!);
        let vpnId: string = "test";
        try {
          await vpnConnection.destroy(vpnId);
          hilog.info(domain, tag, '%{public}s', `${caseName} destroy success`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} destroy fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} destroy error code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name SUB_NetworkManager_VPN_destroy_Promise_static_0500
     * @tc.number SUB_NetworkManager_VPN_destroy_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_NetworkManager_VPN_destroy_Promise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_NetworkManager_VPN_destroy_Promise_static_0500';
      try {
        let vpnConnection: vpnExtension.VpnConnection = vpnExtension.createVpnConnection(context2!);
        try {
          await vpnConnection.destroy("");
          hilog.info(domain, tag, '%{public}s', `${caseName} destroy success`);
          expect().assertFail();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} destroy fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect(err.code === 401).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} destroy error code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNContext_static_0100
     * @tc.number SUB_NetworkManager_VPN_context_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNContext_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNContext_static_0100';
      try {
        let vpnExtensionAbility = new VpnExtensionAbility();
        hilog.info(domain, tag, '%{public}s', `${caseName} context ${JSON.stringify(vpnExtensionAbility.context)}`);
        expect(vpnExtensionAbility.context !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} destroy error code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNProtectProcessNetPromise_static_0100
     * @tc.number SUB_NetworkManager_VPN_ProtectProcessNet_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkManagerVPNProtectProcessNetPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNProtectProcessNetPromise_static_0100';
      try {
        let vpnInstance = vpnExtension.createVpnConnection(context2!);
        try {
          await vpnInstance.protectProcessNet();
          hilog.info(domain, tag, '%{public}s', `${caseName} protectProcessNet success`);
          expect().assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} protectProcessNet fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
          expect().assertFail();
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch error, code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect((error as BusinessError).code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNcreateVpnObserver_static_0100
     * @tc.number SUB_NetworkManager_VPN_createVpnObserver_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNcreateVpnObserver_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNcreateVpnObserver_static_0100';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        hilog.info(domain, tag, '%{public}s', `${caseName} createVpnObserver success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} createVpnObserver fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNonAuthorizationResult_static_0100
     * @tc.number SUB_NetworkManager_VPN_onAuthorizationResult_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNonAuthorizationResult_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNonAuthorizationResult_static_0100';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        vpnObserver.onAuthorizationResult((result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult callback ${result}`);
          expect(result === true).assertTrue();
        });
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNonAuthorizationResult_static_0200
     * @tc.number SUB_NetworkManager_VPN_onAuthorizationResult_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNonAuthorizationResult_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNonAuthorizationResult_static_0200';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        vpnObserver.onAuthorizationResult((result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult callback ${result}`);
        });
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult success`);
        vpnObserver.onAuthorizationResult((result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult callback ${result}`);
        });
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNonAuthorizationResult_static_0300
     * @tc.number SUB_NetworkManager_VPN_onAuthorizationResult_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNonAuthorizationResult_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNonAuthorizationResult_static_0300';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        vpnObserver.onAuthorizationResult((result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult callback ${result}`);
          expect(result === false).assertTrue();
        });
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} onAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNoffAuthorizationResult_static_0100
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult_static_0100';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.onAuthorizationResult(callback);
        vpnObserver.offAuthorizationResult(callback);
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNoffAuthorizationResult_static_0200
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult_static_0200';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.offAuthorizationResult(callback);
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult success`);
        hilog.info(domain, tag, '%{public}s', `${caseName} vpnObserver = ${JSON.stringify(vpnObserver)}`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNoffAuthorizationResult_static_0300
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult_static_0300';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.offAuthorizationResult(callback);
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult success`);
        vpnObserver.offAuthorizationResult(callback);
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkManagerVPNoffAuthorizationResult_static_0400
     * @tc.number SUB_NetworkManager_VPN_offAuthorizationResult_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerVPNoffAuthorizationResult_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'testNetworkManagerVPNoffAuthorizationResult_static_0400';
      try {
        let vpnObserver = vpnExtension.createVpnObserver();
        let callback = (result: boolean) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult callback ${result}`);
        };
        vpnObserver.onAuthorizationResult(callback);
        vpnObserver.offAuthorizationResult();
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult success`);
        expect(vpnObserver !== undefined).assertTrue();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${caseName} offAuthorizationResult fail code: ${JSON.stringify(error?.code)}, message: ${JSON.stringify(error?.message)}`);
        expect().assertFail();
        done();
      }
    });
  });
}
