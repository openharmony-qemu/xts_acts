'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart1(action: string): boolean {
  switch (action) {
    case "testBlankScreenReason_SSL_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.SSL_ERROR;
        console.info('BlankScreenReason.SSL_ERROR=' + reason);
        Utils.emitEvent(105, 20260404)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260404)
      }
      break;
    }
    case "testBlankScreenReason_CERT_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.CERT_ERROR;
        console.info('BlankScreenReason.CERT_ERROR=' + reason);
        Utils.emitEvent(106, 20260405)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260405)
      }
      break;
    }
    case "testBlankScreenReason_INTERNET_DISCONNECTED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.INTERNET_DISCONNECTED;
        console.info('BlankScreenReason.INTERNET_DISCONNECTED=' + reason);
        Utils.emitEvent(107, 20260406)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260406)
      }
      break;
    }
    case "testBlankScreenReason_REDIRECT_LOOP": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.REDIRECT_LOOP;
        console.info('BlankScreenReason.REDIRECT_LOOP=' + reason);
        Utils.emitEvent(108, 20260407)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260407)
      }
      break;
    }
    default:
      return false;
  }
  return true;
}
