import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level } from '@ohos/hypium'
import hiAppEventdfx from '@ohos.hiviewdfx.hiAppEvent';

export default function HiAppEvent1() {
  describe('HiAppEventdfx', () => {
    /**
     * @tc.name   hiAppEventdfx1
     * @tc.number SUB_hiAppEventdfx1
     * @tc.desc   addWatcher&removeWatcher函数异常值覆盖，null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx1', Level.LEVEL0, async (done: Function) => {
      let watcher: hiAppEventdfx.Watcher = {
        name: " ",
      }
      try{
        console.info("====>hiAppEventdfx1 error start");
        hiAppEvent.addWatcher(null);
        console.info("====>hiAppEventdfx1 error end 02");
        hiAppEvent.removeWatcher(null);
        console.info("====>hiAppEventdfx1 error end 03");
        hiAppEvent.addWatcher(undefined);
        console.info("====>hiAppEventdfx1 error end 04");
        hiAppEvent.removeWatcher(undefined);
        console.info("====>hiAppEventdfx1 error end 05");
        done();
      }catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx1', `failed to write event, code: ${err.code}, message: ${err.message}`);
        expect(err.code == 401).assertTrue()
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx2
     * @tc.number SUB_hiAppEventdfx2
     * @tc.desc   clearData函数异常值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('hiAppEventdfx2', Level.LEVEL2, async (done: Function) => {
      let ret = hiAppEvent.clearData();;
      console.error("====>hiAppEventdfx2 err: " + ret)
      done()
    })
    /**
     * @tc.name   hiAppEventdfx3
     * @tc.number SUB_hiAppEventdfx3
     * @tc.desc   setUserId函数的异常值覆盖，' '/null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx3', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx3 error start");
        hiAppEvent.setUserId(' ', ' ');
        console.info("====>hiAppEventdfx3 error end 02");
        hiAppEvent.setUserId(null, null);
        console.info("====>hiAppEventdfx3 error end 03");
        hiAppEvent.setUserId(undefined, undefined);
        console.info("====>hiAppEventdfx3 error end 04");
        done();
      } catch (error) {
        hilog.error(0x0000, 'hiAppEventdfx3', `failed to setUserId event, code=${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx4
     * @tc.number SUB_hiAppEventdfx4
     * @tc.desc   getUserId函数的异常值覆盖，' '/null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx4', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserId('key', 'value');
      try {
        console.info("====>hiAppEventdfx4 error start");
        let value: string = hiAppEvent.getUserId(' ');
        console.info("====>hiAppEventdfx4 error end 01");
        let value1: string = hiAppEvent.getUserId(null);
        console.info("====>hiAppEventdfx4 error end 02");
        let value2: string = hiAppEvent.getUserId(undefined);
        console.info("====>hiAppEventdfx4 error end 03");
        hilog.info(0x0000, 'hiAppEvent', `getUserId event was successful, userId=${value}`);
        hilog.info(0x0000, 'hiAppEvent', `getUserId event was successful, userId=${value1}`);
        hilog.info(0x0000, 'hiAppEvent', `getUserId event was successful, userId=${value2}`);
        done();
      } catch (error) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserId event, code=${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx5
     * @tc.number SUB_hiAppEventdfx5
     * @tc.desc   setUserProperty函数的异常值覆盖，' '/null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx5', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx5 error start");
        hiAppEvent.setUserProperty(' ', ' ');
        console.info("====>hiAppEventdfx5 error end 02");
        hiAppEvent.setUserProperty(null, null);
        console.info("====>hiAppEventdfx5 error end 02");
        hiAppEvent.setUserProperty(undefined, undefined);
        console.info("====>hiAppEventdfx5 error end 02");
        done();
      } catch (error) {
        hilog.error(0x0000, 'hiAppEvent', `failed to setUserId event, code=${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx6
     * @tc.number SUB_hiAppEventdfx6
     * @tc.desc   getUserProperty函数的异常值覆盖，' '/null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx6', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserProperty('key', 'value');
      try {
        console.info("====>hiAppEventdfx6 error start");
        let value: string = hiAppEvent.getUserProperty(' ');
        console.info("====>hiAppEventdfx6 error end 01");
        let value1: string = hiAppEvent.getUserProperty(null);
        console.info("====>hiAppEventdfx6 error end 01");
        let value2: string = hiAppEvent.getUserProperty(undefined);
        console.info("====>hiAppEventdfx6 error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserProperty event was successful, userProperty=${value}`);
        hilog.info(0x0000, 'hiAppEvent', `getUserProperty event was successful, userProperty=${value1}`);
        hilog.info(0x0000, 'hiAppEvent', `getUserProperty event was successful, userProperty=${value2}`);
        done();
      } catch (error) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserProperty event, code=${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx7
     * @tc.number SUB_hiAppEventdfx7
     * @tc.desc   addProcessor&removeProcessor函数的异常值覆盖,unll/undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx7', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx7 error start");
        let id: number = hiAppEvent.addProcessor(null);
        hiAppEvent.removeProcessor(null);
        console.info("====>hiAppEventdfx6 error end 01");
        let id1: number = hiAppEvent.addProcessor(undefined);
        hiAppEvent.removeProcessor(undefined);
        done();
      } catch (error) {
        hilog.error(0x0000, 'hiAppEvent', `failed to removeProcessor event, code=${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx8
     * @tc.number SUB_hiAppEventdfx8
     * @tc.desc   addProcessorFromConfig函数的异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx8', Level.LEVEL2, async (done: Function) => {
      try {
      hiAppEvent.addProcessorFromConfig(null).then((processorId) => {
        hilog.info(0x0000, 'hiAppEvent', `Succeeded in adding processor from config, processorId=${processorId}`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to add processor from config, code: ${err.code}, message: ${err.message}`);
        done();
      });
      }catch (err) {
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx8-test1
     * @tc.number SUB_hiAppEventdfx8-test1
     * @tc.desc   addProcessorFromConfig函数的异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx8-test1', Level.LEVEL2, async (done: Function) => {
      try {
        hiAppEvent.addProcessorFromConfig(undefined).then((processorId) => {
          hilog.info(0x0000, 'hiAppEvent', `Succeeded in adding processor from config, processorId=${processorId}`);
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hiAppEvent', `Failed to add processor from config, code: ${err.code}, message: ${err.message}`);
          done();
        });
      }catch (err) {
        done();
      }
    })
    /**
     * @tc.name   hiAppEventdfx9
     * @tc.number SUB_hiAppEventdfx9
     * @tc.desc   configEventPolicy函数的异常值覆盖 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx9', Level.LEVEL2, async (done:Function) => {
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": true
        }
      };
      hiAppEvent.configEventPolicy(null).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set main thread jank event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set main thread jank event policy. Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
    })
    /**
     * @tc.name   hiAppEventdfx9-test1
     * @tc.number SUB_hiAppEventdfx9-test1
     * @tc.desc   configEventPolicy函数的异常值覆盖 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx9-test1', Level.LEVEL2, async (done:Function) => {
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": true
        }
      };
      hiAppEvent.configEventPolicy(undefined).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set main thread jank event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set main thread jank event policy. Code: ${err?.code}, message: ${err?.message}`);
        done();
      });
    })
    /**
     * @tc.name   hiAppEventdfx10
     * @tc.number SUB_hiAppEventdfx10
     * @tc.desc   setsize&setRow函数的异常值覆盖,/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx10', Level.LEVEL2, async (done:Function) => {
      console.info('hiAppEventdfx10 start')
      let holder2: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      let holder3: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      let holder4: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      let holder5: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      try {
        holder2.setSize(null);
        console.info("====> hiAppEventdfx10 write undefined end 01");
        holder3.setRow(null);
        console.info("====> hiAppEventdfx10 write undefined end 02");
        holder4.setSize(undefined);
        console.info("====> hiAppEventdfx10 write undefined end 03");
        holder5.setRow(undefined);
        console.info("====> hiAppEventdfx10 write undefined end 04");
        done();

      }catch(err){
        console.error(`====>hiAppEventdfx10 setId write catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx11
     * @tc.desc   configure函数的异常值覆盖,/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx11', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx11 start");
      try{
        hiAppEvent.configure(undefined);
        console.info("====> hiAppEventdfx11 configure undefined ");
        hiAppEvent.configure(null);
        console.info("====> hiAppEventdfx11 configure null ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx11 configure catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx11 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx12
     * @tc.desc   write函数的异常值覆盖,/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx12', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx12 start");
      try{
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
        console.info("====> hiAppEventdfx12 write STATISTIC ");
        eventInfo.eventType = hiAppEvent.EventType.SECURITY;
        hiAppEvent.write(eventInfo);
        console.info("====> hiAppEventdfx12 write SECURITY ");
        eventInfo.eventType = hiAppEvent.EventType.BEHAVIOR;
        hiAppEvent.write(eventInfo);
        console.info("====> hiAppEventdfx12 write BEHAVIOR ");
        hiAppEvent.write(null);
        console.info("====> hiAppEventdfx12 write null ");
        hiAppEvent.write(undefined);
        console.info("====> hiAppEventdfx12 write undefined ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx12 configure catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx12 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx13
     * @tc.desc   write函数的异常值覆盖,第一个参数异常值/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx13', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx13 start");
      try{
        hiAppEvent.write(null, null);
        console.info("====> hiAppEventdfx13 write null ");
        hiAppEvent.write(undefined, undefined);
        console.info("====> hiAppEventdfx13 write undefined ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx13 configure catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx13 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx14
     * @tc.desc   setEventParam函数的异常值覆盖,第一个参数异常值/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx14', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx14 start");
      try{
        hiAppEvent.setEventParam(null, "test_domain", "test_name");
        console.info("====> hiAppEventdfx14 setEventParam null ");
        hiAppEvent.setEventParam(undefined, "test_domain", "test_name");
        console.info("====> hiAppEventdfx14 setEventParam undefined ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx14 setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx14 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx15
     * @tc.desc   setEventParam函数的异常值覆盖,第2个参数异常值空值""/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx15', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx15 start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, null, "test_name");
        console.info("====> hiAppEventdfx15 setEventParam null");
        hiAppEvent.setEventParam(eventParams, undefined, "test_name");
        console.info("====> hiAppEventdfx15 setEventParam undefined");
        hiAppEvent.setEventParam(eventParams, "", "test_name");
        console.info("====> hiAppEventdfx15 setEventParam empty");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx15 setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx15 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx16
     * @tc.desc   setEventParam函数的异常值覆盖,第3个参数异常值空值""/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx16', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx16 start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", null);
        console.info("====> hiAppEventdfx16 setEventParam null");
        hiAppEvent.setEventParam(eventParams, "test_domain", undefined);
        console.info("====> hiAppEventdfx16 setEventParam undefined");
        hiAppEvent.setEventParam(eventParams, "test_domain", "");
        console.info("====> hiAppEventdfx16 setEventParam empty");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx16 setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx16 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx177
     * @tc.desc   setEventConfig函数的异常值覆盖,第1个参数异常值空值""/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx17', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx17 start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventConfig(null,eventParams);
        console.info("====> hiAppEventdfx17 setEventConfig null");
        hiAppEvent.setEventConfig(undefined,eventParams);
        console.info("====> hiAppEventdfx17 setEventConfig undefined");
        hiAppEvent.setEventConfig("",eventParams);
        console.info("====> hiAppEventdfx17 setEventConfig empty");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx17 setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx17 end");
    });
    /**
     * @tc.name   HiAppEventTest
     * @tc.number hiAppEventdfx18
     * @tc.desc   setEventConfig函数的异常值覆盖,第2个参数异常值空值""/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx18', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx18 start");
      try{
        hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT,null);
        console.info("====> hiAppEventdfx18 setEventConfig null");
        hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT,undefined);
        console.info("====> hiAppEventdfx18 setEventConfig undefined");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx18 setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("hiAppEventdfx18 end");
    })

  })
}
