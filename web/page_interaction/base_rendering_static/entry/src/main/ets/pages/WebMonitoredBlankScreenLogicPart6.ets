'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart6(action: string): boolean {
  switch (action) {
              case "testBlankScreenReason_GPU_PROCESS_WATCHDOG_TIMEOUT": {
                try {
                  let reason: BlankScreenReason = BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT;
                  console.info('BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT=' + reason);
                  Utils.emitEvent(404, 20260424)
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 20260424)
                }
                break;
              }
              case "testBlankScreenReason_WEB_VIEW_ZERO_SIZE": {
                try {
                  let reason: BlankScreenReason = BlankScreenReason.WEB_VIEW_ZERO_SIZE;
                  console.info('BlankScreenReason.WEB_VIEW_ZERO_SIZE=' + reason);
                  Utils.emitEvent(501, 20260425)
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 20260425)
                }
                break;
              }
    default:
      return false;
  }
  return true;
}
