'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart3(action: string): boolean {
  switch (action) {
    case "testBlankScreenReason_HTTP_5XX_ERROR": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.HTTP_5XX_ERROR;
        console.info('BlankScreenReason.HTTP_5XX_ERROR=' + reason);
        Utils.emitEvent(203, 20260412)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260412)
      }
      break;
    }
    case "testBlankScreenReason_JS_GLOBAL_BUNDLE_LOAD_FAILED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED;
        console.info('BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED=' + reason);
        Utils.emitEvent(210, 20260413)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260413)
      }
      break;
    }
    case "testBlankScreenReason_CSS_LOAD_FAILED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.CSS_LOAD_FAILED;
        console.info('BlankScreenReason.CSS_LOAD_FAILED=' + reason);
        Utils.emitEvent(211, 20260414)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260414)
      }
      break;
    }
    case "testBlankScreenReason_MULTI_RESOURCE_LOAD_FAILED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED;
        console.info('BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED=' + reason);
        Utils.emitEvent(212, 20260415)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260415)
      }
      break;
    }
    default:
      return false;
  }
  return true;
}
