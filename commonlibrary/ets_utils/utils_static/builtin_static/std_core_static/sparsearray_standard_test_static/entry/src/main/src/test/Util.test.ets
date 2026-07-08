'use static';
import { BusinessError } from '@ohos.base';
import { expect } from '@ohos/hypium-binary/src/main/indexStatic';


export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    
    });
  }
}
