import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';

const SYNTAX_ERROR_CODE: int = 1002;

export class MyCallback {
  static myCallback(callback: Callback<String>): void {
    hilog.info(0x0000, 'testTag', 'myCallback');
    callback('myCallback');
  }

  static myAsyncCallback(callback: AsyncCallback<String, String>): void {
    hilog.info(0x0000, 'testTag', 'myAsyncCallback');
    let error = new Error('Business Error', 'basicError2 message', undefined);
    let be2: BusinessError<String> = new BusinessError<String>(SYNTAX_ERROR_CODE, error);
    callback(be2, 'yAsyncCallback');
  }

  static myErrorCallback(callback: ErrorCallback<BusinessError<String>>): void {
    hilog.info(0x0000, 'testTag', 'myErrorCallback');
    let error = new Error('Business Error', 'myErrorCallback message', undefined);
    let result: String = 'test';
    let be: BusinessError<String> = new BusinessError<String>(SYNTAX_ERROR_CODE, result, error);
    callback(be);
  }

  static runCasesOfCallback() {
    MyCallback.myCallback((data: String) => {
      hilog.info(0x0000, 'testTag', 'MyCallback' + data);
    })
    MyCallback.myAsyncCallback((error: BusinessError<String> | null, result: String | undefined) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error?.message}, result:${result}`);
    })
    MyCallback.myErrorCallback((error: BusinessError<String> | null) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error?.message}`);
    })
  }
}