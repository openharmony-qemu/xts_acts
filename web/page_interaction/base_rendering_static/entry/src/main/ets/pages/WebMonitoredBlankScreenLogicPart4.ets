'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart4(action: string): boolean {
  switch (action) {
    case "testBlankScreenReason_CORS_BLOCKED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.CORS_BLOCKED;
        console.info('BlankScreenReason.CORS_BLOCKED=' + reason);
        Utils.emitEvent(213, 20260416)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260416)
      }
      break;
    }
    case "testBlankScreenReason_CSP_BLOCKED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.CSP_BLOCKED;
        console.info('BlankScreenReason.CSP_BLOCKED=' + reason);
        Utils.emitEvent(214, 20260417)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260417)
      }
      break;
    }
    case "testBlankScreenReason_MIXED_CONTENT_BLOCKED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.MIXED_CONTENT_BLOCKED;
        console.info('BlankScreenReason.MIXED_CONTENT_BLOCKED=' + reason);
        Utils.emitEvent(215, 20260418)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260418)
      }
      break;
    }
    case "testBlankScreenReason_JS_RUNTIME_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.JS_RUNTIME_ERROR;
        console.info('BlankScreenReason.JS_RUNTIME_ERROR=' + reason);
        Utils.emitEvent(301, 20260419)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260419)
      }
      break;
    }
    default:
      return false;
  }
  return true;
}
