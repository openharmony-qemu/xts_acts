'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart2(action: string): boolean {
  switch (action) {
    case "testBlankScreenReason_PROXY_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.PROXY_ERROR;
        console.info('BlankScreenReason.PROXY_ERROR=' + reason);
        Utils.emitEvent(109, 20260408)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260408)
      }
      break;
    }
    case "testBlankScreenReason_OTHER_NETWORK_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.OTHER_NETWORK_ERROR;
        console.info('BlankScreenReason.OTHER_NETWORK_ERROR=' + reason);
        Utils.emitEvent(199, 20260409)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260409)
      }
      break;
    }
    case "testBlankScreenReason_MAIN_DOC_EMPTY": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.MAIN_DOC_EMPTY;
        console.info('BlankScreenReason.MAIN_DOC_EMPTY=' + reason);
        Utils.emitEvent(201, 20260410)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260410)
      }
      break;
    }
    case "testBlankScreenReason_HTTP_4XX_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.HTTP_4XX_ERROR;
        console.info('BlankScreenReason.HTTP_4XX_ERROR=' + reason);
        Utils.emitEvent(202, 20260411)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260411)
      }
      break;
    }
    default:
      return false;
  }
  return true;
}
