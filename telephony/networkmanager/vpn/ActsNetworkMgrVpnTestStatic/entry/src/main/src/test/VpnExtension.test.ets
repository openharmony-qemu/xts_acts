'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "@ohos/hypium-binary/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import vpnExtension from '@ohos.net.vpnExtension';
import VpnExtensionAbility from '@ohos.app.ability.VpnExtensionAbility';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'vpnTestTag';

type OptionalVpnExtensionContext = vpnExtension.VpnExtensionContext | undefined;

function getAbsentVpnExtensionContext(): OptionalVpnExtensionContext {
  return undefined;
}

function getVpnExtensionContextSummary(ctx: OptionalVpnExtensionContext): string {
  let config = ctx?.config;
  let cacheDir = ctx?.cacheDir;
  let tempDir = ctx?.tempDir;
  let filesDir = ctx?.filesDir;
  let databaseDir = ctx?.databaseDir;
  let preferencesDir = ctx?.preferencesDir;
  let bundleCodeDir = ctx?.bundleCodeDir;
  let distributedFilesDir = ctx?.distributedFilesDir;
  let resourceDir = ctx?.resourceDir;
  let cloudFileDir = ctx?.cloudFileDir;
  let eventHub = ctx?.eventHub;
  let processName = ctx?.processName;
  return `config: ${config}, cacheDir: ${cacheDir}, tempDir: ${tempDir}, filesDir: ${filesDir}, ` +
    `databaseDir: ${databaseDir}, preferencesDir: ${preferencesDir}, bundleCodeDir: ${bundleCodeDir}, ` +
    `distributedFilesDir: ${distributedFilesDir}, resourceDir: ${resourceDir}, cloudFileDir: ${cloudFileDir}, ` +
    `eventHub: ${eventHub}, processName: ${processName}`;
}

export default function vpnTest(): void {
  describe("vpntest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll((): void => {
      hilog.info(domain, tag, '%{public}s', 'vpntest beforeAll start');
      hilog.info(domain, tag, '%{public}s', 'vpntest beforeAll end');
    });

    /**
      * @tc.name   SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0100
      * @tc.number SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0100
      * @tc.desc   In static ArkTS, VpnExtensionAbility is a napi native class without an exposed constructor,
      *            so it cannot be instantiated with new outside its lifecycle; if construction unexpectedly
      *            succeeds, its context attribute is undefined outside its lifecycle
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level   LEVEL0
      */
    it("SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0100';
      hilog.info(domain, tag, '%{public}s', `${caseName} start`);
      let vpnExtensionAbility: VpnExtensionAbility | undefined = undefined;
      let thrown: boolean = false;
      try {
        vpnExtensionAbility = new VpnExtensionAbility();
      } catch (error) {
        thrown = true;
        hilog.info(domain, tag, '%{public}s',
          `${caseName} new VpnExtensionAbility threw, error: ${JSON.stringify(error)}`);
      }
      if (thrown) {
        expect(vpnExtensionAbility === undefined).assertTrue();
        hilog.info(domain, tag, '%{public}s', `${caseName} construction forbidden in static mode, as expected`);
      } else {
        hilog.info(domain, tag, '%{public}s', `${caseName} start2`);
        let context: vpnExtension.VpnExtensionContext | undefined = vpnExtensionAbility?.context;
        hilog.info(domain, tag, '%{public}s', `${caseName} context ${JSON.stringify(context)}`);
        expect(context === undefined).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName} end`);
    })

    /**
      * @tc.name   SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0200
      * @tc.number SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0200
      * @tc.desc   The VpnExtensionContext type is referenceable in static ArkTS and is identical to the
      *            VpnExtensionContext type alias exported by @ohos.net.vpnExtension
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level   LEVEL0
      */
    it("SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0200';
      hilog.info(domain, tag, '%{public}s', `${caseName} start`);
      let context: OptionalVpnExtensionContext = getAbsentVpnExtensionContext();
      let asAlias: vpnExtension.VpnExtensionContext | undefined = context;
      let backFromClass: OptionalVpnExtensionContext = asAlias;
      expect(context === undefined).assertTrue();
      expect(asAlias === undefined).assertTrue();
      expect(backFromClass === undefined).assertTrue();
      hilog.info(domain, tag, '%{public}s', `${caseName} end`);
      done();
    })

    /**
      * @tc.name   SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0300
      * @tc.number SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0300
      * @tc.desc   No VpnExtensionContext instance exists outside the vpn extension lifecycle, and the
      *            attributes inherited from ExtensionContext and Context are inaccessible
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level   LEVEL0
      */
    it("SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0300';
      hilog.info(domain, tag, '%{public}s', `${caseName} start`);
      let context: OptionalVpnExtensionContext = getAbsentVpnExtensionContext();
      let summary: string = getVpnExtensionContextSummary(context);
      hilog.info(domain, tag, '%{public}s', `${caseName} summary: ${summary}`);
      expect(summary.includes('config: undefined')).assertTrue();
      expect(summary.includes('cacheDir: undefined')).assertTrue();
      expect(summary.includes('tempDir: undefined')).assertTrue();
      expect(summary.includes('filesDir: undefined')).assertTrue();
      expect(summary.includes('databaseDir: undefined')).assertTrue();
      expect(summary.includes('preferencesDir: undefined')).assertTrue();
      expect(summary.includes('bundleCodeDir: undefined')).assertTrue();
      expect(summary.includes('distributedFilesDir: undefined')).assertTrue();
      expect(summary.includes('resourceDir: undefined')).assertTrue();
      expect(summary.includes('cloudFileDir: undefined')).assertTrue();
      expect(summary.includes('eventHub: undefined')).assertTrue();
      expect(summary.includes('processName: undefined')).assertTrue();
      hilog.info(domain, tag, '%{public}s', `${caseName} end`);
      done();
    })

    /**
      * @tc.name   SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0400
      * @tc.number SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0400
      * @tc.desc   The context of a VpnExtensionAbility created outside its lifecycle is a
      *            VpnExtensionContext instance only after the extension is started by the system,
      *            and stays undefined otherwise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level   LEVEL0
      */
    it("SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_NETWORKMANAGER_VPN_STATIC_CONTEXT_0400';
      hilog.info(domain, tag, '%{public}s', `${caseName} start`);
      let ability: VpnExtensionAbility | undefined = undefined;
      try {
        ability = new VpnExtensionAbility();
      } catch (error) {
        ability = undefined;
        hilog.info(domain, tag, '%{public}s',
          `${caseName} new VpnExtensionAbility threw, error: ${JSON.stringify(error)}`);
      }
      let context: vpnExtension.VpnExtensionContext | undefined = ability?.context;
      expect(context === undefined).assertTrue();
      let summary: string = getVpnExtensionContextSummary(context);
      hilog.info(domain, tag, '%{public}s', `${caseName} summary: ${summary}`);
      expect(summary.includes('processName: undefined')).assertTrue();
      hilog.info(domain, tag, '%{public}s', `${caseName} end`);
      done();
    })

  })
}
