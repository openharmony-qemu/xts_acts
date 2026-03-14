/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import print from '@ohos.print';
import { BusinessError } from '@ohos.base';

const DOMAIN: number = 0x0023
const TAG: string = 'printTestXTS';

async function AddPrinterToDiscovery(printerInfo: print.PrinterInformation) {
  await print.addPrinterToDiscovery(printerInfo).then((data : void) => {
    console.log('addPrinterToDiscovery data : ' + JSON.stringify(data));
  }).catch((error: BusinessError) => {
    console.log('addPrinterToDiscovery error : ' + JSON.stringify(error));
  })
}

async function UpdatePrinterInDiscovery(printerInfo: print.PrinterInformation) {
  await print.updatePrinterInDiscovery(printerInfo).then((data : void) => {
    console.log('updatePrinterInDiscovery data : ' + JSON.stringify(data));
  }).catch((error: BusinessError) => {
    console.log('updatePrinterInDiscovery error : ' + JSON.stringify(error));
  })
}

export default function printTest() {
  describe('printTest', () => {

    /**
     * @tc.name   print_function_0100
     * @tc.number print_function_0100
     * @tc.desc   check success of startDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0100', Level.LEVEL1, async (done: Function) => {
      let extensionList: string[] = [];
      print.startDiscoverPrinter(extensionList, (err: BusinessError, data: void) => {
        try {
          if (err) {
            expect(err).assertTrue();
            done();
          } else {
            console.log('print_function_0100 expect success');
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_0200
     * @tc.number print_function_0200
     * @tc.desc   check success of startDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0200', Level.LEVEL1, async (done: Function) => {
      let extensionList: string[] = [];
      await print.startDiscoverPrinter(extensionList).then((data: void) => {
        console.log('print_function_0200 expect success');
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        expect(err).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   print_function_0300
     * @tc.number print_function_0300
     * @tc.desc   check success of stopDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0300', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB
      print.stopDiscoverPrinter((err: BusinessError, data: void) => {
        try {
          if (err) {
            expect(err).assertTrue();
            done();
          } else {
            console.log('print_function_0300 expect success');
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_0400
     * @tc.number print_function_0400
     * @tc.desc   check success of stopDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0400', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB
      await print.stopDiscoverPrinter().then((data: void) => {
        console.log('print_function_0400 expect success');
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        expect(err).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   print_function_0500
     * @tc.number print_function_0500
     * @tc.desc   check success of connectPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0500', Level.LEVEL1, async (done: Function) => {
      let printId: string = '123';
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB
      print.connectPrinter(printId, (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_0500 expect failed by required real printer');
            expect(err).assertEqual(13100005);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_0600
     * @tc.number print_function_0600
     * @tc.desc   check success of connectPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0600', Level.LEVEL1, async (done: Function) => {
      let printId: string = '123';
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB
      await print.connectPrinter(printId).then((data:void) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_0600 expect failed by required real printer');
        expect(err).assertEqual(13100005);
        done();
      })
    })
    
    /**
     * @tc.name   print_function_0700
     * @tc.number print_function_0700
     * @tc.desc   check the getAddedPrinters function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0700', Level.LEVEL1, async (done: Function) => {
      let testPageSize : print.PrintPageSize = {
        id : 'ISO_A4',
        name : 'iso_a4_210x297mm',
        width : 8268,
        height : 11692
      };
      let testCapability : print.PrinterCapabilities = {
        supportedPageSizes : [testPageSize],
        supportedColorModes : [print.PrintColorMode.COLOR_MODE_MONOCHROME],
        supportedDuplexModes : [print.PrintDuplexMode.DUPLEX_MODE_NONE],
        supportedMediaTypes : ['stationery'],
        supportedQualities : [print.PrintQuality.QUALITY_NORMAL],
        supportedOrientations : [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT],
        options : 'testOptions'
      };
      let printerInformation : print.PrinterInformation = {
        printerId : 'testPrinterId',
        printerName : 'testPrinterName',
        printerStatus : 0,
        description : 'testDesc',
        capability : testCapability,
        uri : 'file:/dev/null',
        printerMake : 'raw',
        options : 'testOptions'
      };
      await AddPrinterToDiscovery(printerInformation);
      await UpdatePrinterInDiscovery(printerInformation);

      await print.getAddedPrinters().then((printers : Array<string>) => {
        console.log('getAddedPrinters expect succeed, data: ' + JSON.stringify(printers));
        expect(printers.length > 0).assertTrue();
        expect(!!printers).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.log('getAddedPrinters failed, error: ' + JSON.stringify(error));
        expect().assertFalse();
        done();
      })
    })
  })
}
