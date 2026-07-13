'use static';
import events_emitter from '@ohos.events.emitter';
import { expect } from "@ohos/hypium-binary/src/main/indexStatic";
import { RecordData } from '@ohos.base';

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async emitEvent(actualValue: boolean | string | Int | object, eventId: Int): Promise<void> {
    const tempData: Record<string, RecordData> = {
      "ACTION": actualValue as object
    };
    let backData: events_emitter.EventData = {
      data: tempData
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(backEvent, backData);
    await Utils.msSleep(500)
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: Int,
    done: () => void, expectFunction: (backData: events_emitter.EventData, expected: Object) => void): void {
    let callBack = (backData: events_emitter.EventData) => {
      try {
        expectFunction(backData, expected);
      } catch (err) {
      }
      done()
    }
    let innerEvent: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(innerEvent, callBack)
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: Int, done: () => void): void {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done, (backData: events_emitter.EventData, expected: Object) => {
      const data = backData?.data as Record<string, RecordData>;
      const action = data['ACTION'];
      expect(action).assertEqual(expected);
    });
  }
}
