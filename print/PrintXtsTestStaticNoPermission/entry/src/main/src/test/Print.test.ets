/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import print from '@ohos.print';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';


const domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function printTest() {

  describe("printTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number print_function_0300
     * @tc.name print_function_0300
     * @tc.desc check stopDiscoverPrinter api (promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 start');
      try {
        print.stopDiscoverPrinter().then(() => {
          hilog.info(domain, tag, 'print_function_0300 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0300 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0300 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 end');
    });

    /**
     * @tc.number print_function_0400
     * @tc.name print_function_0400
     * @tc.desc check stopDiscoverPrinter api (callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 start');
      try {
        print.stopDiscoverPrinter((err: BusinessError<void>|null, data: undefined) => {
          if (err != null) {
            hilog.error(domain, tag, 'print_function_0400 error, code: %{public}d, message: %{public}s',
              err.code, err.message);
            expect(err.code).assertEqual(201);
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 end');
    });

    /**
     * @tc.number print_function_0500
     * @tc.name print_function_0500
     * @tc.desc check connectPrinter api (promise)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 start');
      try {
        let printerId: string = 'testPrinterId';
        print.connectPrinter(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_0500 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0500 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0500 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 end');
    });

    /**
     * @tc.number print_function_0600
     * @tc.name print_function_0600
     * @tc.desc check connectPrinter api (callback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 start');
      try {
        let printerId: string = 'testPrinterId';
        print.connectPrinter(printerId, (err: BusinessError<void>|null, data: undefined) => {
          if (err != null) {
            hilog.error(domain, tag, 'print_function_0600 error, code: %{public}d, message: %{public}s',
              err.code, err.message);
            expect(err.code).assertEqual(201);
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 end');
    });

    /**
     * @tc.number print_function_0700
     * @tc.name print_function_0700
     * @tc.desc check getAddedPrinters api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 start');
      try {
        print.getAddedPrinters().then((printers: Array<string>) => {
          hilog.info(domain, tag, 'print_function_0700 success, printers: %{public}s', JSON.stringify(printers));
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0700 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0700 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 end');
    });

    /**
     * @tc.number print_function_0800
     * @tc.name print_function_0800
     * @tc.desc check addPrinterToDiscovery api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 start');
      try {
        let info: print.PrinterInformation = {
          printerId: 'printerIdTest',
          printerName: 'printerNameTest',
          printerStatus: print.PrinterStatus.PRINTER_BUSY
        };
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_0800 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0800 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0800 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 end');
    });

    /**
     * @tc.number print_function_0900
     * @tc.name print_function_0900
     * @tc.desc check updatePrinterInDiscovery api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 start');
      try {
        let info: print.PrinterInformation = {
          printerId: 'printerIdTest',
          printerName: 'printerNameTest',
          printerStatus: print.PrinterStatus.PRINTER_IDLE
        };
        print.updatePrinterInDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_0900 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0900 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0900 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 end');
    });

    /**
     * @tc.number print_function_1000
     * @tc.name print_function_1000
     * @tc.desc check removePrinterFromDiscovery api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 start');
      try {
        let printerId: string = 'printerIdTest';
        print.removePrinterFromDiscovery(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1000 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_1000 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 end');
    });

    /**
     * @tc.number print_function_1100
     * @tc.name print_function_1100
     * @tc.desc check getPrinterInformationById api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 start');
      try {
        let printerId: string = 'printerIdTest';
        print.getPrinterInformationById(printerId).then((info: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_1100 success, info: %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_1100 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1100 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 end');
    });

    /**
     * @tc.number print_function_1200
     * @tc.name print_function_1200
     * @tc.desc check on printerChange api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1200', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1200 start');

      try {
        let type: string = 'printerChange';
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_1200 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.on(type, callback);
        hilog.info(domain, tag, 'print_function_1200 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1200 error');
        expect(error.code).assertEqual(201);
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_1200 end');
    });

    /**
     * @tc.number print_function_1300
     * @tc.name print_function_1300
     * @tc.desc check off printerChange api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1300', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1300 start');

      try {
        let type: string = 'printerChange';
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_1300 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.off(type, callback);
        hilog.info(domain, tag, 'print_function_1300 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1300 error');
        expect(error.code).assertEqual(201);
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_1300 end');
    });

    hilog.info(domain, tag, '%{public}s', 'printTest end');
  });
}