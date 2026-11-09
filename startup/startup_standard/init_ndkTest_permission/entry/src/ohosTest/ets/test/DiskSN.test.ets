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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium'
import initndk from 'libinitndk.so'

export default function diskSNTest() {
  describe('StartupInitDiskSNTest', () => {
    /**
     * @tc.name   testOHGetDiskSN001
     * @tc.number SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISKSN_0100
     * @tc.desc   test OH_GetDiskSN with permission, return code 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetDiskSN001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = initndk.oHGetDiskSN();
      let code: number = result.code;
      let diskSn: string = result.diskSn;
      console.info('the value of the OH_GetDiskSN code is :' + code);
      console.info('the value of the OH_GetDiskSN diskSn is :' + diskSn);

      expect(code).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHGetDiskSN002
     * @tc.number SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISKSN_0200
     * @tc.desc   test OH_GetDiskSN with permission, diskSn is string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetDiskSN002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = initndk.oHGetDiskSN();
      let code: number = result.code;
      let diskSn: string = result.diskSn;
      console.info('the value of the OH_GetDiskSN code is :' + code);
      console.info('the value of the OH_GetDiskSN diskSn is :' + diskSn);

      expect(code).assertEqual(0);
      expect(diskSn).assertInstanceOf('String');
      done();
    });

    /**
     * @tc.name   testOHGetDiskSN003
     * @tc.number SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISKSN_0300
     * @tc.desc   test OH_GetDiskSN with permission, diskSn is consistent across multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHGetDiskSN003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result1 = initndk.oHGetDiskSN();
      console.info('the value of the OH_GetDiskSN result1 code is :' + result1.code);
      console.info('the value of the OH_GetDiskSN result1 diskSn is :' + result1.diskSn);

      expect(result1.code).assertEqual(0);

      let result2 = initndk.oHGetDiskSN();
      console.info('the value of the OH_GetDiskSN result2 code is :' + result2.code);
      console.info('the value of the OH_GetDiskSN result2 diskSn is :' + result2.diskSn);

      expect(result2.code).assertEqual(0);
      expect(result1.diskSn).assertEqual(result2.diskSn);
      done();
    });
  })
}
