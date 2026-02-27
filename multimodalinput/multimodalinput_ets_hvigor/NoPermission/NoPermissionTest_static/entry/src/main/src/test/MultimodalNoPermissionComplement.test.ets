import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import common from '@ohos.app.ability.common';

import { inputDevice } from '@kit.InputKit';
import { inputConsumer } from '@kit.InputKit';
import { BusinessError } from "@ohos.base"

import { infraredEmitter } from '@kit.InputKit';

import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement'

import { inputDevice } from '@kit.InputKit';

import { KeyCode } from '@ohos.multimodalInput.keyCode';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function abilityTest201() {

  describe("abilityTest201", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0250
     * @tc.number SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0250
     * @tc.desc   Test without permission report 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0250",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0250";
        hilog.info(domain, tag, `${caseName} enter`);
        let ifTransmitInfraredSuccess = 0;
        try {
          let frequencies: infraredEmitter.InfraredFrequency[] = [{
            max: 0,
            min: 0
          }];
          frequencies = infraredEmitter.getInfraredFrequencies();
          console.info(`${caseName} getInfraredFrequencies success, frequencies: ${JSON.stringify(frequencies)}`);
          expect().assertFail();
          done();
        } catch (error: BusinessError) {
          console.info(`${caseName} get infrared frequencies failed, error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(201);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0350
     * @tc.number SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0350
     * @tc.desc   Test the execution of the setFunctionalKeyEnabled interface without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0350";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          await inputDevice.setFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK, false).then(() => {
            console.info(`${caseName} Set capslock state success`);
            expect().assertFail();
            done();
          })
        } catch (error) {
          console.info(`${caseName} failed to get capslock state, error: ${error.code}`);
          expect(error.code == 201).assertTrue();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });


  })

}