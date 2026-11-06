'use static';
import { BlankScreenReason } from '@ohos.arkui.component';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';
import { runMonitoredBlankScreenCasePart0 } from './WebMonitoredBlankScreenLogicPart0';
import { runMonitoredBlankScreenCasePart1 } from './WebMonitoredBlankScreenLogicPart1';
import { runMonitoredBlankScreenCasePart2 } from './WebMonitoredBlankScreenLogicPart2';
import { runMonitoredBlankScreenCasePart3 } from './WebMonitoredBlankScreenLogicPart3';
import { runMonitoredBlankScreenCasePart4 } from './WebMonitoredBlankScreenLogicPart4';
import { runMonitoredBlankScreenCasePart5 } from './WebMonitoredBlankScreenLogicPart5';
import { runMonitoredBlankScreenCasePart6 } from './WebMonitoredBlankScreenLogicPart6';

export function runMonitoredBlankScreenCase(action: string): void {
  switch (action) {
    case "testOnMonitoredBlankScreenStatic001": {
      try {
        Utils.emitEvent('onMonitoredBlankScreen', 20260450)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260450)
      }
      break;
    }
    case "testMonitoredBlankScreenEventInfoUrl": {
      try {
        Utils.emitEvent('probe:url', 20260451)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260451)
      }
      break;
    }
    case "testMonitoredBlankScreenEventInfoReason": {
      try {
        Utils.emitEvent(BlankScreenReason.DNS_RESOLVE_FAILED, 20260452)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260452)
      }
      break;
    }
    case "testMonitoredBlankScreenEventInfoExtraMsg": {
      try {
        Utils.emitEvent('probe-extra', 20260453)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260453)
      }
      break;
    }
    case "testOnMonitoredBlankScreenUndefined": {
      try {
        Utils.emitEvent(true, 20260455)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260455)
      }
      break;
    }
    case "testOnMonitoredBlankScreenChaining": {
      try {
        Utils.emitEvent('chain-ok', 20260458)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260458)
      }
      break;
    }
    case "testEnableBlankScreenMonitorTrue": {
      try {
        Utils.emitEvent(true, 20260456)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260456)
      }
      break;
    }
    case "testEnableBlankScreenMonitorFalse": {
      try {
        Utils.emitEvent(false, 20260457)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260457)
      }
      break;
    }
    case "testEnableBlankScreenMonitorUndefined": {
      try {
        Utils.emitEvent(true, 20260459)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260459)
      }
      break;
    }
    case "testOnMonitoredBlankScreenReturn": {
      try {
        Utils.emitEvent('return-monitored-ok', 20260460)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260460)
      }
      break;
    }
    case "testEnableBlankScreenMonitorReturn": {
      try {
        Utils.emitEvent('return-enable-ok', 20260461)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260461)
      }
      break;
    }
    case "testOnMonitoredBlankScreenUndefinedReturn": {
      try {
        Utils.emitEvent('return-monitored-undefined-ok', 20260462)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260462)
      }
      break;
    }
    case "testEnableBlankScreenMonitorUndefinedReturn": {
      try {
        Utils.emitEvent('return-enable-undefined-ok', 20260463)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260463)
      }
      break;
    }
    case "testMonitoredBlankScreenDeclChain": {
      try {
        Utils.emitEvent('main-blank-chain-ok', 20260464)
      } catch (error) {
        error = error as BusinessError;
        Utils.emitEvent(error.code, 20260464)
      }
      break;
    }
    default:
      break;
  }
  if (runMonitoredBlankScreenCasePart0(action)) { return; }
  if (runMonitoredBlankScreenCasePart1(action)) { return; }
  if (runMonitoredBlankScreenCasePart2(action)) { return; }
  if (runMonitoredBlankScreenCasePart3(action)) { return; }
  if (runMonitoredBlankScreenCasePart4(action)) { return; }
  if (runMonitoredBlankScreenCasePart5(action)) { return; }
  if (runMonitoredBlankScreenCasePart6(action)) { return; }
}
