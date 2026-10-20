'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart0(action: string): boolean {
  switch (action) {
              case "testBlankScreenReason_DNS_RESOLVE_FAILED": {
                try {
                  let reason: BlankScreenReason = BlankScreenReason.DNS_RESOLVE_FAILED;
                  console.info('BlankScreenReason.DNS_RESOLVE_FAILED=' + reason);
                  Utils.emitEvent(101, 20260400)
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 20260400)
                }
                break;
              }
              case "testBlankScreenReason_REQUEST_TIMED_OUT": {
                try {
                  let reason: BlankScreenReason = BlankScreenReason.REQUEST_TIMED_OUT;
                  console.info('BlankScreenReason.REQUEST_TIMED_OUT=' + reason);
                  Utils.emitEvent(102, 20260401)
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 20260401)
                }
                break;
              }
              case "testBlankScreenReason_CONNECTION_REFUSED": {
                try {
                  let reason: BlankScreenReason = BlankScreenReason.CONNECTION_REFUSED;
                  console.info('BlankScreenReason.CONNECTION_REFUSED=' + reason);
                  Utils.emitEvent(103, 20260402)
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 20260402)
                }
                break;
              }
              case "testBlankScreenReason_CONNECTION_RESET": {
                try {
                  let reason: BlankScreenReason = BlankScreenReason.CONNECTION_RESET;
                  console.info('BlankScreenReason.CONNECTION_RESET=' + reason);
                  Utils.emitEvent(104, 20260403)
                } catch (error) {
                  error = error as BusinessError;
                  Utils.emitEvent(error.code, 20260403)
                }
                break;
              }
    default:
      return false;
  }
  return true;
}
