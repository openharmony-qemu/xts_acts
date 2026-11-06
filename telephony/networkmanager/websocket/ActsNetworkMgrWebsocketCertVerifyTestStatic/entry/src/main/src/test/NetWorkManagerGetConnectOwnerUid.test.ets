'use static'
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'NetWorkManagerGetConnectOwnerUid';
const DOMAIN = 0x0000;

// Family
const FAMILY_IPV4 = 1;
const FAMILY_IPV6 = 2;

export default function NetWorkManagerGetConnectOwnerUid(): void {
  describe('GetConnectOwnerUid_Test', () => {
    // ==================== TCP IPv4 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_0600
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0600
     * @tc.desc    Test error code 2100001 with invalid IP format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_0600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        hilog.info(DOMAIN, TAG, 'testNetManagerBaseGetConnectOwnerUid_static_0600 start');
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_0700
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0700
     * @tc.desc    Test error code 2100001 with empty address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_0700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_0701
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0701
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_0701', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_0800
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0800
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_0800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_1200
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1200
     * @tc.desc    Test sync API error code 2100001 with invalid IP format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_1200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_1300
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1300
     * @tc.desc    Test sync API error handling with invalid address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_1300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.255.255', family: FAMILY_IPV4, port: 99999 },
          { address: '10.255.255.255', family: FAMILY_IPV4, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_1400
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1400
     * @tc.desc    Test sync API error code 2100001 with empty address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_1400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_1401
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1401
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_1401', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_1402
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1402
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_1402', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    // ==================== TCP IPv6 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_1900
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1900
     * @tc.desc    Test error handling with invalid IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_1900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_2000
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2000
     * @tc.desc    Test error code 2100001 with invalid IPv6 format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_2100
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2100
     * @tc.desc    Test error code 2100001 with empty IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_2100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_2500
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2500
     * @tc.desc    Test sync API error handling with invalid IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_2600
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2600
     * @tc.desc    Test sync API error code 2100001 with invalid IPv6 format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_2600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_2700
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2700
     * @tc.desc    Test sync API error code 2100001 with empty IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_2700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    // ==================== UDP IPv4 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3200
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3200
     * @tc.desc    Test error code 2100001 with invalid IP format for UDP IPv4
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3300
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3300
     * @tc.desc    Test error handling with invalid UDP IPv4 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.255.255', family: FAMILY_IPV4, port: 99999 },
          { address: '10.255.255.255', family: FAMILY_IPV4, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3400
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3400
     * @tc.desc    Test error code 2100001 with empty UDP IPv4 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3401
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3401
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3401', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3402
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3402
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3402', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3800
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3800
     * @tc.desc    Test sync API error code 2100001 with invalid IP format for UDP IPv4
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_3900
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3900
     * @tc.desc    Test sync API error handling with invalid UDP IPv4 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_3900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.255.255', family: FAMILY_IPV4, port: 99999 },
          { address: '10.255.255.255', family: FAMILY_IPV4, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_4000
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4000
     * @tc.desc    Test sync API error code 2100001 with empty UDP IPv4 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_4000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_4001
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4001
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_4001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_4002
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4002
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_4002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    // ==================== UDP IPv6 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_4500
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4500
     * @tc.desc    Test error handling with invalid UDP IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_4500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_4600
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4600
     * @tc.desc    Test error code 2100001 with invalid IPv6 format for UDP
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_4600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_4700
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4700
     * @tc.desc    Test error code 2100001 with empty UDP IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_4700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_5100
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_5100
     * @tc.desc    Test sync API error handling with invalid UDP IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_5100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_5200
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_5200
     * @tc.desc    Test sync API error code 2100001 with invalid IPv6 format for UDP
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_5200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_5300
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_5300
     * @tc.desc    Test sync API error code 2100001 with empty UDP IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_5300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_9000
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_9000
     * @tc.desc    Test error code 2100301
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_9000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetManagerBaseGetConnectOwnerUid_static_9000";
      hilog.info(DOMAIN, TAG, `${caseName}---Start`);
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: 12345 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, `${caseName} [TCP_IPv4_IncorrectUsage] ${uid}`);
        expect().assertFail();
        hilog.info(DOMAIN, TAG, `${caseName}---End`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, `${caseName} [TCP_IPv4_IncorrectUsage] error: code=${error.code}`);
        expect(Number(error.code)).assertEqual(2100301);
        hilog.info(DOMAIN, TAG, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid_static_9100
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_9100
     * @tc.desc    Test error code 2100301
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid_static_9100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetManagerBaseGetConnectOwnerUid_static_9100";
      hilog.info(DOMAIN, TAG, `${caseName}---Start`);
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: 12345 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, `${caseName} [TCP_IPv4_Sync_IncorrectUsage] uid=${uid}`);
        expect().assertFail();
        hilog.info(DOMAIN, TAG, `${caseName}---End`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, `${caseName} [TCP_IPv4_Sync_IncorrectUsage] error: code=${error.code}`);
        expect(Number(error.code)).assertEqual(2100301);
        hilog.info(DOMAIN, TAG, `${caseName}---End`);
        done();
      }
    });
  });
}
