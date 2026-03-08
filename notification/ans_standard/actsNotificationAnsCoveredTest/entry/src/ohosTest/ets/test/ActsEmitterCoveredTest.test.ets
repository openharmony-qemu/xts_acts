import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '@ohos/hypium';
import Base from '@ohos.base';
import { BusinessError } from '@kit.BasicServicesKit';
import emitter from '@ohos.events.emitter';

@Sendable
class Sample {
  constructor() {
    this.count = 100;
  }
  printCount() {
    console.info('Print count : ' + this.count);
  }
  count: number;
}
class SelfEventData implements emitter.EventData {
  data: Sample = new Sample();
}
async function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}
let eventData: emitter.EventData = {
  data: {
    "content": "content",
    "id": 1,
  }
};

const TAG = 'Notification';
const TEST_SUITE_NAME = 'ActsEmitterTest'

export default function actsEmitterCovered() {
  describe('actsEmitterCovered', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })



      /**
       * @tc.name   Sub_Notification_Emitter_Capabilities_0100
       * @tc.number Sub_Notification_Emitter_Capabilities_0100
       * @tc.desc   test on interface success
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Sub_Notification_Emitter_Capabilities_0100', Level.LEVEL2, (done: Function) => {
        const TAG = 'Sub_Notification_Emitter_Capabilities_0100';

        let onCallback :Callback<emitter.EventData> = (eventData: emitter.EventData)=> {
          console.info(TAG+ ' on success');
          expect(false).assertTrue();
          console.info(TAG+ ' test case end');
          done();
        }
        try {
          console.info(TAG+ ' test case start');
          emitter.on(undefined, onCallback)
        } catch (err) {
          console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
          expect(false).assertTrue();
          console.info(TAG+ ' test case end');
          done();
        }
        try{
          console.info(TAG+ 'off callback begin');
          emitter.off(undefined);
          console.info(TAG+ 'off callback success');
        }catch(err){
          console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
        try{
          emitter.emit(undefined,undefined,eventData);
          console.info(TAG+ ' emit event success');
          done();
        }catch(err){
          console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
          expect(false).assertTrue();
          done();
        }
        console.info(TAG+ ' test case end');
        done();
      })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0200
     * @tc.number Sub_Notification_Emitter_Capabilities_0200
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0200', Level.LEVEL2,async (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_0200';
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on('', onCallback05)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.emit('',eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off('', onCallback05);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0300
     * @tc.number Sub_Notification_Emitter_Capabilities_0300
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0300', Level.LEVEL2,async (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_0300';
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on(null, onCallback05)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.emit(null,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(null, onCallback05);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0400
     * @tc.number Sub_Notification_Emitter_Capabilities_0400
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0400', Level.LEVEL2,async (done: Function) => {
      const TAG = 'Sub_Notification_Emitter_Capabilities_0400';
      let onConsume_number = 0
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let onCallback05 : Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        let storage: Sample = eventData.data!;
        storage.printCount();
        onConsume_number +=1
      }
      try {
        console.info(TAG+ ' test case start');
        emitter.on(undefined, onCallback05)
      } catch (err) {
        console.info(TAG+ ` on failed,data is %{public}s`, JSON.stringify(err));
        expect(false).assertTrue();
        console.info(TAG+ ' test case end');
        done();
      }
      try{
        emitter.emit(undefined,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(undefined, onCallback05);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG+ ' test case end');
      done();
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0500
     * @tc.number Sub_Notification_Emitter_Capabilities_0500
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0500', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0500'
      let callback01:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once('', callback01);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off('', callback01);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit('',eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0600
     * @tc.number Sub_Notification_Emitter_Capabilities_0600
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0600', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0600'
      let callback02:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(null, callback02);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(null, callback02);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(null,eventData);
        console.info(TAG+ ' emit event success');
        expect(emitter.getListenerCount(null)).assertEqual(undefined)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0700
     * @tc.number Sub_Notification_Emitter_Capabilities_0700
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0700', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0700'
      let callback03:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(undefined, callback03);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        console.info(TAG+ 'off callback begin');
        emitter.off(undefined, callback03);
        console.info(TAG+ 'off callback success');
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(undefined,eventData);
        console.info(TAG+ ' emit event success');
        expect(emitter.getListenerCount(undefined)).assertEqual(undefined)
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0800
     * @tc.number Sub_Notification_Emitter_Capabilities_0800
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0800', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0800'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let option: emitter.Options = {
        priority: 0
      }
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once('', callback);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit('',option,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_0900
     * @tc.number Sub_Notification_Emitter_Capabilities_0900
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_0900', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_0900'
      let option: emitter.Options = {
        priority: 0
      }
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(null, callback);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(null,null,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1000
     * @tc.number Sub_Notification_Emitter_Capabilities_1000
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1000', Level.LEVEL2, async(done:Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_1000'
      let eventData: emitter.GenericEventData<Sample> = {
        data: new Sample()
      };
      let callback: Callback<emitter.GenericEventData<Sample>> = (eventData: emitter.GenericEventData<Sample>): void => {
        console.info(`eventData: ${JSON.stringify(eventData?.data)}`);
        if (eventData?.data instanceof Sample) {
          eventData?.data?.printCount();
        }
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(undefined, callback);
        done()
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(undefined,undefined,eventData);
        console.info(TAG+ ' emit event success');
        done();
      }catch(err){
        console.info(TAG+ ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_1100
     * @tc.number Sub_Notification_Emitter_Capabilities_1100
     * @tc.desc   test on interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_1100', Level.LEVEL3, async (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Capabilities_1100';

      let count :number = 0
      let innerEvent1: emitter.InnerEvent = {
        eventId: 1,
        priority: emitter.EventPriority.HIGH
      }
      let innerEvent2: emitter.InnerEvent = {
        eventId: 2,
        priority: emitter.EventPriority.LOW
      }
      let innerEvent3: emitter.InnerEvent = {
        eventId: 2,
        priority: emitter.EventPriority.IDLE
      }
      let innerEvent4: emitter.InnerEvent = {
        eventId: 2,
        priority: emitter.EventPriority.IMMEDIATE
      }
      let onCallback1 :Callback<emitter.EventData> = (eventData: emitter.EventData)=>{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        count++
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case start');
        emitter.on(innerEvent1, onCallback1)
        emitter.on(innerEvent2, onCallback1)
        emitter.on(innerEvent3, onCallback1)
        emitter.on(innerEvent4, onCallback1)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit success');
        emitter.emit(innerEvent1,eventData)
        emitter.emit(innerEvent2,eventData)
        emitter.emit(innerEvent3,eventData)
        emitter.emit(innerEvent4,eventData)
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit failed,data is %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      setTimeout(() => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' No subscription message');
        expect(count).assertEqual(4);
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }, 3000)
    })
  })
}
