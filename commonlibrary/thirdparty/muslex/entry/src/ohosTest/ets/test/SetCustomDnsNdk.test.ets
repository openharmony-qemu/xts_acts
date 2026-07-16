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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import libsetcustomdnsndktest from 'libsetcustomdnsndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function SetcustomdnsNdkTest() {
  describe('SetcustomdnsNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testsetcustomdnsNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0100
     * @tc.desc   Set custom DNS server basic test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0200
     * @tc.desc   Set custom DNS with IPv4 address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0300
     * @tc.desc   Set custom DNS with IPv6 address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0500
     * @tc.desc   Set custom DNS with null address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0600
     * @tc.desc   Set custom DNS with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0700
     * @tc.desc   Set custom DNS max length address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0800
     * @tc.desc   Set custom DNS overwrite existing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsStable001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_0900
     * @tc.desc   Repeated set custom DNS stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testsetcustomdnsThread001
     * @tc.number SUB_THIRDPARTY_MUSL_SET_CUSTOM_DNS_1000
     * @tc.desc   Multi-thread set custom DNS concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetcustomdnsThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libsetcustomdnsndktest.setcustomdnsThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

  });
}