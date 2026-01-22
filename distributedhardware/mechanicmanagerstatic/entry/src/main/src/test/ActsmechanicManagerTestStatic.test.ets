/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import mechanicManager from '@ohos.distributedHardware.mechanicManager';

let domain: int = 0x0000; //日志标识,domain作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsmechanicManagerTestStatic() {
  describe('ActsmechanicManagerTestStatic', () => {
    hilog.info(domain, tag, "====>start describe ActsmechanicManagerTestStatic====");

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>ActsmechanicManagerTestStatic beforeAll start====");
      done();
    });

    /**
     * @tc.number SUB_DH_MechanicManager_on_AttachStateChange_0100
     * @tc.name SUB_DH_MechanicManager_on_AttachStateChange_0100
     * @tc.desc Test getLocalDeviceId() interfaces
     * Test Get the device id of the local device.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('SUB_DH_MechanicManager_on_AttachStateChange_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done:() => void): Promise => {
        hilog.info(domain, tag, '-----------------SUB_DH_MechanicManager_on_AttachStateChange_0100 START------------------------');
        let flag = 0;
        try {
          mechanicManager.onAttachStateChange((result: mechanicManager.AttachStateChangeInfo) => {
            hilog.info(domain, tag, 'result:' ${result});
          });
          expect(flag== 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', 'on_AttachStateChange failed for ' + err);
          const e = err as BusinessError;
          hilog.info(domain, tag, `getLocalDeviceId failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, '-----------------SUB_DH_MechanicManager_on_AttachStateChange_0100 END--------------------------');
        done();
      });
  })
}
