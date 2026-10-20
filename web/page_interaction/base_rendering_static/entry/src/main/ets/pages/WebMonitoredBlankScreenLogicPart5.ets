'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';

export function runMonitoredBlankScreenCasePart5(action: string): boolean {
  switch (action) {
    case "testBlankScreenReason_NO_FIRST_CONTENTFUL_PAINT": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT;
        console.info('BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT=' + reason);
        Utils.emitEvent(312, 20260420)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260420)
      }
      break;
    }
    case "testBlankScreenReason_RENDERER_CRASHED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.RENDERER_CRASHED;
        console.info('BlankScreenReason.RENDERER_CRASHED=' + reason);
        Utils.emitEvent(401, 20260421)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260421)
      }
      break;
    }
    case "testBlankScreenReason_RENDERER_KILLED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.RENDERER_KILLED;
        console.info('BlankScreenReason.RENDERER_KILLED=' + reason);
        Utils.emitEvent(402, 20260422)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260422)
      }
      break;
    }
    case "testBlankScreenReason_GPU_PROCESS_CRASHED": {
      try {
        let reason: BlankScreenReason = BlankScreenReason.GPU_PROCESS_CRASHED;
        console.info('BlankScreenReason.GPU_PROCESS_CRASHED=' + reason);
        Utils.emitEvent(403, 20260423)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260423)
      }
      break;
    }
    default:
      return false;
  }
  return true;
}
