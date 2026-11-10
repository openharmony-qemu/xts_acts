/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import input from 'libinputndk.so';

export default function MultimodalInputNdkTest() {
  describe('MultimodalInputNdkTest', () => {

    /**
     * @tc.name   SUB_MMI_Input_Api_NdkPer_AddKeyEventMonitor_0100
     * @tc.number SUB_MMI_Input_Api_NdkPer_AddKeyEventMonitor_0100
     * @tc.desc   OH_Input_AddKeyEventMonitor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_NdkPer_AddKeyEventMonitor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkPer_AddKeyEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddKeyEventMonitor`);
      try {
        let data = input.AddKeyEventMonitorException();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data === 1).assertTrue();
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventMonitor`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_NdkPer_AddMouseEventMonitor_0100
     * @tc.number SUB_MMI_Input_Api_NdkPer_AddMouseEventMonitor_0100
     * @tc.desc   OH_Input_AddMouseEventMonitor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_NdkPer_AddMouseEventMonitor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkPer_AddMouseEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddMouseEventMonitor`);
      try {
        let data = input.AddMouseEventMonitorException();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data === 1).assertTrue();
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddMouseEventMonitor`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_NdkPer_AddTouchEventMonitor_0100
     * @tc.number SUB_MMI_Input_Api_NdkPer_AddTouchEventMonitor_0100
     * @tc.desc   OH_Input_AddTouchEventMonitor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_NdkPer_AddTouchEventMonitor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkPer_AddTouchEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddTouchEventMonitor`);
      try {
        let data = input.AddTouchEventMonitorException();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data === 1).assertTrue();
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddTouchEventMonitor`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitorForAll_0100
     * @tc.number SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitorForAll_0100
     * @tc.desc   OH_Input_AddAxisEventMonitorForAll Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitorForAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitorForAll_0100';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitorForAll`);
      try {
        let data = input.AddAxisEventMonitorForAllException();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data === 1).assertTrue();
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitorForAll`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitor_0100
     * @tc.number SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitor_0100
     * @tc.desc   OH_Input_AddAxisEventMonitor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkPer_AddAxisEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitor`);
      try {
        let data = input.AddAxisEventMonitorException();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        expect(data === 1).assertTrue();
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitor`);
    });
  })
}
