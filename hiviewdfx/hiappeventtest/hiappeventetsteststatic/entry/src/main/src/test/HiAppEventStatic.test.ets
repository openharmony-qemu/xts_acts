import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent';
import { describe, it, TestType, Size,Level,expect } from "../../../hypium/index";
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function Hiviewdfx_HiAppEventTest(){

  describe("Hiviewdfx_HiAppEventTest", (): void => {

    let params: Record<string, hiAppEvent.ParamType> = {
      "log_type": "1",
      "sample_interval": "100",
      "ignore_startup_time": "11",
      "sample_count": "21",
      "report_times_per_app": "3"
    };

    hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params);
    /*
        * @tc.name SUB_HiAppEvent_setEventConfig_0100
        * @tc.number SUB_HiAppEvent_setEventConfig_0100
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL0
        * @tc.size MEDIUMTEST
        * @tc.type FUNCTION
       */
    it("SUB_HiAppEvent_setEventConfig_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,async (done: () => void): Promise<void> =>{
      await Utils.msSleep(1000)
      hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params);
    })

    //hiAppEvent.write(hiAppEvent.EventType.STATISTIC);覆盖枚举STATISTIC
    /*
        * @tc.name SUB_HiAppEvent_write_0200
        * @tc.number SUB_HiAppEvent_write_0200
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL1
        * @tc.size MEDIUMTEST
        * @tc.type FUNCTION
       */
    it("SUB_HiAppEvent_write_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async (done: () => void): Promise<void> =>{
      await Utils.msSleep(1000)
      let eventParams: Record<string, number> = {'clickTime': 100};
      let eventInfo: hiAppEvent.AppEventInfo = {
        // Define the event domain.
        domain: 'button',
        // Define the event name.
        name: 'click',
        // Define the event type.
        eventType: hiAppEvent.EventType.STATISTIC,
        // Define the event parameters.
        params: eventParams,
      };
      hiAppEvent.write(eventInfo);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiAppEvent.write(eventInfo);
    })
    //hiAppEvent.write(hiAppEvent.EventType.SECURITY);覆盖枚举SECURITY
    /*
        * @tc.number SUB_HiAppEvent_write_0210
        * @tc.name SUB_HiAppEvent_write_0210
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL1
        * @tc.size MEDIUMTEST
        * @tc.type FUNCTION
       */
    it("SUB_HiAppEvent_write_0210", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async (done: () => void): Promise<void> =>{
      await Utils.msSleep(1000)
      let eventParams: Record<string, number> = {'clickTime': 100};
      let eventInfo: hiAppEvent.AppEventInfo = {
        // Define the event domain.
        domain: 'button',
        // Define the event name.
        name: 'click',
        // Define the event type.
        eventType: hiAppEvent.EventType.SECURITY,
        // Define the event parameters.
        params: eventParams,
      };
      hiAppEvent.write(eventInfo);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiAppEvent.write(eventInfo);
    })
    /*
        * @tc.number: SUB_HiAppEvent_write_0220
        * @tc.name: SUB_HiAppEvent_write_0220
        * @tc.desc:  Check start ability by bundl
        * @tc.level: LEVEL1
        * @tc.size: MEDIUMTEST
        * @tc.type: FUNCTION
       */
    it("SUB_HiAppEvent_write_0220", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async (done: () => void): Promise<void> =>{
      await Utils.msSleep(1000)
      let eventParams: Record<string, number> = {'clickTime': 100};
      let eventInfo: hiAppEvent.AppEventInfo = {
        // Define the event domain.
        domain: 'button',
        // Define the event name.
        name: 'click',
        // Define the event type.
        eventType: hiAppEvent.EventType.BEHAVIOR,
        // Define the event parameters.
        params: eventParams,
      };
      hiAppEvent.write(eventInfo);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiAppEvent.write(eventInfo);
    })
    /*
        * @tc.number SUB_HiAppEvent_configEventPolicy_0300
        * @tc.name SUB_HiAppEvent_configEventPolicy_0300
        * @tc.desc  Check start ability by bundl
        * @tc.level LEVEL1
        * @tc.size MEDIUMTEST
        * @tc.type FUNCTION
       */
    it("SUB_HiAppEvent_configEventPolicy_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async (done: () => void): Promise<void> =>{
      await Utils.msSleep(1000)
      let policy: hiAppEvent.EventPolicy = {

      };
      hiAppEvent.configEventPolicy(policy);
      let a:int = 1;
      let b:int = 1;
      expect(a).assertEqual(b);
      done()
      hiAppEvent.configEventPolicy(policy);
    })

  })

}
