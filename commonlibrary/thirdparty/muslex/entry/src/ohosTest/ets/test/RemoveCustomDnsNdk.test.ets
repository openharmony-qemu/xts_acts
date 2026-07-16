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
import libremovecustomdnsndktest from 'libremovecustomdnsndktest.so';
import { deviceInfo } from '@kit.BasicServicesKit';

export default function RemovecustomdnsNdkTest() {
  describe('RemovecustomdnsNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testremovecustomdnsNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0100
     * @tc.desc   Remove custom DNS basic test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsNormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0200
     * @tc.desc   Remove custom DNS after query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsNormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0300
     * @tc.desc   Remove custom DNS multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsNormal003();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsNormal004();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0500
     * @tc.desc   Remove custom DNS without prior set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsAbnormal001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0600
     * @tc.desc   Repeated remove DNS calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsAbnormal002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0700
     * @tc.desc   Remove custom DNS boundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsBoundary001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0800
     * @tc.desc   Remove custom DNS edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsBoundary002();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsStable001
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_0900
     * @tc.desc   Repeated remove DNS stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsStable001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

    /**
     * @tc.name   testremovecustomdnsThread001
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_CUSTOM_DNS_1000
     * @tc.desc   Multi-thread remove DNS concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testremovecustomdnsThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libremovecustomdnsndktest.removecustomdnsThread001();
      let deviceType: string = deviceInfo.deviceType;
      let isValid: boolean = resNum == 1;
      expect(isValid).assertTrue();
      done();
    });

  });
}