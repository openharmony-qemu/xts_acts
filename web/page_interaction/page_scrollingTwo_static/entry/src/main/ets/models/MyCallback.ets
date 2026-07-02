'use static';
import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';

const SYNTAX_ERROR_CODE = 1002;

export class MyCallback {
  static myCallback(callback: Callback<string>): void {
    hilog.info(0x0000, 'testTag', 'myCallback');
    callback('myCallback');
  }

  static myAsyncCallback(callback: AsyncCallback<string, string>): void {
    let error = new Error('Business Error', 'basicError2 message', undefined);
    let be2: BusinessError<string> = new BusinessError<string>(SYNTAX_ERROR_CODE, error);
    callback(be2, 'myAsyncCallback');
  }

  static myErrorCallback(callback: ErrorCallback<BusinessError<string>>): void {
    let error = new Error('Business Error', 'myErrorCallback message', undefined);
    let result: string = 'test';
    let be: BusinessError<string> = new BusinessError<string>(SYNTAX_ERROR_CODE, result, error);
    callback(be);
  }

  static runCasesOfCallback(): void {
    MyCallback.myCallback((data: string) => {
      hilog.info(0x0000, 'testTag', 'MyCallback' + data);
    })
  }
}
