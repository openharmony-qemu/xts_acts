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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function UDMFAppShareOptionsTest() {
  describe("UDMFAppShareOptionsTest", (): void => {
    let TAG = '';
    /**
 	      * @tc.name   SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100
 	      * @tc.number SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100
 	      * @tc.desc   setAppShareOptions
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL0
 	      */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG,
          unifiedDataChannel.ShareOptions.IN_APP);
        hilog.info(domain, tag, TAG + `setAppShareOptions is successed`);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    })
  
  /**
   * @tc.name   SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200
   * @tc.number SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200
   * @tc.desc   setAppShareOptions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG,
          unifiedDataChannel.ShareOptions.CROSS_APP);
        hilog.info(domain, tag, TAG + `setAppShareOptions is successed`);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    })
  /**
   * @tc.name   SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800
   * @tc.number SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800
   * @tc.desc   setAppShareOptions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG,
          unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error !== null).assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    })
    hilog.info(domain, tag, '%{public}s', 'UDMFApiTest end');
  });
}

