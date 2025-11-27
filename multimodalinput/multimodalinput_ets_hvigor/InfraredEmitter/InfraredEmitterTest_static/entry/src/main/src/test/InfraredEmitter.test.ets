import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import infraredEmitter from '@ohos.multimodalInput.infraredEmitter';
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function InfraredEmitterTest() {

  describe("InfraredEmitterTest", (): void => {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0100";
        let ifTransmitInfraredSuccess = 0;
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [100, 200, 300, 400];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ifTransmitInfraredSuccess++;
          ExpectTrue(ifTransmitInfraredSuccess == 1);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with 1024 pattern parameters.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0200";
        let ifTransmitInfraredSuccess = 0;
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [];
          for (let i = 1; i <= 1024; i++) {
            pattern.push(i * 100);
          }
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ifTransmitInfraredSuccess++;
          ExpectTrue(ifTransmitInfraredSuccess == 1);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with pattern(length is odd number).
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0600";
        let ifTransmitInfraredSuccess = 0;
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [100, 200, 300];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ifTransmitInfraredSuccess++;
          ExpectTrue(ifTransmitInfraredSuccess == 1);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(error.code == 401);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with pattern(non-incremental).
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0700";
        let ifTransmitInfraredSuccess = 0;
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [400, 200, 300, 100, 500];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ifTransmitInfraredSuccess++;
          ExpectTrue(ifTransmitInfraredSuccess == 1);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800
     * @tc.desc: Test transmitInfrared interface to generate an infrared signal of a specific frequency and a special level with pattern(empty).
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_transmitInfrared_0800";
        let ifTransmitInfraredSuccess = 0;
        try {
          let infraredFrequency: long = 38000;
          let pattern: Array<long> = [];
          infraredEmitter.transmitInfrared(infraredFrequency, pattern);
          console.info(`${caseName} transmitInfrared success.`);
          ifTransmitInfraredSuccess++;
          ExpectTrue(ifTransmitInfraredSuccess == 1);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} transmitInfrared failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number: SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100
     * @tc.name: SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100
     * @tc.desc: Test getInfraredFrequencies interface to query the frequency range of infrared signals supported by the phone.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InfraredEmitter_getInfraredFrequencies_0100";
        try {
          let frequencies: infraredEmitter.InfraredFrequency[] = [{
            max: 0,
            min: 0
          }];
          frequencies = infraredEmitter.getInfraredFrequencies();
          console.info(`${caseName} getInfraredFrequencies success, frequencies: ${JSON.stringify(frequencies)}`);
          ExpectTrue(Array.isArray(frequencies));
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} get infrared frequencies failed, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

  })
}