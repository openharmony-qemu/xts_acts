import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import hiAppEvent from '@ohos.hiAppEvent';
import { describe, it, expect, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'

export default function HiAppEvent() {
  describe('HiAppEvent', () => {
    /**
     * @tc.name   hiAppEvent_null_STATISTIC
     * @tc.number SUB_hiAppEvent_null_STATISTIC
     * @tc.desc   write函数异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_null_STATISTIC', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(null, hiAppEvent.EventType.STATISTIC,null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })
    /**
     * @tc.name   hiAppEvent_null_SECURITY
     * @tc.number SUB_hiAppEvent_null_SECURITY
     * @tc.desc   write函数异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_null_SECURITY', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(null, hiAppEvent.EventType.SECURITY,null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })
    /**
     * @tc.name   hiAppEvent__BEHAVIOR
     * @tc.number SUB_hiAppEvent__BEHAVIOR
     * @tc.desc   write函数异常值覆盖，‘ ’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent__BEHAVIOR', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(' ', hiAppEvent.EventType.BEHAVIOR,undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })

    /**
     * @tc.name   hiAppEvent_undefined_BEHAVIOR
     * @tc.number SUB_hiAppEvent_undefined_BEHAVIOR
     * @tc.desc   write函数异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_undefined_BEHAVIOR', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(undefined, hiAppEvent.EventType.BEHAVIOR,undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })
    /**
     * @tc.name   hiAppEvent_configure_null
     * @tc.number SUB_hiAppEvent_configure_null
     * @tc.desc   configure函数异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_configure_null', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.configure(null);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })
    /**
     * @tc.name   hiAppEvent_configure_undefined
     * @tc.number SUB_hiAppEvent_configure_undefined
     * @tc.desc   configure函数异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent_configure_undefined', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.configure(undefined);
          console.info("====>hiAppEvent error end 01");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code === 401).assertTrue()
          done();
        }
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })

  })

}