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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium-static/src/main/indexStatic';
import hilog from '@ohos.hilog';
import { userAuth } from '@kit.UserAuthenticationKit';
import type common from '@ohos.app.ability.common';
import { GlobalContext } from '../testrunner/OpenHarmonyTestRunner';
import { canIUse } from '@internal.full.global';

let domain: int = 0x0000;
let tag: string = 'testTag';
let format: string = '%{public}s';

export default function UserAuthTest() {
  describe('UserAuthTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
    })

    /**
     * @tc.name   SUB_Security_IAM_Companion_Api_Static_5001
     * @tc.number SUB_Security_IAM_Companion_Api_Static_5001
     * @tc.desc   registerRemoteAuthCallback normal test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_Companion_Api_Static_5001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_Companion_Api_Static_5001 start');
      const context: common.Context = await GlobalContext.getContext();
      let callback: userAuth.IRemoteAuthCallback = {
        onGetRemoteAuthWidgetParam: (challenge: Uint8Array): userAuth.WidgetParam => {
          return {
            title: '远程认证',
            navigationButtonText: '返回',
            windowMode: userAuth.WindowModeType.DIALOG_BOX,
            uiContext: context
          };
        },
        onRemoteAuthResult: (challenge: Uint8Array, result: userAuth.UserAuthResult): void => {
          hilog.info(domain, tag, format, "认证结果" + result.result);
        }
      }
      try {
        await userAuth.registerRemoteAuthCallback(callback);
        expect(true).assertTrue();
      } catch (err) {
        if (err.code === 12500002) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_Companion_Api_Static_5001 expected error code 12500002");
          expect(err.code).assertEqual(12500002);
        } else {
          hilog.info(domain, tag, format, "SUB_Security_IAM_Companion_Api_Static_5001 failed " + err.code + " " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_Companion_Api_Static_5004
     * @tc.number SUB_Security_IAM_Companion_Api_Static_5004
     * @tc.desc   unregisterRemoteAuthCallback normal test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_Companion_Api_Static_5004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_Companion_Api_Static_5004 start');
      try {
        await userAuth.unregisterRemoteAuthCallback();
        expect(true).assertTrue();
      } catch (err) {
        if (err.code === 12500002) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_Companion_Api_Static_5004 expected error code 12500002");
          expect(err.code).assertEqual(12500002);
        } else {
          hilog.info(domain, tag, format, "SUB_Security_IAM_Companion_Api_Static_5004 failed " + err.code + " " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5001
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5001
     * @tc.desc   Verify getUserRecognitionMgr can be invoked normally and returns a UserRecognitionMgr instance when the device supports passive recognition, or null otherwise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5001 start');
      let isSupport: boolean = !canIUse("SystemCapability.Security.DataLossPrevention");
      if (isSupport) {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr != null).assertTrue();
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5001: getUserRecognitionMgr success");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5001: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          expect(false).assertTrue();
        }
      } else {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr === null).assertTrue();
          hilog.info(domain, tag, format, "getUserRecognitionMgr returned null, device does not support passive recognition");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5001: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5002
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5002
     * @tc.desc   Verify getUserRecognitionResult queries the latest user recognition result through the UserRecognitionMgr promise interface and the returned result carries a valid status field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5002 start');
      let isSupport: boolean = !canIUse("SystemCapability.Security.DataLossPrevention");
      if (isSupport) {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        expect(mgr != null).assertTrue();
        try {
          let result: userAuth.UserRecognitionResult = await mgr!.getUserRecognitionResult();
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5002 status: " + result.status);
          expect(result != undefined).assertTrue();
          expect(result.status != undefined).assertTrue();
          expect(result.userId != undefined).assertTrue();
          expect(result.userInfo != undefined).assertTrue();
          expect(result.authTrustLevel != undefined).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5001: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          if (err.code === 12500002) {
            hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5001 expected error code 12500002");
            expect(err.code).assertEqual(12500002);
          } else {
            expect(false).assertTrue();
          }
        }
      } else {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr === null).assertTrue();
          hilog.info(domain, tag, format, "getUserRecognitionMgr returned null, device does not support passive recognition");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5002: getUserRecognitionResult failed, err.code " + err.code + ", err.message " + err.message);
          if (err.code === 12500002) {
            hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5002 expected error code 12500002");
            expect(err.code).assertEqual(12500002);
          } else {
            expect(false).assertTrue();
          }
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5003
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5003
     * @tc.desc   Verify onUserRecognitionChange subscribes to user recognition change events and the callback correctly distinguishes the three statuses UNCERTAIN, MISMATCH and MATCH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5003 start');
      let isSupport: boolean = !canIUse("SystemCapability.Security.DataLossPrevention");
      if (isSupport) {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        expect(mgr != null).assertTrue();
        try {
          mgr!.onUserRecognitionChange((result: userAuth.UserRecognitionResult) => {
            expect(result != undefined).assertTrue();
            expect(result.status != undefined).assertTrue();
            expect(result.userId != undefined).assertTrue();
            expect(result.userInfo != undefined).assertTrue();
            expect(result.authTrustLevel != undefined).assertTrue();
          });
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5003: onUserRecognitionChange failed, err.code " + err.code + ", err.message " + err.message);
          if (err.code === 12500002) {
            hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5003 expected error code 12500002");
            expect(err.code).assertEqual(12500002);
          } else {
            expect(false).assertTrue();
          }
        }
      } else {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr === null).assertTrue();
          hilog.info(domain, tag, format, "getUserRecognitionMgr returned null, device does not support passive recognition");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5003: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5004
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5004
     * @tc.desc   Verify offUserRecognitionChange unsubscribes a specified callback that was previously registered via onUserRecognitionChange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5004 start');
      let isSupport: boolean = !canIUse("SystemCapability.Security.DataLossPrevention");
      if (isSupport) {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        expect(mgr != null).assertTrue();
        mgr!.onUserRecognitionChange((result: userAuth.UserRecognitionResult) => {
          expect(result != undefined).assertTrue();
        });
        try {
          mgr!.offUserRecognitionChange((result: userAuth.UserRecognitionResult) => {
            expect(result != undefined).assertTrue();
            expect(result.status != undefined).assertTrue();
            expect(result.userId != undefined).assertTrue();
            expect(result.userInfo != undefined).assertTrue();
            expect(result.authTrustLevel != undefined).assertTrue();
          });
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5004: offUserRecognitionChange failed, err.code " + err.code + ", err.message " + err.message);
          if (err.code === 12500002) {
            hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5004 expected error code 12500002");
            expect(err.code).assertEqual(12500002);
          } else {
            expect(false).assertTrue();
          }
        }
      } else {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr === null).assertTrue();
          hilog.info(domain, tag, format, "getUserRecognitionMgr returned null, device does not support passive recognition");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5004: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5005
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5005
     * @tc.desc   Verify offUserRecognitionChange unregisters the previously subscribed callback when it is invoked without passing the callback parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5005 start');
      let isSupport: boolean = !canIUse("SystemCapability.Security.DataLossPrevention");
      if (isSupport) {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        expect(mgr != null).assertTrue();
        mgr!.onUserRecognitionChange((result: userAuth.UserRecognitionResult) => {
          expect(result != undefined).assertTrue();
        });
        try {
          mgr!.offUserRecognitionChange();
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5005: offUserRecognitionChange success");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5005: offUserRecognitionChange failed, err.code " + err.code + ", err.message " + err.message);
          if (err.code === 12500002) {
            hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5005 expected error code 12500002");
            expect(err.code).assertEqual(12500002);
          } else {
            expect(false).assertTrue();
          }
        }
      } else {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr === null).assertTrue();
          hilog.info(domain, tag, format, "getUserRecognitionMgr returned null, device does not support passive recognition");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5005: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5006
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5006
     * @tc.desc   Verify the UserRecognitionStatus enum values: UNCERTAIN is 0, MISMATCH is 1 and MATCH is 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5006 start');
      expect(userAuth.UserRecognitionStatus.UNCERTAIN).assertEqual(0);
      expect(userAuth.UserRecognitionStatus.MISMATCH).assertEqual(1);
      expect(userAuth.UserRecognitionStatus.MATCH).assertEqual(2);
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_static_5007
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_static_5007
     * @tc.desc   Verify offUserRecognitionChange returns null when called without any callback registered
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_static_5007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'SUB_Security_IAM_PassiveRecognition_Api_static_5007 start');
      let isSupport: boolean = !canIUse("SystemCapability.Security.DataLossPrevention");
      if (isSupport) {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        expect(mgr != null).assertTrue();
        try {
          let ret: void = mgr!.offUserRecognitionChange();
          expect(ret === null || ret === undefined).assertTrue();
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5007: offUserRecognitionChange returns null");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5007: offUserRecognitionChange failed, err.code " + err.code + ", err.message " + err.message);
          if (err.code === 12500002) {
            hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5007 expected error code 12500002");
            expect(err.code).assertEqual(12500002);
          } else {
            expect(false).assertTrue();
          }
        }
      } else {
        try {
          let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
          expect(mgr === null).assertTrue();
          hilog.info(domain, tag, format, "getUserRecognitionMgr returned null, device does not support passive recognition");
        } catch (err) {
          hilog.info(domain, tag, format, "SUB_Security_IAM_PassiveRecognition_Api_static_5007: getUserRecognitionMgr failed, err.code " + err.code + ", err.message " + err.message);
          expect(false).assertTrue();
        }
      }
      done();
    })
  });
};