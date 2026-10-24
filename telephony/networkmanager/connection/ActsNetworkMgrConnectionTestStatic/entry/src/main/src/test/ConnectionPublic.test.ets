'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import socket from '@ohos.net.socket';
import policy from '@ohos.net.policy';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import geoLocationManager from '@ohos.geoLocationManager';

let g_context: common.UIAbilityContext;

let domain: int = 0x0000;
let tag: string = 'ConnectionTestTag';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export async function changedLocationMode() {
  let locationEnabled: boolean = geoLocationManager.isLocationEnabled()
  hilog.info(domain, tag, '[lbs_js] getLocationSwitchState result: ' + JSON.stringify(locationEnabled));
  if (!locationEnabled) {
    try {
      geoLocationManager.enableLocation((err) => {
        if (err) {
          hilog.error(domain, tag, "[lbs_js] enableLocation error." + JSON.stringify(err));
        }
      });
    } catch (err) {
      hilog.error(domain, tag, "[lbs_js] enableLocation catch error." + JSON.stringify(err));
    }
  }
}

function isValidIp(ip: string): boolean {
  if (typeof ip !== 'string' || ip.length === 0) {
    return false;
  }

  const ipv4Regex =
    new RegExp(
      '^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
  if (ipv4Regex.test(ip)) {
    return true;
  }

  const ipv6Regex = new RegExp(
    '^(' +
      '([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|' +
      '([0-9a-fA-F]{1,4}:){1,7}:|' +
      '([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|' +
      '([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|' +
      '([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|' +
      '([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|' +
      '([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|' +
      '[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|' +
      ':((:[0-9a-fA-F]{1,4}){1,7}|:)|' +
      'fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|' +
      '::(ffff(:0{1,4}){0,1}:){0,1}' +
      '((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}' +
      '(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|' +
      '([0-9a-fA-F]{1,4}:){1,4}:' +
      '((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}' +
      '(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])' +
      ')$'
  );
  if (ipv6Regex.test(ip)) {
    return true;
  }

  return false;
}

export default function ConnectionPublicTest(): void {
  describe("ConnectionPublicTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    beforeAll(async () => {
      await changedLocationMode();
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      let cmd = "aa start -a EntryAbility -b com.example.connectionHasNet.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      hilog.info(domain, tag, 'user:' + JSON.stringify(user));
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(4000);
      g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, 'get UIAbilityContext end');
      try {
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
      } catch (err) {
        hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
      }
      await Utils.msSleep(2000);
      await Utils.clickRequestPermission('仅使用期间允许');
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   testNetworkMgrConnectionHasDefaultNet_static_0100
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNet_0100
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionHasDefaultNet_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionHasDefaultNet_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.hasDefaultNet((error: BusinessError<void> | null, data: boolean | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' hasDefaultNet: data ->' + data);
              ExpectTrue(data === true);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHasDefaultNet_static_0600
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNet_0600
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionHasDefaultNet_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionHasDefaultNet_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let data = await connection.hasDefaultNet();
            hilog.info(domain, tag, '%{public}s', caseName + ': hasDefaultNet data ->' + data);
            ExpectTrue(data === true);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHasDefaultNetSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNetSync_0100
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionHasDefaultNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionHasDefaultNetSync_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let isDefaultNet: boolean = connection.hasDefaultNetSync();
          ExpectTrue(isDefaultNet === true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0100
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0100
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection();
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0200
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0200
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
            }
          });
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0300
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0300
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
            }
          }, 5000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0400
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0400
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
            }
          }, 10);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0500
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0500
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
            }
          }, -1000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0600
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0600
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI]
            }
          });
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0700
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0700
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI]
            }
          }, 5000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0800
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0800
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI]
            }
          }, 10);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0900
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0900
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI]
            }
          }, -1000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1000
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1000
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1000";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
            }
          });
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1100
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1100
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
            }
          }, 5000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1200
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1200
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
            }
          }, 10);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1300
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1300
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
            }
          }, -1000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1400
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1400
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_VPN]
            }
          });
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1500
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1500
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_VPN]
            }
          }, 5000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1600
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1600
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_VPN]
            }
          }, 10);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1700
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1700
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_VPN]
            }
          }, -1000);
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1800
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1800
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              networkCap: [],
              bearerTypes: []
            }
          });
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1900
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1900
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              networkCap: [connection.NetCap.NET_CAPABILITY_PORTAL,
                connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY],
              bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
            }
          });
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0100
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultNetCallback_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + ' data -> ' + JSON.stringify(data) + ' err -> ' + JSON.stringify(err));
            if (err?.code === 0) {
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetCallback_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0200
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultNetCallback_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + ' data -> ' + JSON.stringify(data) + ' err -> ' + JSON.stringify(err));
            if (err?.code === 0) {
              if (data !== undefined) {
                ExpectTrue(data.netId !== 0);
              } else {
                ExpectFail();
              }
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetPromise_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0100
     * @tc.desc   test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultNetPromise_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let data = await connection.getDefaultNet();
            let netBlockStatus: connection.NetBlockStatusInfo = {
              netHandle: data,
              blocked: true
            }
            hilog.info(domain, tag, '%{public}s', caseName + ':getDefaultNet: data-' + JSON.stringify(data));
            ExpectTrue(typeof data.netId === 'int');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetPromise_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0200
     * @tc.desc   test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultNetPromise_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let data = await connection.getDefaultNet();
            let netBlockStatus: connection.NetBlockStatusInfo = {
              netHandle: data,
              blocked: true
            }
            hilog.info(domain, tag, '%{public}s', caseName + ':getDefaultNet: data-' + JSON.stringify(data));
            if (data !== undefined) {
              ExpectTrue(data.netId !== 0);
            } else {
              ExpectFail();
            }
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNetSync_0100
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          ExpectTrue(typeof netHandle.netId === 'int');
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetSync_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNetSync_0200
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          if (netHandle !== undefined) {
            ExpectTrue(netHandle.netId !== 0);
          } else {
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0100
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultHttpProxy((err: BusinessError<void> | null, data: connection.HttpProxy | undefined) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + ' getDefaultHttpProxy data -> ' + JSON.stringify(data) + ' err -> ' + JSON.stringify(err));
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' getDefaultHttpProxy success ');
              ExpectTrue(data !== undefined);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0200
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            hilog.info(domain, tag, '%{public}s', caseName + ': netHandle ->' + JSON.stringify(netHandle));
            connection.setAppNet(netHandle, (err: BusinessError<void> | null) => {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
              if (err?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
            await Utils.msSleep(2000);
            connection.getDefaultHttpProxy((err: BusinessError<void> | null,
              data: connection.HttpProxy | undefined) => {
              hilog.info(domain, tag, '%{public}s',
                caseName + ' data -> ' + JSON.stringify(data) + ' err -> ' + JSON.stringify(err));
              ExpectTrue(data !== undefined);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0300
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0300
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultHttpProxy((err: BusinessError<void> | null, data: connection.HttpProxy | undefined) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + ' getDefaultHttpProxy data -> ' + JSON.stringify(data) + ' err -> ' + JSON.stringify(err));
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s',
                caseName + `getDefaultHttpProxy success, data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data.host !== null);
                ExpectTrue(data.port !== null);
                ExpectTrue(data.username !== null);
                ExpectTrue(data.password !== null);
                if (data.exclusionList !== undefined) {
                  ExpectTrue(data.exclusionList.length > 0);
                } else {
                  ExpectFail();
                }
              } else {
                ExpectFail();
              }
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Promise_0100
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let data = await connection.getDefaultHttpProxy();
            hilog.info(domain, tag, '%{public}s', caseName + ': getDefaultHttpProxy data ->' + JSON.stringify(data));
            ExpectTrue(data !== undefined);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Promise_0200
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let data = await connection.getDefaultHttpProxy();
            hilog.info(domain, tag, '%{public}s', caseName + ': getDefaultHttpProxy data ->' + JSON.stringify(data));
            if (data !== undefined) {
              ExpectTrue(data.host !== null);
              ExpectTrue(data.port !== null);
              ExpectTrue(data.username !== null);
              ExpectTrue(data.password !== null);
              if (data.exclusionList !== undefined) {
                ExpectTrue(data.exclusionList.length > 0);
              } else {
                ExpectFail();
              }
            } else {
              ExpectFail();
            }
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNets_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetAllNets_0100
     * @tc.desc   Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNets_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetAllNets_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getAllNets((error: BusinessError<void> | null, data: connection.NetHandle[] | undefined) => {
            if (error?.code === 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ': data ->' + JSON.stringify(data));
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNets_static_0500
     * @tc.number SUB_NetworkMgr_Connection_GetAllNets_0500
     * @tc.desc   Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNets_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetAllNets_static_0500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let data = await connection.getAllNets();
            hilog.info(domain, tag, '%{public}s', caseName + ': getAllNets: success data->' + JSON.stringify(data));
            ExpectTrue(data.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNetsSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetAllNetsSync_0100
     * @tc.desc   Use synchronization method to obtain a list of all connected networks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNetsSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetAllNetsSync_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle[] = connection.getAllNetsSync();
          hilog.info(domain, tag, '%{public}s',
            caseName + ' GetAllNetsSync: success data->' + JSON.stringify(netHandle));
          ExpectTrue(netHandle.length >= 0);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_0100
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.getConnectionProperties(netHandle,
              (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
                if (error?.code === 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
                  ExpectTrue(true);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_0200
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.getConnectionProperties(netHandle,
              (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
                if (error?.code === 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
                  if (data !== undefined) {
                    ExpectTrue(data.interfaceName !== null);
                    ExpectTrue(data.domains !== null);
                    ExpectTrue(data.mtu !== null);
                    if (data.linkAddresses !== undefined) {
                      ExpectTrue(data.linkAddresses.length > 0);
                    } else {
                      ExpectFail();
                    }
                    if (data.dnses !== undefined) {
                      ExpectTrue(data.dnses.length > 0);
                    } else {
                      ExpectFail();
                    }
                    if (data.routes !== undefined) {
                      ExpectTrue(data.routes.length > 0);
                    } else {
                      ExpectFail();
                    }
                  } else {
                    ExpectFail();
                  }
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0600
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_0600
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 200;
            connection.getConnectionProperties(netHandle,
              (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0700
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_0700
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            connection.getConnectionProperties(netHandle,
              (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + '  getConnectionProperties error is ' +
                      `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ':getConnectionProperties  data ->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0800
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_0800
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 23;
            connection.getConnectionProperties(netHandle,
              (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1700
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_1700
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 9999999;
            connection.getConnectionProperties(netHandle,
              (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + '  getConnectionProperties error is ' +
                      `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0900
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_0900
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              let data = await connection.getConnectionProperties(netHandle);
              let netConnectionProInfo: connection.NetConnectionPropertyInfo = {
                netHandle: netHandle,
                connectionProperties: data
              }
              hilog.info(domain, tag, '%{public}s',
                caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
              ExpectTrue(data !== undefined);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s',
                caseName + '  getConnectionProperties error is ' + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1400
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_1400
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 200;
            try {
              let data = await connection.getConnectionProperties(netHandle);
              hilog.info(domain, tag, '%{public}s',
                caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1500
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_1500
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            try {
              let data = await connection.getConnectionProperties(netHandle);
              hilog.info(domain, tag, '%{public}s',
                caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s',
                caseName + '  getConnectionProperties error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1600
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_1600
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 23;
            try {
              let data = await connection.getConnectionProperties(netHandle);
              hilog.info(domain, tag, '%{public}s',
                caseName + ':  getConnectionProperties data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s',
                caseName + '  getConnectionProperties error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1800
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionProperties_1800
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 999999;
            try {
              let data = await connection.getConnectionProperties(netHandle);
              hilog.info(domain, tag, '%{public}s',
                caseName + ': getConnectionProperties data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionPropertiesSync_0100
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': GetConnectionPropertiesSync data ->' + JSON.stringify(connectionProperties));
          ExpectTrue(connectionProperties !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionPropertiesSync_0200
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': GetConnectionPropertiesSync data ->' + JSON.stringify(connectionProperties));
          if (connectionProperties !== undefined) {
            ExpectTrue(connectionProperties.interfaceName !== null);
            ExpectTrue(connectionProperties.domains !== null);
            ExpectTrue(connectionProperties.mtu !== null);
            if (connectionProperties.linkAddresses !== undefined) {
              ExpectTrue(connectionProperties.linkAddresses.length > 0);
            } else {
              ExpectFail();
            }
            if (connectionProperties.dnses !== undefined) {
              ExpectTrue(connectionProperties.dnses.length > 0);
            } else {
              ExpectFail();
            }
            if (connectionProperties.routes !== undefined) {
              ExpectTrue(connectionProperties.routes.length > 0);
            } else {
              ExpectFail();
            }
          } else {
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionPropertiesSync_0600
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 200;
          let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': GetConnectionPropertiesSync data ->' + JSON.stringify(connectionProperties));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionPropertiesSync_0700
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 0;
          let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': GetConnectionPropertiesSync data ->' + JSON.stringify(connectionProperties));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionPropertiesSync_0800
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 23;
          let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ':GetConnectionPropertiesSync data ->' + JSON.stringify(connectionProperties));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900
     * @tc.number SUB_NetworkMgr_Connection_GetConnectionPropertiesSync_0900
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 999999;
          let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': GetConnectionPropertiesSync data ->' + JSON.stringify(connectionProperties));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_0100
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.getNetCapabilities(netHandle,
              (error: BusinessError<void> | null, data: connection.NetCapabilities | undefined) => {
                if (error?.code === 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getNetCapabilities data ->' + JSON.stringify(data));
                  ExpectTrue(true);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_0200
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.getNetCapabilities(netHandle,
              (error: BusinessError<void> | null, data: connection.NetCapabilities | undefined) => {
                if (error?.code === 0) {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getNetCapabilities data ->' + JSON.stringify(data));
                  if (data !== undefined) {
                    ExpectTrue(data.linkUpBandwidthKbps !== null);
                    ExpectTrue(data.linkDownBandwidthKbps !== null);
                    let networkCap = data.networkCap;
                    if (networkCap !== undefined) {
                      ExpectTrue(networkCap.length > 0);
                    } else {
                      ExpectFail();
                    }
                    if (data.bearerTypes !== undefined) {
                      ExpectTrue(data.bearerTypes.length > 0);
                    } else {
                      ExpectFail();
                    }
                  } else {
                    ExpectFail();
                  }
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0600
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_0600
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 200;
            connection.getNetCapabilities(netHandle,
              (error: BusinessError<void> | null, data: connection.NetCapabilities | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': getNetCapabilities data ->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0700
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_0700
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            connection.getNetCapabilities(netHandle,
              (error: BusinessError<void> | null, data: connection.NetCapabilities | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + 'callback: success data-> ' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0800
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_0800
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 23;
            connection.getNetCapabilities(netHandle,
              (error: BusinessError<void> | null, data: connection.NetCapabilities | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + ': callback: success data->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1700
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_1700
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 9999999;
            connection.getNetCapabilities(netHandle,
              (error: BusinessError<void> | null, data: connection.NetCapabilities | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + ': data ->' + JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0900
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_0900
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              let data = await connection.getNetCapabilities(netHandle);
              let netCapInfo: connection.NetCapabilityInfo = {
                netHandle: netHandle,
                netCap: data
              }
              hilog.info(domain, tag, '%{public}s', caseName + ': GetNetCapabilities data ->' + JSON.stringify(data));
              ExpectTrue(data !== undefined);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  GetNetCapabilities error is ' + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet: err->' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1000
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_1000
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1000";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              let data = await connection.getNetCapabilities(netHandle);
              let netCapInfo: connection.NetCapabilityInfo = {
                netHandle: netHandle,
                netCap: data
              }
              hilog.info(domain, tag, '%{public}s', caseName + ': GetNetCapabilities data ->' + JSON.stringify(data));
              if (data !== undefined) {
                ExpectTrue(data.linkUpBandwidthKbps !== null);
                ExpectTrue(data.linkDownBandwidthKbps !== null);
                let networkCap = data.networkCap;
                if (networkCap !== undefined) {
                  ExpectTrue(networkCap.length > 0);
                } else {
                  ExpectFail();
                }
                if (data.bearerTypes !== undefined) {
                  ExpectTrue(data.bearerTypes.length > 0);
                } else {
                  ExpectFail();
                }
              } else {
                ExpectFail();
              }
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  GetNetCapabilities error is ' + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet: err->' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1400
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_1400
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 200;
            try {
              let data = await connection.getNetCapabilities(netHandle);
              hilog.info(domain, tag, '%{public}s', caseName + ':GetNetCapabilities data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  GetNetCapabilities error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1500
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_1500
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            try {
              let data = await connection.getNetCapabilities(netHandle);
              hilog.info(domain, tag, '%{public}s', caseName + ':GetNetCapabilities  data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  GetNetCapabilities error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1600
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_1600
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 23;
            try {
              let data = await connection.getNetCapabilities(netHandle);
              hilog.info(domain, tag, '%{public}s', caseName + ':GetNetCapabilities data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  GetNetCapabilities error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1800
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilities_1800
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 999999;
            try {
              let data = await connection.getNetCapabilities(netHandle);
              hilog.info(domain, tag, '%{public}s', caseName + ':GetNetCapabilities  data ->' + JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } catch (err) {
              hilog.info(domain, tag, '%{public}s', caseName + '  GetNetCapabilities error is ' + JSON.stringify(err));
              ExpectTrue(err.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  getDefaultNet error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilitiesSync_0100
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': getNetCapabilitiesSync data ->' + JSON.stringify(getNetCapAbilitiesSync));
          ExpectTrue(getNetCapAbilitiesSync !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilitiesSync_0200
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          let data: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s', caseName + ': getNetCapabilitiesSync data ->' + JSON.stringify(data));
          if (data !== undefined) {
            ExpectTrue(data.linkUpBandwidthKbps !== null);
            ExpectTrue(data.linkDownBandwidthKbps !== null);
            let networkCap = data.networkCap;
            if (networkCap !== undefined) {
              ExpectTrue(networkCap.length > 0);
            } else {
              ExpectFail();
            }
            if (data.bearerTypes !== undefined) {
              ExpectTrue(data.bearerTypes.length > 0);
            } else {
              ExpectFail();
            }
          } else {
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilitiesSync_0600
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 200;
          let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': getNetCapabilitiesSync data ->' + JSON.stringify(getNetCapAbilitiesSync));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilitiesSync_0700
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 0;
          let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': getNetCapabilitiesSync data ->' + JSON.stringify(getNetCapAbilitiesSync));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilitiesSync_0800
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 23;
          let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': getNetCapabilitiesSync data ->' + JSON.stringify(getNetCapAbilitiesSync));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900
     * @tc.number SUB_NetworkMgr_Connection_GetNetCapabilitiesSync_0900
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          netHandle.netId = 9999999;
          let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
          hilog.info(domain, tag, '%{public}s',
            caseName + ': getNetCapabilitiesSync data ->' + JSON.stringify(getNetCapAbilitiesSync));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectTrue(err.code === 2100001);
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0100
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_MMS === 0);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0200
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_METERED === 11);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0300
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0300
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_INTERNET === 12);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0400
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0400
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_VPN === 15);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0500
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_VALIDATED === 16);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0600
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_PORTAL === 17);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0700
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0700
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCap_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          ExpectTrue(connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY === 31);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0100
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0100
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.setAppHttpProxy({
            host: '192.168.1.1',
            port: 8080,
            exclusionList: ['192.168', 'baidu.com'],
            username: 'admin',
            password: '123456'
          } as connection.HttpProxy);
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0200
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0200
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.setAppHttpProxy({
            host: '127.0.0.1',
            port: 8080,
            exclusionList: ['127.0', 'baidu.com'],
            username: 'admin',
            password: '123456'
          } as connection.HttpProxy);
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0300
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0300
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0300';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.setAppHttpProxy({
            host: '127.0.0.1',
            port: 8080,
            exclusionList: ['*'],
            username: 'admin',
            password: '123456'
          } as connection.HttpProxy);
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0400
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0400
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.setAppHttpProxy({
            host: '192.168.1.1',
            port: 8080,
            exclusionList: [],
            username: 'admin',
            password: '123456'
          } as connection.HttpProxy);
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0500
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0500
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0500';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.setAppHttpProxy({
            host: '192.168.1.1',
            port: 8080,
            exclusionList: [""],
            username: 'admin',
            password: '123456'
          } as connection.HttpProxy);
          ExpectTrue(true);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0100
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
              networkCap: [connection.NetCap.NET_CAPABILITY_MMS,
                connection.NetCap.NET_CAPABILITY_NOT_METERED,
                connection.NetCap.NET_CAPABILITY_INTERNET,
                connection.NetCap.NET_CAPABILITY_NOT_VPN,
                connection.NetCap.NET_CAPABILITY_VALIDATED],
              linkUpBandwidthKbps: 0,
              linkDownBandwidthKbps: 0
            }
          });
          hilog.info(domain, tag, '%{public}s', caseName + ':  netCon->' + JSON.stringify(netCon));
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0200
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
              networkCap: [connection.NetCap.NET_CAPABILITY_MMS,
                connection.NetCap.NET_CAPABILITY_NOT_METERED,
                connection.NetCap.NET_CAPABILITY_INTERNET,
                connection.NetCap.NET_CAPABILITY_NOT_VPN,
                connection.NetCap.NET_CAPABILITY_VALIDATED],
              linkUpBandwidthKbps: 9999999,
              linkDownBandwidthKbps: 9999999
            }
          });
          hilog.info(domain, tag, '%{public}s', caseName + ': netCon-> ->' + JSON.stringify(netCon));
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0300
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0300
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_WIFI],
            },
            bearerPrivateIdentifier: 'wifi'
          });
          hilog.info(domain, tag, '%{public}s', caseName + ': netCon-> ->' + JSON.stringify(netCon));
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0400
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0400
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netCon: connection.NetConnection = connection.createNetConnection({
            netCapabilities: {
              bearerTypes: [connection.NetBearType.BEARER_ETHERNET],
            },
            bearerPrivateIdentifier: 'slot0'
          });
          hilog.info(domain, tag, '%{public}s', caseName + ': netCon-> ->' + JSON.stringify(netCon));
          ExpectTrue(netCon !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0100
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0100
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.interfaceName === 'string');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0200
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0200
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.domains === 'string');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0300
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0300
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(data?.linkAddresses !== undefined);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0400
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0400
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(data?.routes !== undefined);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0500
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0500
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(data?.dnses !== undefined);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0600
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0600
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.mtu === 'int');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0700
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0700
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.interfaceName === 'string');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0800
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0800
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.domains === 'string');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0900
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0900
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(data.linkAddresses.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_1000
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_1000
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1000";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(data.routes.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_1100
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_1100
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(data.dnses.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_1200
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_1200
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.mtu === 'int');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0200
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0200
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].destination === 'object');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0300
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0300
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].gateway === 'object');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0400
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0400
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].hasGateway === 'boolean');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0500
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0500
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].isDefaultRoute === 'boolean');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0700
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0700
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0700";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination === 'object');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0800
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0800
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0800";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].gateway === 'object');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0900
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0900
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0900";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].hasGateway === 'boolean');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_1000
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_1000
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_1000";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].isDefaultRoute === 'boolean');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_1100
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_1100
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRouteInfo_static_1100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].iface !== null);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0100
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0100
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].destination.prefixLength === 'int');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0200
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0200
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].destination.address === 'object');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0300
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0300
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.address === 'object');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0400
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0400
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.prefixLength === 'int');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0100
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetAddress_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(typeof data?.routes[0].destination.address.address === 'string');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0200
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetAddress_static_0200";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                ExpectTrue(data?.routes[0].destination.address.family === 1 ||
                  data?.routes[0].destination.address.family === 2);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0300
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0300
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetAddress_static_0300";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          connection.getConnectionProperties(netHandle,
            (error: BusinessError<void> | null, data: connection.ConnectionProperties | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  caseName + '  getConnectionProperties: BusinessError-> ' +
                    `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ': getConnectionProperties: data->' + JSON.stringify(data));
                let portTypeof: string = typeof data?.routes[0]?.destination?.address?.port;
                hilog.info(domain, tag, '%{public}s', caseName + ': portTypeof ->' + portTypeof);
                ExpectTrue(portTypeof === 'int' || portTypeof === 'undefined');
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0400
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0400
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetAddress_static_0400";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.address.address === 'string');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0500
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetAddress_static_0500";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            ExpectTrue(data.routes[0].destination.address.family === 1 ||
              data.routes[0].destination.address.family === 2);
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0600
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionNetAddress_static_0600";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          try {
            let data = await connection.getConnectionProperties(netHandle);
            hilog.info(domain, tag, '%{public}s',
              caseName + ': getConnectionProperties: success data ->' + JSON.stringify(data));
            let portTypeof: string = typeof data?.routes[0]?.destination?.address?.port;
            hilog.info(domain, tag, '%{public}s', caseName + ': portTypeof ->' + portTypeof);
            ExpectTrue(portTypeof === 'int' || portTypeof === 'undefined');
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRegister_static_0100
     * @tc.number SUB_NetworkMgr_Connection_Register_0100
     * @tc.desc   test subscribe to notifications of specified network status changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRegister_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionRegister_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netCon: connection.NetConnection = connection.createNetConnection();
          netCon.register((err: BusinessError<void> | null) => {
            hilog.info(domain, tag, '%{public}s', caseName + ' register callback: ' + JSON.stringify(err));
            if (err?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
          await Utils.msSleep(1000);
          netCon.unregister((error: BusinessError<void> | null) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' unregister fail error ' +
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' unregister success ');
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch: err-> ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionUnregister_static_0600
     * @tc.number SUB_NetworkMgr_Connection_Unregister_0600
     * @tc.desc   test unsubscribe from notifications of default network state changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionUnregister_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionUnregister_static_0600";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netCon: connection.NetConnection = connection.createNetConnection();
          netCon.unregister((err: BusinessError<void> | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  unregister callback: ' +
                `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
              ExpectTrue(err?.code === 2101007);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' unregister success ');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch: err-> ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNetCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_Callback_0100
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNetCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNetCallback_static_0100";
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          let netHandle = await connection.getDefaultNet();
          netHandle.netId = -1;
          hilog.info(domain, tag, '%{public}s', caseName + ': netHandle ->' + JSON.stringify(netHandle));
          connection.setAppNet(netHandle, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
              `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
            if (err !== undefined) {
              ExpectTrue(err?.code === 2100001);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + ' error is ' + JSON.stringify(error));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionAddCustomDnsRule_static_0100
     * @tc.number SUB_NetworkMgr_Connection_AddCustomDnsRule_0100
     * @tc.desc   Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionAddCustomDnsRule_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError | null) => {
            hilog.error(domain, tag, '%{public}s',
              `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            } else {
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionAddCustomDnsRule_static_0400
     * @tc.number SUB_NetworkMgr_Connection_AddCustomDnsRule_0400
     * @tc.desc   Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionAddCustomDnsRule_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          try {
            await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
            hilog.error(domain, tag, '%{public}s', `${caseName} success`);
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          } catch (error) {
            hilog.error(domain, tag, '%{public}s',
              `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionAddCustomDnsRule_static_0700
     * @tc.number SUB_NetworkMgr_Connection_AddCustomDnsRule_0700
     * @tc.desc   Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionAddCustomDnsRule_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.addCustomDnsRule("192.168.1.1", [], (error: BusinessError | null) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectTrue(error?.code === 401);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            } else {
              hilog.error(domain, tag, '%{public}s',
                `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 401);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRemoveCustomDnsRule_static_0100
     * @tc.number SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0100
     * @tc.desc   Delete custom DNS rules for the corresponding host in the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + '---Start');
        try {
          try {
            await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
            connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError | null) => {
              hilog.error(domain, tag, '%{public}s', caseName + ' error: ' +
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              if (error?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---End');
                done();
              } else {
                ExpectTrue(true);
                hilog.info(domain, tag, '%{public}s', caseName + '---End');
                done();
              }
            });
          } catch (error) {
            hilog.error(domain, tag, '%{public}s',
              caseName + ' error: ' + `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---End');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' test failed err: ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---End');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionRemoveCustomDnsRule_static_0400
     * @tc.number SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0400
     * @tc.desc   Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRemoveCustomDnsRule_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + '---Start');
        try {
          try {
            await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
            try {
              await connection.removeCustomDnsRule("192.168.1.1");
              hilog.error(domain, tag, '%{public}s', caseName + 'removeCustomDnsRule success');
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName + '---End');
              done();
            } catch (error) {
              hilog.error(domain, tag, '%{public}s', caseName + ' error: ' +
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---End');
              done();
            }
          } catch (error) {
            hilog.error(domain, tag, '%{public}s', caseName + ' addCustomDnsRule error: ' +
              `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName + '---End');
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' test failed err: ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---End');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionClearCustomDnsRules_static_0100
     * @tc.number SUB_NetworkMgr_Connection_ClearCustomDnsRules_0100
     * @tc.desc   Delete all custom DNS rules for the current application.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionClearCustomDnsRules_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          try {
            await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
            connection.clearCustomDnsRules((error: BusinessError | null) => {
              hilog.error(domain, tag, '%{public}s',
                `${caseName} error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              if (error?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
                done();
              } else {
                ExpectTrue(true);
                hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.error(domain, tag, '%{public}s',
              `${caseName} addCustomDnsRule error:code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionClearCustomDnsRules_static_0200
     * @tc.number SUB_NetworkMgr_Connection_ClearCustomDnsRules_0200
     * @tc.desc   Delete all custom DNS rules for the current application . Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionClearCustomDnsRules_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          try {
            await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
            try {
              await connection.clearCustomDnsRules();
              hilog.error(domain, tag, '%{public}s', `${caseName}`);
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            } catch (error) {
              hilog.error(domain, tag, '%{public}s',
                `${caseName} error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.error(domain, tag, '%{public}s',
              `${caseName} addCustomDnsRule error:code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag,
                  `${caseName} error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                if (!data) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
                ExpectTrue(data.address === host);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "xxxx";
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2100002);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0500
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0500';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            try {
              let data = await netHandle.getAddressByName(host);
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0600
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "xxxx";
            try {
              await netHandle.getAddressByName(host);
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectTrue(error?.code === 2100002);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_0900
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0900
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag,
                  `${caseName} error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                if (!data) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
                ExpectTrue(data.address === host);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1000
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1000
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1000';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            try {
              let data = await netHandle.getAddressByName(host);
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1100
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 0;
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              if (error?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                if (!data) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                ExpectTrue(data.address === host);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1200
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 23;
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              if (error?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                if (!data) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                ExpectTrue(data.address === host);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1300
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1300
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 200;
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              if (error?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                if (!data) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                ExpectTrue(data.address === host);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1400
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1400
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1400';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 999999;
            netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              if (error?.code !== 0) {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                if (!data) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                ExpectTrue(data.address === host);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1500
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1500
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1500';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 0;
            try {
              let data = await netHandle.getAddressByName(host);
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1600
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1600
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 23;
            try {
              let data = await netHandle.getAddressByName(host);
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1700
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1700
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1700';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 200;
            try {
              let data = await netHandle.getAddressByName(host);
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1800
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1800
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 999999;
            try {
              let data = await netHandle.getAddressByName(host);
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_1900
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1900
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.getAddressByName("", (error: BusinessError | null, data: connection.NetAddress | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2100001);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_2200
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_2200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_2200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              await netHandle.getAddressByName("");
            } catch (error) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. error:code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectTrue(error?.code === 2100001);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0100';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  if (!data || data.length === 0) {
                    hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                    ExpectFail();
                    hilog.info(domain, tag, `%{public}s---End`, caseName);
                    done();
                    return;
                  }
                  hilog.info(domain, tag, `%{public}s  data:%{public}s`, caseName, JSON.stringify(data));
                  ExpectTrue(data.length > 0);
                  ExpectTrue(data[0].address === host);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0200';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "xxxx";
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                    JSON.stringify(error));
                  ExpectTrue(error?.code === 2100002);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0500
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0500';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            try {
              let data = await netHandle.getAddressesByName(host);
              hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
              ExpectTrue(data.length > 0);
              ExpectTrue(data[0].address === host);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0600
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0600';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "xxxx";
            try {
              await netHandle.getAddressesByName(host);
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectTrue(error?.code === 2100002);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_0900
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0900
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0900';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  if (!data || data.length === 0) {
                    hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                    ExpectFail();
                    hilog.info(domain, tag, `%{public}s---End`, caseName);
                    done();
                    return;
                  }
                  hilog.info(domain, tag, `%{public}s  data:%{public}s`, caseName, JSON.stringify(data));
                  ExpectTrue(data.length > 0);
                  ExpectTrue(data[0].address === host);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1000
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1000
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1000';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            try {
              let data = await netHandle.getAddressesByName(host);
              hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
              ExpectTrue(data.length > 0);
              ExpectTrue(data[0].address === host);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1100
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1100';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            netHandle.netId = 0;
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  if (!data || data.length === 0) {
                    hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                    ExpectFail();
                    hilog.info(domain, tag, `%{public}s---End`, caseName);
                    done();
                    return;
                  }
                  hilog.info(domain, tag, `%{public}s  data:%{public}s`, caseName, JSON.stringify(data));
                  ExpectTrue(data.length > 0);
                  ExpectTrue(data[0].address === host);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1200
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1200';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            netHandle.netId = 23;
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  if (!data || data.length === 0) {
                    hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                    ExpectFail();
                    hilog.info(domain, tag, `%{public}s---End`, caseName);
                    done();
                    return;
                  }
                  hilog.info(domain, tag, `%{public}s  data:%{public}s`, caseName, JSON.stringify(data));
                  ExpectTrue(data.length > 0);
                  ExpectTrue(data[0].address === host);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1300
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1300
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1300';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            netHandle.netId = 200;
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  if (!data || data.length === 0) {
                    hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                    ExpectFail();
                    hilog.info(domain, tag, `%{public}s---End`, caseName);
                    done();
                    return;
                  }
                  hilog.info(domain, tag, `%{public}s  data:%{public}s`, caseName, JSON.stringify(data));
                  ExpectTrue(data.length > 0);
                  ExpectTrue(data[0].address === host);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1400
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1400
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1400';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "192.168.1.1";
            netHandle.netId = 999999;
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  if (!data || data.length === 0) {
                    hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                    ExpectFail();
                    hilog.info(domain, tag, `%{public}s---End`, caseName);
                    done();
                    return;
                  }
                  hilog.info(domain, tag, `%{public}s  data:%{public}s`, caseName, JSON.stringify(data));
                  ExpectTrue(data.length > 0);
                  ExpectTrue(data[0].address === host);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1500
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1500
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1500';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 0;
            try {
              let data = await netHandle.getAddressesByName(host);
              hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
              ExpectTrue(data.length > 0);
              ExpectTrue(data[0].address === host);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1600
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1600
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1600';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 23;
            try {
              let data = await netHandle.getAddressesByName(host);
              hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
              ExpectTrue(data.length > 0);
              ExpectTrue(data[0].address === host);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1700
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1700
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1700';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 200;
            try {
              let data = await netHandle.getAddressesByName(host);
              hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
              ExpectTrue(data.length > 0);
              ExpectTrue(data[0].address === host);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1800
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1800
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1800';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "127.0.0.1";
            netHandle.netId = 999999;
            try {
              let data = await netHandle.getAddressesByName(host);
              hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
              ExpectTrue(data.length > 0);
              ExpectTrue(data[0].address === host);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_1900
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1900
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1900';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "";
            netHandle.getAddressesByName(host,
              (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                    JSON.stringify(error));
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                } else {
                  hilog.info(domain, tag, `%{public}s data: %{public}s`, caseName, JSON.stringify(data));
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                }
              });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} test failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionAddCustomDnsRule_static_0800
     * @tc.number SUB_NetworkMgr_Connection_AddCustomDnsRule_0800
     * @tc.desc   Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionAddCustomDnsRule_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          try {
            await connection.addCustomDnsRule("192.168.1.1", []);
            hilog.error(domain, tag, '%{public}s', `${caseName}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          } catch (error) {
            hilog.error(domain, tag, '%{public}s', `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectTrue(error?.code === 401);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(err?.code === 401);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_2200
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_2200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_2200';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let host: string = "";
            try {
              await netHandle.getAddressesByName(host);
            } catch (error) {
              hilog.info(domain, tag, `%{public}s Failed to get addresses. error:%{public}s`, caseName,
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectTrue(error?.code === 2100001);
              hilog.info(domain, tag, `%{public}s---End`, caseName);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag, `%{public}s test failed error: %{public}s`, caseName, JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, `%{public}s---End`, caseName);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressesByNameCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetAddressesByNameCallback_0100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionGetAddressesByNameCallback_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionGetAddressesByNameCallback_static_0100';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          connection.getAddressesByName("127.0.0.1",
            (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, `%{public}s---End`, caseName);
                done();
              } else {
                if (!data || data.length === 0) {
                  hilog.info(domain, tag, `%{public}s data is empty or undefined`, caseName);
                  ExpectFail();
                  hilog.info(domain, tag, `%{public}s---End`, caseName);
                  done();
                  return;
                }
                hilog.info(domain, tag, `%{public}s success to get data: %{public}s`, caseName, JSON.stringify(data));
                hilog.info(domain, tag, `%{public}s data.length: %{public}s`, caseName, JSON.stringify(data.length));
                ExpectTrue(data.length > 0);
                ExpectTrue(data[0]?.address === "127.0.0.1");
                hilog.info(domain, tag, `%{public}s---End`, caseName);
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressesByNameCallback_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetAddressesByNameCallback_0200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionGetAddressesByNameCallback_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionGetAddressesByNameCallback_static_0200';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          connection.getAddressesByName("",
            (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `%{public}s error: %{public}s`, caseName, JSON.stringify(error));
                ExpectTrue(error?.code === 2100001);
                hilog.info(domain, tag, `%{public}s---End`, caseName);
                done();
              } else {
                hilog.info(domain, tag, `%{public}s success to get data: %{public}s`, caseName, JSON.stringify(data));
                ExpectFail();
                hilog.info(domain, tag, `%{public}s---End`, caseName);
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressesByNamePromise_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetAddressesByNamePromise_0100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionGetAddressesByNamePromise_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionGetAddressesByNamePromise_static_0100';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          let host: string = "127.0.0.1";
          try {
            let data = await connection.getAddressesByName(host);
            hilog.info(domain, tag, `%{public}s success to get data: %{public}s`, caseName, JSON.stringify(data));
            hilog.info(domain, tag, `%{public}s data.length: %{public}s`, caseName, JSON.stringify(data.length));
            ExpectTrue(data.length > 0);
            ExpectTrue(data[0].address === "127.0.0.1");
            hilog.info(domain, tag, `%{public}s---End`, caseName);
            done();
          } catch (error) {
            hilog.info(domain, tag, `%{public}s failed to getAddressesByName error:%{public}s`, caseName,
              error?.message);
            ExpectFail();
            hilog.info(domain, tag, `%{public}s---End`, caseName);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAddressesByNamePromise_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetAddressesByNamePromise_0200
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrConnectionGetAddressesByNamePromise_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionGetAddressesByNamePromise_static_0200';
        hilog.info(domain, tag, `%{public}s---Start`, caseName);
        try {
          try {
            let data = await connection.getAddressesByName("");
            hilog.info(domain, tag, `%{public}s success to get data: %{public}s`, caseName, JSON.stringify(data));
            hilog.info(domain, tag, `%{public}s data.length: %{public}s`, caseName, JSON.stringify(data.length));
            ExpectFail();
            hilog.info(domain, tag, `%{public}s---End`, caseName);
            done();
          } catch (error) {
            hilog.info(domain, tag, `%{public}s failed to getAddressesByName error:%{public}s`, caseName,
              error?.message);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `%{public}s---End`, caseName);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `%{public}s test failed err: %{public}s`, caseName, JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `%{public}s---End`, caseName);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionOn_static_0100
     * @tc.number SUB_NetworkMgr_Connection_On_0100
     * @tc.desc   Subscribe to network available events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOn_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionOn_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netCon: connection.NetConnection = connection.createNetConnection();
          netCon.register((error: BusinessError | null) => {
            hilog.info(domain, tag,
              `${caseName} register error code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}register success`);
            }
          });
          netCon.onNetAvailable((data: connection.NetHandle) => {
            hilog.info(domain, tag, `${caseName} Succeeded to get data:  + ${JSON.stringify(data)}`);
          });
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionOn_static_0200
     * @tc.number SUB_NetworkMgr_Connection_On_0200
     * @tc.desc   Subscription to network capability change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOn_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionOn_static_0200";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netCon: connection.NetConnection = connection.createNetConnection();
          netCon.register((error: BusinessError | null) => {
            hilog.info(domain, tag,
              `${caseName} register error code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}register success`);
            }
          });
          netCon.onNetCapabilitiesChange((data: connection.NetCapabilityInfo) => {
            hilog.info(domain, tag, `${caseName} Succeeded to get data:  + ${JSON.stringify(data)}`);
          });
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionOn_static_0300
     * @tc.number SUB_NetworkMgr_Connection_On_0300
     * @tc.desc   Subscription network connection information change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOn_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionOn_static_0300";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netCon: connection.NetConnection = connection.createNetConnection();
          netCon.onNetConnectionPropertiesChange((data: connection.NetConnectionPropertyInfo) => {
            hilog.info(domain, tag, `${caseName} Succeeded to get data:  + ${JSON.stringify(data)}`);
            let netHandle = data.netHandle;
            let connectionProperties = data.connectionProperties;
            hilog.info(domain, tag, "netConnectionPropertiesChange netHandle: " + JSON.stringify(netHandle) +
              " ,netConnectionPropertiesChange connectionProperties: " + JSON.stringify(connectionProperties));
            ExpectTrue(data.netHandle.netId >= 100);
            ExpectTrue(data.connectionProperties.linkAddresses.length > 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          netCon.register((error: BusinessError | null) => {
            hilog.info(domain, tag,
              `${caseName} register error code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}register success`);
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetIpNeighTable_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetIpNeighTable_0100
     * @tc.desc   Test GetIpNeighTable Success
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetIpNeighTable_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetIpNeighTable_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let data = await connection.getIpNeighTable();
            if (data.length !== 0) {
              hilog.info(domain, tag, `${caseName}ipAddress:${data[0].ipAddress}`)
              hilog.info(domain, tag, `${caseName}ifaceName:${data[0].iface}`)
              hilog.info(domain, tag, `${caseName}macAddress:${data[0].macAddress}`)
              expect(data.length > 0).assertTrue();
            } else {
              expect(data.length === 0).assertTrue();
              hilog.info(domain, tag, `${caseName} error  fetching ip neigh table errorCode:${data}`);
              ExpectTrue(false);
            }
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} error  fetching ip neigh table errorCode:${error?.code}` +
                `code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectTrue(error.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetSystemNetPortStates_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetSystemNetPortStates_0100
     * @tc.desc   Test GetSystemNetPortStates Success
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetSystemNetPortStates_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetSystemNetPortStates_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          try {
            let data = await connection.getSystemNetPortStates();
            if (data !== undefined && data.tcpPortStatesInfo !== undefined && data.udpPortStatesInfo !== undefined) {
              const tcpList = data.tcpPortStatesInfo!;
              const udpList = data.udpPortStatesInfo!;
              hilog.info(domain, tag, `${caseName} tcpPortStatesInfo length: ${tcpList.length}`);
              hilog.info(domain, tag, `${caseName} udpPortStatesInfo length: ${udpList.length}`);

              for (let i = 0; i < tcpList.length; i++) {
                const tcpItem = tcpList[i];
                hilog.info(domain, tag, `${caseName} tcpItem[${i}]: ${JSON.stringify(tcpItem)}`);

                ExpectTrue(typeof tcpItem.tcpLocalIp === 'string');
                ExpectTrue(isValidIp(tcpItem.tcpLocalIp));

                ExpectTrue(typeof tcpItem.tcpLocalPort === 'int');
                ExpectTrue(tcpItem.tcpLocalPort >= 0 && tcpItem.tcpLocalPort <= 65535);

                ExpectTrue(typeof tcpItem.tcpRemoteIp === 'string');
                ExpectTrue(isValidIp(tcpItem.tcpRemoteIp));

                ExpectTrue(typeof tcpItem.tcpRemotePort === 'int');
                ExpectTrue(tcpItem.tcpRemotePort >= 0 && tcpItem.tcpRemotePort <= 65535);

                ExpectTrue(typeof tcpItem.tcpUid === 'int');
                ExpectTrue(tcpItem.tcpUid >= 0);

                ExpectTrue(typeof tcpItem.tcpPid === 'int');
                ExpectTrue(tcpItem.tcpPid >= 0);

                ExpectTrue(typeof tcpItem.tcpState === 'int');
                ExpectTrue(tcpItem.tcpState >= 0);
              }

              for (let i = 0; i < udpList.length; i++) {
                const udpItem = udpList[i];
                hilog.info(domain, tag, `${caseName} udpItem[${i}]: ${JSON.stringify(udpItem)}`);

                ExpectTrue(typeof udpItem.udpLocalIp === 'string');
                ExpectTrue(isValidIp(udpItem.udpLocalIp));

                ExpectTrue(typeof udpItem.udpLocalPort === 'int');
                ExpectTrue(udpItem.udpLocalPort >= 0 && udpItem.udpLocalPort <= 65535);

                ExpectTrue(typeof udpItem.udpUid === 'int');
                ExpectTrue(udpItem.udpUid >= 0);

                ExpectTrue(typeof udpItem.udpPid === 'int');
                ExpectTrue(udpItem.udpPid >= 0);
              }

              expect(tcpList.length >= 0).assertTrue();
              expect(udpList.length >= 0).assertTrue();
            } else {
              expect(data === undefined).assertTrue();
              hilog.info(domain, tag, `${caseName} error: data or its port states info is undefined`);
              ExpectTrue(false);
            }
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} error fetching system net port states, errorCode:${error?.code} code:${JSON.stringify(
                error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectTrue(error.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_0100
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_0100
     * @tc.desc   Test the API function of TraceRoute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_0100";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 30,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo jumpNo: ${JSON.stringify(TraceRouteInfo[0].jumpNo)}`);
            let jumpNo: number = TraceRouteInfo[0].jumpNo;
            ExpectTrue(jumpNo === 1);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_0200
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_0200
     * @tc.desc   Test the option packetsType is UDP and address of TraceRoute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_0200";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 10,
            packetsType: connection.PacketsType.NETCONN_PACKETS_UDP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo jumpNo: ${JSON.stringify(TraceRouteInfo[0].address)}`);
            let address: string = TraceRouteInfo[0].address;
            ExpectTrue(address !== null && address !== undefined);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_0300
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_0300
     * @tc.desc   Test the option packetsType and max_rtt function of TraceRoute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_0300";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 10,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            let rtt_max: number = TraceRouteInfo[0].rtt[2];
            ExpectTrue(rtt_max >= 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_0400
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_0400
     * @tc.desc   Test the option parameter is not contained in the TraceRoute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_0400";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 30,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            let rtt_max: number = TraceRouteInfo[0].rtt[2];
            ExpectTrue(rtt_max >= 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_0700
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_0700
     * @tc.desc   Test the option parameter no maxJumpNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_0700";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            let rtt_max: number = TraceRouteInfo[0].rtt[2];
            ExpectTrue(rtt_max >= 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_0800
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_0800
     * @tc.desc   Test the destination is IPV4 address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_0800";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "223.5.5.5";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 30,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            let rtt_max: number = TraceRouteInfo[0].rtt[2];
            ExpectTrue(rtt_max >= 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1000
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1000
     * @tc.desc   Test the destination is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1000";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 30,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1300
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1300
     * @tc.desc   Test the destination address invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1300";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "123.invalid.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 30,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            ExpectTrue(TraceRouteInfo.length === 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1400
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1400
     * @tc.desc   Test the destination is localhost
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1400";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "localhost";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 30,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            let jumpNo: number = TraceRouteInfo[0].jumpNo;
            ExpectTrue(jumpNo === 1);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1500
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1500
     * @tc.desc   Test the option maxJumpNumber is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1500";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: -1,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1600
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1600
     * @tc.desc   Test the option maxJumpNumber is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1600";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 0,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1700
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1700
     * @tc.desc   Test the option maxJumpNumber is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1700";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 1,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            ExpectTrue(TraceRouteInfo.length > 0);
            let jumpNo: number = TraceRouteInfo[0].jumpNo;
            ExpectTrue(jumpNo === 1);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_1800
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_1800
     * @tc.desc   Test the option maxJumpNumber is 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_1800";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 31,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          try {
            let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
            hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_2200
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_2200
     * @tc.desc   Test queryTraceRoute concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionTraceRoute_static_2200";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let option: connection.TraceRouteOptions = {
            maxJumpNumber: 5,
            packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
          };
          let promiseArray: Promise<connection.TraceRouteInfo[]>[] = [];
          for (let i = 0; i < 10; i++) {
            promiseArray.push(connection.queryTraceRoute(destination, option));
          }
          try {
            let results = await Promise.all(promiseArray);
            hilog.info(domain, tag, `${caseName} all queryTraceRoute success, results count: ${results.length}`);
            ExpectTrue(results.length === 10);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} queryTraceRoute: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_0100
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_0100
     * @tc.desc   Test the API function of queryProbeResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_0100";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          for (let i = 0; i < 10; i++) {
            let destination = "www.baidu.com";
            let duration = 3;
            try {
              let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
              hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
              hilog.info(domain, tag,
                `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                  ProbeResultInfo.rtt)}`);
              ExpectTrue(ProbeResultInfo.rtt[2] < 3000);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_0500
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_0500
     * @tc.desc   Test the destination is IPV4 address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_0500";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "223.5.5.5";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.rtt[2] < 3000);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_0700
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_0700
     * @tc.desc   Test the destination is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_0700";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_0900
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_0900
     * @tc.desc   Test the destination is "100.192.192.192"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_0900";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "100.192.192.192";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.rtt[2] >= 3000);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1000
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1000
     * @tc.desc   Test the destination is invalid address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1000";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "123.invalid.com";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.rtt[2] >= 3000);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1100
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1100
     * @tc.desc   Test the destination is "localhost"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1100";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "localhost";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.rtt[2] < 3000);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1200
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1200
     * @tc.desc   Test the duration is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1200";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let duration = -1;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1300
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1300
     * @tc.desc   Test the duration is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1300";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let duration = 0;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1400
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1400
     * @tc.desc   Test the duration is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1400";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let duration = 1;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.rtt[2] < 1000);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1500
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1500
     * @tc.desc   Test the ProbeResultInfo lossRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1500";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.lossRate < 100);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1600
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1600
     * @tc.desc   Test the ProbeResultInfo lossRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1600";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "123.invalid.com";
          let duration = 3;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectTrue(ProbeResultInfo.lossRate === 100);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_2000
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_2000
     * @tc.desc   Test the duration is 1001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_2000";
        hilog.info(domain, tag, `${caseName} test Start`);
        try {
          let destination = "www.baidu.com";
          let duration = 1001;
          try {
            let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
            hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
            hilog.info(domain, tag,
              `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(
                ProbeResultInfo.rtt)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} ProbeResultInfo: err-> code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_0100
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0100
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionReportNetConnected_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.reportNetConnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetConnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (err) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_0500
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0500
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0500";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            connection.reportNetConnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetConnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2101006);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag, `${caseName}: error: ${JSON.stringify(error)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_0600
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0600
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0600";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 50;
            connection.reportNetConnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetConnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2101006);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_0700
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0700
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0700";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.reportNetConnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetConnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (err) {
              hilog.info(domain, tag,
                `${caseName} err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_0800
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_0800
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0800";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 9999;
            connection.reportNetConnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetConnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2101006);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (err) {
              hilog.info(domain, tag,
                `${caseName} err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_1000
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_1000
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1000";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              await connection.reportNetConnected(netHandle);
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (err) {
              hilog.info(domain, tag,
                `${caseName} reportNetConnected: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                  err?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (err) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_1400
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_1400
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1400";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            try {
              await connection.reportNetConnected(netHandle);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetConnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_1500
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_1500
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1500";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 50;
            try {
              await connection.reportNetConnected(netHandle);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetConnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_1600
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_1600
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1600";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            if (netHandle.netId > 0) {
              try {
                await connection.reportNetConnected(netHandle);
                hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } catch (error) {
                hilog.info(domain, tag,
                  `${caseName} reportNetConnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                    error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            } else {
              hilog.info(domain, tag, `${caseName} connect: err->please link the network`);
              ExpectFail();
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnected_static_1700
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnected_1700
     * @tc.desc   Report to network management that the network is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetConnected_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1700";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 9999;
            try {
              await connection.reportNetConnected(netHandle);
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetConnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_0100
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_0100
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.reportNetDisconnected(netHandle, (err: BusinessError | null) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag,
                  `${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(netHandle)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
                hilog.info(domain, tag,
                  `${caseName} error1111>code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_0500
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_0500
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0500";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            connection.reportNetDisconnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetDisconnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2101006);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_0600
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_0600
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0600";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 50;
            connection.reportNetDisconnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetDisconnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2101006);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_0700
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_0700
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0700";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            connection.reportNetDisconnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetDisconnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
                ExpectTrue(true);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_0800
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_0800
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0800";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 9999;
            connection.reportNetDisconnected(netHandle, (error: BusinessError | null) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} reportNetDisconnected: BusinessError>code:${JSON.stringify(
                  error?.code)}, message:${JSON.stringify(error?.message)}`);
                ExpectTrue(error?.code === 2101006);
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_1000
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_1000
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1000";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              await connection.reportNetDisconnected(netHandle);
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetDisconnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_1400
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_1400
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1400";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            try {
              await connection.reportNetDisconnected(netHandle);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetDisconnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_1500
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_1500
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1500";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 50;
            try {
              await connection.reportNetDisconnected(netHandle);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetDisconnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_1600
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_1600
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1600";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              await connection.reportNetDisconnected(netHandle);
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetDisconnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetDisconnected_static_1700
     * @tc.number SUB_NetworkMgr_Connection_ReportNetDisconnected_1700
     * @tc.desc   Report the network to network management as unavailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionReportNetDisconnected_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1700";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 9999;
            try {
              await connection.reportNetDisconnected(netHandle);
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} reportNetDisconnected: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAppNet_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetAppNet_0100
     * @tc.desc   Obtain network information bound to the app and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAppNet_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetAppNet_static_0100";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          connection.getAppNet((error: BusinessError | null, data: connection.NetHandle | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag,
                `${caseName} callback: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} callback: success data->${JSON.stringify(data)}`);
              ExpectTrue(data !== undefined);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAppNet_static_0500
     * @tc.number SUB_NetworkMgr_Connection_GetAppNet_0500
     * @tc.desc   Obtain network information bound to the app and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAppNet_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetAppNet_static_0500";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let data = await connection.getAppNet();
            hilog.info(domain, tag, `${caseName} getAppNet: success data->${JSON.stringify(data)}`);
            ExpectTrue(data !== undefined);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetAppNetSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetAppNetSync_0100
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAppNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetAppNetSync_static_0100";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let netHandle: connection.NetHandle = connection.getAppNetSync();
          hilog.info(domain, tag, `${caseName} GetAppNetSync: success data->${JSON.stringify(netHandle)}`);
          ExpectTrue(netHandle !== undefined);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMetered_Callback_0100
     * @tc.desc   test check if the data traffic usage on the current network is being measured and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          connection.isDefaultNetMetered((err: BusinessError | null, data: boolean | undefined) => {
            hilog.info(domain, tag,
              `${caseName} isDefaultNetMetered callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
            if (err?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(data === true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0100
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMetered_Promise_0100
     * @tc.desc   test check if the data traffic usage on the current network is being measured and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          try {
            let data = await connection.isDefaultNetMetered();
            hilog.info(domain, tag, `${caseName} isDefaultNetMetered: data->${JSON.stringify(data)}`);
            ExpectTrue(data === true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            hilog.info(domain, tag,
              `${caseName} isDefaultNetMetered: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_IsDefaultNetMeteredSync_0100
     * @tc.desc   test check if the data traffic usage on the current network is being measured and return it using synchronous mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0100";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let isMetered: boolean = connection.isDefaultNetMeteredSync();
          ExpectTrue(isMetered === true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyPromise0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxyPromise_0200
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise0200";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          connection.getDefaultNet((err: BusinessError | null, netHandle: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, `${caseName} getDefaultHttpProxy promise: err->${JSON.stringify(err)} data->${JSON.stringify(
              netHandle)}`);
            if (err?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (netHandle !== undefined) {
                connection.setAppNet(netHandle, (err: BusinessError | null) => {
                  hilog.info(domain, tag, `${caseName} getDefaultHttpProxy promise: err->code:${JSON.stringify(
                    err?.code)}, message:${JSON.stringify(err?.message)}`);
                  if (err?.code !== 0) {
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }
                });
              } else {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            }
          });
          try {
            let data = await connection.getDefaultHttpProxy();
            hilog.info(domain, tag, `${caseName} getDefaultHttpProxy promise: data->${JSON.stringify(data)}`);
            ExpectTrue(data !== undefined);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} getDefaultHttpProxy promise: err->code:${JSON.stringify(
              err?.code)}, message:${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, 
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_0100
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_0100
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0100";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          connection.getDefaultNet((error: BusinessError | null, netHandle: connection.NetHandle | undefined) => {
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (netHandle !== undefined) {
                connection.setAppNet(netHandle, (error: BusinessError | null) => {
                  if (error?.code !== 0) {
                    hilog.info(domain, tag, `${caseName} SetAppNet: success false`);
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                        error?.message)}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }
                });
              } else {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_0600
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_0600
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0600";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          connection.getDefaultNet((error: BusinessError | null, netHandle: connection.NetHandle | undefined) => {
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (netHandle !== undefined) {
                netHandle.netId = 200;
                connection.setAppNet(netHandle, (error: BusinessError | null) => {
                  if (error?.code !== 0) {
                    hilog.info(domain, tag, `${caseName} SetAppNet: success false`);
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                        error?.message)}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }
                });
              } else {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_0700
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_0700
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0700";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          connection.getDefaultNet((error: BusinessError | null, netHandle: connection.NetHandle | undefined) => {
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (netHandle !== undefined) {
                netHandle.netId = 0;
                connection.setAppNet(netHandle, (error: BusinessError | null) => {
                  if (error?.code !== 0) {
                    hilog.info(domain, tag, `${caseName} SetAppNet: success false`);
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                        error?.message)}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }
                });
              } else {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_0800
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_0800
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0800";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          connection.getDefaultNet((error: BusinessError | null, netHandle: connection.NetHandle | undefined) => {
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (netHandle !== undefined) {
                netHandle.netId = 23;
                connection.setAppNet(netHandle, (error: BusinessError | null) => {
                  if (error?.code !== 0) {
                    hilog.info(domain, tag,
                      `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                        error?.message)}`);
                    ExpectTrue(error?.code === 2100001);
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} SetAppNet: success`);
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }
                });
              } else {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_1700
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_1700
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1700";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          connection.getDefaultNet((error: BusinessError | null, netHandle: connection.NetHandle | undefined) => {
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (netHandle !== undefined) {
                netHandle.netId = 99999999;
                connection.setAppNet(netHandle, (error: BusinessError | null) => {
                  if (error?.code !== 0) {
                    hilog.info(domain, tag, `${caseName} SetAppNet: success`);
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                        error?.message)}`);
                    ExpectTrue(true);
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }
                });
              } else {
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_0900
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_0900
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0900";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            try {
              await connection.setAppNet(netHandle);
              hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_1400
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_1400
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1400";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 200;
            try {
              await connection.setAppNet(netHandle);
              hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_1500
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_1500
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1500";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            try {
              await connection.setAppNet(netHandle);
              hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_1600
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_1600
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1600";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 23;
            try {
              await connection.setAppNet(netHandle);
              hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectTrue(error?.code === 2100001);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_1800
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_1800
     * @tc.desc   Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1800";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 99999999;
            try {
              await connection.setAppNet(netHandle);
              hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetAppNet_static_1900
     * @tc.number SUB_NetworkMgr_Connection_SetAppNet_1900
     * @tc.desc   Bind the app normal network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionSetAppNet_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1900";
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            netHandle.netId = 0;
            try {
              await connection.setAppNet(netHandle);
              hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (error) {
              hilog.info(domain, tag,
                `${caseName} SetAppNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getDefaultNet: err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch: err->code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrPolicyGetNetworkAccessPolicy_static_0100
     * @tc.number SUB_NetworkMgr_Policy_GetNetAccessPolicy_0100
     * @tc.desc   Test etNetAccessPolicy function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrPolicyGetNetworkAccessPolicy_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrPolicyGetNetworkAccessPolicy_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let data = await policy.getNetAccessPolicy();
            hilog.info(domain, tag, `${caseName} getNetworkAccessPolicy data: ${JSON.stringify(data)}`);
            if (data !== null && data !== undefined) {
              ExpectTrue(data.allowWiFi === true);
              ExpectTrue(data.allowCellular === true);
            } else {
              ExpectTrue(false);
            }
            done();
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} getNetworkAccessPolicy error code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectTrue(false);
            hilog.info(domain, tag, `${caseName} test end`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch err code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test End`);
          done();
        }
      });

      /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_0100
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_0100';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.bindSocket(tcp, (error: BusinessError | null) => {
                if (error === undefined) {
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_0200
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
            udp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.bindSocket(udp, (error: BusinessError | null) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_0500
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_0500';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              let bindAndDone = async (): Promise<void> => {
                try {
                  await netHandle.bindSocket(tcp);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } catch (err) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                      err?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              };
              bindAndDone();
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_0600
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_0600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
            udp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              let bindAndDone = async (): Promise<void> => {
                try {
                  await netHandle.bindSocket(udp);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } catch (err) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(
                      err?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              };
              bindAndDone();
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_0900
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_0900
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_0900';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 0;
              netHandle.bindSocket(tcp, (error: BusinessError | null) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1000
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1000
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1000';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 53;
              netHandle.bindSocket(tcp, (error: BusinessError | null) => {
                if (error?.code !== 0) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

      /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1100
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1100
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1100';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 200;
              netHandle.bindSocket(tcp, (error: BusinessError | null) => {
                hilog.info(domain, tag,
                  `${caseName} bindSocket error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                    error?.message)}`);
                if (error?.code !== 0) {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1200
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1200
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1200';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 999999;
              netHandle.bindSocket(tcp, (error: BusinessError | null) => {
                hilog.info(domain, tag,
                  `${caseName} bindSocket error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                    error?.message)}`);
                if (error?.code !== 0) {
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1300
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1300
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1300';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 0;
              let bindAndDone = async (): Promise<void> => {
                try {
                  await netHandle.bindSocket(tcp);
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } catch (error) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              };
              bindAndDone();
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1400
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1400
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1400';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 53;
              let bindAndDone = async (): Promise<void> => {
                try {
                  await netHandle.bindSocket(tcp);
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } catch (error) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              };
              bindAndDone();
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1500
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1500
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1500';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 200;
              let bindAndDone = async (): Promise<void> => {
                try {
                  await netHandle.bindSocket(tcp);
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } catch (error) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              };
              bindAndDone();
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleBindSocket_static_1600
     * @tc.number SUB_NetworkMgr_Connection_NetHandleBindSocket_1600
     * @tc.desc   Bind TCPSocket or UDPSocket to the current network.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleBindSocket_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrConnectionNetHandleBindSocket_static_1600';
        hilog.info(domain, tag, `${caseName}---test Start`);
        try {
          try {
            let netHandle = await connection.getDefaultNet();
            let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
            tcp.bind({
              address: "127.0.0.1",
              port: 8080,
              family: 1
            } as socket.NetAddress, (error: BusinessError | null) => {
              hilog.info(domain, tag,
                `${caseName} bind error: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                  error?.message)}`);
              netHandle.netId = 999999;
              let bindAndDone = async (): Promise<void> => {
                try {
                  await netHandle.bindSocket(tcp);
                  hilog.info(domain, tag, `${caseName} bindSocket`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } catch (error) {
                  hilog.info(domain, tag,
                    `${caseName} bindSocket failed err: code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                      error?.message)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              };
              bindAndDone();
            });
          } catch (error) {
            hilog.info(domain, tag,
              `${caseName} err->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(
                error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
  })
}