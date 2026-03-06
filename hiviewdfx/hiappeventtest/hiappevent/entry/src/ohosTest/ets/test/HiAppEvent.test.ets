import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import hiAppEvent from '@ohos.hiAppEvent';
import { describe, it, expect, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'

export default function HiAppEvent() {
  describe('HiAppEvent', () => {
    /**
     * @tc.name   hiAppEvent
     * @tc.number SUB_hiAppEvent
     * @tc.desc   write函数异常值覆盖，‘ ’/null/undefined;configure函数异常值覆盖,null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEvent', Level.LEVEL0, async (done: Function) => {
      let eventParams: Record<string, number | string> = {
        "int_data": 100,
        "str_data": "strValue",
      };
      hiAppEvent.write(null, hiAppEvent.EventType.FAULT, null, (err: BusinessError) => {
        try {
          console.info("====>hiAppEvent error start");
          hiAppEvent.write(null, hiAppEvent.EventType.STATISTIC,null);
          console.info("====>hiAppEvent error end 01");
          hiAppEvent.write(null, hiAppEvent.EventType.SECURITY,null);
          console.info("====>hiAppEvent error end 02");
          hiAppEvent.configure(null);
          console.info("====>hiAppEvent error end 03");
          hiAppEvent.write(' ', hiAppEvent.EventType.BEHAVIOR,undefined);
          console.info("====>hiAppEvent error end 01");
          hiAppEvent.write(undefined, hiAppEvent.EventType.BEHAVIOR,undefined);
          console.info("====>hiAppEvent error end 02");
          hiAppEvent.configure(undefined);
          console.info("====>hiAppEvent error end 03");
          done();
        } catch (err) {
          hilog.error(0x0000, 'hiAppEvent', `failed to write event, code: ${err.code}, message: ${err.message}`);
          expect(err.code == 401).assertTrue()
          done();
        }
        // Event writing success
        console.info(null, 'hiAppEvent', null);
        done();
      });

    })




  })
}