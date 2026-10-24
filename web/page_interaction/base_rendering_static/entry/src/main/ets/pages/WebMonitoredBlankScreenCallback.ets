'use static';
import { MonitoredBlankScreenEventInfo, OnMonitorBlankScreenCallback } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';

let monitoredBlankScreenCurrentAction: string = '';

export function setMonitoredBlankScreenCurrentAction(action: string): void {
  monitoredBlankScreenCurrentAction = action;
}

export const onMonitoredBlankScreenHandle: OnMonitorBlankScreenCallback =
  (event: MonitoredBlankScreenEventInfo): void => {
    console.info(`onMonitoredBlankScreen url=${event.url} reason=${event.reason} extra=${event.extraMsg}`);
    if (monitoredBlankScreenCurrentAction === 'testOnMonitoredBlankScreenStatic001') {
      Utils.emitEvent('onMonitoredBlankScreen', 20260450)
      return;
    }
    if (monitoredBlankScreenCurrentAction === 'testMonitoredBlankScreenEventInfoUrl') {
      Utils.emitEvent(event.url.length >= 0 ? 'probe:url' : '', 20260451)
      return;
    }
    if (monitoredBlankScreenCurrentAction === 'testMonitoredBlankScreenEventInfoReason') {
      Utils.emitEvent(event.reason, 20260452)
      return;
    }
    if (monitoredBlankScreenCurrentAction === 'testMonitoredBlankScreenEventInfoExtraMsg') {
      Utils.emitEvent(event.extraMsg.length >= 0 ? 'probe-extra' : '', 20260453)
      return;
    }
  };
